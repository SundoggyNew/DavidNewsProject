//
//  NSObject+HUD.m
//  BaseProject
//
//  Created by 孙伟 on 15/12/15.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import "NSObject+HUD.h"

@implementation NSObject (HUD)

- (UIView *)currentView {
    UIViewController *vc = [UIApplication sharedApplication].keyWindow.rootViewController;
    if ([vc isKindOfClass:[UITabBarController class]]) {
        vc = [(UITabBarController *)vc selectedViewController];
    }
    if ([vc isKindOfClass:[UINavigationController class]]) {
        vc = [(UINavigationController *)vc visibleViewController];
        
    }
    return vc.view;
}

- (void)showAlert:(NSString *)text {
    dispatch_async(dispatch_get_main_queue(), ^{
        //[self hideProgress];
        [MBProgressHUD hideAllHUDsForView:[self currentView] animated:YES];
        MBProgressHUD *progerssHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
        progerssHUD.mode = MBProgressHUDModeText;
        progerssHUD.labelText = text;
        [progerssHUD hide:YES afterDelay:1.5];
    });
}

- (void)showBusy {
    [[NSOperationQueue mainQueue]addOperationWithBlock:^{
        [MBProgressHUD hideAllHUDsForView:[self currentView] animated:YES];
        MBProgressHUD *progressHUD = [MBProgressHUD showHUDAddedTo:[self currentView] animated:YES];
        [progressHUD hide:YES afterDelay:30];
    }];
}

- (void)hideProgress {
    [[NSOperationQueue mainQueue] addOperationWithBlock:^{
        [MBProgressHUD hideAllHUDsForView:[self currentView] animated:YES];
    }];
    
}

@end
