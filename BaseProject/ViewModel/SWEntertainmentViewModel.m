//
//  SWEntertainmentViewModel.m
//  BaseProject
//
//  Created by 孙伟 on 16/1/5.
//  Copyright © 2016年 sunwei. All rights reserved.
//

#import "SWEntertainmentViewModel.h"

@implementation SWEntertainmentViewModel

- (NSInteger)rowNumber {
    return self.dataArr.count;
}

- (SWT1348648517839Model *)modelForRow:(NSInteger)row {
    return self.dataArr[row];
}

- (void)getDataFromNetCompleteHandle:(CompletionHandle)completionHandle {
    self.dataTask = [SWEntertainmentNetManager getEntertainmentNewsWithStartIndex:0 completionHandle:^(SWEntertainmentNewsModel *model, NSError *error) {
        [self.dataArr addObjectsFromArray:model.T1348648517839];
        completionHandle(error);
    }];
}

- (NSURL *)imgsrcURLForRow:(NSInteger)row {
    return [NSURL URLWithString:[self modelForRow:row].imgsrc];
}

- (NSString *)titleForRow:(NSInteger)row {
    return [self modelForRow:row].title;
}

- (NSString *)createTimeForRow:(NSInteger)row {
    NSString *str = [self modelForRow:row].ptime;
    NSRange range = {11,5};
    NSString *subStr = [str substringWithRange:range];
    return subStr;
}

- (NSString *)commentNumberForRow:(NSInteger)row {
    NSInteger count = [self modelForRow:row].replyCount;
    if (count < 10000) {
        return @(count).stringValue;
    } else {
        return [NSString stringWithFormat:@"%.1f万",count/10000.0];
    }
}

- (NSURL *)url3wForRow:(NSInteger)row {
    return [NSURL URLWithString:[self modelForRow:row].url_3w];
}

@end
