//
//  LPCStringDefine.h
//  Pods
//
//  Created by 李沛池 on 2018/12/4.
//

#ifndef LPCStringDefine_h
#define LPCStringDefine_h


//数据库名字
#define NAME_Database        @"LPCGodlike.sqlite"

//MD5秘钥
#define STRING_Md5Key_One    @"&REMARK=1596"
#define STRING_Md5Key_Two    @"&REMARK=16219"
#define STRING_Md5Key_Three  @"k32*DrqIPD"
#define STRING_Md5Key_Four   @"0cwh1c@#GH"
#define STRING_Md5Key_Five   @"nXJ4GnA@9$"
#define STRING_Md5Key_Six    @"QDy*8xu$U&"

//MD5串
#define STRING_MD5_Encrypt   @"f2b912ec743abfc97d1516722ee3bbb5"

//替换符号
#define STRING_Separate      @"^_^"

/*
 使用的时候在实现的代理方法中做判断
 判断的name需要做一些处理 LPCNotification_Type(type) 通过这个宏做处理 以达到匹配的程度
 */
#define LPCNotification_Type(type)   [NSString stringWithFormat:@"LPCNotification_%ld",(long)type]


#endif /* LPCStringDefine_h */
