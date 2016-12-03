//
//  FAITHClassifyItem.m
//  综合案例
//
//  Created by FAITH on 16/11/23.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHClassifyItem.h"

@implementation FAITHClassifyItem


-(FAITHClassifyItem *)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {
        
        self.name=dict[@"name"];
        
        self.img=dict[@"img"];
    }
    
    return self;
}

+(FAITHClassifyItem *)itemWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}
@end
