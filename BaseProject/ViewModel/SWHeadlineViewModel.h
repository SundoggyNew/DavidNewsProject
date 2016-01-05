//
//  SWHeadlineViewModel.h
//  BaseProject
//
//  Created by 孙伟 on 16/1/4.
//  Copyright © 2016年 sunwei. All rights reserved.
//

#import "BaseViewModel.h"
#import "SWHeadlineNetManager.h"

@interface SWHeadlineViewModel : BaseViewModel

@property (nonatomic, assign) NSInteger rowNumber;

- (NSURL *)imgsrcURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)createTimeForRow:(NSInteger)row;
- (NSString *)commentNumberForRow:(NSInteger)row;
- (NSURL *)url3wForRow:(NSInteger)row;

@end
