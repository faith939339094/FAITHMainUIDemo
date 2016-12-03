//
//  FAITHCityHeadView.m
//  综合案例
//
//  Created by FAITH on 16/11/3.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHCityHeadView.h"
@interface FAITHCityHeadView ()
@property(nonatomic,weak)UILabel *titleLabel;

@end
@implementation FAITHCityHeadView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UILabel *titleLabel=[[UILabel alloc] init];
        
        titleLabel.font=[UIFont boldSystemFontOfSize:20];
        
        titleLabel.textColor=[UIColor blackColor];
        
        titleLabel.textAlignment=NSTextAlignmentCenter;
        
        [self addSubview:titleLabel];
        
        self.backgroundColor=[UIColor whiteColor];
        
        self.titleLabel=titleLabel;
    }
    return self;
}

-(void)setCitySection:(NSString *)citySection
{
    _citySection=citySection;
    
    self.titleLabel.text=citySection;
    
    self.titleLabel.frame=self.bounds;
}

@end
