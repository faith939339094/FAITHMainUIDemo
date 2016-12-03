//
//  FAITHTabBarController.m
//  彩票
//
//  Created by FAITH on 16/10/5.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHTabBarController.h"
#import "FAITHTabBar.h"
#import "FAITHNavigationController.h"
#import "FAITHFoundStoreController.h"
#import "FAITHExperienceViewController.h"
#import "FAITHClassifyViewController.h"
@interface FAITHTabBarController ()<FAITHTabBarDelegate>
@property(nonatomic,strong)NSMutableArray *items;


@end

@implementation FAITHTabBarController

//懒加载
-(NSMutableArray *)items
{
    if (_items==nil){
        _items=[NSMutableArray array];
    }
    return _items;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
   
    //添加所有的viewController
    [self setUpAllChildController];
    
    //自定义tabbar
    [self setUpTabBar];
    
}

-(void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    for (UIView *child in self.tabBar.subviews) {
        if (![child isKindOfClass:[FAITHTabBar class]]) {
            [child removeFromSuperview];
        }
    }
   
}

-(void)setUpTabBar
{
    
    FAITHTabBar *tabBar=[[FAITHTabBar alloc] initWithFrame:self.tabBar.bounds];
    
    tabBar.items=self.items;
    
    tabBar.delegate=self;
    
    [self.tabBar addSubview:tabBar];
}


//调用代理协议方法
-(void)tabBar:(FAITHTabBar *)tabBar didClickBtn:(UIButton *)btn
{
    if (btn.tag==2) {

    }
    
    self.selectedIndex=btn.tag;
}

//添加所有的viewController
-(void)setUpAllChildController
{
    //探店
    FAITHFoundStoreController *foundStore=[[FAITHFoundStoreController alloc] init];
    
    [self setUpOneChildControllerWithViewController:foundStore image:[UIImage imageNamed: @"recommendation_1" ]selectedImage:[UIImage imageNamed: @"recommendation_2"] title:@"探店"];
    
    //体验
    FAITHExperienceViewController *experience=[[FAITHExperienceViewController alloc] init];
    
    [self setUpOneChildControllerWithViewController:experience image:[UIImage imageNamed: @"broadwood_1"] selectedImage:[UIImage imageNamed: @"broadwood_2"] title:@"体验"];
    
    //分类
    FAITHClassifyViewController *classify=[[FAITHClassifyViewController alloc] init];
    
    [self setUpOneChildControllerWithViewController:classify image:[UIImage imageNamed: @"classification_1"] selectedImage:[UIImage imageNamed: @"classification_2"] title:@"分类"];

   
   
}
//设置一个子控制器
-(void)setUpOneChildControllerWithViewController:(UIViewController *)viewController image:(UIImage *)image selectedImage:(UIImage *)selImage title:(NSString *)title
{
    //系统自带的tabbar规定图片的大小不能超过49,为此自定义tabbar
    
    UINavigationController *nav=[[FAITHNavigationController alloc] initWithRootViewController:
                                    viewController];
    viewController.navigationItem.title=title;
    
    nav.tabBarItem.title=title;
    nav.tabBarItem.image=image;
    nav.tabBarItem.selectedImage=selImage;
    
    [self.items addObject:nav.tabBarItem];
    
    [self addChildViewController:nav];
}

@end
