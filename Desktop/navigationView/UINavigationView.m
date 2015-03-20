//
//  UINavigationView.m
//  MobilePingTu
//
//  Created by Yangfan on 15/3/20.
//  Copyright (c) 2015年 4gread. All rights reserved.
//

#import "UINavigationView.h"

@implementation UINavigationView

- (id)initWithFrame:(CGRect)frame {
    // 自定义导航栏的CGRect值
    self = [super initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 44)];
    if (self) {
    }
    return self;
}

- (void)initUI:(NSString *)Title orTitleImageView:(UIImage *)titleImage andLeftImage:(UIImage *)leftImage andLeftImageSelected:(UIImage *)leftImageSelected andRightImage:(UIImage *)rightImage  andRightImageSelected:(UIImage *)rightImageSelected andImageMarginLeftOrRight:(float)marginLeftOrRight {
    // Title文字
    if (Title != nil) {
        _titleLabel = [[UILabel alloc] initWithFrame:self.bounds];
        _titleLabel.text = Title;
        [_titleLabel setTextAlignment:NSTextAlignmentCenter];
        [_titleLabel setTextColor:[UIColor blackColor]];
        [_titleLabel setFont:[UIFont systemFontOfSize:18]];
        [self addSubview:_titleLabel];
    } else if (titleImage != nil) {// title是一张图片
        CGSize size = [self ifImageHegihtIsBigThenCurrentView:titleImage.size];
        _titleImageView = [[UIImageView alloc] initWithFrame:CGRectMake((selfViewWidth - size.width) / 2.0, (selfViewHeight - size.height) / 2.0, size.width, size.height)];
        [_titleImageView setImage:titleImage];
        [self addSubview:_titleImageView];
    } else {
    }
    
    // Left 按钮
    if (leftImage != nil) {
        CGSize size = [self ifImageHegihtIsBigThenCurrentView: leftImage.size];
        _leftImageButton = [[UIButton alloc] initWithFrame:CGRectMake(marginLeftOrRight, (selfViewHeight - size.height) / 2.0, size.width, size.height)];
        [_leftImageButton setBackgroundImage:leftImage forState:UIControlStateNormal];
        if (leftImageSelected != nil) {
            [_leftImageButton setBackgroundImage:leftImageSelected forState:UIControlStateHighlighted];
        }
        
        [_leftImageButton addTarget:self action:@selector(selectLeft:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_leftImageButton];
    }
    
    // Right 按钮
    if (rightImage != nil) {
        CGSize size = [self ifImageHegihtIsBigThenCurrentView: rightImage.size];
        _rightImageButton = [[UIButton alloc] initWithFrame:CGRectMake(selfViewWidth - marginLeftOrRight - size.width, (selfViewHeight - size.height) / 2.0, size.width, size.height)];
        [_rightImageButton setBackgroundImage:rightImage forState:UIControlStateNormal];
        if (leftImageSelected != nil) {
            [_rightImageButton setBackgroundImage:rightImageSelected forState:UIControlStateHighlighted];
        }
        
        [_rightImageButton addTarget:self action:@selector(selectRight:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:_rightImageButton];
    }
}

// 点击左边按钮的代理
- (void)selectLeft:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(selectLeftButton:)]) {
        [_delegate selectLeftButton:sender];
    }
}

// 点击右边按钮的代理
- (void)selectRight:(UIButton *)sender {
    if (_delegate && [_delegate respondsToSelector:@selector(selectRightButton:)]) {
        [_delegate selectRightButton:sender];
    }
}

// 如果图片过高，进行大小的适配
- (CGSize)ifImageHegihtIsBigThenCurrentView:(CGSize)currentSize {
        if (currentSize.height > selfViewHeight) {
            currentSize.width = currentSize.height * selfViewWidth / selfViewHeight;
            currentSize.height = selfViewHeight;
        }
    return currentSize;
}

- (void)setViewBackgroundColor:(UIColor *)color {
    [self setBackgroundColor:color];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
