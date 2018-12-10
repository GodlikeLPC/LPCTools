//
//  LPCModel.h
//  AFNetworking
//
//  Created by 李沛池 on 2018/12/10.
//

#import "JSONModel.h"

@interface LPCModel : JSONModel

//重写JSONModel方法 以方便使用
- (instancetype)initWithDictionaryJSON:(NSDictionary *)dict;

+ (NSMutableArray *)arrayOfModelsFromDictionariesJSON:(NSArray *)array;

@end
