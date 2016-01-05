//
//  SWEntertainmentViewModel.h
//  BaseProject
//
//  Created by 孙伟 on 16/1/5.
//  Copyright © 2016年 sunwei. All rights reserved.
//

#import "BaseViewModel.h"
#import "SWEntertainmentNetManager.h"

@interface SWEntertainmentViewModel : BaseViewModel

@property (nonatomic, assign) NSInteger rowNumber;

- (NSURL *)imgsrcURLForRow:(NSInteger)row;
- (NSString *)titleForRow:(NSInteger)row;
- (NSString *)createTimeForRow:(NSInteger)row;
- (NSString *)commentNumberForRow:(NSInteger)row;
- (NSURL *)url3wForRow:(NSInteger)row;


@end
