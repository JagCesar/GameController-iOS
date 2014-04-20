//
//  JCRGameController.h
//  gameController
//
//  Created by César Manuel Pinto Castillo on 20/04/14.
//  Copyright (c) 2014 JagCesar. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, JCRGamepadType) {
    JCRGamepadTypeSimple,
    JCRGamepadTypeExtended,
    JCRGamepadTypeNA
};

@interface JCRGameController : NSObject

typedef void (^JCRGameControllerButtonBlock)(GCControllerButtonInput *button, float value, BOOL pressed);
typedef void (^JCRGameControllerDirectionPadBlock)(GCControllerDirectionPad *dpad, float xValue, float yValue);

@property (nonatomic,strong) GCController *controller;
@property (nonatomic) JCRGamepadType gamePadType;

@property (copy) JCRGameControllerButtonBlock aButtonBlock;
@property (copy) JCRGameControllerButtonBlock bButtonBlock;
@property (copy) JCRGameControllerButtonBlock xButtonBlock;
@property (copy) JCRGameControllerButtonBlock yButtonBlock;

@property (copy) JCRGameControllerButtonBlock leftShoulderButtonBlock;
@property (copy) JCRGameControllerButtonBlock rightShoulderButtonBlock;
@property (copy) JCRGameControllerButtonBlock leftTriggerButtonBlock;
@property (copy) JCRGameControllerButtonBlock rightTriggerButtonBlock;

@property (copy) JCRGameControllerDirectionPadBlock dPadBlock;
@property (copy) JCRGameControllerDirectionPadBlock leftThumbstickBlock;
@property (copy) JCRGameControllerDirectionPadBlock rightThumbstickBlock;

@end
