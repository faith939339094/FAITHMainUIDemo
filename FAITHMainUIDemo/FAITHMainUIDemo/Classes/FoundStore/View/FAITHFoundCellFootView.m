//
//  FAITHFoundCellFootView.m
//  综合案例
//
//  Created by FAITH on 16/11/2.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHFoundCellFootView.h"
#import "FAITHThemes.h"
#import "UIImageView+WebCache.h"
#import "FAITHBeautifulDay.h"
#import "FAITHBeautifulDayFrame.h"
@interface FAITHFoundCellFootView ()
@property(nonatomic,weak)UIImageView *imageView;

@property(nonatomic,weak)UILabel *titleLabel;

@property(nonatomic,weak)UILabel *keywordsLabel;

@end

@implementation FAITHFoundCellFootView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView=[[UIImageView alloc] init];
        
        self.imageView=imageView;
        
        [self addSubview:imageView];
        
        UILabel *titleLabel=[[UILabel alloc] init];
        
        [titleLabel setTextColor:[UIColor whiteColor]];
        
        titleLabel.font=[UIFont systemFontOfSize:20];
        
        self.titleLabel=titleLabel;
        
        [self addSubview:titleLabel];
        
        UILabel *keywordsLabel=[[UILabel alloc] init];
        
        [keywordsLabel setTextColor:[UIColor whiteColor]];
        
        keywordsLabel.font=[UIFont systemFontOfSize:18];
        
        self.keywordsLabel=keywordsLabel;
        
        [self addSubview:keywordsLabel];
        
    }
    return self;
}

-(void)setBeautifulDayFrame:(FAITHBeautifulDayFrame *)beautifulDayFrame
{
    _beautifulDayFrame=beautifulDayFrame;
    
    if (beautifulDayFrame.beautifulDay.themes.count==nil) {
        return;
    }
    
    FAITHThemes *themes=beautifulDayFrame.beautifulDay.themes[0];
    
    self.titleLabel.text=themes.title;
    
    self.titleLabel.frame=beautifulDayFrame.titleLabelFrame3;
    
    self.keywordsLabel.text=themes.keywords;
    
    self.keywordsLabel.frame=beautifulDayFrame.keywordsLabelFrame;
    
    NSURL *url=[NSURL URLWithString:themes.img];
    
    [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"mebackground"]];

    
    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
}


@end
