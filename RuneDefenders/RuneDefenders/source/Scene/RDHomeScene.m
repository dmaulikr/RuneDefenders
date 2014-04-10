//
//  RDHomeScene.m
//  RuneDefenders
//
//  Created by Tekka on 4/9/14.
//  Copyright (c) 2014 TekkaInc. All rights reserved.
//

#import "RDHomeScene.h"
#import "SpriteDef.h"
#import "GlobalDef.h"
#import "RDHomeSceneDefs.h"

@implementation RDHomeScene

-(id)initWithSize:(CGSize)size {
    if (self = [super initWithSize:size]) {
        /* Setup your scene here */
        
        NSLog(@"width:%f height:%f", size.width, size.height);
        
        // background
        SKSpriteNode* home = [SKSpriteNode spriteNodeWithImageNamed:@HOME];
        home.position = CGPointMake(size.width/2, size.height/2);
        [self addChild:home];
        //NSLog(@"width:%f height:%f", home.size.width, home.size.height);
        
        // set gWorldScale
        gWorldScale = size.height/home.size.height;
        NSLog(@"gWorldScale = %f", gWorldScale);
        [home setScale:gWorldScale];
        
        // logo
        SKSpriteNode* logo = [SKSpriteNode spriteNodeWithImageNamed:@LOGO];
        logo.position = LOGO_POSITION;
        [logo setScale:gWorldScale];
        [self addChild:logo];
        
        [self addMoreGames];
        [self addPlayHand];
        [self addFacebook];
        [self addSetting];
    }
    return self;
}

- (void)addMoreGames
{
    // more games
    SKSpriteNode* moreGame = [SKSpriteNode spriteNodeWithImageNamed:@MORE_GAME];
    moreGame.position = MORE_GAME_POSITION;
    [moreGame setScale:0];
    [self addChild:moreGame];
    
    // more games action
    CGFloat moreGameActionDuration = 0.2;
    CGFloat moreGameMinScale = gWorldScale * 0.8;
    SKAction* act0 = [SKAction waitForDuration:MORE_GAME_WAIT_DURATION];
    SKAction* act1 = [SKAction scaleTo:gWorldScale duration:moreGameActionDuration];
    SKAction* act2 = [SKAction scaleTo:moreGameMinScale duration:moreGameActionDuration];
    SKAction* act3 = [SKAction sequence:@[act2, act1]];
    SKAction* act4 = [SKAction repeatAction:act3 count:5];
    SKAction* act5 = [SKAction sequence:@[act0, act1, act4]];
    [moreGame runAction:act5];
}

- (void)addPlayHand
{
    // white halo
    SKSpriteNode* whiteHalo = [SKSpriteNode spriteNodeWithImageNamed:@WHITE_HALO];
    whiteHalo.position = WHITE_HALO_POSITION;
    whiteHalo.hidden = YES;
    [self addChild:whiteHalo];
    
    // play hand
    SKSpriteNode* playHand = [SKSpriteNode spriteNodeWithImageNamed:@PLAY_HAND];
    playHand.position = PLAY_HAND_START_POSITION;
    [playHand setScale:gWorldScale];
    [self addChild:playHand];
    
    // play hand action
    SKAction* act0 = [SKAction waitForDuration:PLAY_HAND_WAIT_DURATION];
    SKAction* act1 = [SKAction moveTo:PLAY_HAND_TARGET_POSITION duration:0.25];
    SKAction* act2 = [SKAction sequence:@[act0, act1]];
    [playHand runAction:act2 completion:^(){
        whiteHalo.hidden = NO;
        SKAction* act1 = [SKAction rotateByAngle:-3.14 duration:3.5];
        SKAction* act2 = [SKAction repeatActionForever:act1];
        [whiteHalo runAction:act2];
    }];
}

- (void)addFacebook
{
    SKSpriteNode* facebook = [SKSpriteNode spriteNodeWithImageNamed:@FACEBOOK];
    facebook.position = FACEBOOK_POSITION;
    facebook.zRotation = PI/3;
    facebook.hidden = YES;
    [facebook setScale:gWorldScale];
    [self addChild:facebook];
    
    SKAction* act0 = [SKAction waitForDuration:1.8];
    SKAction* act1 = [SKAction runBlock:^(){
        facebook.hidden = NO;
    }];
    SKAction* act2 = [SKAction rotateToAngle:0 duration:0.5];
    SKAction* act3 = [SKAction group:@[act1, act2]];
    SKAction* act4 = [SKAction sequence:@[act0, act3]];
    [facebook runAction:act4];
}

- (void)addSetting
{
    SKSpriteNode* setting = [SKSpriteNode spriteNodeWithImageNamed:@SETTING];
    setting.position = SETTING_POSITION;
    setting.zRotation = -PI/3;
    [setting setScale:gWorldScale];
    [self addChild:setting];
    
    SKAction* act0 = [SKAction waitForDuration:1.8];
    SKAction* act1 = [SKAction runBlock:^(){
        setting.hidden = NO;
    }];
    SKAction* act2 = [SKAction rotateToAngle:0 duration:0.5];
    SKAction* act3 = [SKAction group:@[act1, act2]];
    SKAction* act4 = [SKAction sequence:@[act0, act3]];
    [setting runAction:act4];
}

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    /* Called when a touch begins */
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

@end
