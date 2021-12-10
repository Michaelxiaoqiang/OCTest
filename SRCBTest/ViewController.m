//
//  ViewController.m
//  SRCBTest
//
//  Created by 小强 on 2021/8/19.
//

#import "ViewController.h"
#import "ZTCLLocationManager.h"
#import "BabyBluetooth.h"
#import "XQRecorder.h"

//#import <NSConfigSdk/NSConfigSdk.h>

#import <AssetsLibrary/AssetsLibrary.h>
#import <Photos/Photos.h>

#import <mach-o/dyld.h>
#import <objc/runtime.h>

@interface ViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>{
    UIImagePickerController *_imagePickerController;
    BabyBluetooth *baby;
    XQRecorder * recoder;
}



@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
//    [self verifyAppWithBundle:@""];
    
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.backgroundColor = [UIColor redColor];
    [button setTitle:@"打电话" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 100, 100, 50);
    [button addTarget:self action:@selector(cellphone) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button1 = [UIButton buttonWithType:UIButtonTypeCustom];
    button1.backgroundColor = [UIColor redColor];
    [button1 setTitle:@"发短信" forState:UIControlStateNormal];
    button1.frame = CGRectMake(100, 200, 100, 50);
    [button1 addTarget:self action:@selector(sendMassage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeCustom];
    button2.backgroundColor = [UIColor redColor];
    [button2 setTitle:@"发邮件" forState:UIControlStateNormal];
    button2.frame = CGRectMake(100, 300, 100, 50);
    [button2 addTarget:self action:@selector(sendEmail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button2];
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeCustom];
    button3.backgroundColor = [UIColor redColor];
    [button3 setTitle:@"拍照" forState:UIControlStateNormal];
    button3.frame = CGRectMake(100, 400, 100, 50);
    [button3 addTarget:self action:@selector(photo) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button3];
    
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(100, 500, 100, 50)];
//    textField.backgroundColor = [UIColor redColor];
    textField.borderStyle = UITextBorderStyleRoundedRect;
    textField.placeholder = @"复制粘贴";
    [self.view addSubview:textField];
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeCustom];
    button4.backgroundColor = [UIColor redColor];
    [button4 setTitle:@"定位地址" forState:UIControlStateNormal];
    button4.frame = CGRectMake(100, 600, 100, 50);
    [button4 addTarget:self action:@selector(location) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button4];
    
    UIButton *button5 = [UIButton buttonWithType:UIButtonTypeCustom];
    button5.backgroundColor = [UIColor redColor];
    [button5 setTitle:@"网络请求" forState:UIControlStateNormal];
    button5.frame = CGRectMake(100, 700, 100, 50);
    [button5 addTarget:self action:@selector(sendRequest) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button5];
    
    
    UIButton *button6 = [UIButton buttonWithType:UIButtonTypeCustom];
    button6.backgroundColor = [UIColor redColor];
    [button6 setTitle:@"蓝牙" forState:UIControlStateNormal];
    button6.frame = CGRectMake(250, 100, 100, 50);
    [button6 addTarget:self action:@selector(startBluetooth) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button6];
    
    UIButton *button7 = [UIButton buttonWithType:UIButtonTypeCustom];
    button7.backgroundColor = [UIColor redColor];
    [button7 setTitle:@"录音" forState:UIControlStateNormal];
    button7.frame = CGRectMake(250, 200, 100, 50);
    [button7 addTarget:self action:@selector(recordMedia) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button7];
    
    UIButton *button8 = [UIButton buttonWithType:UIButtonTypeCustom];
    button8.backgroundColor = [UIColor redColor];
    [button8 setTitle:@"分享" forState:UIControlStateNormal];
    button8.frame = CGRectMake(250, 300, 100, 50);
    [button8 addTarget:self action:@selector(shareWithActivityItems) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button8];
    
    UIButton *button9 = [UIButton buttonWithType:UIButtonTypeCustom];
    button9.backgroundColor = [UIColor redColor];
    [button9 setTitle:@"写入相册" forState:UIControlStateNormal];
    button9.frame = CGRectMake(250, 400, 100, 50);
    [button9 addTarget:self action:@selector(loadImageFinished) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button9];
    
    UIButton *button10 = [UIButton buttonWithType:UIButtonTypeCustom];
    button10.backgroundColor = [UIColor redColor];
    [button10 setTitle:@"获取设备id" forState:UIControlStateNormal];
    button10.frame = CGRectMake(250, 500, 100, 50);
    [button10 addTarget:self action:@selector(obtainDeviceUUID) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button10];
    
    UIButton *button11 = [UIButton buttonWithType:UIButtonTypeCustom];
    button11.backgroundColor = [UIColor redColor];
    [button11 setTitle:@"uem客户端安装" forState:UIControlStateNormal];
    button11.frame = CGRectMake(250, 600, 100, 50);
    [button11 addTarget:self action:@selector(isInstallUEM) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button11];
}

