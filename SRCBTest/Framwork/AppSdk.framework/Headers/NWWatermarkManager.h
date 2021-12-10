//
//  NWWatermarkManager.h
//
//  Created by mac on 2019/6/21.
//  Copyright © 2019 NationSky. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface NWWatermarkManager : NSObject

/**
 添加屏幕水印
 
 @param view 要添加水印的UIView对象
 @param moduleID 模块ID（可以为nil，为nil时按当前应用应用全局配置）
 @param pageID 页面ID（可以为nil，为nil时是否加水印按照模块配置，moduelID也为nil时按应用全局配置）
 */
- (BOOL)watermarkScreenToView:(UIView * _Nonnull)view moduleID:(NSString * _Nullable)moduleID pageID:(NSString * _Nullable)pageID;

/**
 清除水印
 */
- (void)cleanWatermarkFromView:(UIView * _Nonnull)view;

- (BOOL)getWatermarkState;

@end
