//
//  XQRecorder.m
//  SRCBTest
//
//  Created by 小强 on 2021/9/2.
//

#import "XQRecorder.h"

#import <AVFoundation/AVFoundation.h>

@interface XQRecorder ()<AVAudioRecorderDelegate>{
    AVAudioRecorder *_recorder;
}

@end

@implementation XQRecorder


- (BOOL)checkPermission {
    AVAudioSessionRecordPermission permission = [[AVAudioSession sharedInstance] recordPermission];
    return permission == AVAudioSessionRecordPermissionGranted;
}

- (void)startMedia {
    [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
        if (granted) {
            // 通过验证
            [self configRecorder];
        } else {
            // 未通过验证
        }
    }];
}

- (BOOL)configRecorder {
    // ...其他设置
    AVAudioSession *session = [AVAudioSession sharedInstance];
        
        NSError *sessionError;
        
        [session setCategory:AVAudioSessionCategoryPlayAndRecord error:&sessionError];
        
        if(session == nil){
            
            NSLog(@"Error creating session: %@", [sessionError description]);
            
        }
        else{
            
            [session setActive:YES error:nil];
            
        }
    NSURL *fileUrl = [NSURL fileURLWithPath:[self filePathWithName:[self newRecorderName]]];
    NSError *error = nil;
    NSDictionary *setting = [self recordSetting];
    _recorder = [[AVAudioRecorder alloc] initWithURL:fileUrl settings:setting error:&error];
    _recorder.delegate = self;
_recorder.meteringEnabled = YES;
//    if (error) // 录音文件创建失败处理
        
    if (error) {
            NSLog(@"创建录音机时发生错误，信息：%@",error.localizedDescription);
    }else{
        if (![_recorder isRecording]) {
            
            NSLog(@"录音开始");
            
            [_recorder record];
            
        }
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self->_recorder stop];
    });
    // ...其他设置
    return YES;
}

- (void)audioRecorderDidFinishRecording:(AVAudioRecorder *)recorder successfully:(BOOL)flag {
    NSLog(@"-------------录音结束 %@", @(flag));
}

// 录音参数设置
- (NSDictionary *)recordSetting {
    NSMutableDictionary *recSetting = [[NSMutableDictionary alloc] init];
    // General Audio Format Settings
    recSetting[AVFormatIDKey] = @(kAudioFormatLinearPCM);
    recSetting[AVSampleRateKey] = @44100;
    recSetting[AVNumberOfChannelsKey] = @2;
    // Linear PCM Format Settings
    recSetting[AVLinearPCMBitDepthKey] = @24;
    recSetting[AVLinearPCMIsBigEndianKey] = @YES;
    recSetting[AVLinearPCMIsFloatKey] = @YES;
    // Encoder Settings
    recSetting[AVEncoderAudioQualityKey] = @(AVAudioQualityMedium);
    recSetting[AVEncoderBitRateKey] = @128000;
    return [recSetting copy];
}

// 录音文件的名称使用时间戳+caf后缀
- (NSString *)newRecorderName {
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    formatter.dateFormat = @"yyyyMMddhhmmss";
    return [[formatter stringFromDate:[NSDate date]] stringByAppendingPathExtension:@"caf"];
}
// Document目录
- (NSString *)filePathWithName:(NSString *)fileName {
    NSString *urlStr = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
    return [urlStr stringByAppendingPathComponent:fileName];
}


- (void)handleRecorderData {
    [_recorder updateMeters];
    float peak0 = ([_recorder peakPowerForChannel:0] + 160.0) * (1.0 / 160.0);
    float peak1 = ([_recorder peakPowerForChannel:1] + 160.0) * (1.0 / 160.0);
    float ave0 = ([_recorder averagePowerForChannel:0] + 160.0) * (1.0 / 160.0);
    float ave1 = ([_recorder averagePowerForChannel:1] + 160.0) * (1.0 / 160.0);
}






@end
