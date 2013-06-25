//
//  main.m
//  yidevNUISample
//
//  Created by Toshihiro Morimoto on 2013/06/21.
//  Copyright (c) 2013年 Toshihiro Morimoto. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "AppDelegate.h"
#import "NUISettings.h"

int main(int argc, char *argv[])
{
    @autoreleasepool {
        [NUISettings initWithStylesheet:@"Customize-Googolplex.NUI"];
//        [NUISettings initWithStylesheet:@"Blue.NUI"];
//        [NUISettings initWithStylesheet:@"Default.NUI"];
//        [NUISettings initWithStylesheet:@"Round.NUI"];
//        [NUISettings initWithStylesheet:@"Switchboard.NUI"];

        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
