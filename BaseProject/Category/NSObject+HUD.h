//
//  NSObject+HUD.h
//  BaseProject
//
//  Created by 孙伟 on 15/12/15.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>

@interface NSObject (HUD)

- (void)showAlert:(NSString *)text;
- (void)showBusy;
- (void)hideProgress;

@end
