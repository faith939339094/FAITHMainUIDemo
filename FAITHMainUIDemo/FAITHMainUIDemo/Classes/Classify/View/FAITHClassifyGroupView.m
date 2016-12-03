//
//  FAITHClassifyGroupView.m
//  综合案例
//
//  Created by FAITH on 16/11/23.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHClassifyGroupView.h"
#import "FAITHClassifyGroup.h"
@interface FAITHClassifyGroupView ()
@property(nonatomic,weak)UILabel *titleLabel;
@end

@implementation FAITHClassifyGroupView

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

-(void)setGroup:(FAITHClassifyGroup *)group
{
    _group=group;
    
    self.titleLabel.text=group.title;
    
    self.titleLabel.frame=self.bounds;
}

@end
