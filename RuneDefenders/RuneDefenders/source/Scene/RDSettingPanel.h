//
//  RDSettingPanel.h
//  RuneDefenders
//
//  Created by Tekka on 4/10/14.
//  Copyright (c) 2014 TekkaInc. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>
#import "RDActionProtocol.h"

@interface RDSettingPanel : SKNode <RDActionProtocol>

@property (nonatomic, retain) SKSpriteNode* panel;
@property (nonatomic, retain) SKSpriteNode* background;

- (void)showAction;

@end
