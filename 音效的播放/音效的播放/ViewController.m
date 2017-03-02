//
//  ViewController.m
//  音效的播放
//
//  Created by zhangzhifu on 2017/3/2.
//  Copyright © 2017年 seemygo. All rights reserved.
//

#import "ViewController.h"
#import <AVFoundation/AVFoundation.h>

@interface ViewController ()
@property (nonatomic, assign) SystemSoundID soundID;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    // 播放音效
//    AudioServicesPlaySystemSound(soundID);
    AudioServicesPlayAlertSound(self.soundID);
}

- (SystemSoundID)soundID {
    if (_soundID == 0) {
        // 2. 根据音效文件生成systemSoundID
        NSURL *url = [[NSBundle mainBundle] URLForResource:@"win.aac" withExtension:nil];
        AudioServicesCreateSystemSoundID((__bridge CFURLRef _Nonnull)(url), &_soundID);
    }
    return _soundID;
}

@end
