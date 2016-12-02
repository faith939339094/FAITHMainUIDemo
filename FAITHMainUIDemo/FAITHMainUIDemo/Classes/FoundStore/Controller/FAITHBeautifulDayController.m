//
//  FAITHBeautifulDayController.m
//  综合案例
//
//  Created by FAITH on 16/11/3.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHBeautifulDayController.h"
#import "MJExtension.h"
#import "FAITHBeautifulDay.h"
#import "FAITHEvents.h"
#import "FAITHThemes.h"
#import "FAITHBeautifulDayFrame.h"
#import "FAITHFoundStoreCell.h"
@interface FAITHBeautifulDayController ()
@property(nonatomic,strong)NSArray *beautifulDayArray;

@end

@implementation FAITHBeautifulDayController

//懒加载
-(NSArray *)beautifulDayArray
{
    if (_beautifulDayArray==nil){
        [FAITHBeautifulDay mj_setupObjectClassInArray:^NSDictionary *{
            return @{
                     @"events" : [FAITHEvents class],
                     @"themes" : [FAITHThemes class]
                     };
        }];
        _beautifulDayArray=[FAITHBeautifulDay mj_objectArrayWithFilename:@"BeautifulDay.plist"];
        
    }
    return _beautifulDayArray;
}


-(void)viewDidLoad
{
    [super viewDidLoad];
    self.tableView.contentInset = UIEdgeInsetsMake(0, 0, 84, 0);
    
}


-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.beautifulDayArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *const ID=@"beautifulDay";
    
    FAITHFoundStoreCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    
    if (cell==nil) {
        cell=[[FAITHFoundStoreCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    FAITHBeautifulDayFrame *beautifulDayFrame=[[FAITHBeautifulDayFrame alloc] init];
    
    beautifulDayFrame.beautifulDay=self.beautifulDayArray[indexPath.row];
    
    cell.beautifulDayFrame=beautifulDayFrame;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FAITHBeautifulDayFrame *beautifulDayFrame=[[FAITHBeautifulDayFrame alloc] init];
    
    beautifulDayFrame.beautifulDay=self.beautifulDayArray[indexPath.row];

    return beautifulDayFrame.cellHeight;
}


@end
