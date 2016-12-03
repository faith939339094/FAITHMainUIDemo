//
//  FAITHNavigationController.m
//  彩票
//
//  Created by FAITH on 16/10/6.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHNavigationController.h"
#import "UIImage+Extension.h"

@interface FAITHNavigationController ()<UINavigationControllerDelegate>
@property(nonatomic,strong)id popDelegate;
@end

@implementation FAITHNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _popDelegate=self.interactivePopGestureRecognizer.delegate;
    
    self.delegate=self;
}

-(void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    if (viewController==self.childViewControllers[0]) {
        self.interactivePopGestureRecognizer.delegate=_popDelegate;
    }else
    {
        self.interactivePopGestureRecognizer.delegate=nil;
    }
}

+(void)load
{
    if (self==[FAITHNavigationController class]) {
        UINavigationBar *navBar=[UINavigationBar appearanceWhenContainedInInstancesOfClasses:@[[FAITHNavigationController class]]];
        
        
//        [navBar setBackgroundImage:[UIImage imageNamed:@"bar"] forBarMetrics:UIBarMetricsDefault];
        
        NSMutableDictionary *textAttr=[NSMutableDictionary dictionary];
        textAttr[NSForegroundColorAttributeName]=[UIColor blackColor];
        
        textAttr[NSFontAttributeName]=[UIFont systemFontOfSize:20];
        
        [[UIBarButtonItem appearance] setTitleTextAttributes:textAttr forState:UIControlStateNormal];
        
        [navBar setTitleTextAttributes:textAttr];
    }
    
}


-(void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    
    if (self.childViewControllers.count) {
        viewController.hidesBottomBarWhenPushed=YES;
        viewController.navigationItem.leftBarButtonItem=[[UIBarButtonItem alloc] initWithImage:[UIImage imageWithOriginalImageNamed:@"back_1"] style:UIBarButtonItemStylePlain target:self action:@selector(back)];
    }

    [super pushViewController:viewController animated:animated];
}

-(void)back
{
    [self popViewControllerAnimated:YES];
}
@end
