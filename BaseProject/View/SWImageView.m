//
//  SWImageView.m
//  BaseProject
//
//  Created by 孙伟 on 16/1/3.
//  Copyright © 2016年 sunwei. All rights reserved.
//

#import "SWImageView.h"

@implementation SWImageView

-(id)init
{
    if (self = [super init]) {
        _imageView = [UIImageView new];
        [self addSubview:_imageView];
        //按比例放大,充满
        _imageView.contentMode = 2;
        [_imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.edges.mas_equalTo(0);
        }];
        //当前视图容易减掉超出自身区域的视图
        self.clipsToBounds = YES;
    }
    return self;
}

@end
