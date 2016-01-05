//
//  SWHeadlineNetManager.h
//  BaseProject
//
//  Created by 孙伟 on 15/12/31.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import "BaseNetManager.h"
#import "SWHeadlineNewsModel.h"

@interface SWHeadlineNetManager : BaseNetManager

+ (id)getHeadlineNewsWithStartIndex:(NSInteger)index kCompletionHandle

@end
