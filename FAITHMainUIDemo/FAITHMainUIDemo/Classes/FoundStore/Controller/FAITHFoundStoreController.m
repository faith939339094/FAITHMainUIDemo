//
//  FAITHFoundStoreController.m
//  综合案例
//
//  Created by FAITH on 16/11/3.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHFoundStoreController.h"
#import "UIBarButtonItem+Extension.h"
#import "FAITHCityButton.h"
#import "FAITHTitleView.h"
#import "FAITHTitleView.h"
#import "FAITHBeautifulDayController.h"
#import "FAITHAblumController.h"
#import "FAITHNearByController.h"
#import "FAITHChooseCityController.h"

@interface FAITHFoundStoreController ()<FAITHTitleViewDelegate>

@property(nonatomic,weak)UIButton *dayBtn;

@property(nonatomic,weak)UIButton *ablumBtn;
@end

@implementation FAITHFoundStoreController

static NSString *const ID=@"foundStore";

-(instancetype)init
{
    //创建流水布局
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize=[UIScreen mainScreen].bounds.size;
    
    flowLayout.minimumLineSpacing=0;
    
    flowLayout.minimumInteritemSpacing=0;
    
    flowLayout.scrollDirection=UICollectionViewScrollDirectionHorizontal;
 
    return [self initWithCollectionViewLayout:flowLayout];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:ID];
    
    self.collectionView.bounces=NO;
    
    self.collectionView.pagingEnabled=YES;
    
    self.collectionView.showsHorizontalScrollIndicator=NO;
    
    self.navigationItem.leftBarButtonItem=[FAITHCityButton butttonWithImageName:@"home_down" title:@"罗马" target:self action:@selector(cityBtnClick)];
    
    self.navigationItem.rightBarButtonItem=[UIBarButtonItem itemWithTitle:@"附近" target:self action:@selector(nearByBtnClick)];
    
    FAITHTitleView *titleView=[FAITHTitleView titleView];
    
    self.navigationItem.titleView=titleView;
    
    titleView.delegate=self;
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    CGRect frame = self.collectionView.frame;
    frame.origin.y += 44;
    self.collectionView.frame = frame;
    
    self.collectionView.backgroundColor=[UIColor whiteColor];
    
}

-(void)titleView:(FAITHTitleView *)titleView didClickBtn:(UIButton *)btn
{

    if (btn.tag==0) {
        
        self.dayBtn=btn;
        
        //[self.collectionView setCfontentOffset:CGPointZero animated:YES];
        [self.collectionView setContentOffset:CGPointZero animated:YES];
    }else
    {
        self.ablumBtn=btn;
        
        [self.collectionView setContentOffset:CGPointMake(self.view.bounds.size.width, 0) animated:YES];
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    
    
    
}


-(void)nearByBtnClick
{
    FAITHNearByController *nearbyController=[[FAITHNearByController alloc] init];
    
    [self.navigationController pushViewController:nearbyController animated:YES];
}

-(void)cityBtnClick
{
    FAITHChooseCityController *chooseCity=[[FAITHChooseCityController alloc] init];
    
    UINavigationController *nav=[[UINavigationController alloc] initWithRootViewController:chooseCity];
    
    [self presentViewController:nav animated:YES completion:nil];
}



-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 2;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UICollectionViewCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    if (indexPath.row==0) {
        FAITHBeautifulDayController *beautifulDay=[[FAITHBeautifulDayController alloc] init];
        
        [cell.contentView addSubview:beautifulDay.view];
        
        [self addChildViewController:beautifulDay];
    }else
    {
        FAITHAblumController *ablum=[[FAITHAblumController alloc] init];
        
        [self addChildViewController:ablum];
        
        [cell.contentView addSubview:ablum.view];
    }
    
    return cell;
}

-(void)scrollViewDidScroll:(UIScrollView *)scrollView
{
   
    
        
}



@end
