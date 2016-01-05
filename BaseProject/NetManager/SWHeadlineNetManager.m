//
//  SWHeadlineNetManager.m
//  BaseProject
//
//  Created by 孙伟 on 15/12/31.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import "SWHeadlineNetManager.h"

@implementation SWHeadlineNetManager

+ (id)getHeadlineNewsWithStartIndex:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle {
    NSString *path = [NSString stringWithFormat:kHeadlineNewsPath,index];
    return [self GET:path parameters:nil completionHandle:^(id model, NSError *error) {
        DDLogVerbose(@"model%@", model);
        completionHandle([SWHeadlineNewsModel parse:model], error);
    }];
}

@end
