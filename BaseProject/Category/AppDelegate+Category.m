//
//  AppDelegate+Category.m
//  BaseProject
//
//  Created by 孙伟 on 15/12/15.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import "AppDelegate+Category.h"
#import <AFNetworkActivityIndicatorManager.h>
#import "MobClick.h"

#define kUMKey @"5673b0f6e0f55a46e6001389"
@implementation AppDelegate (Category)

- (void)applicationWillResignActive:(UIApplication *)application {
    
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    
}

- (void)applicationWillTerminate:(UIApplication *)application {
    
}

- (void)initializeWithApplication:(UIApplication *)application {
    //注册DDLog
    [DDLog addLogger:[DDASLLogger sharedInstance]];
    [DDLog addLogger:[DDTTYLogger sharedInstance]];
    [[DDTTYLogger sharedInstance] setColorsEnabled:YES];
    
    [AFNetworkActivityIndicatorManager sharedManager].enabled = YES;
    
    [[AFNetworkReachabilityManager sharedManager] setReachabilityStatusChangeBlock:^(AFNetworkReachabilityStatus status) {
        
        switch (status) {
            case AFNetworkReachabilityStatusReachableViaWiFi:
                DDLogVerbose(@"当前是WIFI环境");
                break;
            case AFNetworkReachabilityStatusNotReachable:
                DDLogVerbose(@"当前无网络");
                break;
            case AFNetworkReachabilityStatusUnknown:
                DDLogVerbose(@"当前网络未知");
                break;
            case AFNetworkReachabilityStatusReachableViaWWAN:
                DDLogVerbose(@"当前是蜂窝网络");
                break;
            default:
                break;
        }
    }];
    //开启网络检测
    [[AFNetworkReachabilityManager sharedManager] startMonitoring];
    //开启友盟统计功能
    [MobClick startWithAppkey:kUMKey];
#ifdef DEBUG
    [MobClick setLogEnabled:YES];
#endif
}

@end
