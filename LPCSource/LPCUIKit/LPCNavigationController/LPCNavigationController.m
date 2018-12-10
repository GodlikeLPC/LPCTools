//
//  LPCNavigationController.m
//  AFNetworking
//
//  Created by 李沛池 on 2018/12/10.
//

#import "LPCNavigationController.h"

@implementation LPCNavigationController

- (BOOL)shouldAutorotate {
    return self.topViewController.shouldAutorotate;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return self.topViewController.supportedInterfaceOrientations;
}

- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation {
    return self.topViewController.preferredInterfaceOrientationForPresentation;
}

@end
