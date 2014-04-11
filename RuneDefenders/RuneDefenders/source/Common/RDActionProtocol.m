//
//  RDActionProtocol.m
//  RuneDefenders
//
//  Created by Tekka on 4/11/14.
//  Copyright (c) 2014 TekkaInc. All rights reserved.
//

#import "RDActionProtocol.h"

@implementation RDSpriteNode

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_delegate && [_delegate respondsToSelector:@selector(touchesBeganOnNode:withTouches:withEvent:)]){
        [_delegate touchesBeganOnNode:self withTouches:touches withEvent:event];
    }
    else{
        [super touchesBegan:touches withEvent:event];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_delegate && [_delegate respondsToSelector:@selector(touchesMovedOnNode:withTouches:withEvent:)]){
        [_delegate touchesMovedOnNode:self withTouches:touches withEvent:event];
    }
    else{
        [super touchesMoved:touches withEvent:event];
    }
}

- (void)setDelegate:(id<RDActionProtocol>)delegate
{
    _delegate = delegate;
    if (delegate)
        self.userInteractionEnabled = YES;
    else
        self.userInteractionEnabled = NO;
}

@end

@implementation RDLabelNode

-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_delegate && [_delegate respondsToSelector:@selector(touchesBeganOnNode:withTouches:withEvent:)]){
        [_delegate touchesBeganOnNode:self withTouches:touches withEvent:event];
    }
    else{
        [super touchesBegan:touches withEvent:event];
    }
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_delegate && [_delegate respondsToSelector:@selector(touchesMovedOnNode:withTouches:withEvent:)]){
        [_delegate touchesMovedOnNode:self withTouches:touches withEvent:event];
    }
    else{
        [super touchesMoved:touches withEvent:event];
    }
}

- (void)setDelegate:(id<RDActionProtocol>)delegate
{
    _delegate = delegate;
    if (delegate)
        self.userInteractionEnabled = YES;
    else
        self.userInteractionEnabled = NO;
}

@end
