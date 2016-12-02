//
//  FAITHFoundCellHeadView.m
//  综合案例
//
//  Created by FAITH on 16/11/2.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHFoundCellHeadView.h"
#import "FAITHBeautifulDay.h"
#import "FAITHEvents.h"
#import "FAITHBeautifulDayFrame.h"

@interface FAITHFoundCellHeadView ()
@property(nonatomic,weak)UIImageView *dateImage;

@property(nonatomic,weak)UILabel *dateLabel;

@property(nonatomic,weak)UILabel *titleLabel;

@end

@implementation FAITHFoundCellHeadView
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *dateImage=[[UIImageView alloc] initWithImage:[UIImage imageNamed:@"date"]];

        [self addSubview:dateImage];
        
        self.dateImage=dateImage;
        
        UILabel *dateLabel=[[UILabel alloc] init];
        
        [dateLabel sizeToFit];
        
        [dateLabel setBackgroundColor:[UIColor whiteColor]];
        
        [self addSubview:dateLabel];
        
        self.dateLabel=dateLabel;
        
        UILabel *titleLabel=[[UILabel alloc] init];
        
        [titleLabel sizeToFit];
        
        [self addSubview:titleLabel];
        
        self.titleLabel=titleLabel;
    }
    return self;
}



-(void)setBeautifulDayFrame:(FAITHBeautifulDayFrame *)beautifulDayFrame
{
    _beautifulDayFrame=beautifulDayFrame;
    
    FAITHBeautifulDay *beautifulDay=beautifulDayFrame.beautifulDay;
    
    FAITHEvents *dict=beautifulDay.events[0];
    
    self.titleLabel.text=dict.feeltitle;
    
    self.titleLabel.frame=beautifulDayFrame.titleLabelFrame;
    
    NSString *dateStr=[NSString stringWithFormat:@"%@%@",beautifulDay.month,beautifulDay.day];
    
    self.dateLabel.text=dateStr;
    
    self.dateLabel.frame=beautifulDayFrame.dateLabelFrame;
    
    self.dateImage.frame=beautifulDayFrame.dateImageFrame;
    
}




@end
