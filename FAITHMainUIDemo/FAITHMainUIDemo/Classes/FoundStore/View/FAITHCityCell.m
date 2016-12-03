//
//  FAITHCityCell.m
//  综合案例
//
//  Created by FAITH on 16/11/3.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHCityCell.h"
@interface FAITHCityCell ()

@property(nonatomic,weak)UILabel *cityLabel;
@end
@implementation FAITHCityCell

-(instancetype)initWithFrame:(CGRect)frame
{
    if (self=[super initWithFrame:frame]) {
        UILabel *cityLabel=[[UILabel alloc] init];
        
        cityLabel.textColor=[UIColor blackColor];
        
        cityLabel.textAlignment=NSTextAlignmentCenter;

        [self.contentView addSubview:cityLabel];
        
        self.backgroundColor=[UIColor whiteColor];
        
        _cityLabel=cityLabel;
    }
    return self;
}

-(void)setCityName:(NSString *)cityName
{
    _cityName=cityName;

    self.cityLabel.text=cityName;
    
    self.cityLabel.frame=self.bounds;
}


@end
