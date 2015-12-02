//
//  DRXMPPTool.m
//  FastRun
//
//  Created by drouce on 15/11/17.
//  Copyright © 2015年 drouce. All rights reserved.
//

#import "DRXMPPTool.h"

@interface DRXMPPTool ()<XMPPStreamDelegate>
{
    DRXMPPResultBlock _resultBlock;
}
@end


@implementation DRXMPPTool
singleton_implementation(DRXMPPTool)

/** 设置流 */
- (void)setXMPPStream {
    _xmppStream = [[XMPPStream alloc]init];
    [_xmppStream addDelegate:self delegateQueue:dispatch_get_main_queue()];
    //[DDLog addLogger:[DDTTYLogger sharedInstance]];//查看日志，底层XML
}

/** 连接服务器 */
- (void)connectToServer {
    if (_xmppStream == nil) {
        [self setXMPPStream];
    }
    _xmppStream.hostName = DRXMPPHOSTNAME;
    _xmppStream.hostPort = DRXMPPPort;
    NSString *userName = nil;
    if ([DRUserInfo sharedDRUserInfo].isRegisterType) {
        userName = [DRUserInfo sharedDRUserInfo].userRegisterName;
    } else {
        userName = [DRUserInfo sharedDRUserInfo].userName;
    }
    
    NSString *jidStr = [NSString stringWithFormat:@"%@@%@",userName,DRXMPPDOMAIN];
    XMPPJID *myJID = [XMPPJID jidWithString:jidStr];
    _xmppStream.myJID = myJID;
    NSError *error = nil;
    [_xmppStream connectWithTimeout:XMPPStreamTimeoutNone error:&error];
    if (error) {
        myLog(@"%@",error.localizedDescription);
    }else  {
      myLog(@"连接成功");
    }
}

/** 发送密码 */
- (void)sendPassWD {
    
    NSString *passWD = nil;
    NSError *error = nil;
    if ([DRUserInfo sharedDRUserInfo].isRegisterType) {
        passWD = [DRUserInfo sharedDRUserInfo].userRegisterPwd;
        [_xmppStream registerWithPassword:passWD error:&error];
        
    } else {
        passWD = [DRUserInfo sharedDRUserInfo].userPasswd;
        [_xmppStream authenticateWithPassword:passWD error:&error];
    }
    
    if (error) {
        myLog(@"%@",error.localizedDescription);
    } else {
        myLog(@"fa送成功");
    }
}

/** 发送在线请求 */
- (void)sendOnLine {
    XMPPPresence *presence = [XMPPPresence presence];
    [_xmppStream sendElement:presence];
}

/** 用户登录 */
- (void)userLogin:(DRXMPPResultBlock)resultBlock {
    [self.xmppStream disconnect];
    _resultBlock  = resultBlock;
    [self connectToServer];
}

/** 用户注册 */
- (void)userRegister:(DRXMPPResultBlock)resultBlock {
    [self.xmppStream disconnect];
    _resultBlock = resultBlock;
    [self connectToServer];
}

#pragma mark - XMPPStreamDelegate

/** 连接成功 */
- (void)xmppStreamDidConnect:(XMPPStream *)sender {
    [self sendPassWD];
}
/** 授权成功 */
- (void)xmppStreamDidAuthenticate:(XMPPStream *)sender {
    if(_resultBlock) {
        _resultBlock(DRXMPPResultLoginSuccess);
    }
}

/** 授权失败 */
- (void)xmppStream:(XMPPStream *)sender didNotAuthenticate:(DDXMLElement *)error {
    if (_resultBlock) {
        _resultBlock(DRXMPPResultLoginFaild);
    }
}
/** 连接失败 */
- (void)xmppStreamDidDisconnect:(XMPPStream *)sender withError:(NSError *)error {
    if (error && _resultBlock) {
        _resultBlock(DRXMPPResultNetError);
    } else {
        myLog(@"连接2成功");
    }
}

#pragma mark - 注册的状态获取
/** 注册失败 */
- (void)xmppStream:(XMPPStream *)sender didNotRegister:(DDXMLElement *)error {
    _resultBlock(DRXMPPResultRegisterFaild);
}
/** 注册成功 */
- (void)xmppStreamDidRegister:(XMPPStream *)sender {
    _resultBlock(DRXMPPResultRegisterSuccess);
}
@end
