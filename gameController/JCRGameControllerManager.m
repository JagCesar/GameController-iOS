//
//  JCRGameControllerManager.m
//  gameController
//
//  Created by César Manuel Pinto Castillo on 02/05/14.
//  Copyright (c) 2014 JagCesar. All rights reserved.
//

#import "JCRGameControllerManager.h"

@implementation JCRGameControllerManager

- (instancetype)init
{
    self = [super init];
    if (self) {
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(__gameControllerConnected:)
                                                     name:GCControllerDidConnectNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(__gameControllerDisconnected:)
                                                     name:GCControllerDidDisconnectNotification
                                                   object:nil];
    }
    return self;
}

#pragma mark - Private functions

- (void)__gameControllerConnected:(NSNotification*)notification {
    if ([[self delegate] respondsToSelector:@selector(gameControllerManager:gameControllerConnected:)]) {
        [[self delegate] gameControllerManager:self
                       gameControllerConnected:[notification object]];
    }
}

- (void)__gameControllerDisconnected:(NSNotification*)notification {
    if ([[self delegate] respondsToSelector:@selector(gameControllerManager:gameControllerDisconnected:)]) {
        [[self delegate] gameControllerManager:self
                    gameControllerDisconnected:[notification object]];
    }
}

@end
