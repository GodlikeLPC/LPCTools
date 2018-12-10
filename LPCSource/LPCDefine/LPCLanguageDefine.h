//
//  LPCLanguageDefine.h
//  Pods
//
//  Created by 李沛池 on 2018/12/4.
//

#ifndef LPCLanguageDefine_h
#define LPCLanguageDefine_h


//系统语言
#define LANGUAGE_Apple               [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] firstObject]
//系统地区
#define LANGUAGE_AppleLocale         [[[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLocale"] componentsSeparatedByString:@"_"] lastObject]

//设置给程序的
#define LANGUAGE_Chinese_App         @"zh-Hans"
#define LANGUAGE_English_App         @"en"
//展示给用户的
#define LANGUAGE_Chinese_Show        @"中文(简体)"
#define LANGUAGE_English_Show        @"English"

#define LANGUAGE_Zone_China          @"CN"
#define LANGUAGE_Zone_China_TW       @"TW" //台湾
#define LANGUAGE_Zone_China_HK       @"HK" //香港
#define LANGUAGE_Zone_China_MO       @"MO" //澳门
#define LANGUAGE_Zone_English        @"US"

//国际化
#define LPCLocalizedString(Key)      NSLocalizedString(Key, nil)


#endif /* LPCLanguageDefine_h */