- (void)isInstallUEM {
    NSURL *strURL = [NSURL URLWithString:@"UrlSchemesAppMdm://"];
    BOOL bCanStartB = [[UIApplication sharedApplication] canOpenURL:strURL];
    if (bCanStartB) {
        [[UIApplication sharedApplication] openURL:strURL options:nil completionHandler:nil];
    }
    NSLog(@"是否安装了uem客户端:%ld", (long)bCanStartB);

}

- (void)obtainDeviceUUID {
//    NSString *deviceID = [[NSConfigSdkManager sharedInstance] fetchDeviceUdid];
//    UIAlertController *alertCtl = [UIAlertController alertControllerWithTitle:nil message:deviceID preferredStyle:UIAlertControllerStyleAlert];
//
//    UIAlertAction *cancel =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
//        NSLog(@"cancel");
//    }];
//
//    [alertCtl addAction:cancel];
//
//
//    [self presentViewController:alertCtl animated:YES completion:nil];
//    NSLog(@"Device id:%@。。。",deviceID);
}

- (void)loadImageFinished
{
    UIImage *image = [UIImage imageNamed:@"Bridge.png"];
    [[PHPhotoLibrary sharedPhotoLibrary] performChanges:^{
            
         //写入图片到相册
         PHAssetChangeRequest *req = [PHAssetChangeRequest creationRequestForAssetFromImage:image];
            
            
     } completionHandler:^(BOOL success, NSError * _Nullable error) {
            
         NSLog(@"success = %d, error = %@", success, error);
            
    }];
}

- (void)recordMedia {
    recoder = [XQRecorder new];
    [recoder startMedia];
}

