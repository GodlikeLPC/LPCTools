//
//  NSArray+LPCTools.m
//  LPCTools
//
//  Created by 李沛池 on 2018/12/7.
//

#import "NSArray+LPCTools.h"

@implementation NSArray (LPCTools)

+ (void)load {
    MethodSwizzle_lpc(self, @selector(objectAtIndex:), @selector(objectAtIndex_lpc:));
    MethodSwizzle_lpc(self, @selector(objectAtIndexedSubscript:), @selector(objectAtIndexedSubscript_lpc:));
}

/*
 + (instancetype)arrayWithObjects:(id)firstObj, ... {
 NSMutableArray *array = [NSMutableArray array];
 //VA_LIST 是在C语言中解决变参问题的一组宏
 va_list argList;
 
 if (firstObj) {
 [array addObject:firstObj];
 // VA_START宏，获取可变参数列表的第一个参数的地址,在这里是获取firstObj的内存地址,这时argList的指针 指向firstObj
 va_start(argList, firstObj);
 // 临时指针变量
 id temp;
 // VA_ARG宏，获取可变参数的当前参数，返回指定类型并将指针指向下一参数
 // 首先 argList的内存地址指向的fristObj将对应储存的值取出,如果不为nil则判断为真,将取出的值房在数组中, 并且将指针指向下一个参数,这样每次循环argList所代表的指针偏移量就不断下移直到取出nil
 while ((temp = va_arg(argList, id))) {
 [array addObject:temp];
 }
 }
 
 // 清空列表
 va_end(argList);
 if (self == [NSMutableArray class]) {
 return array;
 } else {
 NSArray *ar = [array copy];
 return ar;
 }
 }
 */

+ (instancetype)arrayWithObjects:(const id [])objects count:(NSUInteger)cnt
{
    NSMutableArray *mArray = [[NSMutableArray alloc] init];
    
    for (NSUInteger i = 0; i < cnt; i ++) {
        if (objects[i]) {
            [mArray addObject:objects[i]];
        } else {
            NSCAssert(0, @"❌❌❌❌❌❌❌:array初始化传了nil");
        }
    }
    
    return [[self alloc] initWithArray:mArray];
}

- (id)objectAtIndex_lpc:(NSUInteger)index
{
    if (self.count > index) {
        return [self objectAtIndex_lpc:index];
    }
    NSCAssert(0, @"❌❌❌❌❌❌❌:objectAtIndex:越界了");
    return nil;
}

- (id)objectAtIndexedSubscript_lpc:(NSUInteger)index
{
    if (self.count > index) {
        return [self objectAtIndexedSubscript_lpc:index];
    }
    NSCAssert(0, @"❌❌❌❌❌❌❌:objectAtIndexedSubscript:越界了");
    return nil;
}


#ifdef DEBUG
//解决xcode控制台输出日志不显示中文的问题
- (NSString *)description {
    return [self LPC_descriptionWithLevel:1];
}

-(NSString *)descriptionWithLocale:(id)locale{
    return [self LPC_descriptionWithLevel:1];
}

- (NSString *)descriptionWithLocale:(nullable id)locale indent:(NSUInteger)level {
    return [self LPC_descriptionWithLevel:(int)level];
}

/**
 将数组转化成字符串，文字格式UTF8,并且格式化
 
 @param level 当前数组的层级，最少为 1，代表最外层
 @return 格式化的字符串
 */
- (NSString *)LPC_descriptionWithLevel:(int)level {
    NSString *subSpace = [self LPC_getSpaceWithLevel:level];
    NSString *space = [self LPC_getSpaceWithLevel:level - 1];
    NSMutableString *retString = [[NSMutableString alloc] init];
    // 1、添加 [
    [retString appendString:[NSString stringWithFormat:@"["]];
    // 2、添加 value
    [self enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        if ([obj isKindOfClass:[NSString class]]) {
            NSString *value = (NSString *)obj;
            value = [value stringByRemovingPercentEncoding];
            NSString *subString = [NSString stringWithFormat:@"\n%@\"%@\",", subSpace, value];
            [retString appendString:subString];
        } else if ([obj isKindOfClass:[NSArray class]]) {
            NSArray *arr = (NSArray *)obj;
            NSString *str = [arr LPC_descriptionWithLevel:level + 1];
            str = [NSString stringWithFormat:@"\n%@%@,", subSpace, str];
            [retString appendString:str];
        } else if ([obj isKindOfClass:[NSDictionary class]]) {
            NSDictionary *dic = (NSDictionary *)obj;
            NSString *str = [dic descriptionWithLocale:nil indent:level + 1];
            str = [NSString stringWithFormat:@"\n%@%@,", subSpace, str];
            [retString appendString:str];
        } else {
            NSString *subString = [NSString stringWithFormat:@"\n%@%@,", subSpace, obj];
            [retString appendString:subString];
        }
    }];
    if ([retString hasSuffix:@","]) {
        [retString deleteCharactersInRange:NSMakeRange(retString.length-1, 1)];
    }
    // 3、添加 ]
    [retString appendString:[NSString stringWithFormat:@"\n%@]", space]];
    return retString;
}

/**
 根据层级，返回前面的空格占位符
 
 @param level 层级
 @return 占位空格
 */
- (NSString *)LPC_getSpaceWithLevel:(int)level {
    NSMutableString *mustr = [[NSMutableString alloc] init];
    for (int i=0; i<level; i++) {
        [mustr appendString:@"\t"];
    }
    return mustr;
}
#endif

@end



@implementation NSMutableArray (Safely)

+ (void)load
{
    MethodSwizzle_lpc(self, @selector(addObject:), @selector(addObject_lpc:));
    MethodSwizzle_lpc(self, @selector(removeObjectAtIndex:), @selector(removeObjectAtIndex_lpc:));
    MethodSwizzle_lpc(self, @selector(insertObject:atIndex:), @selector(insertObject_lpc:));
}

- (void)addObject_lpc:(id)object
{
    if (object) {
        [self addObject_lpc:object];
    }else {
        NSCAssert(0, @"❌❌❌❌❌❌❌addObject:参数不是对象或为nil");
    }
}

- (void)removeObjectAtIndex_lpc:(NSUInteger)index
{
    if (self.count > index) {
        [self removeObjectAtIndex_lpc:index];
    }else {
        NSCAssert(0, @"❌❌❌❌❌❌❌removeObjectAtIndex:参数越界");
    }
}

- (void)insertObject_lpc:(id)anObject atIndex:(NSUInteger)index
{
    if (anObject) {
        NSUInteger count = self.count;
        if (count >= index) {
            [self insertObject_lpc:anObject atIndex:index];
        } else {
            NSCAssert(0, @"❌❌❌❌❌❌❌insertObject:atIndex: index越界了,但是被我加到数组最后一位了");
            [self insertObject_lpc:anObject atIndex:count];
        }
    }else {
        NSCAssert(0, @"❌❌❌❌❌❌❌insertObject:atIndex:  Object不是合法对象");
    }
}

@end
