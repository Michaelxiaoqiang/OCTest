//
//  NSConfigSdkManager.h
//  NSConfigSdk
//
//  Created by max on 2019/9/12.
//  Copyright © 2019 max. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NSConfigError) {
    
    NSConfigError_UEMPush = -10001,//平台下发，不获取config策略
    NSConfigError_WithoutCfg = -10002,//cfg文件不存在
    NSConfigError_WithoutApp = -10003,//应用不存在或者未上架
};


@interface NSConfigSdkManager : NSObject

+ (nonnull instancetype)sharedInstance;

- (void)startFetchConfig;

- (void)startFetchConfigWithLoginId:(NSString *_Nonnull)loginid withRemoteIP:(NSString *_Nonnull)remoteip withTenantId:(NSString *_Nonnull)tenantId CompletionHandler:(void (^ __nullable)(BOOL success , NSError * _Nullable error))completionHandler;

- (NSString *)fetchDeviceUdid;

@end

