//
//  XMGAudioTool.m
//  音效的播放
//
//  Created by zhangzhifu on 2017/3/2.
//  Copyright © 2017年 seemygo. All rights reserved.
//

#import "XMGAudioTool.h"
#import <AVFoundation/AVFoundation.h>

@implementation XMGAudioTool

static NSMutableDictionary *_soundIDs;

+ (void)initialize {
    _soundIDs = [NSMutableDictionary dictionary];
}

+ (void)playSoundWithSoundName:(NSString *)soundName {
    // 1. 定义systemSoundID
    SystemSoundID soundID = 0;
    
    // 2. 从字典中取对应的soundID,如果取出是nil,表示之前没有存在字典中
    soundID = [_soundIDs[soundName] unsignedIntValue];
    if (soundID == 0) {
        CFURLRef url = (__bridge CFURLRef)[[NSBundle mainBundle] URLForResource:soundName withExtension:nil];
        AudioServicesCreateSystemSoundID(url, &soundID);
        
        // 将soundID存入字典中
        [_soundIDs setObject:@(soundID) forKey:soundName];
    }
    
    // 3. 播放音效
    AudioServicesPlayAlertSound(soundID);
}

@end
