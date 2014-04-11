//
//  RDSpriteNode.m
//  RuneDefenders
//
//  Created by Tekka on 4/11/14.
//  Copyright (c) 2014 TekkaInc. All rights reserved.
//

#import "RDSpriteNode.h"

@implementation RDSpriteNode

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_delegate){
        [_delegate touchesBeganOnNode:self withTouches:touches withEvent:event];
    }
    else{
        [super touchesBegan:touches withEvent:event];
    }
}

- (void)setDelegate:(id<RDActionProtocol>)delegate
{
    _delegate = delegate;
    if (delegate)
        self.userInteractionEnabled = YES;
}

@end
