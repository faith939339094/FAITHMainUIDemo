//
//  FAITHAblumController.m
//  综合案例
//
//  Created by FAITH on 16/11/3.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHAblumController.h"
#import "MJExtension.h"
#import "FAITHThemes.h"
#import "FAITHBeautifulDayFrame.h"
#import "FAITHAblumCell.h"
@interface FAITHAblumController ()
@property(nonatomic,strong)NSArray *ablumArray;

@end
@implementation FAITHAblumController

static NSString *const ID=@"ablum";

//懒加载
-(NSArray *)ablumArray
{
    if (_ablumArray==nil){
        _ablumArray=[FAITHThemes mj_objectArrayWithFilename:@"theme.plist"];
    }
    return _ablumArray;
}

-(void)viewDidLoad
{
    [super viewDidLoad];

}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.ablumArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    FAITHAblumCell *cell=[tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
        cell=[[FAITHAblumCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    
    FAITHThemes *ablum=self.ablumArray[indexPath.row];
    
    cell.ablum=ablum;
    
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 200;
}


@end
