//
//  LPCCommentApp.h
//  EverydayNews
//
//  Created by 李沛池 on 2017/7/24.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LPCDefine.h"

@interface LPCCommentApp : NSObject

singleton_interface(LPCCommentApp);

//配置评论规则
+ (void)configCommentLogicWithTitle:(NSString *)title
                            message:(NSString *)message
                    commentAppBlock:(void (^)())commentAppBlock
                      feedbackBlock:(void (^)())feedbackBlock;

@end
