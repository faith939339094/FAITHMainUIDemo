//
//  FAITHPageScrollView.m
//  图片轮播器
//
//  Created by FAITH on 16/11/6.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import "FAITHPageScrollView.h"
@interface FAITHPageScrollView ()<UIScrollViewDelegate>

{
    NSInteger _valueToBottom;
}
@property(nonatomic,weak)UIScrollView *scrollView;

@property(nonatomic,weak)UIPageControl *pageControl;

@property(nonatomic,weak)NSTimer *timer;


@end
@implementation FAITHPageScrollView



+(FAITHPageScrollView *)pageScrollViewpaeScrollViewWithFrame:(CGRect)frame
{
   
    return [[self alloc] initWithFrame:frame];
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIScrollView *scrollView=[[UIScrollView alloc] initWithFrame:self.bounds];
        
        scrollView.contentSize=CGSizeMake(scrollView.bounds.size.width*5, 0);
        
        scrollView.showsVerticalScrollIndicator=NO;
        
        scrollView.showsHorizontalScrollIndicator=NO;
        
        scrollView.pagingEnabled=YES;
        
        scrollView.bounces=NO;
        
        self.scrollView=scrollView;
        
        [self addSubview:scrollView];
        
        scrollView.backgroundColor=[UIColor redColor];

        UIPageControl *pageControl =[[UIPageControl alloc] initWithFrame:CGRectMake(280, 180, 100, 30)];
        
        self.pageControl.hidesForSinglePage=YES;
        
        scrollView.delegate=self;
        
 //        2.设置pageControl显示的图片(KVC)
        [self.pageControl setValue:[UIImage imageNamed:@"current"] forKeyPath:@"_currentPageImage"];
        [self.pageControl setValue:[UIImage imageNamed:@"other"] forKeyPath:@"_pageImage"];

        [self addSubview:pageControl];
        
        self.pageControl=pageControl;
        
    }
    return self;
}

-(void)setImagesArray:(NSArray *)imagesArray
{
    _imagesArray=imagesArray;
    
    //去除之前在scrollview上的子控件
    [self.scrollView.subviews makeObjectsPerformSelector:@selector(removeAllObjects)];
    
    for (int i=0; i<imagesArray.count; i++) {
        UIImageView *imageView=[[UIImageView alloc] initWithFrame:self.scrollView.bounds];
        
        imageView.image=[UIImage imageNamed:imagesArray[i]];
        
        imageView.contentMode=UIViewContentModeScaleAspectFill;
        
        imageView.frame=CGRectMake(i*imageView.bounds.size.width, 0, imageView.bounds.size.width, imageView.bounds.size.height);
        
        [self.scrollView addSubview:imageView];
    }
    
    self.pageControl.numberOfPages=imagesArray.count;
    
    [self startTimer];
    
}


-(void)startTimer
{
    
    [self stopTimer];
    //常规定时器
    NSTimer *timer=[NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(nextPage) userInfo:nil repeats:YES];
    
    self.timer=timer;
    
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{

    // 计算页码
    int page = (int)(self.scrollView.contentOffset.x / self.scrollView.bounds.size.width + 0.5);
    
    // 设置页码
    self.pageControl.currentPage = page;
}

-(void)nextPage
{
    CGFloat nextPageOffSet=self.scrollView.contentOffset.x+self.scrollView.bounds.size.width;
    
    if (self.scrollView.contentOffset.x>self.scrollView.bounds.size.width*(self.imagesArray.count-2)) {
        nextPageOffSet=0;
    }
    
    [self.scrollView setContentOffset:CGPointMake(nextPageOffSet, 0) animated:YES];
  
}

-(void)stopTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self stopTimer];
}

-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
{
    [self startTimer];
}
@end
