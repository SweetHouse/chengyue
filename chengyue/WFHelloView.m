//
//  HelloView.m
//  Demo
//
//  Created by Administrator on 2017/5/27.
//  Copyright © 2017年 dyy. All rights reserved.
//

#import "WFHelloView.h"
#import "WFSingle.h"

@implementation WFHelloView

- (instancetype)initWithOrientation:(UIDeviceOrientation)orient{
    if (self = [super initWithFrame:[UIScreen mainScreen].bounds]) {
        if ([WFSingle shareSingle].orientation == UIDeviceOrientationPortrait) {
            [self Portrait];
        }
        else if ([WFSingle shareSingle].orientation == UIDeviceOrientationLandscapeLeft||[WFSingle shareSingle].orientation == UIDeviceOrientationLandscapeRight){
            [self Landscape];
        }
    }
    return self;
}
//竖屏
- (void)Portrait{

    float rate = MYRATE;
    UIImageView * bgImageView = [[UIImageView alloc]initWithFrame:self.frame];
    bgImageView.image = [UIImage imageNamed:@"bg竖"];
    [self addSubview:bgImageView];
    
    UIImageView * logoImageView = [UIImageView new];
    logoImageView.image = [UIImage imageNamed:@"闪屏logo"];
    [bgImageView addSubview:logoImageView];
    [logoImageView MASS_makeConstraints:^(MASSConstraintMaker *make) {
        make.top.equalTo(bgImageView.MASS_top).offset(201);
        make.leading.equalTo(self.MASS_leading).offset(40*rate);
        make.trailing.equalTo(self.MASS_trailing).offset(-40*rate);
        make.height.equalTo(@(75*rate));
    }];
    
    UILabel * goingLabel = [UILabel new];
    [self addSubview:goingLabel];
    goingLabel.text = @"正在进入游戏...";
    goingLabel.font = [UIFont systemFontOfSize:15];
    goingLabel.textColor = [UIColor whiteColor];
    [goingLabel MASS_makeConstraints:^(MASSConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(logoImageView.MASS_bottom).offset(161);
    }];
    
    _completInfoButton = [UIButton new];
    _completInfoButton.tag = 1;
    [_completInfoButton addTarget:self action:@selector(clickOn:) forControlEvents:UIControlEventTouchUpInside];
    [_completInfoButton setTitle:@"完善信息" forState:UIControlStateNormal];
    [_completInfoButton setTitleColor:MYHEXCOLOR(0x55f778) forState:UIControlStateNormal];
    _completInfoButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_completInfoButton];
    [_completInfoButton MASS_makeConstraints:^(MASSConstraintMaker *make) {
        make.trailing.equalTo(goingLabel.MASS_leading).offset(15);
        make.top.equalTo(goingLabel.MASS_bottom).offset(50*rate);
    }];
    
    _changePasswordButton = [UIButton new];
    _changePasswordButton.tag = 2;
    [_changePasswordButton addTarget:self action:@selector(clickOn:) forControlEvents:UIControlEventTouchUpInside];
    [_changePasswordButton setTitle:@"修改密码" forState:UIControlStateNormal];
    [_changePasswordButton setTitleColor:MYHEXCOLOR(0x55f778) forState:UIControlStateNormal];
    _changePasswordButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_changePasswordButton];
    [_changePasswordButton MASS_makeConstraints:^(MASSConstraintMaker *make) {
        make.trailing.equalTo(goingLabel.MASS_leading).offset(15);
        make.top.equalTo(goingLabel.MASS_bottom).offset(50*rate);
    }];
    
    _changecountButton = [UIButton new];
    _changecountButton.tag = 3;
    [_changecountButton addTarget:self action:@selector(clickOn:) forControlEvents:UIControlEventTouchUpInside];
    [_changecountButton setTitle:@"切换账号" forState:UIControlStateNormal];
    [_changecountButton setTitleColor:MYHEXCOLOR(0x55f778) forState:UIControlStateNormal];
    _changecountButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_changecountButton];
    [_changecountButton MASS_makeConstraints:^(MASSConstraintMaker *make) {
        make.leading.equalTo(goingLabel.MASS_trailing).offset(-15);
        make.top.equalTo(goingLabel.MASS_bottom).offset(50*rate);
    }];
    self.changePasswordButton.hidden = YES;
    self.changecountButton.hidden = YES;
    self.completInfoButton.hidden = YES;
    [[NSNotificationCenter defaultCenter]addObserverForName:@"showButton" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        if ([note.userInfo[@"user_type"] integerValue] == 1) {
            self.changePasswordButton.hidden = NO;
            self.changecountButton.hidden = NO;
            self.completInfoButton.hidden = YES;
        }else{
            self.changePasswordButton.hidden = YES;
            self.changecountButton.hidden = NO;
            self.completInfoButton.hidden = NO;
        }
    }];
}
//横屏
- (void)Landscape{
    float rate = MYRATE;
    UIImageView * bgImageView = [[UIImageView alloc]initWithFrame:self.frame];
    bgImageView.image = [UIImage imageNamed:@"bg"];
    [self addSubview:bgImageView];
    
    UIImageView * logoImageView = [UIImageView new];
    logoImageView.image = [UIImage imageNamed:@"闪屏logo"];
    [bgImageView addSubview:logoImageView];
    [logoImageView MASS_makeConstraints:^(MASSConstraintMaker *make) {
        make.top.equalTo(bgImageView.MASS_top).offset(74);
        make.centerX.equalTo(self);
    }];
    
    UILabel * goingLabel = [UILabel new];
    [self addSubview:goingLabel];
    goingLabel.text = @"正在进入游戏...";
    goingLabel.font = [UIFont systemFontOfSize:15];
    goingLabel.textColor = [UIColor whiteColor];
    [goingLabel MASS_makeConstraints:^(MASSConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(logoImageView.MASS_bottom).offset(77*rate);
    }];
    
    _completInfoButton = [UIButton new];
    _completInfoButton.tag = 1;
    [_completInfoButton addTarget:self action:@selector(clickOn:) forControlEvents:UIControlEventTouchUpInside];
    [_completInfoButton setTitle:@"完善信息" forState:UIControlStateNormal];
    [_completInfoButton setTitleColor:MYHEXCOLOR(0x55f778) forState:UIControlStateNormal];
    _completInfoButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_completInfoButton];
    [_completInfoButton MASS_makeConstraints:^(MASSConstraintMaker *make) {
        make.trailing.equalTo(goingLabel.MASS_leading).offset(15);
        make.top.equalTo(goingLabel.MASS_bottom).offset(35*rate);
    }];
    
    _changePasswordButton = [UIButton new];
    _changePasswordButton.tag = 2;
    [_changePasswordButton addTarget:self action:@selector(clickOn:) forControlEvents:UIControlEventTouchUpInside];
    [_changePasswordButton setTitle:@"修改密码" forState:UIControlStateNormal];
    [_changePasswordButton setTitleColor:MYHEXCOLOR(0x55f778) forState:UIControlStateNormal];
    _changePasswordButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_changePasswordButton];
    [_changePasswordButton MASS_makeConstraints:^(MASSConstraintMaker *make) {
        make.trailing.equalTo(goingLabel.MASS_leading).offset(15);
        make.top.equalTo(goingLabel.MASS_bottom).offset(35*rate);
    }];
    
    _changecountButton = [UIButton new];
    _changecountButton.tag = 3;
    [_changecountButton addTarget:self action:@selector(clickOn:) forControlEvents:UIControlEventTouchUpInside];
    [_changecountButton setTitle:@"切换账号" forState:UIControlStateNormal];
    [_changecountButton setTitleColor:MYHEXCOLOR(0x55f778) forState:UIControlStateNormal];
    _changecountButton.titleLabel.font = [UIFont systemFontOfSize:15];
    [self addSubview:_changecountButton];
    [_changecountButton MASS_makeConstraints:^(MASSConstraintMaker *make) {
        make.leading.equalTo(goingLabel.MASS_trailing).offset(-15);
        make.top.equalTo(goingLabel.MASS_bottom).offset(35*rate);
    }];
    
    self.changePasswordButton.hidden = YES;
    self.changecountButton.hidden = YES;
    self.completInfoButton.hidden = YES;
    [[NSNotificationCenter defaultCenter]addObserverForName:@"showButton" object:nil queue:[NSOperationQueue mainQueue] usingBlock:^(NSNotification * _Nonnull note) {
        if ([note.userInfo[@"user_type"] integerValue] == 1) {
            self.changePasswordButton.hidden = NO;
            self.changecountButton.hidden = NO;
            self.completInfoButton.hidden = YES;
        }else{
            self.changePasswordButton.hidden = YES;
            self.changecountButton.hidden = NO;
            self.completInfoButton.hidden = NO;
        }
    }];

}

