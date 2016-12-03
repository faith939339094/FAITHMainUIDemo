//
//  FAITHPageScrollView.h
//  图片轮播器
//
//  Created by FAITH on 16/11/6.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import <UIKit/UIKit.h>
@class FAITHPageScrollView;
@interface FAITHPageScrollView : UIView

/**
 *  显示的图片
 */

@property(nonatomic,strong) NSArray *imagesArray;


+(__kindof FAITHPageScrollView *)pageScrollViewpaeScrollViewWithFrame:(CGRect)frame;
@end
