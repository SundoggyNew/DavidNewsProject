//
//  SWEntertainmentNetManager.m
//  BaseProject
//
//  Created by 孙伟 on 16/1/5.
//  Copyright © 2016年 sunwei. All rights reserved.
//

#import "SWEntertainmentNetManager.h"

@implementation SWEntertainmentNetManager

+ (id)getEntertainmentNewsWithStartIndex:(NSInteger)index completionHandle:(void (^)(id, NSError *))completionHandle {
    NSString *path = [NSString stringWithFormat:kEntertainmentNewsPath, index];
    return [self GET:path parameters:nil completionHandle:^(id model, NSError *error) {
        completionHandle([SWEntertainmentNewsModel parse:model], error);
    }];
}

@end
