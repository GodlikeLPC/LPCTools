//
//  LPCLanguageDefine.h
//  EverydayNews
//
//  Created by 李沛池 on 2017/7/22.
//  Copyright © 2017年 Godlike. All rights reserved.
//

#ifndef LPCLanguageDefine_h
#define LPCLanguageDefine_h

//系统语言
#define APP_Language        [[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLanguages"] firstObject]
//系统地区
#define APPLocale_Zone      [[[[NSUserDefaults standardUserDefaults] objectForKey:@"AppleLocale"] componentsSeparatedByString:@"_"] lastObject]

#define KLanguage_Chinese   @"zh-Hans"
#define KLanguage_English   @"en"

#define Language_Chinese_Show @"中文(简体)"
#define Language_English_Show @"English"

#define KZone_China         @"CN"
#define KZone_China_TW      @"TW" //台湾
#define KZone_China_HK      @"HK" //香港
#define KZone_China_MO      @"MO" //澳门
#define KZone_English       @"US"

//国际化
#define WPLocalizedString(Key) NSLocalizedString(Key, nil)


#endif /* LPCLanguageDefine_h */
