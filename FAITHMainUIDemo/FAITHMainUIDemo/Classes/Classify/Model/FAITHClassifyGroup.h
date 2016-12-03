//
//  FAITHClassifyGroup.h
//  综合案例
//
//  Created by FAITH on 16/11/23.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FAITHClassifyGroup : NSObject
@property(nonatomic,strong)NSNumber * ID;

@property(nonatomic,strong) NSMutableArray *tags;

@property(nonatomic,strong) NSString *title;

-(__kindof FAITHClassifyGroup *)initWithDict:(NSDictionary *)dict;

+(__kindof FAITHClassifyGroup *)groupWithDict:(NSDictionary *)dict;

+(NSMutableArray *)getClassifyItemWithfileName:(NSString *)fileName;
@end
