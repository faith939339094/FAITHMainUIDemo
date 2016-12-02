//
//  FAITHBeautifulDayFrame.h
//  综合案例
//
//  Created by FAITH on 16/11/3.
//  Copyright © 2016年 FAITH. All rights reserved.
//

#import <Foundation/Foundation.h>

#import <UIKit/UIKit.h>
@class FAITHBeautifulDay;
@interface FAITHBeautifulDayFrame : NSObject
@property(nonatomic,strong) FAITHBeautifulDay *beautifulDay;

@property(nonatomic,assign)CGRect dateImageFrame;

@property(nonatomic,assign)CGRect dateLabelFrame;

@property(nonatomic,assign)CGRect titleLabelFrame;

@property(nonatomic,assign)CGRect titleLabelFrame2;

@property(nonatomic,assign)CGRect addressLabelFrame;

@property(nonatomic,assign)CGRect titleLabelFrame3;

@property(nonatomic,assign)CGRect keywordsLabelFrame;

@property(nonatomic,assign)CGRect foundCellHeadViewFrame;

@property(nonatomic,assign)CGRect foundCellEventViewFrame;

@property(nonatomic,assign)CGRect foundCellFootViewFrame;

@property(nonatomic,assign)CGFloat cellHeight;

@end