- (void)clickOn:(UIButton *)button{
    _block();
    switch (button.tag) {
        case 1:
        {
            for (UIView * obj in [WFSingle shareSingle].mainWindow.contentView.subviews) {
                obj.hidden = YES;
            }
            [[WFSingle shareSingle].mainWindow.contentView addSubview:self.completeInfoView];
            self.hidden = YES;
            break;
        }
        case 2:
        {
            for (UIView * obj in [WFSingle shareSingle].mainWindow.contentView.subviews) {
                obj.hidden = YES;
            }
            [[WFSingle shareSingle].mainWindow.contentView addSubview:self.forgetPasswordView];
            self.hidden = YES;
            break;
        }
        case 3://切换账号
        {
            
            if (WFSINGLE.isBound == 2) {
                self.hidden = YES;
                [WFSingle shareSingle].mainWindow.contentView.hidden = YES;
                [self changeCountView];
            }
            else{
                self.hidden = YES;
            }
            break;
        }
        default:
            break;
    }
}
- (WFForgetPasswordView *)forgetPasswordView{
    if (!_forgetPasswordView) {
        _forgetPasswordView = [[WFForgetPasswordView alloc]initWithOrientation:[WFSingle shareSingle].orientation];
        __weak typeof(self)weakself = self;
        self.forgetPasswordView.backBlock = ^(){
            __strong typeof (weakself)strongself = weakself;
            [strongself.forgetPasswordView removeFromSuperview];
            strongself.forgetPasswordView = nil;
            for (UIView * obj in [WFSingle shareSingle].mainWindow.contentView.subviews) {
                obj.hidden = NO;
            }
        };
    }
    return _forgetPasswordView;
}

