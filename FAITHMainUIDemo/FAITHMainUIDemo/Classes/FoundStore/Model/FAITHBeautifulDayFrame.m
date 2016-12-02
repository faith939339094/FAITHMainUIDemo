//
//  FAITHBeautifulDayFrame.m
//  综合案例
//
//  Created by FAITH on 16/11/3.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHBeautifulDayFrame.h"
#import "FAITHBeautifulDay.h"
@implementation FAITHBeautifulDayFrame
-(void)setBeautifulDay:(FAITHBeautifulDay *)beautifulDay
{
    
    _beautifulDay=beautifulDay;
    
    CGFloat imageX=22;
    CGFloat imageY=10;
    CGFloat imageW=80;
    CGFloat imageH=30;
    
    self.dateImageFrame=CGRectMake(imageX, imageY, imageW, imageH);
    
    CGFloat dateLabelX=40;
    CGFloat dateLabelY=20;
    
    self.dateLabelFrame=CGRectMake(dateLabelX, dateLabelY, 58, 20);
    
    CGFloat titleLabelX=CGRectGetMaxX(self.dateImageFrame)+8;
    CGFloat titleLabelY=imageY;
    
    self.titleLabelFrame=CGRectMake(titleLabelX, titleLabelY, 300, 30);
    
    self.foundCellHeadViewFrame=CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, CGRectGetMaxY(self.dateImageFrame)+8);
    
    CGFloat title2X=20;
    CGFloat title2Y=20;
    CGFloat title2W=[UIScreen mainScreen].bounds.size.width;
    CGFloat title2H=30;
    
    self.titleLabelFrame2=CGRectMake(title2X, title2Y, title2W, title2H);
    
    CGFloat addressX=title2X;
    CGFloat addressY=CGRectGetMaxY(self.titleLabelFrame2);
    CGFloat addressW=[UIScreen mainScreen].bounds.size.width;
    CGFloat addressH=25;
    
    self.addressLabelFrame=CGRectMake(addressX, addressY, addressW, addressH);
    
    self.foundCellEventViewFrame=CGRectMake(0, CGRectGetMaxY(self.foundCellHeadViewFrame), [UIScreen mainScreen].bounds.size.width, 200);
    
    if (beautifulDay.themes) {
        
        CGFloat title3X=100;
        CGFloat title3Y=80;
        CGFloat title3W=[UIScreen mainScreen].bounds.size.width;
        CGFloat title3H=30;
        
        self.titleLabelFrame3=CGRectMake(title3X, title3Y, title3W, title3H);
        
        
        CGFloat keywordsX=title3X;
        CGFloat keywordsY=CGRectGetMaxY(self.titleLabelFrame3);
        CGFloat keywordsW=[UIScreen mainScreen].bounds.size.width;
        CGFloat keywordsH=25;
        
        self.keywordsLabelFrame=CGRectMake(keywordsX, keywordsY, keywordsW, keywordsH);
        
        self.foundCellFootViewFrame=CGRectMake(0, CGRectGetMaxY(self.foundCellEventViewFrame), [UIScreen mainScreen].bounds.size.width, 200);
        
        self.cellHeight=CGRectGetMaxY(self.foundCellFootViewFrame)+5;
    }else
    { 
        self.cellHeight=CGRectGetMaxY(self.foundCellEventViewFrame)+5;
    }
}

@end
