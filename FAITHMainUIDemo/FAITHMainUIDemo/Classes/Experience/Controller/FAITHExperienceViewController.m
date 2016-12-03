//
//  FAITHExperienceViewController.m
//  综合案例
//
//  Created by FAITH on 16/11/1.
//  Copyright © 2016年 FAITH. All rights reserved.
//
#define screenW [UIScreen mainScreen].bounds.size.width
#define screenH [UIScreen mainScreen].bounds.size.height
#define margin 10
#define maxCol 2
#import "FAITHExperienceViewController.h"
#import "FAITHExperienceCell.h"
#import "FAITHExperienceSectionHeadView.h"
#import "FAITHBeautifulDay.h"
#import "FAITHEvents.h"
#import "FAITHThemes.h"
#import "MJExtension.h"
#import "FAITHPageScrollView.h"
@interface FAITHExperienceViewController ()
@property(nonatomic,strong)NSArray *beautifulDayArray;

@end

@implementation FAITHExperienceViewController

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
        _beautifulDayArray=[FAITHBeautifulDay mj_objectArrayWithFilename:@"experience.plist"];
        
    }
    return _beautifulDayArray;
}

static NSString *const ID=@"item";

static NSString *const reuseIdentifier=@"experience";

-(instancetype)init
{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize=CGSizeMake((screenW-(maxCol+1)*margin)/2, (screenW-(maxCol+1)*margin)/2-30);
    
    flowLayout.minimumLineSpacing=0;
    
    flowLayout.minimumInteritemSpacing=margin;
    
    flowLayout.headerReferenceSize = CGSizeMake(screenW, 200);
    
    return [self initWithCollectionViewLayout:flowLayout];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerClass:[FAITHExperienceCell class] forCellWithReuseIdentifier:ID];
    
    [self.collectionView registerClass:[FAITHExperienceSectionHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier];

    self.collectionView.backgroundColor=[UIColor whiteColor];
    
    self.collectionView.alwaysBounceVertical=YES;
    
    self.collectionView.contentInset=UIEdgeInsetsMake(250, 0, 0, 0);
    
    FAITHPageScrollView *pageScrollView=[FAITHPageScrollView pageScrollViewpaeScrollViewWithFrame:CGRectMake(5, -245, 404, 200)];
    
    pageScrollView.imagesArray=@[@"0",@"1",@"2",@"3",@"4"];
    
    [self.collectionView addSubview:pageScrollView];
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.beautifulDayArray.count;
    
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    
    FAITHBeautifulDay *beautifulDay=self.beautifulDayArray[section];
    
    NSArray *themesArray=beautifulDay.themes;
    
    return themesArray.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FAITHExperienceCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    FAITHBeautifulDay *beautifulDay=self.beautifulDayArray[indexPath.section];
    
    NSArray *themesArray=beautifulDay.themes;
    
    cell.themes=themesArray[indexPath.row];
    
    return cell;
}



-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    
    FAITHExperienceSectionHeadView *headView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
    
    FAITHBeautifulDay *beautifulDay=self.beautifulDayArray[indexPath.section];
    
    NSArray *eventsArray=beautifulDay.events;
    
    headView.events=eventsArray[indexPath.row];
    
    return headView;
}

@end
