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

@end

@implementation JCRGameControllerConnectedViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        [[self view] setBackgroundColor:[UIColor blueColor]];
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
    if ([controller gamepad]) {
        [self setGamepad:[controller gamepad]];
        [[self gamepad] setValueChangedHandler:^(GCGamepad *gamepad, GCControllerElement *element) {
            
        }];
    } else if ([controller extendedGamepad]) {
        [self setExtendedGamepad:[controller extendedGamepad]];
        [[self extendedGamepad] setValueChangedHandler:^(GCExtendedGamepad *gamepad, GCControllerElement *element) {
            
        }];
    }
}

@end
