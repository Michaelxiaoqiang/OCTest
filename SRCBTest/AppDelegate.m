//
//  AppDelegate.m
//  SRCBTest
//
//  Created by 小强 on 2021/8/19.
//

#import "AppDelegate.h"
//#import <AppSdk/AppSdk.h>
//#import <NSConfigSdk/NSConfigSdk.h>

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    
//    [AppSdkManager sharedInstance:self isClcEncryption:YES];
//    [[NSConfigSdkManager sharedInstance] startFetchConfig];
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self config];
//    });
    return YES;
}

//- (void)config{
//    [[NSConfigSdkManager sharedInstance] startFetchConfigWithLoginId:@"ysq" withRemoteIP:@"mdscmtest.srcb.com" withTenantId:@"mdm" CompletionHandler:^(BOOL success, NSError *error) {
//        NSLog(@"拉取远程策略------success- %d   --- error  : %ld" ,success , (long)error.code );
//}];

//}


//#pragma mark - UISceneSession lifecycle
//
//
//- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options {
//    // Called when a new scene session is being created.
//    // Use this method to select a configuration to create the new scene with.
//    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
//}
//
//
//- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions {
//    // Called when the user discards a scene session.
//    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
//    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
//}


@end
