//
//  FAITHBeautifulDay.h
//  综合案例
//
//  Created by FAITH on 16/11/1.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import <Foundation/Foundation.h>
@class FAITHEvents;
@interface FAITHBeautifulDay : NSObject

@property(nonatomic,strong) NSString *date;

@property(nonatomic,strong) NSArray *events;

@property(nonatomic,strong) NSArray *themes;

@property (nonatomic, strong) NSString *month;

@property (nonatomic, strong) NSString *day;

@end
