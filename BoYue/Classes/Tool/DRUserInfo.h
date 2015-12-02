//
//  DRUserInfo.h
//  FastRun
//
//  Created by drouce on 15/11/17.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DRUserInfo : NSObject

singleton_interface(DRUserInfo)

/** 登录的用户名 密码 */
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *userPasswd;

/** 注册的用户名 密码 */
@property (nonatomic, copy) NSString *userRegisterName;
@property (nonatomic, copy) NSString *userRegisterPwd;

@property (nonatomic, getter=isRegisterType) BOOL registerType;

/** 新浪登陆 */
@property (nonatomic) BOOL sinaLogin;
@property (nonatomic, copy) NSString *sinaToken;
@end
