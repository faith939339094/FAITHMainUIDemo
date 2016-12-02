//
//  FAITHFoundCellEventView.m
//  综合案例
//
//  Created by FAITH on 16/11/2.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHFoundCellEventView.h"
#import "FAITHEvents.h"
#import "UIImageView+WebCache.h"
#import "FAITHBeautifulDayFrame.h"
#import "FAITHBeautifulDay.h"
@interface FAITHFoundCellEventView ()
@property(nonatomic,weak)UIImageView *imageView;

@property(nonatomic,weak)UILabel *titleLabel;

@property(nonatomic,weak)UILabel *addressLabel;

@end

@implementation FAITHFoundCellEventView


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
        
        UILabel *addressLabel=[[UILabel alloc] init];
        
        [addressLabel setTextColor:[UIColor whiteColor]];
        
        addressLabel.font=[UIFont systemFontOfSize:18];
        
        self.addressLabel=addressLabel;
        
        [self addSubview:addressLabel];
        
        
    }
    return self;
}

-(void)setBeautifulDayFrame:(FAITHBeautifulDayFrame *)beautifulDayFrame
{
    _beautifulDayFrame=beautifulDayFrame;
    
    FAITHEvents *events=beautifulDayFrame.beautifulDay.events[0];
    
    self.titleLabel.text=events.title;
    
    self.titleLabel.frame=beautifulDayFrame.titleLabelFrame2;
    
    self.addressLabel.text=events.address;
    
    self.addressLabel.frame=beautifulDayFrame.addressLabelFrame;
    
    NSURL *url=[NSURL URLWithString:events.imgs[0]];
   
    [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"mebackground"]];

    
}

-(void)layoutSubviews
{
    [super layoutSubviews];
    
    self.imageView.frame = self.bounds;
}



@end
