//
//  UIImage+Extension.h
//  FAITH微博-02
//
//  Created by faith939339094 on 16/1/13.
//  Copyright © 2016年 faith939339094. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
// 根据图片名字拉伸图片
+(UIImage *)resizedImage:(NSString *)name;
// 根据颜色生成一张尺寸为1*1的相同颜色图片
+ (UIImage *)imageWithColor:(UIColor *)color;

+(UIImage *)borderImageWithImageName:(NSString *)name border:(CGFloat)border color:(UIColor *)color;

+(UIImage *)imageWithOriginalImageNamed:(NSString *)name;
@end