- (WFCompleteInfoView *)completeInfoView{
    if (!_completeInfoView) {
        _completeInfoView = [[WFCompleteInfoView alloc]initWithOrientation:[WFSingle shareSingle].orientation];
        __weak typeof(self)weakself = self;
        self.completeInfoView.backBlock = ^(){
            __strong typeof (weakself)strongself = weakself;
            [strongself.completeInfoView removeFromSuperview];
            strongself.completeInfoView = nil;
            for (UIView * obj in [WFSingle shareSingle].mainWindow.contentView.subviews) {
                obj.hidden = NO;
            }
        };
    }
    return _completeInfoView;
}
- (WFLoginView *)loginView{
    if (!_loginView) {
        _loginView = [[WFLoginView alloc]initWithOrientation:[WFSingle shareSingle].orientation];
        __weak typeof(self)weakself = self;
        _loginView.backBlock = ^(){
            __strong typeof (weakself)strongself = weakself;
            [strongself.loginView removeFromSuperview];
            strongself.loginView = nil;
            for (UIView * obj in [WFSingle shareSingle].mainWindow.contentView.subviews) {
                obj.hidden = NO;
            }
        };
    }
    return _loginView;
}
- (WFChangeCountTipsView *)changeCountView{
    if (!_changeCountView) {
        _changeCountView = [[WFChangeCountTipsView alloc]initWithFrame:CGRectMake(([UIScreen mainScreen].bounds.size.width-295)/2, ([UIScreen mainScreen].bounds.size.height-175)/2, 295, 175)];
        [[WFSingle shareSingle].mainWindow addSubview:_changeCountView];
        __weak typeof(self)weakself = self;
        _changeCountView.block = ^(NSInteger tag){
            __strong typeof(weakself)strongself = weakself;
            if (!tag) {
                [WFSingle shareSingle].mainWindow.contentView.hidden = NO;
                strongself.changeCountView.hidden = YES;
            }else{
                [WFSingle shareSingle].mainWindow.contentView.hidden = NO;
                strongself.changeCountView.hidden = YES;
                for (UIView * obj in [WFSingle shareSingle].mainWindow.contentView.subviews) {
                    obj.hidden = YES;
                }
                [[WFSingle shareSingle].mainWindow.contentView addSubview:strongself.completeInfoView];
            }
        
        };
    }
    return _changeCountView;
}
@end
