//
//  FAITHClassifyGroup.m
//  综合案例
//
//  Created by FAITH on 16/11/23.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHClassifyGroup.h"
#import "FAITHClassifyItem.h"
@implementation FAITHClassifyGroup

+(NSMutableArray *)getClassifyItemWithfileName:(NSString *)fileName
{
    NSString *filePath=[[NSBundle mainBundle] pathForResource:fileName ofType:nil];
    
    NSArray *array=[NSArray arrayWithContentsOfFile:filePath];
    
    NSMutableArray *tempArray=[NSMutableArray array];
    
    for (NSDictionary *dict in array) {
        FAITHClassifyGroup *group=[FAITHClassifyGroup groupWithDict:dict];
        
        [tempArray addObject:group];
   
    }
    
    return tempArray;
}

-(FAITHClassifyGroup *)initWithDict:(NSDictionary *)dict
{
    if (self=[super init]) {

        [self setValuesForKeysWithDictionary:dict];
    }
    
    return self;
}

+(FAITHClassifyGroup *)groupWithDict:(NSDictionary *)dict
{
    return [[self alloc] initWithDict:dict];
}

-(void)setValue:(id)value forKey:(NSString *)key
{
    if ([key isEqualToString:@"tags"]) {
        NSMutableArray *tempArray=[NSMutableArray array];
        
        for (NSDictionary *dict in (NSArray *)value) {
            FAITHClassifyItem *item=[FAITHClassifyItem itemWithDict:dict];
            
            [tempArray addObject:item];
        }
        
        self.tags=tempArray;
        return;
    }
    
    [super setValue:value forKey:key];
}

@end
