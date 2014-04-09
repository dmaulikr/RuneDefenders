//
//  RDViewController.m
//  RuneDefenders
//
//  Created by Tekka on 4/8/14.
//  Copyright (c) 2014 TekkaInc. All rights reserved.
//

#import "RDViewController.h"
#import "RDHomeScene.h"
#import "GlobalDef.h"

@implementation RDViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Startup Configuration
    gDeviceWidth = self.view.bounds.size.width;
    gDeviceHeight = self.view.bounds.size.height;
    [[UIApplication sharedApplication] setStatusBarHidden:YES];

    // Configure the view.
    SKView * skView = (SKView *)self.view;
    skView.showsFPS = YES;
    skView.showsNodeCount = YES;
    
    // Create and configure the scene.
    SKScene * scene = [RDHomeScene sceneWithSize:skView.bounds.size];
    scene.scaleMode = SKSceneScaleModeAspectFill;
    
    // Present the scene.
    [skView presentScene:scene];
}

- (BOOL)shouldAutorotate
{
    return NO;
}

- (NSUInteger)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

@end
