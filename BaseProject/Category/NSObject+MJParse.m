//
//  NSObject+MJParse.m
//  BaseProject
//
//  Created by 孙伟 on 15/12/15.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import "NSObject+MJParse.h"

@implementation NSObject (MJParse)
/*
+ (NSString *)mj_replacedKeyFromPropertyName121:(NSString *)propertyName {
    if ([propertyName isEqualToString:@"ID"]) {
        propertyName = @"id";
    }
    if ([propertyName isEqualToString:@"desc"]) {
        propertyName = @"description";
    }
    return propertyName;
}
*/
+ (id)parse:(id)responseObj {
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self mj_objectArrayWithKeyValuesArray:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self mj_objectWithKeyValues:responseObj];
    }
    return responseObj;
}

@end
