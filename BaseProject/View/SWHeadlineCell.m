//
//  SWHeadlineCell.m
//  BaseProject
//
//  Created by 孙伟 on 16/1/3.
//  Copyright © 2016年 sunwei. All rights reserved.
//

#import "SWHeadlineCell.h"

@implementation SWHeadlineCell

- (SWImageView *)newsImageView {
    if (!_newsImageView) {
        _newsImageView = [[SWImageView alloc] init];
        [self.contentView addSubview:_newsImageView];
        [_newsImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.left.mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(65, 55));
            
        }];
    }
    return _newsImageView;
}

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = [UIFont systemFontOfSize:16];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.numberOfLines = 2;
        [self.contentView addSubview:_titleLabel];
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.right.mas_equalTo(-10);
            make.left.mas_equalTo(self.newsImageView.mas_right).mas_equalTo(10);
            make.height.mas_equalTo(35);
        }];
    }
    return _titleLabel;
}

- (UILabel *)createtimeLabel {
    if (!_createtimeLabel) {
        _createtimeLabel = [[UILabel alloc] init];
        _createtimeLabel.font = [UIFont systemFontOfSize:13];
        _createtimeLabel.textColor = [UIColor lightGrayColor];
        _createtimeLabel.textAlignment = NSTextAlignmentLeft;
        [self.contentView addSubview:_createtimeLabel];
        [_createtimeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-10);
            make.left.mas_equalTo(self.newsImageView.mas_right).mas_equalTo(10);
            make.size.mas_equalTo(CGSizeMake(55, 20));
        }];
    }
    return _createtimeLabel;
}

- (SWImageView *)commentImageView {
    if (!_commentImageView) {
        _commentImageView = [[SWImageView alloc] init];
        [self.contentView addSubview:_commentImageView];
        [_commentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.right.mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(20, 20));
        }];
    }
    return _commentImageView;
}

- (UILabel *)commentNumberLabel {
    if (!_commentNumberLabel) {
        _commentNumberLabel = [[UILabel alloc] init];
        _commentNumberLabel.font = [UIFont systemFontOfSize:13];
        _commentNumberLabel.textColor = [UIColor lightGrayColor];
        _commentNumberLabel.textAlignment = NSTextAlignmentRight;
        [self.contentView addSubview:_commentNumberLabel];
        [_commentNumberLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.mas_equalTo(-10);
            make.right.mas_equalTo(self.commentImageView.mas_left).mas_equalTo(-10);
            make.size.mas_equalTo(CGSizeMake(40, 20));
        }];
    }
    return _commentNumberLabel;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
