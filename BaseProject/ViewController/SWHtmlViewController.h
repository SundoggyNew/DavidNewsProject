//
//  SWHtmlViewController.h
//  BaseProject
//
//  Created by 孙伟 on 16/1/4.
//  Copyright © 2016年 sunwei. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SWHtmlViewController : UIViewController

@property (nonatomic, strong) NSURL *url;
- (instancetype)initWithURL:(NSURL *)url;

@end
