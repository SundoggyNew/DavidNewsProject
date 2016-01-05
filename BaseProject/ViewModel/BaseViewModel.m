//
//  BaseViewModel.m
//  BaseProject
//
//  Created by 孙伟 on 15/12/24.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import "BaseViewModel.h"

@implementation BaseViewModel

- (void)cancelTask {
    [self.dataTask cancel];
}

- (void)suspendTask {
    [self.dataTask suspend];
}

- (void)resumeTask {
    [self.dataTask resume];
}

- (NSMutableArray *)dataArr {
    if (!_dataArr) {
        _dataArr = [NSMutableArray new];
    }
    return _dataArr;
}

@end
