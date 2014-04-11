//
//  RDSettingPanel.m
//  RuneDefenders
//
//  Created by Tekka on 4/10/14.
//  Copyright (c) 2014 TekkaInc. All rights reserved.
//

#import "RDSettingPanel.h"

#define SCROLL_VOLUME_WIDTH  400
#define SCROLL_VOLUME_HEIGHT 45
#define MUSIC_VOLUME_RECT CGRectMake(-SCROLL_VOLUME_WIDTH/2, 70, SCROLL_VOLUME_WIDTH, SCROLL_VOLUME_HEIGHT)
#define SOUND_FX_VOLUME_RECT CGRectMake(-SCROLL_VOLUME_WIDTH/2, 5, SCROLL_VOLUME_WIDTH, SCROLL_VOLUME_HEIGHT)

@implementation RDSettingPanel

- (instancetype)initWithImageNamed:(NSString *)name
{
    if (self = [super initWithImageNamed:name])
    {
        [self addMusicVolume];
        [self addSoundFXVolume];
    }
    return self;
}

- (void)addFrame:(CGRect)rect
{
    SKShapeNode* background = [SKShapeNode node];
    background.path = CGPathCreateWithRoundedRect(rect, 15, 15, NULL);
    background.strokeColor = [SKColor colorWithRed:0.74 green:0.7 blue:0.54 alpha:1];
    background.lineWidth = 5;
    [self addChild:background];
}

- (void)addMusicVolume
{
    [self addFrame:MUSIC_VOLUME_RECT];
}

- (void)addSoundFXVolume
{
    [self addFrame:SOUND_FX_VOLUME_RECT];
}

@end
