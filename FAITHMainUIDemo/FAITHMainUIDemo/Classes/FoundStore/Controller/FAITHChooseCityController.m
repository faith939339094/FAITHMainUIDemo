//
//  FAITHChooseCityController.m
//  综合案例
//
//  Created by FAITH on 16/11/3.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHChooseCityController.h"
#import "FAITHCityCell.h"
#import "UIBarButtonItem+Extension.h"
#import "FAITHCityHeadView.h"
@interface FAITHChooseCityController ()

@property(nonatomic,strong)NSArray *domesticCityArray;

@property(nonatomic,strong)NSArray *overseasCityArray;

@property(nonatomic,strong)NSArray *cityArray;

@property(nonatomic,weak)UILabel *cityLabel;

@end
@implementation FAITHChooseCityController

static NSString *const ID=@"City";
static NSString *const cityHead=@"cityHead";
//懒加载
-(NSArray *)domesticCityArray
{
    if (_domesticCityArray==nil){
        _domesticCityArray=[NSArray arrayWithObjects:@"北京", @"上海", @"深圳", @"广州", @"杭州", @"西安", @"重庆", @"厦门", @"台北", nil];
        
    }
    return _domesticCityArray;
}

//懒加载
-(NSArray *)overseasCityArray
{
    if (_overseasCityArray==nil){
        
//        _overseasCityArray
        _overseasCityArray=[NSArray arrayWithObjects:@"罗马", @"迪拜", @"里斯本", @"巴黎", @"柏林", @"伦敦", nil];
        
    }
    return _overseasCityArray;
}

-(NSArray *)cityArray
{
    if (_cityArray==nil) {
        _cityArray=[NSArray arrayWithObjects:self.domesticCityArray,self.overseasCityArray, nil];
    }
    return _cityArray;
}
-(instancetype)init
{
    //创建流失布局
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.minimumLineSpacing=1;
    
    flowLayout.minimumInteritemSpacing=1;

    flowLayout.itemSize=CGSizeMake([UIScreen mainScreen].bounds.size.width/3-1, 40);
    
    flowLayout.headerReferenceSize=CGSizeMake([UIScreen mainScreen].bounds.size.width, 60);

    return [self initWithCollectionViewLayout:flowLayout];
}

-(void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.collectionView registerClass:[FAITHCityCell class] forCellWithReuseIdentifier:ID];
    
    [self.collectionView registerClass:[FAITHCityHeadView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cityHead];
    
    self.collectionView.backgroundColor=[UIColor lightGrayColor];
    
    self.collectionView.alwaysBounceVertical=YES;
    
    self.navigationItem.leftBarButtonItem=[UIBarButtonItem itemWithTitle:@"取消" target:self action:@selector(cancel)];
    
    self.navigationController.navigationBar.tintColor=[UIColor clearColor];
    
    self.title=@"选择城市";
    
//    self.view.backgroundColor=[UIColor whiteColor];
    
//    self.view.backgroundColor=[UIColor lightGrayColor];
    
//    self.automaticallyAdjustsScrollViewInsets=NO;

}

-(void)cancel
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath{
    //返回YES允许其item移动
    return YES;
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.cityArray.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    NSArray *array=self.cityArray[section];
    
    return array.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FAITHCityCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    NSArray *array=self.cityArray[indexPath.section];
    
    cell.cityName=array[indexPath.row];
    
    return cell;
}


- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath {
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        
        FAITHCityHeadView *headView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:cityHead forIndexPath:indexPath];
        
        if (indexPath.section == 0) {
            headView.citySection= @"国内城市";
        } else {
            headView.citySection = @"国外城市";
        }
        return headView;
        
    }else {
        return nil;
    }
}

@end