- (void)shareWithActivityItems
{
    NSString *textToShare = @"我就是喜欢踩坑呢，咋的了。生活不止眼前的苟且，还有翔和未来的苟且。";
    UIImage *imageShare = [UIImage imageNamed:@"这儿放你自己的图片"];
    NSURL *urlShare = [NSURL URLWithString:@"http://www.jianshu.com/u/9ab932a98604"];
    NSArray *activityItems = @[textToShare, urlShare];
    UIActivityViewController *actVC = [[UIActivityViewController alloc] initWithActivityItems:activityItems applicationActivities:nil];
    //下面的excludedActivityTypes填写你需要剔除的（比如打印UIActivityTypePrint，短信UIActivityTypeMessage）,不写excludedActivityTypes这一行即使用系统默认的，好了，我们来看一下excludedActivityTypes的所有值。

//    UIKIT_EXTERN NSString *const UIActivityTypePostToFacebook     NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED;    //发送到Facebook
//    UIKIT_EXTERN NSString *const UIActivityTypePostToTwitter      NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED;    //发送到Twitter
//    UIKIT_EXTERN NSString *const UIActivityTypePostToWeibo        NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED;    //发送到新浪微博
//    UIKIT_EXTERN NSString *const UIActivityTypeMessage            NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED;    //短信
//    UIKIT_EXTERN NSString *const UIActivityTypeMail               NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED;    //邮件
//    UIKIT_EXTERN NSString *const UIActivityTypePrint              NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED;    //打印
//    UIKIT_EXTERN NSString *const UIActivityTypeCopyToPasteboard   NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED;    //拷贝
//    UIKIT_EXTERN NSString *const UIActivityTypeAssignToContact    NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED;    //指定给联系人
//    UIKIT_EXTERN NSString *const UIActivityTypeSaveToCameraRoll   NS_AVAILABLE_IOS(6_0) __TVOS_PROHIBITED;    //保存至相机胶卷
//    UIKIT_EXTERN NSString *const UIActivityTypeAddToReadingList   NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;    //添加至阅读列表
//    UIKIT_EXTERN NSString *const UIActivityTypePostToFlickr       NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;    //发送到Flickr(雅虎旗下图片分享网站)
//    UIKIT_EXTERN NSString *const UIActivityTypePostToVimeo        NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;    //发送到Vimeo
//    UIKIT_EXTERN NSString *const UIActivityTypePostToTencentWeibo NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;    //发送到腾讯微博
//    UIKIT_EXTERN NSString *const UIActivityTypeAirDrop            NS_AVAILABLE_IOS(7_0) __TVOS_PROHIBITED;    //AirDrop
//    UIKIT_EXTERN NSString *const UIActivityTypeOpenInIBooks       NS_AVAILABLE_IOS(9_0) __TVOS_PROHIBITED;    //在iBooks中打开

    actVC.excludedActivityTypes = @[UIActivityTypeMessage,UIActivityTypePrint,UIActivityTypeSaveToCameraRoll,UIActivityTypeAddToReadingList,UIActivityTypePostToFlickr,UIActivityTypePostToVimeo,UIActivityTypeAirDrop];
    //这儿一定要做iPhone与iPad的判断，因为这儿只有iPhone可以present，iPad需pop，所以这儿actVC.popoverPresentationController.sourceView = self.view;在iPad下必须有，不然iPad会crash，self.view你可以换成任何view，你可以理解为弹出的窗需要找个依托。
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        actVC.popoverPresentationController.sourceView = self.view;
        [self presentViewController:actVC animated:YES completion:nil];
    } else {
        [self presentViewController:actVC animated:YES completion:nil];
    }
}

- (void)location {
    [[ZTCLLocationManager shareZTCLLocationManager]startGetLocationManager];
}

- (void)cellphone {
    NSString * telStr = [NSString stringWithFormat:@"tel:%@",@"12306"];
        //iOS10以后
       if (@available(iOS 10.0, *)) {
           [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telStr] options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:^(BOOL success) {
           }];
       } else {
           //iOS10以前
           [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telStr]];
       }
}

- (void)sendMassage {
    NSString * telStr = [NSString stringWithFormat:@"sms://%@",@"12306"];

//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"sms://10000"]];

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telStr] options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:^(BOOL success) {
    }];
}

- (void)sendEmail {
    NSString * telStr = [NSString stringWithFormat:@"mailto:%@",@"12306"];

//    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@"sms://10000"]];

    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:telStr] options:@{UIApplicationOpenURLOptionsSourceApplicationKey : @YES} completionHandler:^(BOOL success) {
    }];
}



#pragma mark - bluetooth

