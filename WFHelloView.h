//
//  HelloView.h
//  Demo
//
//  Created by Administrator on 2017/5/27.
//  Copyright © 2017年 dyy. All rights reserved.
//

#import "WFBassView.h"
#import "WFForgetPasswordView.h"
#import "WFCompleteInfoView.h"
#import "WFLoginView.h"
#import "WFChangeCountTipsView.h"
@interface WFHelloView : UIView
@property (nonatomic,strong)UIButton * changePasswordButton;//修改密码
@property (nonatomic,strong)UIButton * completInfoButton;//完善信息
@property (nonatomic,strong)UIButton * changecountButton;//切换账号
@property (nonatomic,strong)WFForgetPasswordView * forgetPasswordView;//修改密码
@property (nonatomic,strong)WFCompleteInfoView * completeInfoView;//完善账号
@property (nonatomic,strong)WFLoginView * loginView;//切换账号
@property (nonatomic,strong)WFChangeCountTipsView * changeCountView;//未绑定用户切换提示
@property (nonatomic,copy)void(^block)();
- (instancetype)initWithOrientation:(UIDeviceOrientation)orient;
@end
