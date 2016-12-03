//
//  FAITHClassifyItem.h
//  综合案例
//
//  Created by FAITH on 16/11/23.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FAITHClassifyItem : NSObject
@property(nonatomic,strong) NSString *name;

@property(nonatomic,strong) NSString *img;

-(__kindof FAITHClassifyItem *)initWithDict:(NSDictionary *)dict;

+(__kindof FAITHClassifyItem *)itemWithDict:(NSDictionary *)dict;
@end
