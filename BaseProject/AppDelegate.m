//
//  AppDelegate.m
//  BaseProject
//
//  Created by 孙伟 on 15/12/15.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import "AppDelegate.h"
#import "AppDelegate+Category.h"
#import "SWHeadlineNetManager.h"
#import "SWEntertainmentNetManager.h"

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    [self initializeWithApplication:application];
    [SWHeadlineNetManager getHeadlineNewsWithStartIndex:0 completionHandle:^(SWHeadlineNewsModel *model, NSError *error) {
        DDLogVerbose(@"%@", model);
    }];
    [SWEntertainmentNetManager getEntertainmentNewsWithStartIndex:0 completionHandle:^(SWEntertainmentNewsModel *model, NSError *error) {
        DDLogVerbose(@"%@", model);
    }];
    return YES;
}

@end
