//
//  LPCPathDefine.h
//  LPCTools
//
//  Created by 李沛池 on 2017/7/22.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#ifndef LPCPathDefine_h
#define LPCPathDefine_h


//默认的系统plist文件
#define DefaultSystemPlist    [NSUserDefaults standardUserDefaults]
//Document目录
#define PATH_Document         [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) firstObject]
//下载文件存储目录
#define PATH_DownloadPath [PATH_Document stringByAppendingPathComponent:@"LPCDownloadFile"]


#endif /* LPCPathDefine_h */
