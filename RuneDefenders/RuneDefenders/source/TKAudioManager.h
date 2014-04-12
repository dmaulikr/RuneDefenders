//
//  AudioManager.h
//  TKKit - 2D Game Engine
//
//  Created by Tekka Xie on 12-4-19.
//  Copyright (c) 2012年 . All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TKAudioManager : NSObject
{
    NSMutableDictionary* sfxDictionary;
}

@property(strong, nonatomic) AVAudioPlayer* player;

#pragma mark - init
- (id)init;

#pragma mark - sfx operation
- (void)registSFXWithFileName:(NSString*)filename;
- (void)playSFX:(NSString*)filename;

#pragma mark - bgm operation
- (void)playBGM:(NSString*)bgmFileName;

@end
