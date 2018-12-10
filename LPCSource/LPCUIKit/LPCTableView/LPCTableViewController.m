//
//  LPCTableViewController.m
//  AFNetworking
//
//  Created by 李沛池 on 2018/12/10.
//

#import "LPCTableViewController.h"

@implementation LPCTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
}

- (NSString *)cellClassStringWithIndexPathRow:(NSInteger)row
{
    return @"";
}


#pragma mark - UITableViewDelegate、UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _arrayDataTV.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    LPCTableViewCell *cell;
    XIBcellWithName([self cellClassStringWithIndexPathRow:indexPath.row]);
    cell.delegate = self;
    cell.cellIndexPath = indexPath;
    [(LPCTableViewCell *)cell updateData:_arrayDataTV[indexPath.row]];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    return nil;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    return nil;
}


#pragma mark - LPCTableViewDelegate
- (void)lpcTableViewBeforeReloadData
{
    if (!self.tableViewLPC || !self.tableViewLPC.showErrorView) {
        return;
    }
    
    if (self.arrayDataTV.count == 0) {
//        [LPCErrorView showInView:self.tableViewLPC errorType:LPCErrorView_Errorcode_NoTask];
    }else {
//        [LPCErrorView dismissWithAnimation:NO];
    }
}


#pragma mark - LPCTableViewCellDelegate
- (void)actionCellClickWithBtnIndex:(NSUInteger)btnIndex cellIndexPath:(NSIndexPath *)indexPath
{
    
}

@end
