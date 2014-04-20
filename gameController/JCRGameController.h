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

@property (nonatomic,strong) GCController *controller;
@property (nonatomic) JCRGamepadType gamePadType;

@end
