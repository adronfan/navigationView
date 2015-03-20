# navigationView
自定义一个基于UIView的导航栏，可以设置左右的按钮已经标题，还有透明度

```
    [self.navigationController setNavigationBarHidden:YES animated:NO];
    navigationView = [[UINavigationView alloc] initWithFrame:CGRectMake(0, 0, 0, 0)];
    [navigationView setDelegate:self];
    [navigationView initUI:nil orTitleImageView:[UIImage imageNamed:@"home_logo"] andLeftImage:[UIImage imageNamed:@"home_menu"] andLeftImageSelected:nil andRightImage:[UIImage imageNamed:@"home_menu"] andRightImageSelected:nil andImageMarginLeftOrRight:0];
    [navigationView setBackgroundColor:HexRGBAlpha(0xff0000, 0.4)];
    [self.view addSubview:navigationView];
```
别忘了按钮的代理方法哦
