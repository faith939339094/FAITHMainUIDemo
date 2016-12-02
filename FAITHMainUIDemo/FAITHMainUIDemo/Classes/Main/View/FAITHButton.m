//
//  FAITHButton.m
//  彩票
//
//  Created by FAITH on 16/10/6.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHButton.h"
#import "UIView+Extension.h"
@implementation FAITHButton

-(void)setHighlighted:(BOOL)highlighted
{
    
}
-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        self.imageView.contentMode=UIViewContentModeScaleAspectFit;
        
        self.titleLabel.textAlignment=NSTextAlignmentCenter;
        
        self.titleLabel.font=[UIFont systemFontOfSize:12];
        
        self.backgroundColor=[UIColor clearColor];
    }
    return self;
}
//-(CGRect)imageRectForContentRect:(CGRect)contentRect
//{
//    [super imageRectForContentRect:contentRect];
//    
//    self.imageView.frame=CGRectMake(0, 0, contentRect.size.width, self.currentImage.size.height);
//    
//    return self.imageView.frame;
//}
//
//-(CGRect)titleRectForContentRect:(CGRect)contentRect
//{
//    [super titleRectForContentRect:contentRect];
//    
//    self.titleLabel.frame=CGRectMake(0, self.currentImage.size.height, contentRect.size.width, (contentRect.size.height-self.currentImage.size.height));
//    
//    return self.imageView.frame
//}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    if (self.titleLabel.x>self.imageView.x) {
        self.imageView.frame=CGRectMake(0, 0, self.width, self.currentImage.size.height);
        
        self.titleLabel.frame=CGRectMake(0, self.currentImage.size.height, self.width, (self.size.height-self.currentImage.size.height));
    }
}
@end
