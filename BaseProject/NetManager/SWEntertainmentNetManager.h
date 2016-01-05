//
//  SWEntertainmentNetManager.h
//  BaseProject
//
//  Created by 孙伟 on 16/1/5.
//  Copyright © 2016年 sunwei. All rights reserved.
//

#import "BaseNetManager.h"
#import "SWEntertainmentNewsModel.h"

@interface SWEntertainmentNetManager : BaseNetManager

+ (id)getEntertainmentNewsWithStartIndex:(NSInteger)index kCompletionHandle

@end
