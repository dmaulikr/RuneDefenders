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
        
        [self addEyeBall];
        [self addMoreGames];
        [self addFacebook];
        [self addSettingButton];
        [self addPlayHand];
    }
    return self;
}

- (void)showBlackMask
{
    if (_blackMask == NULL)
    {
        _blackMask = [RDSpriteNode spriteNodeWithColor:[UIColor blackColor] size:self.size];
        _blackMask.name = @"blackMask";
        _blackMask.position = CGPointMake(self.size.width/2, self.size.height/2);
        _blackMask.alpha = 0;
        _blackMask.userInteractionEnabled = YES;
        [self addChild:_blackMask];
    }
    SKAction* act1 = [SKAction fadeAlphaTo:0.5 duration:0.2];
    assert(_blackMask);
    [_blackMask runAction:act1];
}

- (void)addEyeBall
{
    self.leftEyeBall = [SKSpriteNode spriteNodeWithImageNamed:@EYEBALL];
    [_leftEyeBall setScale:gWorldScale];
    _leftEyeBall.position = LEFT_EYEBALL_POSITION;
    [self addChild:_leftEyeBall];
    
    self.rightEyeBall = [SKSpriteNode spriteNodeWithImageNamed:@EYEBALL];
    [_rightEyeBall setScale:gWorldScale];
    _rightEyeBall.position = RIGHT_EYEBALL_POSITION;
    [self addChild:_rightEyeBall];
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
    self.playHand = [SKSpriteNode spriteNodeWithImageNamed:@PLAY_HAND];
    _playHand.position = PLAY_HAND_START_POSITION;
    [_playHand setScale:gWorldScale];
    [self addChild:_playHand];
    
    // play hand action
    SKAction* act0 = [SKAction waitForDuration:PLAY_HAND_WAIT_DURATION];
    SKAction* act1 = [SKAction moveTo:PLAY_HAND_TARGET_POSITION duration:0.3];
    SKAction* act2 = [SKAction sequence:@[act0, act1]];
    [_playHand runAction:act2 completion:^(){
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
    facebook.alpha = 0;
    [facebook setScale:gWorldScale];
    [self addChild:facebook];
    
    SKAction* act0 = [SKAction waitForDuration:1.8];
    SKAction* act1 = [SKAction rotateToAngle:0 duration:0.7];
    SKAction* act2 = [SKAction fadeInWithDuration:0.4];
    SKAction* act3 = [SKAction group:@[act1, act2]];
    SKAction* act4 = [SKAction sequence:@[act0, act3]];
    [facebook runAction:act4];
}

- (void)addSettingButton
{
    self.settingButton = [RDSpriteNode spriteNodeWithImageNamed:@SETTING];
    _settingButton.position = SETTING_POSITION;
    _settingButton.zRotation = -PI/3;
    _settingButton.alpha = 0;
    _settingButton.delegate = self;
    [_settingButton setScale:gWorldScale];
    [self addChild:_settingButton];
    
    SKAction* act0 = [SKAction waitForDuration:1.8];
    SKAction* act1 = [SKAction rotateToAngle:0 duration:0.7];
    SKAction* act2 = [SKAction fadeInWithDuration:0.4];
    SKAction* act3 = [SKAction group:@[act1, act2]];
    SKAction* act4 = [SKAction sequence:@[act0, act3]];
    [_settingButton runAction:act4];
}

//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
//    /* Called when a touch begins */
//    NSLog(@"touchesBegan");
//    UITouch *touch = [touches anyObject];
//    CGPoint location = [touch locationInNode:self];
////    if ([self nodeAtPoint:location] == _settingButton){
////        [self showSettingPanel];
////    }
////    else if ([self nodeAtPoint:location] == _playHand){
////        
////    }
//}

- (void)showSettingPanel
{
    [self showBlackMask];
    if (_settingPanel == NULL)
    {
        self.settingPanel = [[RDSettingPanel alloc ] initWithImageNamed:@ROCK_PANEL];
        _settingPanel.position = CGPointMake(self.size.width/2, self.size.height/2);
        [_settingPanel setScale:gWorldScale];
        [self addChild:_settingPanel];
    }
    [_settingPanel setScale:0.2];
    SKAction* act1 = [SKAction scaleTo:1.15*gWorldScale duration:0.3];
    SKAction* act2 = [SKAction scaleTo:1.0*gWorldScale duration:0.15];
    SKAction* act3 = [SKAction sequence:@[act1, act2]];
    [_settingPanel runAction:act3];
}

-(void)update:(CFTimeInterval)currentTime {
    /* Called before each frame is rendered */
}

#pragma mark - RDActionProtocol
- (void)touchesBeganOnNode:(RDSpriteNode*)node withTouches:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (node == _settingButton)
    {
        [self showSettingPanel];
    }
    else if (node == _playHand)
    {

    }
}

@end
