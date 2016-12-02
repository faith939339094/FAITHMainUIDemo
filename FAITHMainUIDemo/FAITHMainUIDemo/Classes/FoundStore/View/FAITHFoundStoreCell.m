//
//  FAITHFoundStoreCell.m
//  综合案例
//
//  Created by FAITH on 16/11/2.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHFoundStoreCell.h"
#import "FAITHFoundCellHeadView.h"
#import "UIView+Extension.h"
#import "FAITHFoundCellEventView.h"
#import "FAITHEvents.h"
#import "FAITHBeautifulDay.h"
#import "FAITHFoundCellFootView.h"
#import "FAITHThemes.h"
#import "FAITHBeautifulDayFrame.h"
@interface FAITHFoundStoreCell ()
@property(nonatomic,weak)FAITHFoundCellHeadView *foundCellHeadView;

@property(nonatomic,weak)FAITHFoundCellEventView *foundCellEventView;

@property(nonatomic,weak)FAITHFoundCellFootView *foundCellFootView;
@end

@implementation FAITHFoundStoreCell

-(instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self=[super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        FAITHFoundCellHeadView *foundCellHeadView=[[FAITHFoundCellHeadView alloc] init];
        
        [self.contentView addSubview:foundCellHeadView];
        
        self.foundCellHeadView=foundCellHeadView;
        
        FAITHFoundCellEventView *foundCellEventView=[[FAITHFoundCellEventView alloc] init];
        
        [self.contentView addSubview:foundCellEventView];
        
        self.foundCellEventView=foundCellEventView;
        
        FAITHFoundCellFootView *foundCellFootView=[[FAITHFoundCellFootView alloc] init];
        
        [self.contentView addSubview:foundCellFootView];
        
        self.foundCellFootView=foundCellFootView;
        
//        self.selectionStyle=UITableViewCellSelectionStyleNone;
     
    }
    
    return self;
}

-(void)setBeautifulDayFrame:(FAITHBeautifulDayFrame *)beautifulDayFrame
{
    _beautifulDayFrame=beautifulDayFrame;
    
    self.foundCellHeadView.beautifulDayFrame=beautifulDayFrame;
    
    self.foundCellHeadView.frame=beautifulDayFrame.foundCellHeadViewFrame;
    
    self.foundCellEventView.beautifulDayFrame=beautifulDayFrame;

    self.foundCellEventView.frame= beautifulDayFrame.foundCellEventViewFrame;
    
    self.foundCellFootView.beautifulDayFrame=beautifulDayFrame;
    
    self.foundCellFootView.frame=beautifulDayFrame.foundCellFootViewFrame;
 
}



@end
