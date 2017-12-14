//
//  LPCErrorCodeView.m
//  LPCTools
//
//  Created by 李沛池 on 2017/12/6.
//  Copyright © 2017年 jd. All rights reserved.
//

#import "LPCErrorcodeView.h"
#import "UIView+LPCCategoryTool.h"

@interface LPCErrorcodeView ()

@property (weak, nonatomic) IBOutlet UIImageView *errorIView;
@property (weak, nonatomic) IBOutlet UILabel *errorText;
@property (weak, nonatomic) IBOutlet UIButton *errorBtn;

@end

@implementation LPCErrorcodeView
{
    ErrorcodeShowType _currentESType;
    NSString *_strNavOriginalTitle; //原始标题
    NSString *_strNavTitle;
}

- (void)awakeFromNib
{
    [super awakeFromNib];
    
    [self initData];
    [self initUI];
}

- (void)initData
{
    _strNavOriginalTitle = @"";
    _strNavTitle = @"";
}

- (void)initUI
{
    
}

//展示服务器错误代码通用View
+ (void)showInView:(UIView *)superView
         errorcode:(NSInteger)errorcode
         backBlock:(void(^)(NSString *))backBlock
       reloadBlock:(void(^)(NSString *))reloadBlock
      refreshBlock:(void(^)(NSString *))refreshBlock
{
    //在主线程中执行
    GCD_MAIN(^{
        LPCErrorcodeView *ecView = XIBFromMainBundle(@"LPCErrorcodeView");
        ecView.backBlock = backBlock;
        ecView.reloadBlock = reloadBlock;
        ecView.refreshBlock = refreshBlock;
        [ecView configESTypeWithErrorcode:errorcode];
        [ecView showInView:superView animation:NO];
    });
}

//根据错误码决定页面展示类型
- (void)configESTypeWithErrorcode:(NSInteger)errorcode
{
    switch (errorcode) {
        case -1001: //请求超时。
        {
            _currentESType = ErrorcodeShowType_Reload;
        }
            break;
        case -1009: //似乎已断开与互联网的连接。
        {
            _currentESType = ErrorcodeShowType_Refresh;
        }
            break;
        case 403:
        {
            _currentESType = ErrorcodeShowType_BackLastpage;
        }
            break;
        case 404: //找不到文件
        {
            _currentESType = ErrorcodeShowType_Back;
        }
            break;
        case 502: //服务器 异常/错误
        {
            _currentESType = ErrorcodeShowType_BackHomepage;
        }
            break;
        default:
        {
            _currentESType = ErrorcodeShowType_Unknow;
        }
            break;
    }
    //根据类型更新UI
    [self updateUI];
}

- (void)updateUI
{
    NSString *strImageName = @"";
    NSString *strErrorText = @"";
    NSString *strErrorBtnTitle = @"";
    
    switch (_currentESType) {
        case ErrorcodeShowType_Back:
        {
            _strNavTitle = @"无数据";
            strImageName = @"errorcodeView_showType_back";
            strErrorText = @"没有相关数据";
            strErrorBtnTitle = @"返回";
        }
            break;
        case ErrorcodeShowType_BackLastpage:
        {
            _strNavTitle = @"页面不存在";
            strImageName = @"errorcodeView_showType_backLastpage";
            strErrorText = @"亲，您访问的页面不存在";
            strErrorBtnTitle = @"返回上一页";
        }
            break;
        case ErrorcodeShowType_BackHomepage:
        {
            _strNavTitle = @"异常";
            strImageName = @"errorcodeView_showType_backHomepage";
            strErrorText = @"操作/系统异常";
            strErrorBtnTitle = @"返回首页";
        }
            break;
        case ErrorcodeShowType_Unknow:
        case ErrorcodeShowType_Refresh:
        {
            _strNavTitle = @"无网络";
            strImageName = @"errorcodeView_showType_refresh";
            strErrorText = @"咦，网络开小差啦";
            strErrorBtnTitle = @"刷新试试";
        }
            break;
        case ErrorcodeShowType_Reload:
        {
            _strNavTitle = @"加载失败";
            strImageName = @"errorcodeView_showType_reload";
            strErrorText = @"呜，加载失败，请重新加载";
            strErrorBtnTitle = @"重新加载";
        }
            break;
        default:
            break;
    }
    
    _errorText.text = strErrorText;
    [_errorBtn setTitle:strErrorBtnTitle forState:UIControlStateNormal];
    _errorIView.image = ImageWithContentsOfFileDefault(strImageName);
}

//页面出现动画
- (void)showInView:(UIView *)view animation:(BOOL)animation
{
    self.frame = view.bounds;
    //保存原标题
    _strNavOriginalTitle = view.viewController.title;
    //设置标题
    view.viewController.title = _strNavTitle;
    
    if (animation) {
        
    }else {
        [view addSubview:self];
    }
}

//消失动画
- (void)dismissWithAnimation:(BOOL)animation
{
    if (animation) {
        
    }else {
        [self removeFromSuperview];
    }
}

//重新加载、返回上一页、返回首页、返回、刷新
- (IBAction)errorBtnAction:(UIButton *)sender
{
    switch (_currentESType) {
        case ErrorcodeShowType_Back:
        {
            [self.viewController.navigationController popViewControllerAnimated:YES];
        }
            break;
        case ErrorcodeShowType_BackLastpage:
        {
            if (_backBlock) {
                _backBlock(_strNavOriginalTitle);
            }
            [self dismissWithAnimation:NO];
        }
            break;
        case ErrorcodeShowType_BackHomepage:
        {
            [self.viewController.navigationController popToRootViewControllerAnimated:YES];
        }
            break;
        case ErrorcodeShowType_Refresh:
        {
            if (_refreshBlock) {
                _refreshBlock(_strNavOriginalTitle);
            }
            [self dismissWithAnimation:NO];
        }
            break;
        case ErrorcodeShowType_Reload:
        {
            if (_reloadBlock) {
                _reloadBlock(_strNavOriginalTitle);
            }
            [self dismissWithAnimation:NO];
        }
            break;
        default:
            break;
    }
}


@end

