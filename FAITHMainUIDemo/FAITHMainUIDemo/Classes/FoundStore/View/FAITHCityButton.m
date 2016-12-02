//
//  FAITHCityButton.m
//  综合案例
//
//  Created by FAITH on 16/11/1.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHCityButton.h"
#import "UIView+Extension.h"
@implementation FAITHCityButton

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.titleLabel.x>self.imageView.x) {
        self.titleLabel.x=0;
        
        self.imageView.x=CGRectGetMaxX(self.titleLabel.frame);
    }
    
}

+(UIBarButtonItem *)butttonWithImageName:(NSString *)imageName title:(NSString *)title target:(id)target action:(SEL)action
{
    FAITHCityButton *btn=[FAITHCityButton buttonWithType:UIButtonTypeCustom];
    
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    
    [btn sizeToFit];
    
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}

@end
