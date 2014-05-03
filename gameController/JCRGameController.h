//
//  JCRGameController.h
//  gameController
//
//  Created by César Manuel Pinto Castillo on 20/04/14.
//  Copyright (c) 2014 JagCesar. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <GameController/GameController.h>

typedef NS_ENUM(NSInteger, JCRGamepadType) {
    JCRGamepadTypeSimple,
    JCRGamepadTypeExtended,
    JCRGamepadTypeNA
};

@interface JCRGameController : NSObject

typedef void (^JCRGameControllerPauseBlock)(GCController* controller);
typedef void (^JCRGameControllerButtonBlock)(GCControllerButtonInput *button, float value, BOOL pressed);
typedef void (^JCRGameControllerDirectionPadBlock)(GCControllerDirectionPad *dpad, float xValue, float yValue);

@property (nonatomic,strong) GCController *controller;
@property (nonatomic) JCRGamepadType gamePadType;

@property (copy) JCRGameControllerPauseBlock pauseButtonBlock;

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

// The only reason we have these set-functions is because xCode isn't doing
// proper auto completion on the above properties.

- (void)setPauseButtonBlock:(JCRGameControllerPauseBlock)pauseButtonBlock;

- (void)setAButtonBlock:(JCRGameControllerButtonBlock)aButtonBlock;
- (void)setBButtonBlock:(JCRGameControllerButtonBlock)bButtonBlock;
- (void)setXButtonBlock:(JCRGameControllerButtonBlock)xButtonBlock;
- (void)setYButtonBlock:(JCRGameControllerButtonBlock)yButtonBlock;

- (void)setLeftShoulderButtonBlock:(JCRGameControllerButtonBlock)leftShoulderButtonBlock;
- (void)setRightShoulderButtonBlock:(JCRGameControllerButtonBlock)rightShoulderButtonBlock;
- (void)setLeftTriggerButtonBlock:(JCRGameControllerButtonBlock)leftTriggerButtonBlock;
- (void)setRightTriggerButtonBlock:(JCRGameControllerButtonBlock)rightTriggerButtonBlock;

- (void)setDPadBlock:(JCRGameControllerDirectionPadBlock)dPadBlock;
- (void)setLeftThumbstickBlock:(JCRGameControllerDirectionPadBlock)leftThumbstickBlock;
- (void)setRightThumbstickBlock:(JCRGameControllerDirectionPadBlock)rightThumbstickBlock;

@end
