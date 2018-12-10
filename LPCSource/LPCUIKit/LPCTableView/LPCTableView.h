//
//  LPCTableView.h
//  LPCTools
//
//  Created by 李沛池 on 2018/12/7.
//

#import <UIKit/UIKit.h>

@protocol LPCTableViewDelegate <NSObject>

@optional
- (void)lpcTableViewBeforeReloadData;
- (void)lpcTableViewAfterReloadData;

@end

@interface LPCTableView : UITableView

@property (nonatomic, assign) IBInspectable BOOL showErrorView;   //是否需要在无数据时展示errorView

@property (nonatomic, weak) IBOutlet id <LPCTableViewDelegate> delegate_lpc;

@end
