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
        [[self textView] scrollRangeToVisible:NSMakeRange([[[self textView] text] length], 0)];
    });
}

- (void)__setupExtendedGamepad {
    [self __logMessage:@"Setup extended gamepad"];
    
    GCControllerButtonInput *a = [[self extendedGamepad] buttonA];
    __weak typeof(self) weakSelf = self;
    [a setValueChangedHandler:^(GCControllerButtonInput *button, float value, BOOL pressed){
        __strong typeof(self) strongSelf = weakSelf;
        if (value > 0) {
            [strongSelf __logMessage:[NSString stringWithFormat:@"A pressed - %f", value]];
        } else {
            [strongSelf __logMessage:[NSString stringWithFormat:@"A released - %f", value]];
        }
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
