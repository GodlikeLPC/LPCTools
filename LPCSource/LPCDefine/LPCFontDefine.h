//
//  LPCFontDefine.h
//  Pods
//
//  Created by 李沛池 on 2018/12/4.
//

#ifndef LPCFontDefine_h
#define LPCFontDefine_h


//平方-常规
#define FONT_PFSC_Regular(s)           [UIFont fontWithName:@"PingFangSC-Regular" size:s]
//平方-中黑
#define FONT_PFSC_Medium(s)            [UIFont fontWithName:@"PingFangSC-Medium" size:s]
//平方-中粗
#define FONT_PFSC_Semibold(s)          [UIFont fontWithName:@"PingFangSC-Semibold" size:s]


#pragma mark - WALKUP
//BebasNeue-常规
#define FONT_BebasNeue_Regular(s)      [UIFont fontWithName:@"BebasNeueregular" size:s]==nil?[UIFont systemFontOfSize:s]:[UIFont fontWithName:@"BebasNeueregular" size:s]
//BebasNeue-粗体
#define FONT_BebasNeue_Bold(s)         [UIFont fontWithName:@"BebasNeuebold" size:s]==nil?[UIFont systemFontOfSize:s]:[UIFont fontWithName:@"BebasNeuebold" size:s]


#endif /* LPCFontDefine_h */
