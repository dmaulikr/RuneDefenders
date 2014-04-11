//
//  RDSettingPanel.m
//  RuneDefenders
//
//  Created by Tekka on 4/10/14.
//  Copyright (c) 2014 TekkaInc. All rights reserved.
//

#import "RDSettingPanel.h"
#import "GlobalDef.h"
#import "SpriteDef.h"

#define SCROLL_VOLUME_WIDTH  400
#define SCROLL_VOLUME_HEIGHT 45
#define SCROLL_VOLUME_TEXT_DIFF 6

// title label
#define TITLE_LABEL_POSITION CGPointMake(0, 170)

// music_volume
#define MUSIC_VOLUME_YOFFSET    70
#define MUSIC_VOLUME_RECT CGRectMake(-SCROLL_VOLUME_WIDTH/2, MUSIC_VOLUME_YOFFSET, SCROLL_VOLUME_WIDTH, SCROLL_VOLUME_HEIGHT)
#define MUSIC_VOLUME_POSITION CGPointMake(0, MUSIC_VOLUME_YOFFSET+SCROLL_VOLUME_TEXT_DIFF)

// sound_fx_volume
#define SOUND_FX_VOLUME_YOFFSET 5
#define SOUND_FX_VOLUME_RECT CGRectMake(-SCROLL_VOLUME_WIDTH/2, SOUND_FX_VOLUME_YOFFSET, SCROLL_VOLUME_WIDTH, SCROLL_VOLUME_HEIGHT)
#define SOUNDX_FX_VOLUME_POSITION CGPointMake(0, SOUND_FX_VOLUME_YOFFSET+SCROLL_VOLUME_TEXT_DIFF)

#define FULL_RESET_POSITION CGPointMake(0, -65)
#define BACK_POSITION CGPointMake(0, -125)

// scroll
#define SCROLL_GEAR_DIFF    22
#define SCROLL_XOFFSET  -200

#define MUSIC_SCROLL_SY MUSIC_VOLUME_YOFFSET
#define MUSIC_SCROLL_POSITION CGPointMake(SCROLL_XOFFSET, MUSIC_SCROLL_SY+SCROLL_GEAR_DIFF)

#define SOUND_SCROLL_SY SOUND_FX_VOLUME_YOFFSET
#define SOUND_SCROLL_POSITION CGPointMake(SCROLL_XOFFSET, SOUND_SCROLL_SY+SCROLL_GEAR_DIFF)




@implementation RDSettingPanel

- (instancetype)initWithImageNamed:(NSString *)name
{
    if (self = [super initWithImageNamed:name])
    {
        [self addTitleLabel];
        [self addMusicVolume];
        [self addSoundFXVolume];
        [self addMenu];
    }
    return self;
}

- (void)addTitleLabel
{
    SKLabelNode* label = [SKLabelNode labelNodeWithFontNamed:@"Zapfino"];
    label.position = TITLE_LABEL_POSITION;
    label.text = @"Game Settings";
//    label.fontSize = 24;
    label.color = [UIColor colorWithRed:0.88 green:0.68 blue:0.11 alpha:1];
    label.colorBlendFactor = 1.0;
    [self addChild:label];
}

- (void)addFrame:(CGRect)rect
{
    SKShapeNode* background = [SKShapeNode node];
    background.path = CGPathCreateWithRoundedRect(rect, 15, 15, NULL);
    background.strokeColor = [SKColor colorWithRed:0.74 green:0.7 blue:0.54 alpha:1];
    background.lineWidth = 5;
    background.fillColor = [SKColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [self addChild:background];
}

- (void)addStaticLabel:(NSString*)text position:(CGPoint)position
{
    SKLabelNode* label = [SKLabelNode labelNodeWithFontNamed:@"Zapfino"];
    label.position = position;
    label.text = text;
    label.fontSize = 24;
    [self addChild:label];
}

- (void)addDynamicLabel:(NSString*)text position:(CGPoint)position
{
    RDLabelNode* label = [RDLabelNode labelNodeWithFontNamed:@"Zapfino"];
    label.position = position;
    label.text = text;
    label.fontSize = 24;
    label.delegate = self;
    [self addChild:label];
}

- (void)addScrollGear:(CGPoint)position
{
    RDSpriteNode* scrollGear = [RDSpriteNode spriteNodeWithImageNamed:@SCROLL_GEAR];
    scrollGear.position = position;
    [scrollGear setScale:0.9];
    scrollGear.delegate = self;
    [self addChild:scrollGear];
}

- (void)addMusicVolume
{
    [self addFrame:MUSIC_VOLUME_RECT];
    [self addStaticLabel:@"Music Volume" position:MUSIC_VOLUME_POSITION];
    [self addScrollGear:MUSIC_SCROLL_POSITION];
}

- (void)addSoundFXVolume
{
    [self addFrame:SOUND_FX_VOLUME_RECT];
    [self addStaticLabel:@"Sound FX Volume" position:SOUNDX_FX_VOLUME_POSITION];
    [self addScrollGear:SOUND_SCROLL_POSITION];
}

- (void)addMenu
{
    [self addDynamicLabel:@"Full Reset" position:FULL_RESET_POSITION];
    [self addDynamicLabel:@"Back" position:BACK_POSITION];
}

#pragma mark - RDActionProtocol
- (void)touchesMovedOnNode:(RDSpriteNode *)node withTouches:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"RDSettingPanel touchesMovedOnNode");
}

@end
