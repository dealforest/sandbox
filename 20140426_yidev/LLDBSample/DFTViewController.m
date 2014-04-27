
//
//  DFTViewController.m
//  LLDBSample
//
//  Created by Toshihiro Morimoto on 4/26/14.
//  Copyright (c) 2014 Toshihiro Morimoto. All rights reserved.
//

#import "DFTViewController.h"

@interface DFTViewController ()

@end

@implementation DFTViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (IBAction)break:(id)sender {
    NSLog(@"%@", @"break");
}

@end