- (void)startBluetooth {
    //配置第一个服务s1
    CBMutableService *s1 = makeCBService(@"FFF0");
    //配置s1的3个characteristic
    makeCharacteristicToService(s1, @"FFF1", @"r", @"hello1");//读
    makeCharacteristicToService(s1, @"FFF2", @"w", @"hello2");//写
    makeCharacteristicToService(s1, genUUID(), @"rw", @"hello3");//读写,自动生成uuid
    makeCharacteristicToService(s1, @"FFF4", nil, @"hello4");//默认读写字段
    makeCharacteristicToService(s1, @"FFF5", @"n", @"hello5");//notify字段
    //配置第一个服务s2
    CBMutableService *s2 = makeCBService(@"FFE0");
    makeStaticCharacteristicToService(s2, genUUID(), @"hello6", [@"a" dataUsingEncoding:NSUTF8StringEncoding]);//一个含初值的字段，该字段权限只能是只读
    //实例化baby
    baby = [BabyBluetooth shareBabyBluetooth];
    //配置委托
    [self babyDelegate];
    //添加服务和启动外设
    baby.bePeripheral().addServices(@[s1,s2]).startAdvertising();
}
//配置委托
- (void)babyDelegate{

    //设置添加service委托 | set didAddService block
    [baby peripheralModelBlockOnPeripheralManagerDidUpdateState:^(CBPeripheralManager *peripheral) {
        NSLog(@"PeripheralManager trun status code: %ld",(long)peripheral.state);
    }];
    
    //设置添加service委托 | set didAddService block
    [baby peripheralModelBlockOnDidStartAdvertising:^(CBPeripheralManager *peripheral, NSError *error) {
        NSLog(@"didStartAdvertising !!!");
    }];
    
    //设置添加service委托 | set didAddService block
    [baby peripheralModelBlockOnDidAddService:^(CBPeripheralManager *peripheral, CBService *service, NSError *error) {
        NSLog(@"Did Add Service uuid: %@ ",service.UUID);
    }];
    
    //设置添加service委托 | set didAddService block
    [baby peripheralModelBlockOnDidReceiveReadRequest:^(CBPeripheralManager *peripheral,CBATTRequest *request) {
        NSLog(@"request characteristic uuid:%@",request.characteristic.UUID);
        //判断是否有读数据的权限
        if (request.characteristic.properties & CBCharacteristicPropertyRead) {
            NSData *data = request.characteristic.value;
            [request setValue:data];
            //对请求作出成功响应
            [peripheral respondToRequest:request withResult:CBATTErrorSuccess];
        }else{
            //错误的响应
            [peripheral respondToRequest:request withResult:CBATTErrorWriteNotPermitted];
        }
    }];
    
    //设置添加service委托 | set didAddService block
    [baby peripheralModelBlockOnDidReceiveWriteRequests:^(CBPeripheralManager *peripheral,NSArray *requests) {
        NSLog(@"didReceiveWriteRequests");
        CBATTRequest *request = requests[0];
        //判断是否有写数据的权限
        if (request.characteristic.properties & CBCharacteristicPropertyWrite) {
            //需要转换成CBMutableCharacteristic对象才能进行写值
            CBMutableCharacteristic *c =(CBMutableCharacteristic *)request.characteristic;
            c.value = request.value;
            [peripheral respondToRequest:request withResult:CBATTErrorSuccess];
        }else{
            [peripheral respondToRequest:request withResult:CBATTErrorWriteNotPermitted];
        }
        
    }];
    
    __block NSTimer *timer;
    //设置添加service委托 | set didAddService block
    [baby peripheralModelBlockOnDidSubscribeToCharacteristic:^(CBPeripheralManager *peripheral, CBCentral *central, CBCharacteristic *characteristic) {
        NSLog(@"订阅了 %@的数据",characteristic.UUID);
        //每秒执行一次给主设备发送一个当前时间的秒数
        timer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(sendData:) userInfo:characteristic  repeats:YES];
    }];
    
    //设置添加service委托 | set didAddService block
    [baby peripheralModelBlockOnDidUnSubscribeToCharacteristic:^(CBPeripheralManager *peripheral, CBCentral *central, CBCharacteristic *characteristic) {
        NSLog(@"peripheralManagerIsReadyToUpdateSubscribers");
        [timer fireDate];
    }];
    
}

//发送数据，发送当前时间的秒数
-(BOOL)sendData:(NSTimer *)t {
    CBMutableCharacteristic *characteristic = t.userInfo;
    NSDateFormatter *dft = [[NSDateFormatter alloc]init];
    [dft setDateFormat:@"ss"];
//    NSLog(@"%@",[dft stringFromDate:[NSDate date]]);
    //执行回应Central通知数据
    return  [baby.peripheralManager updateValue:[[dft stringFromDate:[NSDate date]] dataUsingEncoding:NSUTF8StringEncoding] forCharacteristic:(CBMutableCharacteristic *)characteristic onSubscribedCentrals:nil];
}


