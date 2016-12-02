//
//  FAITHChooseViewController.m
//  彩票
//
//  Created by FAITH on 16/10/9.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHChooseViewController.h"
#import "FAITHTabBarController.h"

@implementation FAITHChooseViewController
+(void)chooseRootViewController:(UIWindow *)window
{
    NSString *versionKey=@"CFBundleShortVersionString";
    //获取上次的版本号
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *lastVersion = [defaults objectForKey:versionKey];
    
    //获取当前版本号
    NSString *curVersion=[NSBundle mainBundle].infoDictionary[versionKey];
    
    //对比两个版本号
//    if ([curVersion isEqualToString:lastVersion]) {
        //让tabbarvontroller成为主窗口的跟控制器
        FAITHTabBarController *tabbarController=[[FAITHTabBarController alloc] init];

         window.rootViewController= tabbarController;
//    }
    
//    else{
//    
//    
//        FAITHNewFeatureController *newFeature=[[FAITHNewFeatureController alloc] init];
//        
//        window.rootViewController=newFeature;
//        
//        [defaults setObject:curVersion forKey:versionKey];
//        [defaults synchronize];
//        }

}
@end
