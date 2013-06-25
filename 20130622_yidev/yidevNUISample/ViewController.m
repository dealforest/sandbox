//
//  ViewController.m
//  yidevNUISample
//
//  Created by Toshihiro Morimoto on 2013/06/21.
//  Copyright (c) 2013年 Toshihiro Morimoto. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

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

- (IBAction)touchedActivityButton:(id)sender
{
    UIActivityViewController *activityView = [[UIActivityViewController alloc] initWithActivityItems:@[ @"NUI" ]
                                                                               applicationActivities:nil];
    [self presentViewController:activityView animated:YES completion:nil];


}
- (IBAction)touchedActionSheetButton:(id)sender
{
    UIActionSheet *actionsheet = [[UIActionSheet alloc] init];
    actionsheet.title = @"NUI";
    [actionsheet addButtonWithTitle:@"Remove"];
    [actionsheet addButtonWithTitle:@"cancel"];
    [actionsheet addButtonWithTitle:@"Button1"];
    [actionsheet addButtonWithTitle:@"Button2"];
    actionsheet.cancelButtonIndex = 1;
    actionsheet.destructiveButtonIndex = 0;
    [actionsheet showInView:self.view];
}

- (IBAction)touchedAlertButton:(id)sender
{
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"title"
                                                    message:@"message"
                                                   delegate:nil
                                          cancelButtonTitle:@"OK"
                                          otherButtonTitles:nil, nil];
    [alert show];
}

- (IBAction)touchedImagePickerButton:(id)sender
{
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
    picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    [self presentViewController:picker animated:YES completion:nil];
}

- (IBAction)touchedPickerButton:(id)sender
{
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    UIDatePicker *datePicker = [[UIDatePicker alloc] init];
    datePicker.frame = CGRectOffset(datePicker.frame, 0, CGRectGetHeight(applicationFrame) - CGRectGetHeight(datePicker.frame) - 44);
    datePicker.datePickerMode = UIDatePickerModeTime;
    [self.view addSubview:datePicker];
}

@end
