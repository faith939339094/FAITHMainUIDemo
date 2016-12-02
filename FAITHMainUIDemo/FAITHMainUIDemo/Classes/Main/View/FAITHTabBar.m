//
//  FAITHTabBar.m
//  彩票
//
//  Created by FAITH on 16/10/5.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHTabBar.h"
#import "FAITHButton.h"
#import "UIImage+Extension.h"
@interface FAITHTabBar ()

@property(nonatomic,weak)UIButton *selBtn;
@end
@implementation FAITHTabBar

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        
        
        
        
    }
    return self;
}

-(void)setItems:(NSArray *)items
{
    _items=items;
    int i=0;
    for (UITabBarItem *item in items) {
        
        FAITHButton *btn=[FAITHButton buttonWithType:UIButtonTypeCustom];
        btn.tag=i;
        [btn setImage:item.image forState:UIControlStateNormal];
        [btn setImage:item.selectedImage forState:UIControlStateSelected];
        [btn setTitle:item.title forState:UIControlStateNormal];
        [btn setTitle:item.title forState:UIControlStateSelected];
        [btn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        [btn setTitleColor:[UIColor blackColor] forState:UIControlStateSelected];

        
        i++;
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchDown];
        
        if (btn.tag==0) {
            btn.selected=YES;
            self.selBtn=btn;
        }
        [self addSubview:btn];
    }
}

-(void)btnClick:(FAITHButton *)btn
{
    self.selBtn.selected=NO;
    
    btn.selected=YES;
    
    self.selBtn=btn;
    
    if ([_delegate respondsToSelector:@selector(tabBar:didClickBtn:)]) {
        [_delegate tabBar:self didClickBtn:btn];
    }
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat W=self.bounds.size.width/self.subviews.count;
    CGFloat H=self.bounds.size.height;
    CGFloat X=0;
    CGFloat Y=0;
    for (int i=0; i<self.subviews.count; i++) {
        UIButton *btn=self.subviews[i];
        X=W*i;
        
        btn.frame=CGRectMake(X, Y, W, H);
    }
}

//-(void)drawRect:(CGRect)rect
//{
//    CGContextRef ctx = UIGraphicsGetCurrentContext();
//    
//    UIImageView *imageView=[[UIImageView alloc] initWithImage:[UIImage resizedImage: @"tabbar_bg"]];
//    
//
//    
//    [imageView.layer drawInContext:ctx];
//}
@end
