//
//  AppSdkManager.h
//  AppSdk
//
//  Copyright © 2018年 Nationsky. All rights reserved.


#define VERSION_APP_SDK @"1.4"

#import <Foundation/Foundation.h>

//#import "AppSdkCallback.h"
#import "NWWatermarkManager.h"

typedef NS_ENUM(NSInteger , en_SandboxState)
{
    SandboxStateNone            = 0,    //  请确认沙箱状态
    SandboxStatePolicyErr       = 1,    //  请检查策略状态
    SandboxStateNotLogin        = 2,    //  沙箱没有登录
    SandboxStateAppIsLogin      = 3,    //  请确认该app是否在沙箱中配置过策略(目前已经去掉了沙箱登陆验证)
    SandboxStateNotLink         = 4,    //  沙箱没有连接成功
    SandboxStateUnInstall       = 5,    //  沙箱没有安装
    SandboxStateDeleteAppData   = 6,    //  删除app数据
    SandboxStateScreenCapture   = 7,    //  截屏
};

//@protocol AppSdkDelegate <NSObject>
////发生错误的回调函数
//int sdkCallback(int nErrorCode, NSString* strErrorMsg);
//@end


@interface AppSdkManager : NSObject {
   
}

@property(nonatomic,assign)en_SandboxState sandState;

@property (nonatomic, strong, readonly, nullable) NWWatermarkManager *watermarkManager;

//@property (nonatomic , assign) id<AppSdkDelegate> _delegate;

/**
 *  初始化APPSDK
 *
 *  @param delegateApp 你自己的AppDelegate类本身 self
 *
 *  @param automic 设置是否自动加密 yes:自动加密 no:关闭加密
 *
 *  @return 返回AppSdkManager 接口类
 */
+ (nullable AppSdkManager *)sharedInstance:(id _Nullable )delegateApp isClcEncryption:(BOOL)automic;

/**
 *  单例
 *
 *  @return AppSdkManager接口类
 */
+ (nullable AppSdkManager *)shared;

/**
 *  检测设备是否越狱
 *
 *  @return 越狱设备：YES, 否则返回NO
 */
+ (BOOL)isJailbreak;

/**
 *
 *  检查沙箱是否存在
 */
- (void)isCheckSandboxInstall;

@end
