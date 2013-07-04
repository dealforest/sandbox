//
//  ViewController2.m
//  TransitionSample
//
//  Created by Toshihiro Morimoto on 2013/07/02.
//  Copyright (c) 2013年 Toshihiro Morimoto. All rights reserved.
//

#import "ViewController2.h"

@interface ViewController2 ()

@end

@implementation ViewController2

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
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

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    self.title = @"second page";
}

- (IBAction)popViewWithNoAnimation:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

@end
