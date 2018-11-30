//
//  LPCToolsDemoViewController.m
//  LPCTools
//
//  Created by godlikelpc@gmail.com on 11/29/2018.
//  Copyright (c) 2018 godlikelpc@gmail.com. All rights reserved.
//

#import "LPCToolsDemoViewController.h"
#import "LPCUITool.h"

@interface LPCToolsDemoViewController ()

@end

@implementation LPCToolsDemoViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
}

- (IBAction)btnAction:(id)sender
{
    [LPCUITool showAlertControllerWithViewController:self preferredStyle:UIAlertControllerStyleActionSheet title:@"godlike" message:@"1" cancelTitle:@"qx" firstBtnTitle:@"g" secondBtnTitle:@"s" actionBlock:^(NSInteger index) {
        NSLog(@"%ld",index);
    }];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
