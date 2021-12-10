//
//  ZTCLLocationManager.h
//  SRCBTest
//
//  Created by 小强 on 2021/9/1.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ZTCLLocationManager : CLLocationManager



+ (id)shareZTCLLocationManager;

/** 开始获取经纬度*/

- (void)startGetLocationManager;

/** 经纬度获取的地址数组（中文）*/

- (NSArray *)getLocationAddressNameArray;



@end


NS_ASSUME_NONNULL_END
