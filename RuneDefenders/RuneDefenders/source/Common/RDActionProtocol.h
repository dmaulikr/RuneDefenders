//
//  RDActionProtocol.h
//  RuneDefenders
//
//  Created by Tekka on 4/11/14.
//  Copyright (c) 2014 TekkaInc. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@protocol RDActionProtocol <NSObject>
@optional
- (void)touchesBeganOnNode:(SKNode*)node withTouches:(NSSet *)touches withEvent:(UIEvent *)event;
- (void)touchesMovedOnNode:(SKNode*)node withTouches:(NSSet *)touches withEvent:(UIEvent *)event;
@end

@interface RDSpriteNode : SKSpriteNode
@property (nonatomic, weak) id<RDActionProtocol> delegate;
@end

@interface RDLabelNode : SKLabelNode
@property (nonatomic, weak) id<RDActionProtocol> delegate;
@end
