//
//  BaseModel.m
//  BaseProject
//
//  Created by 孙伟 on 15/12/15.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import "BaseModel.h"

@implementation BaseModel

@end

@implementation SWT1348648517839Model

+ (NSDictionary *)objectClassInArray{
    return @{@"ads" : [SWAdsModel class], @"imgextra" : [SWImgextraModel class]};
}

@end

@implementation SWT1348647853363Model

+ (NSDictionary *)objectClassInArray{
    return @{@"ads" : [SWAdsModel class], @"imgextra" : [SWImgextraModel class]};
}

@end


@implementation SWAdsModel

@end


@implementation SWImgextraModel

@end