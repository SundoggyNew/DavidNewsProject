//
//  NSObject+Parse.h
//  BaseProject
//
//  Created by 孙伟 on 15/12/15.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (Parse)

+ (id)parse:(id)responseObj;

+ (NSString *)replacePropertyForKey:(NSString *)key;

+ (NSDictionary *)objectClassInArray;

@end
