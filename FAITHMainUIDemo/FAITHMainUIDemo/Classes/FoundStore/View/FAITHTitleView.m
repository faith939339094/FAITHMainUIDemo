//
//  FAITHTitleView.m
//  综合案例
//
//  Created by FAITH on 16/11/1.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHTitleView.h"
#import "UIView+Extension.h"
@interface FAITHTitleView ()
@property (weak, nonatomic) IBOutlet UIView *bottomLine;

@property (weak, nonatomic) IBOutlet UIButton *dayBtn;

@property (weak, nonatomic) IBOutlet UIButton *ablumBtn;

@end

@implementation FAITHTitleView

+(__kindof FAITHTitleView *)titleView
{
    return [[NSBundle mainBundle] loadNibNamed:@"FAITHTitleView" owner:nil options:nil][0];
}

-(void)awakeFromNib
{
    [super awakeFromNib];
    
    self.backgroundColor=[UIColor colorWithRed:249.0 green:249.0 blue:249.0 alpha:0.01];
}

- (IBAction)dayBtnClick:(UIButton *)sender
{
    sender.tag=0;
    
    [self.dayBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.ablumBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.bottomLine.x=self.dayBtn.x;
    }];
    
    if ([_delegate respondsToSelector:@selector(titleView:didClickBtn:)]) {
        [_delegate titleView:self didClickBtn:self.dayBtn];
    }
    
}


- (IBAction)ablumBtnClick:(UIButton *)sender
{
    sender.tag=1;
    
    [self.ablumBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    
    [self.dayBtn setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    
    [UIView animateWithDuration:0.25 animations:^{
        self.bottomLine.x=self.ablumBtn.x;
    }];
    
    if ([_delegate respondsToSelector:@selector(titleView:didClickBtn:)]) {
        [_delegate titleView:self didClickBtn:self.ablumBtn];
    }
}

@end
