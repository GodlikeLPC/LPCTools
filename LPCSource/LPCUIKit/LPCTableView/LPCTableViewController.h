//
//  LPCTableViewController.h
//  AFNetworking
//
//  Created by 李沛池 on 2018/12/10.
//

#import "LPCViewController.h"
#import "LPCTableView.h"
#import "LPCTableViewCell.h"

/**
 带tableView的页面都可以继承此ViewController
 */
@interface LPCTableViewController : LPCViewController<
UITableViewDelegate,
LPCTableViewDelegate,
UITableViewDataSource,
LPCTableViewCellDelegate>

@property (nonatomic, weak)   LPCTableView   *tableViewLPC;
@property (nonatomic, strong) NSMutableArray *arrayDataTV; //tableView的数据源

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;

//赋值cell类
- (NSString *)cellClassStringWithIndexPathRow:(NSInteger)row;

@end
