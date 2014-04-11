//
//  RDSpriteNode.h
//  RuneDefenders
//
//  Created by Tekka on 4/11/14.
//  Copyright (c) 2014 TekkaInc. All rights reserved.
//

#import <SpriteKit/SpriteKit.h>

@class RDSpriteNode;

@protocol RDActionProtocol <NSObject>
- (void)touchesBeganOnNode:(RDSpriteNode*)node withTouches:(NSSet *)touches withEvent:(UIEvent *)event;
@end

@interface RDSpriteNode : SKSpriteNode
@property (nonatomic, weak) id<RDActionProtocol> delegate;
@end
