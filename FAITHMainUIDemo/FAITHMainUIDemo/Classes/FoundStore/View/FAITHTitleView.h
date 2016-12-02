//
//  FAITHTitleView.h
//  综合案例
//
//  Created by FAITH on 16/11/1.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import <UIKit/UIKit.h>


@class FAITHTitleView;

@protocol FAITHTitleViewDelegate <NSObject>

@optional

-(void)titleView:(FAITHTitleView *)titleView didClickBtn:(UIButton *)btn;

@end


@interface FAITHTitleView : UIView

@property(nonatomic,weak) id<FAITHTitleViewDelegate> delegate;
+(__kindof FAITHTitleView *)titleView;

@end
