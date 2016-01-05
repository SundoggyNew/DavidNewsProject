//
//  NSObject+Parse.m
//  BaseProject
//
//  Created by 孙伟 on 15/12/15.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import "NSObject+Parse.h"

@implementation NSObject (Parse)

+ (id)parseArr:(NSArray *)arr {
    NSMutableArray *array = [NSMutableArray array];
    for (id obj in arr) {
        [array addObject:[self parse:obj]];
    }
    return [array copy];
}

+ (id)parseDic:(NSDictionary *)dic {
    id model = [self new];
    [dic enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        key = [self replacePropertyForKey:key];
        if ([obj isKindOfClass:[NSArray class]]) {
            //由子类重写的方法中获取array的key所对应的解析类
            Class class = [self objectClassInArray][key];
            if (class) {
                obj = [class parse:obj];
            }
        }
        [model setValue:obj forKey:key];
    }];
    return model;
}

+ (id)parse:(id)responseObj {
    if ([responseObj isKindOfClass:[NSArray class]]) {
        return [self parseArr:responseObj];
    }
    if ([responseObj isKindOfClass:[NSDictionary class]]) {
        return [self parseDic:responseObj];
    }
    return responseObj;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key {
    
}

- (void)setNilValueForKey:(NSString *)key {
    
}

+ (NSString *)replacePropertyForKey:(NSString *)key {
    
    if ([key isEqualToString:@"id"]) return @"ID";
    if ([key isEqualToString:@"description"]) return @"desc";
    if ([key isEqualToString:@"template"]) return @"atemplate";
    
    return key;
}

+ (NSDictionary *)objectClassInArray {
    return nil;
}

@end
