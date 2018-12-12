//
//  LPCOtherDefine.h
//  Pods
//
//  Created by 李沛池 on 2018/12/4.
//

#ifndef LPCOtherDefine_h
#define LPCOtherDefine_h

#import <objc/runtime.h>
// runtime 方法交换
NS_INLINE void MethodSwizzle_lpc(Class cls, SEL origSelector, SEL newSelector) {
    Method originalMethod = class_getInstanceMethod(cls, origSelector);
    Method swizzledMethod = class_getInstanceMethod(cls, newSelector);
    
    BOOL didAddMethod = class_addMethod(cls,
                                        origSelector,
                                        method_getImplementation(swizzledMethod),
                                        method_getTypeEncoding(swizzledMethod));
    if (didAddMethod) {
        class_replaceMethod(cls,
                            newSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}


#endif /* LPCOtherDefine_h */
