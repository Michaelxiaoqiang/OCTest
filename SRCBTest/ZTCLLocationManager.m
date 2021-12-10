//
//  ZTCLLocationManager.m
//  SRCBTest
//
//  Created by 小强 on 2021/9/1.
//

#import "ZTCLLocationManager.h"

#import <UIKit/UIKit.h>


@interface ZTCLLocationManager()<CLLocationManagerDelegate>{
    NSMutableDictionary *_locationFinallDic;    //key:经度 valueL:纬度

}


@property (nonatomic, strong) NSMutableArray *locationNameArray;

@end


@implementation ZTCLLocationManager


+ (id)shareZTCLLocationManager{
    static ZTCLLocationManager *share = nil;

    static dispatch_once_t onceToken;

    dispatch_once(&onceToken, ^{
        share = [[self alloc]init];

    });

    return share;

}


- (void)startGetLocationManager{
    

    if (_locationFinallDic == nil) {
        _locationFinallDic = [[NSMutableDictionary alloc]init];

    }else{
        [_locationFinallDic removeAllObjects];

    }

    

    if (self.locationNameArray == nil) {
        self.locationNameArray = [[NSMutableArray alloc]init];

    }else{
        [self.locationNameArray removeAllObjects];

    }

    

//    if(IOS8_OR_LATER){
        [self requestWhenInUseAuthorization];

//    }

    

    [self setDesiredAccuracy:kCLLocationAccuracyBest];

    self.distanceFilter = 10;  // 指定最小更新的距离为10米

    self.delegate = self;

    

    [self startUpdatingLocation];

}


- (NSArray *)getLocationAddressNameArray{
    NSArray *sendArr = [NSArray arrayWithArray:self.locationNameArray];

    for (int i = 0; i < self.locationNameArray.count; i ++) {
        NSLog(@"======= %@",[self.locationNameArray objectAtIndex:i]);

    }

    return sendArr;

}


#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    switch (status) {
        case kCLAuthorizationStatusNotDetermined:

            if ([self respondsToSelector:@selector(requestAlwaysAuthorization)]) {
                [self requestAlwaysAuthorization];

            }

            break;

        default:break;

    }

}


- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations{
    //该方法会运行多次 以最后的经纬度为准

    NSLog(@"开始定位......");

    CLLocation *location;

    if (locations.count > 0) {
        location = [locations objectAtIndex:0];

        NSLog(@"精度：%f 纬度：%f",location.coordinate.latitude,location.coordinate.longitude);

        

        static NSString *tempLocationFinalStr = nil;

        

        CLGeocoder *geocoder = [[CLGeocoder alloc]init];

        [geocoder reverseGeocodeLocation:location completionHandler:^(NSArray*placemarks,NSError* error){
    

             if (error) {
                 //TODO: (CZ)需要处理无网络时的提示 获取位置信息异常

                 NSLog(@"reverseGeocodeLocation error: %@", error);

             }else{
                 //存储获取的名称的经纬度

                 CGFloat finalLatitude = 0;

                 CGFloat finalLongitude = 0;

                 

                 for (CLPlacemark* place in placemarks) {
                     NSLog(@"name %@",place.name); //位置

                     NSLog(@"thoroughfare %@",place.thoroughfare);//街道

                     //子街道

                     NSLog(@"subthoroughfare %@",place.subThoroughfare);

                     //市

                     NSLog(@"loclitity %@",place.locality);

                     //区

                     NSLog(@"subLocality %@",place.subLocality);

                     //国家

                     NSLog(@"country %@",place.country);

                     NSLog(@"----------------------");

                     

                     NSMutableString *loc = [NSMutableString new];

                     if (![place.locality isEqualToString:@"(null)"]) {
                         [loc appendString:[NSString stringWithFormat:@"%@",place.locality]];

                     }

                     if (![place.subLocality isEqualToString:@"(null)"]) {
                         [loc appendString:[NSString stringWithFormat:@"%@",place.subLocality]];

                     }

                     if (![place.thoroughfare isEqualToString:@"(null)"]) {
                         [loc appendString:[NSString stringWithFormat:@"%@",place.thoroughfare]];

                     }

                     if (![place.subThoroughfare isEqualToString:@"(null)"]) {
                         [loc appendString:[NSString stringWithFormat:@"%@",place.subThoroughfare]];

                     }

                     

                     //取最后一次的位置

                     if (loc.length > 0) {
                         finalLatitude = place.location.coordinate.latitude;

                         finalLongitude = place.location.coordinate.longitude;

                         tempLocationFinalStr = loc;

                     }

                 }

                 

                 //判断没有存储过 该经纬度 && 有位置

                 NSNumber *longitudeInDic = [_locationFinallDic objectForKey:[NSNumber numberWithDouble:finalLatitude]];

                 if ([longitudeInDic doubleValue] != finalLongitude && tempLocationFinalStr.length > 0) {
                     [_locationFinallDic setObject:[NSNumber numberWithDouble:finalLongitude] forKey:[NSNumber numberWithDouble:finalLatitude]];

                    [self.locationNameArray addObject:tempLocationFinalStr];

                 }

             }

         }];

        

        [manager stopUpdatingLocation];

    }

}


- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    NSLog(@"didFailWithError :%@", error);

    switch (error.code) {
        case kCLErrorDenied:{
            //@"打开“定位服务”来允许我们确定您的位置"

        }

        case kCLErrorLocationUnknown:{
            //@"定位异常"

        }break;

        default:break;

    }

    [manager stopUpdatingLocation];

}


@end

