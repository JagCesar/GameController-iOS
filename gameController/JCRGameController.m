//
//  JCRGameController.m
//  gameController
//
//  Created by César Manuel Pinto Castillo on 20/04/14.
//  Copyright (c) 2014 JagCesar. All rights reserved.
//

#import "JCRGameController.h"

@interface JCRGameController ()

@property (nonatomic) GCGamepad *gamepad;
@property (nonatomic) GCExtendedGamepad *extendedGamepad;

@end

@implementation JCRGameController

#pragma mark - Public properties

- (void)setController:(GCController *)controller {
    if (_controller == controller) {
        return;
    }
    
    _controller = controller;
    
    [[self controller] setControllerPausedHandler:^(GCController *controller) {
    }];
    
    if ([controller extendedGamepad]) {
        [self setExtendedGamepad:[controller extendedGamepad]];
        [self __setupExtendedGamepad];
    } else if ([controller gamepad]) {
        [self setGamepad:[controller gamepad]];
        [self __setupGamepad];
    }
}

- (JCRGamepadType)gamePadType {
    if ([[self controller] extendedGamepad]) {
        return JCRGamepadTypeExtended;
    } else if ([[self controller] gamepad]) {
        return JCRGamepadTypeSimple;
    } else {
        return JCRGamepadTypeNA;
    }
}

#pragma mark - Private functions

- (void)__setupExtendedGamepad {
    
    GCControllerButtonInput *a = [[self extendedGamepad] buttonA];
    GCControllerButtonInput *b = [[self extendedGamepad] buttonB];
    GCControllerButtonInput *x = [[self extendedGamepad] buttonX];
    GCControllerButtonInput *y = [[self extendedGamepad] buttonY];
    GCControllerButtonInput *leftShoulder = [[self extendedGamepad] leftShoulder];
    GCControllerButtonInput *leftTrigger = [[self extendedGamepad] leftTrigger];
    GCControllerButtonInput *rightShoulder = [[self extendedGamepad] rightShoulder];
    GCControllerButtonInput *rightTrigger = [[self extendedGamepad] rightTrigger];
    
    GCControllerDirectionPad *dPad = [[self extendedGamepad] dpad];
    GCControllerDirectionPad *leftThumbstick = [[self extendedGamepad] leftThumbstick];
    GCControllerDirectionPad *rightThumbstick = [[self extendedGamepad] rightThumbstick];
    
    [a setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self aButtonBlock]) {
            self.aButtonBlock(button, value, pressed);
        }
    }];
    [b setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self bButtonBlock]) {
            self.bButtonBlock(button, value, pressed);
        }
    }];
    [x setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self xButtonBlock]) {
            self.xButtonBlock(button, value, pressed);
        }
    }];
    [y setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self yButtonBlock]) {
            self.yButtonBlock(button, value, pressed);
        }
    }];
    [leftShoulder setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self leftShoulderButtonBlock]) {
            self.leftShoulderButtonBlock(button,value,pressed);
        }
    }];
    [leftTrigger setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self leftTriggerButtonBlock]) {
            self.leftTriggerButtonBlock(button,value,pressed);
        }
    }];
    [rightShoulder setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self rightShoulderButtonBlock]) {
            self.rightShoulderButtonBlock(button,value,pressed);
        }
    }];
    [rightTrigger setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self rightTriggerButtonBlock]) {
            self.rightTriggerButtonBlock(button,value,pressed);
        }
    }];
    
    // DPad and sticks
    [dPad setValueChangedHandler:^(GCControllerDirectionPad *dpad, float xValue, float yValue){
        if ([self dPadBlock]) {
            self.dPadBlock(dpad,xValue,yValue);
        }
    }];
    [leftThumbstick setValueChangedHandler:^(GCControllerDirectionPad *dpad, float xValue, float yValue){
        if ([self leftThumbstickBlock]) {
            self.leftThumbstickBlock(dpad,xValue,yValue);
        }
    }];
    [rightThumbstick setValueChangedHandler:^(GCControllerDirectionPad *dpad, float xValue, float yValue){
        if ([self rightThumbstickBlock]) {
            self.rightThumbstickBlock(dpad,xValue,yValue);
        }
    }];
}

- (void)__setupGamepad {
    
    GCControllerButtonInput *a = [[self gamepad] buttonA];
    GCControllerButtonInput *b = [[self gamepad] buttonB];
    GCControllerButtonInput *x = [[self gamepad] buttonX];
    GCControllerButtonInput *y = [[self gamepad] buttonY];
    GCControllerButtonInput *leftShoulder = [[self gamepad] leftShoulder];
    GCControllerButtonInput *rightShoulder = [[self gamepad] rightShoulder];
    
    GCControllerDirectionPad *dPad = [[self gamepad] dpad];
    
    [a setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self aButtonBlock]) {
            self.aButtonBlock(button, value, pressed);
        }
    }];
    [b setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self bButtonBlock]) {
            self.bButtonBlock(button, value, pressed);
        }
    }];
    [x setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self xButtonBlock]) {
            self.xButtonBlock(button, value, pressed);
        }
    }];
    [y setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self yButtonBlock]) {
            self.yButtonBlock(button, value, pressed);
        }
    }];
    [leftShoulder setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self leftShoulderButtonBlock]) {
            self.leftShoulderButtonBlock(button,value,pressed);
        }
    }];
    [rightShoulder setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        if ([self rightShoulderButtonBlock]) {
            self.rightShoulderButtonBlock(button,value,pressed);
        }
    }];
    
    // DPad and sticks
    [dPad setValueChangedHandler:^(GCControllerDirectionPad *dpad, float xValue, float yValue){
        if ([self dPadBlock]) {
            self.dPadBlock(dpad,xValue,yValue);
        }
    }];
}

@end
