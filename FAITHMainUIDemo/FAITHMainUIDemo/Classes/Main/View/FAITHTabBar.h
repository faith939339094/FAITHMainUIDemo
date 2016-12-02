//
//  FAITHTabBar.h
//  彩票
//
//  Created by FAITH on 16/10/5.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FAITHTabBar;
@protocol FAITHTabBarDelegate <NSObject>

@optional
-(void)tabBar:(FAITHTabBar *)tabBar didClickBtn:(UIButton *)btn;

@end

@interface FAITHTabBar : UIView
@property(nonatomic,strong) NSArray *items;

@property(nonatomic,weak)id<FAITHTabBarDelegate> delegate;
@end
