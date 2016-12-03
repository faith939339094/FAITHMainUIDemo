//
//  FAITHExperienceSectionHeadView.m
//  综合案例
//
//  Created by FAITH on 16/11/6.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHExperienceSectionHeadView.h"
#import "FAITHEvents.h"
#import "UIImageView+WebCache.h"
@interface FAITHExperienceSectionHeadView ()
@property(nonatomic,weak)UIImageView *imageView;

@property(nonatomic,weak)UILabel *titleLabel;

@property(nonatomic,weak)UILabel *addressLabel;

@end

@implementation FAITHExperienceSectionHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        UIImageView *imageView=[[UIImageView alloc] init];
        
        self.imageView=imageView;
        
        imageView.frame=CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.height-40);
        
        [self addSubview:imageView];
        
        UILabel *titleLabel=[[UILabel alloc] init];
        
        [titleLabel setTextColor:[UIColor whiteColor]];
        
        titleLabel.font=[UIFont systemFontOfSize:20];
        
        self.titleLabel=titleLabel;
        
        titleLabel.frame=CGRectMake(5, CGRectGetMaxY(self.imageView.frame)+2, self.bounds.size.width, 23);
        
        [self addSubview:titleLabel];
        
        UILabel *addressLabel=[[UILabel alloc] init];
        
        [addressLabel setTextColor:[UIColor whiteColor]];
        
        addressLabel.font=[UIFont systemFontOfSize:18];
        
        self.addressLabel=addressLabel;
        
        addressLabel.frame=CGRectMake(5, CGRectGetMaxY(self.titleLabel.frame), self.bounds.size.width, 17);
        
        [self addSubview:addressLabel];
        
        
    }
    return self;
}

-(void)setEvents:(FAITHEvents *)events
{
    _events=events;
    
    self.titleLabel.text=events.title;
    
//    self.titleLabel.frame=beautifulDayFrame.titleLabelFrame2;
    
    self.addressLabel.text=events.address;
    
//    self.addressLabel.frame=beautifulDayFrame.addressLabelFrame;
    
    NSURL *url=[NSURL URLWithString:events.imgs[0]];
    
    [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"mebackground"]];
}
@end
