//
//  JCRGameControllerConnectedViewController.m
//  gameController
//
//  Created by César Manuel Pinto Castillo on 18/04/14.
//  Copyright (c) 2014 JagCesar. All rights reserved.
//

#import "JCRGameControllerConnectedViewController.h"

@interface JCRGameControllerConnectedViewController ()

@property (nonatomic) GCGamepad *gamepad;
@property (nonatomic) GCExtendedGamepad *extendedGamepad;
@property (nonatomic) UITextView *textView;

@end

@implementation JCRGameControllerConnectedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[self view] setBackgroundColor:[UIColor blueColor]];
        
        [self setTextView:[UITextView new]];
        [[self textView] setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
        [[self textView] setFrame:[[self view] bounds]];
        [[self view] addSubview:[self textView]];
        [self __logMessage:@"TextView created"];
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Public properties

- (void)setController:(GCController *)controller {
    [self __logMessage:@"Controller set"];
    if ([controller extendedGamepad]) {
        [self __logMessage:@"It was an extended gamepad"];
        [self setExtendedGamepad:[controller extendedGamepad]];
        [self __setupExtendedGamepad];
    } else if ([controller gamepad]) {
        [self __logMessage:@"It was a gamepad"];
        [self setGamepad:[controller gamepad]];
        [self __setupGamepad];
    }
}

#pragma mark - Private functions

- (void)__logMessage:(NSString*)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self textView] setText:[NSString stringWithFormat:@"%@\n%@", [[self textView] text], message]];
        [[self textView] scrollRangeToVisible:NSMakeRange([[[self textView] text] length]-1, 1)];
    });
}

- (void)__setupExtendedGamepad {
    [self __logMessage:@"Setup extended gamepad"];
    
    GCControllerButtonInput *a = [[self extendedGamepad] buttonA];
    GCControllerButtonInput *b = [[self extendedGamepad] buttonB];
    GCControllerButtonInput *x = [[self extendedGamepad] buttonX];
    GCControllerButtonInput *y = [[self extendedGamepad] buttonY];
    GCControllerButtonInput *leftShoulder = [[self extendedGamepad] leftShoulder];
    GCControllerButtonInput *leftTrigger = [[self extendedGamepad] leftTrigger];
    GCControllerButtonInput *rightShoulder = [[self extendedGamepad] rightShoulder];
    GCControllerButtonInput *rightTrigger = [[self extendedGamepad] rightTrigger];
    
    GCControllerDirectionPad *dPad = [[self extendedGamepad] dpad];
    
    __weak typeof(self) weakSelf = self;
    [a setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf __logMessage:[NSString stringWithFormat:@"A - %f", value]];
    }];
    [b setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf __logMessage:[NSString stringWithFormat:@"B - %f", value]];
    }];
    [x setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf __logMessage:[NSString stringWithFormat:@"X - %f", value]];
    }];
    [y setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf __logMessage:[NSString stringWithFormat:@"Y - %f", value]];
    }];
    [leftShoulder setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf __logMessage:[NSString stringWithFormat:@"left shoulder - %f", value]];
    }];
    [leftTrigger setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf __logMessage:[NSString stringWithFormat:@"left trigger - %f", value]];
    }];
    [rightShoulder setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf __logMessage:[NSString stringWithFormat:@"right shoulder - %f", value]];
    }];
    [rightTrigger setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf __logMessage:[NSString stringWithFormat:@"right trigger - %f", value]];
    }];
    
    // DPad and sticks
    [dPad setValueChangedHandler:^(GCControllerDirectionPad *dpad, float xValue, float yValue){
        __strong typeof(self) strongSelf = weakSelf;
        [strongSelf __logMessage:[NSString stringWithFormat:@"X: %f | Y: %f", xValue, yValue]];
    }];
}

- (void)__setupGamepad {
    [self __logMessage:@"Setup extended gamepad"];
    
    GCControllerButtonInput *a = [[self extendedGamepad] buttonA];
    __weak typeof(self) weakSelf = self;
    [a setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        __strong typeof(self) strongSelf = weakSelf;
        if (value > 0) {
            [strongSelf __logMessage:@"A pressed"];
        } else {
            [strongSelf __logMessage:@"A released"];
        }
    }];
}

@end
