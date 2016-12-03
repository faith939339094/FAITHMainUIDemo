//
//  FAITHClassifyItemCell.m
//  综合案例
//
//  Created by FAITH on 16/11/23.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHClassifyItemCell.h"
#import "FAITHClassifyItem.h"
#import "UIImageView+WebCache.h"
@interface FAITHClassifyItemCell ()
@property(nonatomic,weak)UIImageView *imageView;

@property(nonatomic,weak)UILabel *nameLabel;
@end

@implementation FAITHClassifyItemCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView=[[UIImageView alloc] init];
        
        [self.contentView addSubview:imageView];
        
        _imageView=imageView;
        
        UILabel *nameLabel=[[UILabel alloc] init];
        
        nameLabel.textColor=[UIColor blackColor];
        
        nameLabel.font=[UIFont systemFontOfSize:14];
        
        nameLabel.textAlignment=NSTextAlignmentCenter;
        
        [self.contentView addSubview:nameLabel];
        
        self.backgroundColor=[UIColor colorWithRed:0.98 green:0.98 blue:0.98  alpha:0.8];
        
        _nameLabel=nameLabel;
    
    }
    return self;
}

-(void)setItem:(FAITHClassifyItem *)item
{
    _item=item;
    
    NSURL *url=[NSURL URLWithString:item.img];
    
    [self.imageView sd_setImageWithURL:url placeholderImage:[UIImage imageNamed:@"mebackground"]];
    
    self.imageView.frame=CGRectMake(0, 0, self.contentView.width, self.contentView.height-15);
    
    self.nameLabel.text=item.name;
    
    self.nameLabel.frame=CGRectMake(0, self.contentView.height-15, self.contentView.width, 15);
    
}


@end
