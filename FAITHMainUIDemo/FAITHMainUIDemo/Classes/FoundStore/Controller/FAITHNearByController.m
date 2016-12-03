//
//  FAITHNearByController.m
//  综合案例
//
//  Created by FAITH on 16/11/26.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHNearByController.h"

@interface FAITHNearByController ()

@end

@implementation FAITHNearByController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor=[UIColor whiteColor];
    
    [self setUp];
}

-(void)setUp
{
    UIView *nearbyView=[[UIView alloc] init];
    
    nearbyView.size=CGSizeMake(screenW, screenW);
    
    nearbyView.center=self.view.center;
    [self.view addSubview:nearbyView];
    
    CAShapeLayer *shapeLayer=[CAShapeLayer layer];
    
    shapeLayer.frame=nearbyView.bounds;
    
    shapeLayer.fillColor=[UIColor redColor].CGColor;
    
    shapeLayer.path=[UIBezierPath bezierPathWithOvalInRect:shapeLayer.bounds].CGPath;
    
    shapeLayer.opacity=0;

    
    CAReplicatorLayer *repl=[CAReplicatorLayer layer];
    
    repl.frame=nearbyView.bounds;
    
    repl.instanceCount=5;
    
    repl.instanceDelay=0.5;
    
    [repl addSublayer:shapeLayer];
    
    [nearbyView.layer addSublayer:repl];
    
    //缩放
    CABasicAnimation *anim=[CABasicAnimation animationWithKeyPath:@"transform"];
    
    anim.fromValue=[NSValue valueWithCATransform3D:CATransform3DMakeScale(0, 0, 0)];
    
    anim.toValue=[NSValue valueWithCATransform3D:CATransform3DMakeScale(1, 1, 0)];

    
//    透明度
    CABasicAnimation *anim2=[CABasicAnimation animationWithKeyPath:@"opacity"];
    
    anim2.fromValue=@0.3;
    
    anim2.toValue=@0.0;
    
    
    
    CAAnimationGroup *group=[CAAnimationGroup animation];
    
    group.animations=@[anim,anim2];
    
    group.repeatCount=HUGE;
    
    group.duration=3.0;
    
    [shapeLayer addAnimation:group forKey:nil];
    
    
}




@end
