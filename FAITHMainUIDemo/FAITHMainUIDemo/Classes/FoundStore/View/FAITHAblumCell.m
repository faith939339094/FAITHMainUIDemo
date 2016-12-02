//
//  FAITHAblumCell.m
//  综合案例
//
//  Created by FAITH on 16/11/3.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHAblumCell.h"
#import "FAITHThemes.h"
#import "UIImageView+WebCache.h"

@interface FAITHAblumCell ()
@property(nonatomic,weak)UIImageView *imageV;

@property(nonatomic,weak)UILabel *titleLabel;

@property(nonatomic,weak)UILabel *keywordsLabel;

@end

@implementation FAITHAblumCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
       
        UIImageView *imageView=[[UIImageView alloc] init];
        
        [self.contentView addSubview:imageView];
        
        self.imageV=imageView;
        
        UILabel *titleLabel=[[UILabel alloc] init];
        
        [titleLabel setTextColor:[UIColor whiteColor]];
        
        titleLabel.font=[UIFont systemFontOfSize:20];
        
        self.titleLabel=titleLabel;
        
        [self.imageView addSubview:titleLabel];

//        [self.contentView addSubview:titleLabel];
        
        UILabel *keywordsLabel=[[UILabel alloc] init];
        
        [keywordsLabel setTextColor:[UIColor whiteColor]];
        
        keywordsLabel.font=[UIFont systemFontOfSize:18];
        
        self.keywordsLabel=keywordsLabel;
        
        [self.imageView addSubview:keywordsLabel];

//        [self.contentView addSubview:keywordsLabel];
        
    }
    return self;
}

-(void)setAblum:(FAITHThemes *)ablum
{
    _ablum=ablum;
    
    NSURL *url=[NSURL URLWithString:ablum.img];
    
    [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"mebackground"]];
    
    self.titleLabel.text=ablum.title;
    
    self.keywordsLabel.text=ablum.keywords;
    
    [self setNeedsDisplay];
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame=CGRectMake(10 , 0, self.contentView.bounds.size.width-20, self.contentView.bounds.size.height-10);
    
    self.titleLabel.frame=CGRectMake(100, 80, 200, 30);
    
    self.keywordsLabel.frame=CGRectMake(100, 100, 200, 25);
}

//-(void)drawRect:(CGRect)rect
//{
//    
////    UIGraphicsBeginImageContext(CGRectMake(10 , 0, self.contentView.bounds.size.width-20, self.contentView.bounds.size.height-10).size);
//    
//    CGContextRef ctx=UIGraphicsGetCurrentContext();
//    
//    [self.imageView.layer renderInContext:ctx];
//    
//    
//}

@end
