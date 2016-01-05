//
//  WelcomeViewController.m
//  BaseProject
//
//  Created by 孙伟 on 15/12/24.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import "WelcomeViewController.h"
#import "SWCustomTabBarController.h"

/* 欢迎界面4张图片 */
#define kImageNumber 4

@interface WelcomeViewController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIPageControl *pageControl;

@end

@implementation WelcomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpScrollView];
    [self setUpPageControl];
}

//设置ScrollView
- (void)setUpScrollView {
    UIScrollView *scrollView = [UIScrollView new];
    scrollView.delegate = self;
    scrollView.frame = self.view.bounds;
    for (int i = 0; i < kImageNumber; i++) {
        NSString *imageName = [NSString stringWithFormat:@"welcome%d.jpg",i + 1];
        UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:imageName]];
        CGRect iFrame = CGRectZero;
        iFrame.origin = CGPointMake(i * scrollView.bounds.size.width, 0);
        iFrame.size = scrollView.bounds.size;
        imageView.frame = iFrame;
        [scrollView addSubview:imageView];
        if (i == kImageNumber - 1) {
            [self addEnterButton:imageView];
        }
    }
    scrollView.contentSize = CGSizeMake(kImageNumber * scrollView.bounds.size.width, scrollView.bounds.size.height);
    scrollView.bounces = NO;
    scrollView.pagingEnabled = YES;
    scrollView.showsHorizontalScrollIndicator = NO;
    [self.view addSubview:scrollView];
}

//设置PageControl
- (void)setUpPageControl {
    _pageControl = [UIPageControl new];
    [self.view addSubview:_pageControl];
    [_pageControl mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.bottom.mas_equalTo(-30);
        make.height.mas_equalTo(30);
    }];
    _pageControl.backgroundColor = [UIColor clearColor];
    _pageControl.numberOfPages = kImageNumber;
    _pageControl.pageIndicatorTintColor = [UIColor lightGrayColor];
    _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    _pageControl.userInteractionEnabled = NO;
}

- (void)addEnterButton:(UIImageView *)imageView {
    imageView.userInteractionEnabled = YES;
    UIButton *enterButton = [UIButton new];
    [imageView addSubview:enterButton];
    [enterButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(imageView);
        make.centerY.mas_equalTo(imageView).multipliedBy(1.67);
        make.size.mas_equalTo(CGSizeMake(150, 40));
    }];
    enterButton.titleLabel.font = [UIFont fontWithName:@"AppleColorEmoji" size:30];
    [enterButton setTitleColor:[UIColor colorWithWhite:1 alpha:0.4] forState:UIControlStateNormal];
    [enterButton setTitle:@"进入应用" forState:UIControlStateNormal];
    [enterButton addTarget:self action:@selector(enterApp:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark ---跳转到主页面
- (void)enterApp:(UIButton *)sender {
    SWCustomTabBarController *tabBarController = [SWCustomTabBarController new];
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    window.rootViewController = tabBarController;
}

#pragma mark --- UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    int index = round(scrollView.contentOffset.x / self.view.bounds.size.width);
    _pageControl.currentPage = index;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
