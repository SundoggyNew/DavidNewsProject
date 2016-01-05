//
//  NSObject+Network.h
//  BaseProject
//
//  Created by 孙伟 on 15/12/15.
//  Copyright © 2015年 sunwei. All rights reserved.
//
#define kCompletionHandle  completionHandle:(void(^)(id model, NSError *error))completionHandle;

#import <Foundation/Foundation.h>

@interface NSObject (Network)

+ (id)GET:(NSString *)path parameters:(NSDictionary *)params kCompletionHandle;

+ (id)POST:(NSString *)path parameters:(NSDictionary *)params kCompletionHandle;

@end
