//
//  LPCPathDefine.h
//  Pods
//
//  Created by 李沛池 on 2018/12/4.
//

#ifndef LPCPathDefine_h
#define LPCPathDefine_h


//获取沙盒路径
#define PATH_AppDomains              NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES)
//系统Document目录
#define PATH_Document                [PATH_AppDomains firstObject]
//下载文件存储目录
#define PATH_DownloadPath            [PATH_Document stringByAppendingPathComponent:@"LPCDownload"]

//自动化埋点目录名
#define PATH_UserStatistics          @"LPCImages.bundle/LPCGlobalUserStatisticsConfig"


#endif /* LPCPathDefine_h */
