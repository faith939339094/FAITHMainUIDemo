//
//  FAITHExperienceCell.m
//  综合案例
//
//  Created by FAITH on 16/11/6.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHExperienceCell.h"
#import "FAITHThemes.h"
#import "UIImageView+WebCache.h"
@interface FAITHExperienceCell ()

@property(nonatomic,weak)UIImageView *imageView;

@property(nonatomic,weak)UILabel *titleLabel;

@property(nonatomic,weak)UILabel *keywordsLabel;

@end

@implementation FAITHExperienceCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView=[[UIImageView alloc] init];
        
        self.imageView=imageView;
        
        imageView.frame=CGRectMake(0, 0, self.contentView.bounds.size.width, self.contentView.bounds.size.height-40);
        
        [self.contentView addSubview:imageView];
        
        UILabel *titleLabel=[[UILabel alloc] init];
        
        [titleLabel setTextColor:[UIColor whiteColor]];
        
        titleLabel.font=[UIFont systemFontOfSize:17];
        
        titleLabel.textColor=[UIColor lightGrayColor];
        
        self.titleLabel=titleLabel;
        
        titleLabel.frame=CGRectMake(5, CGRectGetMaxY(self.imageView.frame)+2, self.contentView.bounds.size.width, 23);
        
        [self.contentView addSubview:titleLabel];
        
        UILabel *keywordsLabel=[[UILabel alloc] init];
        
        [keywordsLabel setTextColor:[UIColor whiteColor]];
        
        keywordsLabel.textColor=[UIColor lightGrayColor];
        
        keywordsLabel.font=[UIFont systemFontOfSize:13];
        
        self.keywordsLabel=keywordsLabel;
        
        keywordsLabel.frame=CGRectMake(5, CGRectGetMaxY(self.titleLabel.frame), self.contentView.bounds.size.width, 17);
        
        [self.contentView addSubview:keywordsLabel];
        
    }
    return self;
}

-(void)setThemes:(FAITHThemes *)themes
{
    _themes=themes;
    
    self.titleLabel.text=themes.title;
    
//    self.titleLabel.frame=beautifulDayFrame.titleLabelFrame3;
    
    self.keywordsLabel.text=themes.keywords;
    
//    self.keywordsLabel.frame=beautifulDayFrame.keywordsLabelFrame;
    
    NSURL *url=[NSURL URLWithString:themes.img];
    
    [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"mebackground"]];
    
}
@end
