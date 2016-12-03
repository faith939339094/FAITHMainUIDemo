//
//  FAITHClassifyViewController.m
//  综合案例
//
//  Created by FAITH on 16/11/1.
//  Copyright © 2016年 FAITH. All rights reserved.
//
#define margin 10
#import "FAITHClassifyViewController.h"
#import "FAITHClassifyItem.h"
#import "FAITHClassifyGroup.h"
#import "FAITHClassifyGroupView.h"
#import "FAITHClassifyItemCell.h"

@interface FAITHClassifyViewController ()<UIGestureRecognizerDelegate>
@property(nonatomic,strong)NSMutableArray *groupArray;


@end
@implementation FAITHClassifyViewController

static NSString *const ID=@"classifyItem";

static NSString *const reuseIdentifier=@"classifyGroup";

//懒加载
-(NSMutableArray *)groupArray
{
    if (_groupArray==nil){
        _groupArray=[FAITHClassifyGroup getClassifyItemWithfileName:@"Classify.plist"];
    }
    return _groupArray;
}


-(instancetype)init
{
    UICollectionViewFlowLayout *flowLayout=[[UICollectionViewFlowLayout alloc] init];
    
    flowLayout.itemSize=CGSizeMake((screenW-4*margin)/3, 80);
    
    flowLayout.minimumLineSpacing=margin;
    
    flowLayout.minimumInteritemSpacing=margin;
    
    flowLayout.headerReferenceSize=CGSizeMake(screenW, 60);
    
    return [self initWithCollectionViewLayout:flowLayout];

}

-(void)viewDidLoad
{
    [super viewDidLoad];

    self.collectionView.alwaysBounceVertical=YES;
    
    self.collectionView.backgroundColor=[UIColor colorWithRed:0.98 green:0.98 blue:0.98  alpha:0.8];
    //注册
    [self.collectionView registerClass:[FAITHClassifyItemCell class] forCellWithReuseIdentifier:ID];
    
    [self.collectionView registerClass:[FAITHClassifyGroupView class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier];
    
    self.collectionView.contentInset=UIEdgeInsetsMake(margin, margin, margin, margin);
    
    //为某控件添加长按手势
    UILongPressGestureRecognizer *longPress=[[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPress:)];
    
    [self.collectionView addGestureRecognizer:longPress];
    
    longPress.delegate=self;
  
}

-(void)longPress:(UIPanGestureRecognizer *)longPress
{
    switch (longPress.state) {
        case UIGestureRecognizerStateBegan:{
            //获取当前手指的点
            CGPoint curP=[longPress locationInView:self.collectionView];
            //通过当前手指的点的位置获取item的indexpath
            NSIndexPath *indexPath =[self.collectionView indexPathForItemAtPoint:curP];
            //如果indexpath为nil返回
            if (indexPath==nil) {
                break;
            }
            
            //开始与用户进行交互
            [self.collectionView beginInteractiveMovementForItemAtIndexPath:indexPath];
        
            break;
        }
            
        case UIGestureRecognizerStateChanged:{
            
            CGPoint curP=[longPress locationInView:self.collectionView];
            //手指移动的时候随时更新
            [self.collectionView updateInteractiveMovementTargetPosition:curP];
            
            break;
        }
            
        case UIGestureRecognizerStateEnded:{
            //手指停止的时候关闭交互
            [self.collectionView endInteractiveMovement];
            
            break;
        }

        default:
            //取消交互
            [self.collectionView cancelInteractiveMovement];
            
            break;
    }
    
    
}

-(BOOL)collectionView:(UICollectionView *)collectionView canMoveItemAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

-(void)collectionView:(UICollectionView *)collectionView moveItemAtIndexPath:(NSIndexPath *)sourceIndexPath toIndexPath:(NSIndexPath *)destinationIndexPath
{
    //获取当前组数据
    FAITHClassifyGroup *group=self.groupArray[sourceIndexPath.section];
    //取出源item数据
    FAITHClassifyItem *item=group.tags[sourceIndexPath.row];
    //从资源组中移除该数据
    [group.tags removeObject:item];
    //取出目标组
    FAITHClassifyGroup *group2=self.groupArray[destinationIndexPath.section];
    //将数据圆加到目标数组中
    [group2.tags insertObject:item atIndex:destinationIndexPath.row];
    
    
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return self.groupArray.count;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    FAITHClassifyGroup *group=self.groupArray[section];

    return group.tags.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    FAITHClassifyItemCell *cell=[collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    
    FAITHClassifyGroup *group=self.groupArray[indexPath.section];
    
    FAITHClassifyItem *item=group.tags[indexPath.row];
    
    cell.item=item;
    
    return cell;
 
}

-(UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
{
    
    if ([kind isEqualToString:UICollectionElementKindSectionHeader]) {
        FAITHClassifyGroupView *headView=[collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:reuseIdentifier forIndexPath:indexPath];
        
        headView.group=self.groupArray[indexPath.section];
        
        return headView;
    }else{
        return nil;
    }
}





@end
