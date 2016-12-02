//
//  UIImage+Extension.m
//  FAITH微博-02
//
//  Created by faith939339094 on 16/1/13.
//  Copyright © 2016年 faith939339094. All rights reserved.
//

#import "UIImage+Extension.h"

@implementation UIImage (Extension)

+(UIImage *)resizedImage:(NSString *)name
{
    UIImage *image=[UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width*0.5 topCapHeight:image.size.height*0.5];
}
+ (UIImage *)imageWithColor:(UIColor *)color
{
    // 描述矩形
    CGRect rect=CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    
    // 开启位图上下文
    UIGraphicsBeginImageContext(rect.size);
    // 获取位图上下文
    CGContextRef context = UIGraphicsGetCurrentContext();
    // 使用color演示填充上下文
    CGContextSetFillColorWithColor(context, [color CGColor]);
    // 渲染上下文
    CGContextFillRect(context, rect);
    // 从上下文中获取图片
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    // 结束上下文
    UIGraphicsEndImageContext();
    
    return theImage;
}

+(UIImage *)borderImageWithImageName:(NSString *)name border:(CGFloat)border color:(UIColor *)color
{
    //创建一张图片
    UIImage *image=[UIImage imageNamed: name];
    
    //设置边框宽度
    CGFloat borderW=border;
    
    //设置上下文的大小
    CGSize size=CGSizeMake(image.size.width+2*borderW, image.size.height+2*borderW);
    
    //开启图片上下文
    UIGraphicsBeginImageContextWithOptions(size, NO, 0.0);
    
    //添加一个大圆,设置为填充区域
    UIBezierPath *path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, size.width, size.height)];
    [color set];
    [path fill];
    
    //再添加一个小圆,设置裁剪区域
    path=[UIBezierPath bezierPathWithOvalInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    [path addClip];
    
    //把图片路径添加到图片上下文中
    [image drawInRect:CGRectMake(borderW, borderW, image.size.width, image.size.height)];
    
    //用一张新的图片接收
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    
    //手动关闭上下文
    UIGraphicsEndImageContext();
    
    return newImage;

}


+(UIImage *)imageWithOriginalImageNamed:(NSString *)name
{
    UIImage *image=[UIImage imageNamed:name];
    
    return [image imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
}
@end
