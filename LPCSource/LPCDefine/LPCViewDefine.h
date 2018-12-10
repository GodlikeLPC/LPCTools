//
//  LPCViewDefine.h
//  Pods
//
//  Created by 李沛池 on 2018/12/4.
//

#ifndef LPCViewDefine_h
#define LPCViewDefine_h


// View 圆角和加边框
#define VIEWBORDERRADIUS(View, Radius, Width, Color)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES];\
[View.layer setBorderWidth:(Width)];\
[View.layer setBorderColor:[Color CGColor]]

// View 圆角
#define VIEWRADIUS(View, Radius)\
\
[View.layer setCornerRadius:(Radius)];\
[View.layer setMasksToBounds:YES]

// UIView - viewWithTag
#define VIEWWITHTAG(object, tag)       [object viewWithTag:tag]


#endif /* LPCViewDefine_h */
