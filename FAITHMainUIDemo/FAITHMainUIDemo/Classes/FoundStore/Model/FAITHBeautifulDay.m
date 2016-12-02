//
//  FAITHBeautifulDay.m
//  综合案例
//
//  Created by FAITH on 16/11/1.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHBeautifulDay.h"
#import "NSDate(Extension).h"
#import "FAITHEvents.h"
@implementation FAITHBeautifulDay


-(void)setDate:(NSString *)date
{
    _date = date;
    
    if (date.length == 10) {
        
        NSString *tmpM = [date substringWithRange:NSMakeRange(5, 2)];
        
        NSInteger res = tmpM.intValue;
        
        switch (res) {
            case 1:
                self.month = @"Jan.";
                break;
            case 2:
                self.month = @"Feb.";
                break;
            case 3:
                self.month = @"Mar.";
                break;
            case 4:
                self.month = @"Apr.";
                break;
            case 5:
                self.month = @"May.";
                break;
            case 6:
                self.month = @"Jun.";
                break;
            case 7:
                self.month = @"Jul.";
                break;
            case 8:
                self.month = @"Aug.";
                break;
            case 9:
                self.month = @"Sep.";
                break;
            case 10:
                self.month = @"Oct.";
                break;
            case 11:
                self.month = @"Nov.";
                break;
            case 12:
                self.month = @"Dec.";
                break;
                
            default:
                self.month = @"\(tmpM).";
        }
    } else {
        self.month = @"Aug.";
    }
    
    self.day = [date substringWithRange:NSMakeRange(8, 2)];
    
}

//- (void)setValue:(id)value forKey:(NSString *)key {
//    // 拦截body
//    if ([key isEqualToString:@"themes"]) {
//        
//        NSMutableArray *arrM = [NSMutableArray array];
//        
//        for (NSDictionary *dict in (NSArray *)value) {
//            XQThemesItem *model = [XQThemesItem themsItemWithDict:dict];
//            [arrM addObject:model];
//        }
//        self.themes = [arrM copy];
//        return;
//    }else if([key isEqualToString:@"events"]) {
//        
//        NSMutableArray *arrM = [NSMutableArray array];
//        
//        for (NSDictionary *dict in (NSArray *)value) {
//            XQEventsItem *model = [XQEventsItem eventsItemWithDict:dict];
//            [arrM addObject:model];
//        }
//        self.events = [arrM copy];
//        return;
//    }
//    [super setValue:value forKey:key];
//}


@end
