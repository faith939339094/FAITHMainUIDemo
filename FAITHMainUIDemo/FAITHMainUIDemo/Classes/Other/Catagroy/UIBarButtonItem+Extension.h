//
//  UIBarButtonItem+Extension.h
//  FAITH微博-02
//
//  Created by faith939339094 on 16/1/12.
//  Copyright © 2016年 faith939339094. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+(UIBarButtonItem *)itemWithImageName:(NSString *)imageName highImageName:(NSString *)highImageName target:(id)target action:(SEL)action;

+(__kindof UIBarButtonItem *)itemWithTitle:(NSString *)title target:(id)target action:(SEL)action;
@end