- (void)sendRequest{
    //创建请求
    NSURL *url = [NSURL URLWithString:@"https://www.baidu.com/"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    //设置request的缓存策略（决定该request是否要从缓存中获取）
    request.cachePolicy = NSURLRequestReturnCacheDataElseLoad;
    
    //创建配置（决定要不要将数据和响应缓存在磁盘）
    NSURLSessionConfiguration *configuration = [NSURLSessionConfiguration defaultSessionConfiguration];
    //configuration.requestCachePolicy = NSURLRequestReturnCacheDataElseLoad;
    
    //创建会话
    NSURLSession *session = [NSURLSession sessionWithConfiguration:configuration delegate:self delegateQueue:nil];
    //生成任务
    NSURLSessionDataTask *task = [session dataTaskWithRequest:request];
    //创建的task是停止状态，需要我们去启动
    [task resume];
}
//1.接收到服务器响应的时候调用
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
didReceiveResponse:(NSURLResponse *)response
 completionHandler:(void (^)(NSURLSessionResponseDisposition disposition))completionHandler{
    NSLog(@"接收响应");
    //必须告诉系统是否接收服务器返回的数据
    //默认是completionHandler(NSURLSessionResponseAllow)
    //可以再这边通过响应的statusCode来判断否接收服务器返回的数据
    completionHandler(NSURLSessionResponseAllow);
}
//2.接受到服务器返回数据的时候调用,可能被调用多次
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask didReceiveData:(NSData *)data{
    NSLog(@"接收到数据");
    //一般在这边进行数据的拼接，在方法3才将完整数据回调
//    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:0 error:nil];
}
//3.请求完成或者是失败的时候调用
- (void)URLSession:(NSURLSession *)session task:(NSURLSessionTask *)task
didCompleteWithError:(nullable NSError *)error{
    NSLog(@"请求完成或者是失败,%@",error);
    //在这边进行完整数据的解析，回调
}
//4.将要缓存响应的时候调用（必须是默认会话模式，GET请求才可以）
- (void)URLSession:(NSURLSession *)session dataTask:(NSURLSessionDataTask *)dataTask
 willCacheResponse:(NSCachedURLResponse *)proposedResponse
 completionHandler:(void (^)(NSCachedURLResponse * _Nullable cachedResponse))completionHandler{
    //可以在这边更改是否缓存，默认的话是completionHandler(proposedResponse)
    //不想缓存的话可以设置completionHandler(nil)
    completionHandler(proposedResponse);
}

- (void)photo {
    
    _imagePickerController = [[UIImagePickerController alloc] init];
        _imagePickerController.delegate = self;
        //跳转动画效果
        _imagePickerController.modalTransitionStyle = UIModalTransitionStyleFlipHorizontal;
        _imagePickerController.allowsEditing = YES;
    
    UIAlertController *alertCtl =[[UIAlertController alloc]init];
    
    UIAlertAction *cancel =[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"cancel");
    }];
    UIAlertAction *xiangji =[UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"xiangji");
        
        [self openCamera];
    }];
    UIAlertAction *xiangce =[UIAlertAction actionWithTitle:@"相册" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        NSLog(@"xiangce");
        
        [self openPhotoLibrary];
    }];
    
    [alertCtl addAction:cancel];
    [alertCtl addAction:xiangji];
    [alertCtl addAction:xiangce];
    
    [self presentViewController:alertCtl animated:YES completion:nil];
}

/**
 *  调用照相机
 */
- (void)openCamera
{

    //判断是否可以打开照相机
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
        //摄像头
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:_imagePickerController animated:YES completion:nil];
    }
    else{
        NSLog(@"没有摄像头");
    }
}

