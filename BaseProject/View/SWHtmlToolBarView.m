//
//  SWHtmlToolBarView.m
//  BaseProject
//
//  Created by 孙伟 on 16/1/5.
//  Copyright © 2016年 sunwei. All rights reserved.
//

#import "SWHtmlToolBarView.h"

@implementation SWHtmlToolBarView

- (UIButton *)backButton {
    if (!_backButton) {
        _backButton = [UIButton new];
        [self addSubview:_backButton];
        [_backButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.width.mas_equalTo(24);
        }];
        [_backButton setImage:[UIImage imageNamed:@"back"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"back_highlighted"] forState:UIControlStateHighlighted];
    }
    return _backButton;
}
/*
- (UIButton *)shareButton {
    if (!_shareButton) {
        _shareButton = [UIButton new];
        [self addSubview:_shareButton];
        [_shareButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.right.bottom.mas_equalTo(-10);
            make.top.mas_equalTo(10);
            make.width.mas_equalTo(24);
        }];
        [_backButton setImage:[UIImage imageNamed:@"share"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"share_highlighted"] forState:UIControlStateHighlighted];
    }
    return _shareButton;
}

- (UIButton *)collectButton {
    if (!_collectButton) {
        _collectButton = [UIButton new];
        [self addSubview:_collectButton];
        [_collectButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.width.mas_equalTo(24);
            make.right.mas_equalTo(_shareButton.mas_left).mas_equalTo(-10);
        }];
        [_backButton setImage:[UIImage imageNamed:@"collect"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"collect_highlighted"] forState:UIControlStateHighlighted];
    }
    return _collectButton;
}

- (UIButton *)commentButton {
    if (!_commentButton) {
        _commentButton = [UIButton new];
        [self addSubview:_commentButton];
        [_commentButton mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.mas_equalTo(10);
            make.bottom.mas_equalTo(-10);
            make.width.mas_equalTo(24);
            make.right.mas_equalTo(_collectButton.mas_left).mas_equalTo(-10);
        }];
        [_backButton setImage:[UIImage imageNamed:@"comments"] forState:UIControlStateNormal];
        [_backButton setImage:[UIImage imageNamed:@"comments_highlighted"] forState:UIControlStateHighlighted];
    }
    return _commentButton;
}
*/
- (instancetype)init {
    if (self = [super init]) {
        self.backButton.hidden = NO;
        self.commentButton.hidden = NO;
        self.collectButton.hidden = NO;
        self.shareButton.hidden = NO;
    }
    return self;
}

@end
