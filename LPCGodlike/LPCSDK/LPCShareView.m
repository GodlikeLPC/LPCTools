//
//  LPCShareView.m
//  EverydayNews
//
//  Created by 李沛池 on 2017/8/7.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import "LPCShareView.h"

#define Height_View_Share  150
#define Size_Btn_Share     52

#define TAG_Default 520
#define TAG_Close   101

@interface LPCShareView ()

@property (nonatomic, copy) void (^selectShareTypeBlock)(SharePlatformType type);

@end

@implementation LPCShareView
{
    NSArray *_arrayImageName;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self=[super initWithFrame:frame];
    if (self)
    {
        _arrayImageName = @[@"LPCImages.bundle/lpcImages_share_wechat_session", //微信好友
                            @"LPCImages.bundle/lpcImages_share_wechat_timeline", //微信朋友圈
                            @"LPCImages.bundle/lpcImages_share_qq",     //QQ好友
                            @"LPCImages.bundle/lpcImages_share_sina"];  //新浪微博
        [self initUI];
    }
    return self;
}

- (void)initUI
{
    self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.6];
    
    UIView * viewShare = [[UIView alloc] initWithFrame:CGRectMake(0, SCREEN_HEIGHT-Height_View_Share, SCREEN_WIDTH, Height_View_Share)];
    viewShare.backgroundColor = [UIColor whiteColor];
    [self addSubview:viewShare];
    
    CGFloat space = (SCREEN_WIDTH - Size_Btn_Share * _arrayImageName.count)/(_arrayImageName.count + 1);
    
    for (int i = 0; i < _arrayImageName.count; i++) {
        [self btnAnimateWithFrame:CGRectMake(space*(i+1) + Size_Btn_Share*i, SCREEN_HEIGHT-52, Size_Btn_Share, Size_Btn_Share) shareType:i delay:0.07*i];
    }
    
    UIButton *btnClose = [UIButton buttonWithType:UIButtonTypeCustom];
    btnClose.frame = CGRectMake((SCREEN_WIDTH-25)/2 ,SCREEN_HEIGHT-35, 25, 25);
    [btnClose setImage:[UIImage imageNamed:@"LPCImages.bundle/lpcImages_share_close"] forState:UIControlStateNormal];
    [btnClose addTarget:self action:@selector(cancelAnimation) forControlEvents:UIControlEventTouchUpInside];
    btnClose.tag = TAG_Close;
    [self addSubview:btnClose];
    
    [UIView animateWithDuration:0.2 animations:^{
        btnClose.transform = CGAffineTransformMakeRotation(M_PI_2);
    }];
}

- (UIButton *)btnAnimateWithFrame:(CGRect)frame shareType:(SharePlatformType)shareType delay:(CGFloat)delay
{
    UIButton * btn = [[UIButton alloc] init];
    btn.frame = frame;
    btn.tag = shareType + TAG_Default;
    [btn setBackgroundImage:[UIImage imageNamed:_arrayImageName[shareType]] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(BtnClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:btn];
    
    [UIView animateWithDuration:1 delay:delay usingSpringWithDamping:0.3 initialSpringVelocity:0 options:UIViewAnimationOptionAllowUserInteraction animations:^{
        btn.transform = CGAffineTransformMakeTranslation(0, -66);
    } completion:^(BOOL finished) {
        
    }];
    return btn;
    
    //usingSpringWithDamping :弹簧动画的阻尼值，也就是相当于摩擦力的大小，该属性的值从0.0到1.0之间，越靠近0，阻尼越小，弹动的幅度越大，反之阻尼越大，弹动的幅度越小，如果大道一定程度，会出现弹不动的情况。
    //initialSpringVelocity :弹簧动画的速率，或者说是动力。值越小弹簧的动力越小，弹簧拉伸的幅度越小，反之动力越大，弹簧拉伸的幅度越大。这里需要注意的是，如果设置为0，表示忽略该属性，由动画持续时间和阻尼计算动画的效果。
}

- (void)BtnClick:(UIButton*)btn
{
    for (NSInteger i = 0; i<self.subviews.count; i++)
    {
        UIView *view = self.subviews[i];
        if ([view isKindOfClass:[UIButton class]])
        {
            [UIView animateWithDuration:0.3 delay:0.1*i options:UIViewAnimationOptionTransitionCurlDown animations:^{
                view.frame = CGRectMake(view.frame.origin.x, SCREEN_HEIGHT, Size_Btn_Share, Size_Btn_Share);
            } completion:^(BOOL finished) {
                
            }];
        }
    }
    
    [self performSelector:@selector(removeView:) withObject:btn afterDelay:0.5];
}

- (void)removeView:(UIButton*)btn
{
    [self removeFromSuperview];
    _selectShareTypeBlock(btn.tag - TAG_Default);
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    
    CGPoint currentPosition = [touch locationInView:self];
    
    CGFloat deltaY = currentPosition.y;
    if (deltaY < (SCREEN_HEIGHT-Height_View_Share))
    {
        [self cancelAnimation];
    }
}

- (void)cancelAnimation
{
    UIButton * cancelBtn = (UIButton*)[self viewWithTag:TAG_Close];
    [UIView animateWithDuration:0.2 animations:^{
        cancelBtn.transform = CGAffineTransformMakeRotation(-M_PI_2);
    }];
    
    for (NSInteger i = 0; i < self.subviews.count; i++)
    {
        UIView *view = self.subviews[i];
        if ([view isKindOfClass:[UIButton class]])
        {
            [UIView animateWithDuration:0.3 delay:0.1*i options:UIViewAnimationOptionTransitionCurlDown animations:^{
                view.frame = CGRectMake(view.frame.origin.x, SCREEN_HEIGHT, Size_Btn_Share, Size_Btn_Share);
            } completion:^(BOOL finished) {
                [self removeFromSuperview];
            }];
        }
    }
}

+ (void)showInWindow:(void (^)(SharePlatformType type))selectShareTypeBlock
{
    LPCShareView *shareView = [[LPCShareView alloc] initWithFrame:FRAME_SCREEN];
    shareView.selectShareTypeBlock = selectShareTypeBlock;
    UIWindow *keyWindow = [UIApplication sharedApplication].keyWindow;
    [keyWindow addSubview:shareView];
}

@end
