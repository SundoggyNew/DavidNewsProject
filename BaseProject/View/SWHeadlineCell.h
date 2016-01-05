//
//  SWHeadlineCell.h
//  BaseProject
//
//  Created by 孙伟 on 16/1/3.
//  Copyright © 2016年 sunwei. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SWImageView.h"

@interface SWHeadlineCell : UITableViewCell

@property (nonatomic, strong) SWImageView *newsImageView;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *createtimeLabel;
@property (nonatomic, strong) UILabel *commentNumberLabel;
@property (nonatomic, strong) SWImageView *commentImageView;

@end
