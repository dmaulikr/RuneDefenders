//
//  RDHomeScene.h
//  RuneDefenders
//
//  Created by Tekka on 4/9/14.
//  Copyright (c) 2014 TekkaInc. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "RDSettingPanel.h"
#import "RDSpriteNode.h"

@interface RDHomeScene : SKScene <RDActionProtocol>

@property(nonatomic, strong) SKSpriteNode* leftEyeBall;
@property(nonatomic, strong) SKSpriteNode* rightEyeBall;
@property(nonatomic, strong) RDSpriteNode* settingButton;
@property(nonatomic, strong) SKSpriteNode* playHand;
@property(nonatomic, strong) SKSpriteNode* settingPanel;
@property(nonatomic, strong) SKSpriteNode* blackMask;

@end
