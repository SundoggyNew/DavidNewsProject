//
//  SWCustomTabBarController.m
//  BaseProject
//
//  Created by 孙伟 on 15/12/28.
//  Copyright © 2015年 sunwei. All rights reserved.
//

#import "SWCustomTabBarController.h"
#import "SWLocalViewController.h"

static CGFloat const customViewHeight = 44;
static CGFloat const buttonWidth = 80;

#define kScreenWidth [UIScreen mainScreen].bounds.size.width
#define kScreenHeight [UIScreen mainScreen].bounds.size.height

@interface SWCustomTabBarController ()<UIScrollViewDelegate>

@property (nonatomic, strong) UIView *customView;
@property (nonatomic, strong) NSArray *titlesArray;
@property (nonatomic, strong) UIScrollView *titleScrollView;
@property (nonatomic, weak) UIButton *selectedButton;

@end

@implementation SWCustomTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setupTabBarAppearance];
    self.tabBar.hidden = YES;
    self.customView.hidden = NO;
    self.titleScrollView.hidden = NO;
    [self setupLeftAndRightButtons];
    [self addChildViewControllerToTabBarController];
    
    self.selectedIndex = 1;
}

- (UIView *)customView {
    if (!_customView) {
        _customView = [UIView new];
        _customView.backgroundColor = [UIColor colorWithRed:234/255.0 green:234/255.0 blue:235/255.0 alpha:1];
        [self.view addSubview:_customView];
        [_customView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(20);
            make.height.mas_equalTo(customViewHeight);
        }];
    }
    return _customView;
}

- (NSArray *)titlesArray {
    if (!_titlesArray) {
        _titlesArray = @[@"头条", @"推荐", @"娱乐", @"本地", @"财经", @"科技"];
    }
    return  _titlesArray;
}

- (UIScrollView *)titleScrollView {
    if (!_titleScrollView) {
        _titleScrollView = [UIScrollView new];
        _titleScrollView.backgroundColor = [UIColor clearColor];
        _titleScrollView.delegate = self;
        [_customView addSubview:_titleScrollView];
        [_titleScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(customViewHeight);
            make.right.mas_equalTo(-customViewHeight);
        }];
        [self addButtonsToScrollView];
        _titleScrollView.contentSize = CGSizeMake(_titlesArray.count * buttonWidth, customViewHeight);
    }
    return _titleScrollView;
}

#pragma mark ---在titleScrollView上添加按钮
- (void)addButtonsToScrollView {
    for (int i = 0; i < self.titlesArray.count; i++) {
        UIButton *button = [[UIButton alloc]init];
        button.tag = 101 + i;
        [button setTitle:_titlesArray[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        button.backgroundColor = [UIColor clearColor];
        [_titleScrollView addSubview:button];
        [button mas_makeConstraints:^(MASConstraintMaker *make) {
            make.top.bottom.mas_equalTo(0);
            make.left.mas_equalTo(i * buttonWidth);
            make.width.mas_equalTo(buttonWidth);
            make.height.mas_equalTo(customViewHeight);
        }];
        [button addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
        if (i == 0) {
            [self click:button];
        }
    }
}

#pragma mark ---点击按钮事件
- (void)click:(UIButton *)button {
    self.selectedIndex = button.tag - 100;
    [self.selectedButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
    self.selectedButton.titleLabel.font = [UIFont systemFontOfSize:17];
    [button setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:20];
    self.selectedButton = button;
    [self setupTitleCenter:button];
}

#pragma mark ---设置选中按钮显示在中间
- (void)setupTitleCenter:(UIButton *)button {
    CGFloat offset = button.center.x - _titleScrollView.bounds.size.width * 0.5;
    if (offset < 0) {
        offset = 0;
    }
    CGFloat maxOffset = _titlesArray.count * buttonWidth - _titleScrollView.bounds.size.width;
    if (offset > maxOffset) {
        offset = maxOffset;
    }
    [self.titleScrollView setContentOffset:CGPointMake(offset, 0) animated:YES];
}

#pragma mark ---设置左右按钮
- (void)setupLeftAndRightButtons {
    UIButton *leftButton = [UIButton buttonWithType:UIButtonTypeSystem];
    leftButton.tag = 100;
    [leftButton setBackgroundColor:[UIColor clearColor]];
    [leftButton setImage:[UIImage imageNamed:@"information"] forState:UIControlStateNormal];
    [leftButton setImage:[UIImage imageNamed:@"information_highlighted"] forState:UIControlStateHighlighted];
    [_customView addSubview:leftButton];
    [leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(customViewHeight);
    }];
    [leftButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
    UIButton *rightButton = [UIButton buttonWithType:UIButtonTypeSystem];
    rightButton.tag = _titlesArray.count + 100;
    [rightButton setBackgroundColor:[UIColor clearColor]];
    [rightButton setImage:[UIImage imageNamed:@"add"] forState:UIControlStateNormal];
    [rightButton setImage:[UIImage imageNamed:@"add_highlighted"] forState:UIControlStateHighlighted];
    [_customView addSubview:rightButton];
    [rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.top.bottom.mas_equalTo(0);
        make.width.mas_equalTo(customViewHeight);
    }];
    [rightButton addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
}

#pragma mark ---添加子控制器
- (void)addChildViewControllerToTabBarController {
    SWLoginViewController *loginVC = [SWLoginViewController new];
    SWHeadlineViewController *headlineVC = [SWHeadlineViewController new];
    SWRecommendViewController *recommendVC = [SWRecommendViewController new];
    SWEntertainmentViewController *entertainmentVC = [SWEntertainmentViewController new];
    SWLocalViewController *localVC = [SWLocalViewController new];
    SWFinanceViewController *financeVC = [SWFinanceViewController new];
    SWTechnologyViewController *technologyVC = [SWTechnologyViewController new];
    self.viewControllers = @[loginVC, headlineVC, recommendVC, entertainmentVC, localVC, financeVC, technologyVC];
}

#pragma mark ---统一TabBar的Appearance
- (void)setupTabBarAppearance {
    
}

@end