- (void)checkCameraPermission {
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    if (status == AVAuthorizationStatusNotDetermined) {
        [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
            if (granted) {
                [self takePhoto];
            }
        }];
    } else if (status == AVAuthorizationStatusDenied || status == AVAuthorizationStatusRestricted) {
//        [self alertCamear];
    } else {
        [self takePhoto];
    }
}

- (void)takePhoto {
    //判断相机是否可用，防止模拟器点击【相机】导致崩溃
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self presentViewController:_imagePickerController animated:YES completion:^{

        }];
    } else {
        NSLog(@"不能使用模拟器进行拍照");
    }
}
/**
 *  打开相册
 */
-(void)openPhotoLibrary{

    // 进入相册
    if([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary])
    {
        _imagePickerController.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self presentViewController:_imagePickerController animated:YES completion:^{
            NSLog(@"打开相册");
        }];
    }else{
        NSLog(@"不能打开相册");
    }
}
#pragma mark - UIImagePickerControllerDelegate
// 拍照完成回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingImage:(UIImage *)image editingInfo:(nullable NSDictionary<NSString *,id> *)editingInfo NS_DEPRECATED_IOS(2_0, 3_0){
    
    NSLog(@"finish..");
    if(picker.sourceType == UIImagePickerControllerSourceTypeCamera)
    {
        //图片存入相册
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil);
    }
    [self dismissViewControllerAnimated:YES completion:nil];
}

//进入拍摄页面点击取消按钮
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (BOOL) verifyAppWithBundle:(NSString *)bundleID{
  __block BOOL isInstall = NO;
    
    if ([[UIDevice currentDevice].systemVersion floatValue] >= 11.0) {

                 //iOS12间接获取办法

           if ([[UIDevice currentDevice].systemVersion floatValue] >= 12.0){

               

                    Class lsawsc = objc_getClass("LSApplicationWorkspace");

    

                    NSObject* workspace = [lsawsc performSelector:NSSelectorFromString(@"defaultWorkspace")];

    

                    NSArray *plugins = [workspace performSelector:NSSelectorFromString(@"installedPlugins")]; //列出所有plugins
               
//                    DLOG(@"installedPlugins:%@",plugins);
           
                    [plugins enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                    NSString *pluginID = [obj performSelector:(@selector(pluginIdentifier))];
                        NSLog(@"pluginID：%@",pluginID);
                        if([pluginID containsString:bundleID]){
                            isInstall = YES;
                            return;
                        }
               }];

               return isInstall;

           }else{
                   //iOS11获取办法
                   NSBundle *container = [NSBundle bundleWithPath:@"/System/Library/PrivateFrameworks/MobileContainerManager.framework"];

                   if ([container load]) {

                         Class appContainer = NSClassFromString(@"MCMAppContainer");

                         id test = [appContainer performSelector:@selector(containerWithIdentifier:error:) withObject:bundleID withObject:nil];

                         NSLog(@"%@",test);

                         if (test) {
                              return YES;
                          } else {
                              return NO;
                            }

                    }else{
                        return NO;
                    }

               }

       }else{

       //iOS10及以下获取办法
           Class lsawsc = objc_getClass("LSApplicationWorkspace");

           NSObject* workspace = [lsawsc performSelector:NSSelectorFromString(@"defaultWorkspace")];

           NSArray *appList = [workspace performSelector:@selector(allApplications)];

           Class LSApplicationProxy_class = object_getClass(@"LSApplicationProxy");

           for (LSApplicationProxy_class in appList)

           {
              //这里可以查看一些信息

               NSString *bundleID = [LSApplicationProxy_class performSelector:@selector(applicationIdentifier)];

               NSString *version =  [LSApplicationProxy_class performSelector:@selector(bundleVersion)];

               NSString *shortVersionString =  [LSApplicationProxy_class performSelector:@selector(shortVersionString)];

               if ([bundleID isEqualToString:bundleID]) {
                   return  YES;
               }
           }
           return NO;

       }
    return NO;

}


@end
