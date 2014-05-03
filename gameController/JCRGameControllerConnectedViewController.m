//
//  JCRGameControllerConnectedViewController.m
//  gameController
//
//  Created by César Manuel Pinto Castillo on 18/04/14.
//  Copyright (c) 2014 JagCesar. All rights reserved.
//

#import "JCRGameControllerConnectedViewController.h"
#import "JCRGameControllerManager.h"
#import "JCRGameController.h"

@interface JCRGameControllerConnectedViewController () <JCRGameControllerManagerDelegate>

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
        
        [[JCRGameControllerManager sharedInstance] setDelegate:self];
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

#pragma mark - Private functions

- (void)__logMessage:(NSString*)message {
    dispatch_async(dispatch_get_main_queue(), ^{
        [[self textView] setText:[NSString stringWithFormat:@"%@\n%@", message, [[self textView] text]]];
    });
}

#pragma mark - JCRGameControllerManagerDelegate

- (void)gameControllerManager:(JCRGameControllerManager *)manager
      gameControllerConnected:(JCRGameController *)gameController {
    [self __logMessage:[NSString stringWithFormat:@"+ Gamecontroller connected with index: %ld", (long)[[gameController controller] playerIndex]]];
    
    [gameController setAButtonBlock:^(GCControllerButtonInput *button, float value, BOOL pressed) {
        [self __logMessage:@"test"];
    }];
}

- (void)gameControllerManagerGameControllerDisconnected:(JCRGameControllerManager *)manager {
    [self __logMessage:@"- Gamecontroller disconnected with index: %ld"];
}

@end
