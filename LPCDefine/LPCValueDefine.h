//
//  LPCValueDefine.h
//  Pods
//
//  Created by 李沛池 on 2018/12/4.
//

#ifndef LPCValueDefine_h
#define LPCValueDefine_h


//toast弹窗默认显示时长(s)
#define VALUE_TOAST_Duration_Default          (1.3f)
//手势解锁失效时间(s)
#define VALUE_Invalid_GesturesUnlock          (130)

//默认分页数
#define Size_Pagesize_Default                 (20)
//默认tag
#define TAG_Default                           (100)

//由角度获取弧度
#define VALUE_DegreesToRadian(x)              (M_PI * (x) / 180.0)
//由弧度获取角度
#define VALUE_RadianToDegrees(radian)         (radian*180.0)/(M_PI)

//一天的秒数
#define VALUE_SecondsOneDay                   (24.f * 60.f * 60.f)
//根据天数获取秒数
#define VALUE_Seconds(days)                   (24.f * 60.f * 60.f * (days))
//一天的毫秒数
#define VALUE_MillisecondsOneDay              (24.f * 60.f * 60.f * 1000.f)
//根据天数获取毫秒数
#define VALUE_Milliseconds(days)              (24.f * 60.f * 60.f * 1000.f * (days))


#endif /* LPCValueDefine_h */
