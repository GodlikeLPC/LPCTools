//
//  LPCGestureUnlockViewController.m
//  LPCTools
//
//  Created by Godlike on 2017/12/13.
//  Copyright © 2017年 jd. All rights reserved.
//

#import "LPCGesturesUnlockViewController.h"
#import "LPCGesturesUnlockView.h"
#import "LPCGesturesUnlockIndicator.h"
#import "LPCAlertController.h"

#define GesturesPassword @"LPCKey_GesturesPassword"

@interface LPCGesturesUnlockViewController ()<LPCGesturesUnlockViewDelegate>

@property (weak, nonatomic) IBOutlet LPCGesturesUnlockView *gesturesUnlockView;
@property (weak, nonatomic) IBOutlet LPCGesturesUnlockIndicator *gesturesUnlockIndicator;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
 //重新绘制按钮
@property (weak, nonatomic) IBOutlet UIButton *otherAcountLoginButton;
@property (weak, nonatomic) IBOutlet UIButton *forgetGesturesPasswordButton;
@property (weak, nonatomic) IBOutlet UIButton *resetGesturesPasswordButton;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *headIconImageView;

//约束：
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *indicatoerTopConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *indicatorWidthConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *headIconTopConstraint;


@property (nonatomic) WUUnlockType unlockType;

//要创建的手势密码
@property (nonatomic, copy) NSString *lastGesturePassword;

@end

@implementation LPCGesturesUnlockViewController

#pragma mark - 类方法

+ (void)deleteGesturesPassword {
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:GesturesPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (void)addGesturesPassword:(NSString *)gesturesPassword {
    [[NSUserDefaults standardUserDefaults] setObject:gesturesPassword forKey:GesturesPassword];
    [[NSUserDefaults standardUserDefaults] synchronize];
}

+ (NSString *)gesturesPassword {
    return [[NSUserDefaults standardUserDefaults] objectForKey:GesturesPassword];
}

#pragma mark - inint
- (instancetype)initWithUnlockType:(WUUnlockType)unlockType {
    if (self = [super init]) {
        _unlockType = unlockType;
    }
    return self;
}

#pragma mark - viewDidLoad
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.gesturesUnlockView.delegate = self;
    
    self.resetGesturesPasswordButton.hidden = YES;
    switch (_unlockType) {
        case LPCUnlockTypeCreatePwd:
        {
            self.gesturesUnlockIndicator.hidden = NO;
            self.otherAcountLoginButton.hidden = YES;
            self.forgetGesturesPasswordButton.hidden = YES;
            self.nameLabel.hidden = YES;
            self.headIconImageView.hidden = YES;
        }
            break;
        case LPCUnlockTypeValidatePwd:
        {
            self.gesturesUnlockIndicator.hidden = YES;
            
        }
            break;
        default:
            break;
    }
    
    [self udpateConstraints];

}

#pragma mark - private
//创建手势密码
- (void)createGesturesPassword:(NSMutableString *)gesturesPassword {
    
    if (self.lastGesturePassword.length == 0) {
        
        if (gesturesPassword.length <4) {
            self.statusLabel.text = @"至少连接四个点，请重新输入";
            [self shakeAnimationForView:self.statusLabel];
            return;
        }
        
        if (self.resetGesturesPasswordButton.hidden == YES) {
            self.resetGesturesPasswordButton.hidden = NO;
        }
        
        self.lastGesturePassword = gesturesPassword;
        [self.gesturesUnlockIndicator setGesturesPassword:gesturesPassword];
        self.statusLabel.text = @"请再次绘制手势密码";
        return;
    }
    
    if ([self.lastGesturePassword isEqualToString:gesturesPassword]) {//绘制成功
        
        [self dismissViewControllerAnimated:YES completion:^{
            //保存手势密码
            [LPCGesturesUnlockViewController addGesturesPassword:gesturesPassword];
        }];
        
    }else {
        self.statusLabel.text = @"与上一次绘制不一致，请重新绘制";
        [self shakeAnimationForView:self.statusLabel];
    }
    
    
}
//验证手势密码
- (void)validateGesturesPassword:(NSMutableString *)gesturesPassword {
    
    static NSInteger errorCount = 5;

    if ([gesturesPassword isEqualToString:[LPCGesturesUnlockViewController gesturesPassword]]) {
        [self dismissViewControllerAnimated:YES completion:^{
            errorCount = 5;
        }];
    }else {
        
        if (errorCount - 1 == 0) {//你已经输错五次了！ 退出登陆！
            
            LPCAlertController *alertController = [LPCAlertController alertControllerWithTitle:@"手势密码已失效" message:@"请重新登陆" preferredStyle:UIAlertControllerStyleAlert];
            UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"重新登陆" style:UIAlertActionStyleCancel handler:^(UIAlertAction *action) {
                NSLog(@"重新登录");
            }];
            [alertController addAction:cancelAction];
            [self presentViewController:alertController animated:YES completion:nil];
            
            errorCount = 5;
            return;
        }
        
        self.statusLabel.text = [NSString stringWithFormat:@"密码错误，还可以再输入%@次",@(--errorCount)];
        [self shakeAnimationForView:self.statusLabel];
    }
}

//抖动动画
- (void)shakeAnimationForView:(UIView *)view
{
    CALayer *viewLayer = view.layer;
    CGPoint position = viewLayer.position;
    CGPoint left = CGPointMake(position.x - 10, position.y);
    CGPoint right = CGPointMake(position.x + 10, position.y);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"position"];
    [animation setTimingFunction:[CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut]];
    [animation setFromValue:[NSValue valueWithCGPoint:left]];
    [animation setToValue:[NSValue valueWithCGPoint:right]];
    [animation setAutoreverses:YES]; // 平滑结束
    [animation setDuration:0.08];
    [animation setRepeatCount:3];
    
    [viewLayer addAnimation:animation forKey:nil];
}

//更新约束，进行适配
- (void)udpateConstraints {
    if (Screen_Height == 480) {// 适配4寸屏幕
        
        self.headIconTopConstraint.constant = 30;
        self.indicatoerTopConstraint.constant = 64;
        
    }
    
}

#pragma mark - Action
//点击其他账号登陆按钮
- (IBAction)otherAccountLogin:(id)sender {
    NSLog(@"%s",__FUNCTION__);
}
//点击重新绘制按钮
- (IBAction)resetGesturePassword:(id)sender {
    NSLog(@"%s",__FUNCTION__);
    self.lastGesturePassword = nil;
    self.statusLabel.text = @"请绘制手势密码";
    self.resetGesturesPasswordButton.hidden = YES;
    [self.gesturesUnlockIndicator setGesturesPassword:@""];
}
//点击忘记手势密码按钮
- (IBAction)forgetGesturesPassword:(id)sender {
    NSLog(@"%s",__FUNCTION__);
}


#pragma mark - WUGesturesUnlockViewDelegate
- (void)gesturesUnlockView:(LPCGesturesUnlockView *)unlockView drawRectFinished:(NSMutableString *)gesturePassword {
    
    switch (_unlockType) {
        case LPCUnlockTypeCreatePwd://创建手势密码
        {
            [self createGesturesPassword:gesturePassword];
        }
            break;
        case LPCUnlockTypeValidatePwd://校验手势密码
        {
            [self validateGesturesPassword:gesturePassword];
        }
            break;
        default:
            break;
    }
}


@end
