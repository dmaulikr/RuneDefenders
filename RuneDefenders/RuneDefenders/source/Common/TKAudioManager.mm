//
//  AudioManager.m
//  CardWarrior
//
//  Created by Tekka Xie on 12-4-19.
//  Copyright (c) 2012年 Tencent. All rights reserved.
//

#import "TKAudioManager.h"

@implementation TKAudioManager

@synthesize player;

static TKAudioManager* pInstance = nil;

#pragma mark - init
- (id)init
{
    if (self = [super init])
    {
        sfxDictionary = [[NSMutableDictionary alloc] init];
    }
    return self;
}

#pragma mark - sfx operation
- (void)registSFXWithFileName:(NSString*)filename
{
    NSString* bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString* sfxPath = [bundlePath stringByAppendingPathComponent:filename]; 
    CFURLRef pathURL = (__bridge CFURLRef)[NSURL fileURLWithPath:sfxPath];
    
    SystemSoundID systemSoundID;
    AudioServicesCreateSystemSoundID(pathURL, &systemSoundID);
    
    
    [sfxDictionary setObject:[NSNumber numberWithUnsignedLong:systemSoundID]
                      forKey:filename];
}

- (void)playBGM:(NSString*)filename
{
    NSString* bundlePath = [[NSBundle mainBundle] bundlePath];
    NSString* bgmPath = [bundlePath stringByAppendingPathComponent:filename]; 
    NSURL *bgmURL = [[NSURL alloc] initFileURLWithPath:bgmPath];
    
    player = [[AVAudioPlayer alloc] initWithContentsOfURL: bgmURL error: nil];
    [player prepareToPlay];
    [player setNumberOfLoops:-1];
    [player setVolume:1.0];
    [player play];
}

#pragma mark - bgm operation
- (void)playSFX:(NSString*)filename
{
    NSNumber* systemSoundNum = [sfxDictionary objectForKey:filename];
    SystemSoundID systemSoundID = [systemSoundNum unsignedLongValue];
    
    AudioServicesPlaySystemSound(systemSoundID);
}	

@end
