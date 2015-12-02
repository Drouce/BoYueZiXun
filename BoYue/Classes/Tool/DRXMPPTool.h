//
//  DRXMPPTool.h
//  FastRun
//
//  Created by drouce on 15/11/17.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "XMPPFramework.h"

/** 表示返回状态 */
typedef enum {
    DRXMPPResultLoginSuccess,
    DRXMPPResultLoginFaild,
    DRXMPPResultNetError,
    DRXMPPResultRegisterSuccess,
    DRXMPPResultRegisterFaild
}DRXMPPResult;

/** 用来获得状态信息 */
typedef void(^DRXMPPResultBlock)(DRXMPPResult type);

@interface DRXMPPTool : NSObject
singleton_interface(DRXMPPTool)

@property (nonatomic, strong) XMPPStream *xmppStream;

/** 增加电子名片和头像模块 */
@property (nonatomic, strong) XMPPvCardAvatarModule *xppAvatar;
@property (nonatomic, strong) XMPPvCardTempModule *xppModule;
@property (nonatomic, strong) XMPPvCardCoreDataStorage *xppStory;

/** 设置流 */
- (void)setXMPPStream;
/** 连接服务器 */
- (void)connectToServer;
/** 发送密码 */
- (void)sendPassWD;
/** 发送在线请求 */
- (void)sendOnLine;

/** 用户登录 */
- (void)userLogin:(DRXMPPResultBlock)resultBlock;

/** 用户注册 */
- (void)userRegister:(DRXMPPResultBlock)resultBlock;

@end
