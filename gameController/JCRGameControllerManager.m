//
//  JCRGameControllerManager.m
//  gameController
//
//  Created by César Manuel Pinto Castillo on 02/05/14.
//  Copyright (c) 2014 JagCesar. All rights reserved.
//

#import "JCRGameControllerManager.h"
#import "JCRGameController.h"

@implementation JCRGameControllerManager

+ (instancetype)sharedInstance {
    static dispatch_once_t onceToken;
    static JCRGameControllerManager *sharedInstance;
    dispatch_once(&onceToken, ^{
        sharedInstance = [JCRGameControllerManager new];
        
        [[NSNotificationCenter defaultCenter] addObserver:sharedInstance
                                                 selector:@selector(__gameControllerConnected:)
                                                     name:GCControllerDidConnectNotification
                                                   object:nil];
        
        [[NSNotificationCenter defaultCenter] addObserver:sharedInstance
                                                 selector:@selector(__gameControllerDisconnected:)
                                                     name:GCControllerDidDisconnectNotification
                                                   object:nil];
    });
    return sharedInstance;
}

- (NSArray *)connectedGameControllers {
    return [GCController controllers];
}

#pragma mark - Private functions

- (void)__gameControllerConnected:(NSNotification*)notification {
    if ([[self delegate] respondsToSelector:@selector(gameControllerManager:gameControllerConnected:)]) {
        GCController *controller = [notification object];
        if ([controller playerIndex] == -1) {
            [controller setPlayerIndex:[[self connectedGameControllers] count]-1];
        }
        JCRGameController *gameController = [JCRGameController new];
        [gameController setController:controller];
        [[self delegate] gameControllerManager:self
                       gameControllerConnected:gameController];
    }
}

- (void)__gameControllerDisconnected:(NSNotification*)notification {
    if ([[self delegate] respondsToSelector:@selector(gameControllerManagerGameControllerDisconnected:)]) {
        [[self delegate] gameControllerManagerGameControllerDisconnected:self];
    }
}

@end
