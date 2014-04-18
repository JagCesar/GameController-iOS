//
//  JCRWelcomeViewController.m
//  gameController
//
//  Created by César Manuel Pinto Castillo on 18/04/14.
//  Copyright (c) 2014 JagCesar. All rights reserved.
//

#import "JCRWelcomeViewController.h"
#import "JCRGameControllerConnectedViewController.h"

@interface JCRWelcomeViewController ()

@property (nonatomic,strong) JCRGameControllerConnectedViewController *gameControllerConnectedViewController;

@end

@implementation JCRWelcomeViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[self view] setBackgroundColor:[UIColor whiteColor]];
        
        UILabel *instructionsLabel = [UILabel new];
        [instructionsLabel setText:@"Put your iPhone in your Game Controller"];
        [instructionsLabel setTextAlignment:NSTextAlignmentCenter];
        [instructionsLabel setNumberOfLines:0];
        [instructionsLabel setFrame:[[self view] bounds]];
        [instructionsLabel setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
        [[self view] addSubview:instructionsLabel];
        
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

- (void)__gameControllerConnected:(NSNotification*)notification {
    [self setGameControllerConnectedViewController:[JCRGameControllerConnectedViewController new]];
    [self presentViewController:[self gameControllerConnectedViewController]
                       animated:YES
                     completion:^{
                         ;
                     }];
}

- (void)__gameControllerDisconnected:(NSNotification*)notification {
    [[self gameControllerConnectedViewController] dismissViewControllerAnimated:YES
                                                                     completion:^{
                                                                         ;
                                                                     }];
    [self setGameControllerConnectedViewController:nil];
}

@end
