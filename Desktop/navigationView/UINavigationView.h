//
//  UINavigationView.h
//  MobilePingTu
//
//  Created by Yangfan on 15/3/20.
//  Copyright (c) 2015年 4gread. All rights reserved.
//

#import <UIKit/UIKit.h>

#define selfViewWidth  self.frame.size.width
#define selfViewHeight  self.frame.size.height

@protocol UINavigationViewDelegate <NSObject>

@required
// 点击左边的按钮
- (void)selectLeftButton:(UIButton *)sender;
// 点击右边的按钮
- (void)selectRightButton:(UIButton *)sender;

@end

@interface UINavigationView : UIView<UINavigationViewDelegate> {
}

@property(nonatomic, strong) id<UINavigationViewDelegate> delegate;// 顶部文字

@property(nonatomic, strong) UILabel *titleLabel;// 顶部文字
@property(nonatomic, strong) UIImageView *titleImageView;// 顶部标题图片
@property(nonatomic, strong) UIButton *leftImageButton;// Left 按钮
@property(nonatomic, strong) UIButton *rightImageButton;// Right 按钮

// 全局初始化导航栏需要的元素
- (void)initUI:(NSString *)Title orTitleImageView:(UIImage *)titleImage andLeftImage:(UIImage *)leftImage andLeftImageSelected:(UIImage *)leftImageSelected andRightImage:(UIImage *)rightImage  andRightImageSelected:(UIImage *)rightImageSelected andImageMarginLeftOrRight:(float)marginLeftOrRight;

// 设置导航的背景色（支持透明度）
- (void)setViewBackgroundColor:(UIColor *)color;



@end

