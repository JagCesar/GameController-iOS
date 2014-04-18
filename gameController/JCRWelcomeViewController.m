//
//  JCRWelcomeViewController.m
//  gameController
//
//  Created by César Manuel Pinto Castillo on 18/04/14.
//  Copyright (c) 2014 JagCesar. All rights reserved.
//

#import "JCRWelcomeViewController.h"

@interface JCRWelcomeViewController ()

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

@end
