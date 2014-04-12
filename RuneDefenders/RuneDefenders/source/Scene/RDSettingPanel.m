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

// names
#define MUSIC_SCROLL_GEAR_NAME  @"Music ScrollGear"
#define SOUND_SCROLL_GEAR_NAME  @"Sound ScrollGear"
#define FULL_RESET_LABEL_NAME @"Full Reset"
#define BACK_LABEL_NAME @"Back"

@implementation RDSettingPanel

- (instancetype)init
{
    if (self = [super init])
    {
        [self addBackground];
        [self addPanel];
        [self addTitleLabel];
        [self addMusicVolume];
        [self addSoundFXVolume];
        [self addMenu];
    }
    return self;
}

- (void)showAction
{
    [self showBackgroundAction];
    [self showPanelAction];
}

- (void)showBackgroundAction
{
    assert(_background);
    _background.alpha = 0;
    SKAction* act1 = [SKAction fadeAlphaTo:0.5 duration:0.5];
    [_background runAction:act1];
}

- (void)showPanelAction
{
    assert(_panel);
    [_panel setScale:0.2];
    SKAction* act1 = [SKAction scaleTo:1.15*gWorldScale duration:0.3];
    SKAction* act2 = [SKAction scaleTo:1.0*gWorldScale duration:0.15];
    SKAction* act3 = [SKAction sequence:@[act1, act2]];
    [_panel runAction:act3];
}

- (void)addBackground
{
    self.background = [SKSpriteNode spriteNodeWithColor:[UIColor blackColor] size:CGSizeMake(gDeviceWidth/gWorldScale, gDeviceHeight/gWorldScale)];
    _background.alpha = 0;
    [self addChild:_background];
}

- (void)addPanel
{
    self.panel = [SKSpriteNode spriteNodeWithImageNamed:@ROCK_PANEL];
    [self addChild:_panel];
}

- (void)addTitleLabel
{
    SKLabelNode* label = [SKLabelNode labelNodeWithFontNamed:@"Zapfino"];
    label.position = TITLE_LABEL_POSITION;
    label.text = @"Game Settings";
//    label.fontSize = 24;
    label.color = [UIColor colorWithRed:0.88 green:0.68 blue:0.11 alpha:1];
    label.colorBlendFactor = 1.0;
    [_panel addChild:label];
}

- (void)addFrame:(CGRect)rect
{
    SKShapeNode* background = [SKShapeNode node];
    background.path = CGPathCreateWithRoundedRect(rect, 15, 15, NULL);
    background.strokeColor = [SKColor colorWithRed:0.74 green:0.7 blue:0.54 alpha:1];
    background.lineWidth = 5;
    background.fillColor = [SKColor colorWithRed:0 green:0 blue:0 alpha:0.5];
    [_panel addChild:background];
}

- (void)addStaticLabel:(NSString*)text position:(CGPoint)position
{
    SKLabelNode* label = [SKLabelNode labelNodeWithFontNamed:@"Zapfino"];
    label.position = position;
    label.text = text;
    label.fontSize = 24;
    [_panel addChild:label];
}

- (void)addDynamicLabel:(NSString*)text position:(CGPoint)position
{
    RDLabelNode* label = [RDLabelNode labelNodeWithFontNamed:@"Zapfino"];
    label.position = position;
    label.text = text;
    label.name = text;
    label.fontSize = 24;
    label.delegate = self;
    [_panel addChild:label];
}

- (void)addScrollGear:(NSString*)name position:(CGPoint)position
{
    RDSpriteNode* scrollGear = [RDSpriteNode spriteNodeWithImageNamed:@SCROLL_GEAR];
    scrollGear.name = name;
    scrollGear.position = position;
    [scrollGear setScale:0.9];
    scrollGear.delegate = self;
    [_panel addChild:scrollGear];
}

- (void)addMusicVolume
{
    [self addFrame:MUSIC_VOLUME_RECT];
    [self addStaticLabel:@"Music Volume" position:MUSIC_VOLUME_POSITION];
    [self addScrollGear:MUSIC_SCROLL_GEAR_NAME position:MUSIC_SCROLL_POSITION];
}

- (void)addSoundFXVolume
{
    [self addFrame:SOUND_FX_VOLUME_RECT];
    [self addStaticLabel:@"Sound FX Volume" position:SOUNDX_FX_VOLUME_POSITION];
    [self addScrollGear:SOUND_SCROLL_GEAR_NAME position:SOUND_SCROLL_POSITION];
}

- (void)addMenu
{
    [self addDynamicLabel:FULL_RESET_LABEL_NAME position:FULL_RESET_POSITION];
    [self addDynamicLabel:BACK_LABEL_NAME position:BACK_POSITION];
}
#define MUSIC_SCROLL_GEAR_NAME  @"Music ScrollGear"
#define SOUND_SCROLL_GEAR_NAME  @"Sound ScrollGear"
#define FULL_RESET_LABEL_NAME @"Full Reset"
#define BACK_LABEL_NAME @"Back"

#pragma mark - RDActionProtocol
- (void)touchesBeganOnNode:(SKNode *)node withTouches:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([node.name compare:FULL_RESET_LABEL_NAME] == NSOrderedSame)
    {
    }
    else if ([node.name compare:BACK_LABEL_NAME] == NSOrderedSame)
    {
        [self removeFromParent];
    }

}

- (void)touchesMovedOnNode:(SKSpriteNode *)node withTouches:(NSSet *)touches withEvent:(UIEvent *)event
{
    if ([node.name compare:MUSIC_SCROLL_GEAR_NAME] == NSOrderedSame ||
        [node.name compare:SOUND_SCROLL_GEAR_NAME] == NSOrderedSame)
    {
        CGPoint location = [[touches anyObject] locationInNode:_panel];
        location.x = MAX(location.x, SCROLL_XOFFSET);
        location.x = MIN(-SCROLL_XOFFSET, location.x);
        node.position = CGPointMake(location.x, node.position.y);
        node.zRotation = (location.x - SCROLL_XOFFSET) / (2*SCROLL_XOFFSET)*2.5*PI;
    }
}

@end
