//
//  TransitionNavigationController.m
//  TransitionSample
//
//  Created by Toshihiro Morimoto on 2013/07/02.
//  Copyright (c) 2013年 Toshihiro Morimoto. All rights reserved.
//

#import "TransitionNavigationController.h"
#import <QuartzCore/QuartzCore.h>
#import "CAKeyframeAnimation+AHEasing.h"

@interface TransitionNavigationController ()

@end

@implementation TransitionNavigationController

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

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    UIImageView *fromView = [self createCaptureView];
    [super pushViewController:viewController animated:NO];
    [self.view layoutSubviews];
    
    UIView *superView = self.view.superview;
    [superView addSubview:fromView];
    [superView bringSubviewToFront:self.view];
    
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    CGPoint toPoint   = self.view.center;
    CGPoint fromPoint = fromView.center;

    [CATransaction begin];
    [CATransaction setAnimationDuration:0.5f];
    [CATransaction setCompletionBlock:^{
        [fromView removeFromSuperview];
    }];
    
    CAAnimation *anim;
    anim = [CAKeyframeAnimation animationWithKeyPath:@"position"
                                            function:CubicEaseOut
                                           fromPoint:fromPoint
                                             toPoint:CGPointMake(fromPoint.x - 80, fromPoint.y)];
    [fromView.layer addAnimation:anim forKey:@"position"];

    anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"
                                            function:CubicEaseOut
                                           fromValue:1.0f
                                             toValue:0.9f];
    [fromView.layer addAnimation:anim forKey:@"transform.scale"];
    
    anim = [CAKeyframeAnimation animationWithKeyPath:@"position"
                                            function:QuarticEaseOut
                                           fromPoint:CGPointMake(toPoint.x + CGRectGetWidth(applicationFrame), toPoint.y)
                                             toPoint:toPoint];
    [self.view.layer addAnimation:anim forKey:@"position"];
    
    [CATransaction commit];
}

- (UIViewController *)popViewControllerAnimated:(BOOL)animated
{
    NSInteger count = [self.viewControllers count];
    if (count <= 1 || animated == NO)
        return [super popViewControllerAnimated:animated];
    
    UIViewController *fromViewController = self.visibleViewController;
    UIImageView *fromView = [self createCaptureView];
    [super popViewControllerAnimated:NO];
    [self.view layoutSubviews];
    
    [self.view.superview addSubview:fromView];
    
    CGRect applicationFrame = [[UIScreen mainScreen] applicationFrame];
    CGFloat y        = CGRectGetMinY(applicationFrame) / 2;
    CGFloat width    = CGRectGetWidth(applicationFrame);

    CGPoint toPoint   = self.view.center;
    CGPoint fromPoint = fromView.center;
    
    [CATransaction begin];
    [CATransaction setAnimationDuration:0.5f];
    [CATransaction setCompletionBlock:^{
        [fromView removeFromSuperview];
    }];
    
    CAAnimation *anim;
    anim = [CAKeyframeAnimation animationWithKeyPath:@"position"
                                            function:CubicEaseOut
                                           fromPoint:CGPointMake(toPoint.x - 80, toPoint.y - y)
                                             toPoint:toPoint];
    self.view.layer.position = toPoint;
    [self.view.layer addAnimation:anim forKey:@"position"];
    
    anim = [CAKeyframeAnimation animationWithKeyPath:@"transform.scale"
                                            function:CubicEaseOut
                                           fromValue:0.85f
                                             toValue:1.0f];
    [self.view.layer addAnimation:anim forKey:@"transform.scale"];
    
    anim = [CAKeyframeAnimation animationWithKeyPath:@"position"
                                            function:QuarticEaseOut
                                           fromPoint:fromPoint
                                             toPoint:CGPointMake(fromPoint.x + width, fromPoint.y)];
    fromView.layer.position = CGPointMake(fromPoint.x + width, fromPoint.y);
    [fromView.layer addAnimation:anim forKey:@"position"];

    [CATransaction commit];

    return fromViewController;
}

- (UINavigationItem *)popNavigationItemAnimated:(BOOL)animated;
{
    [self popViewControllerAnimated:NO];
    return nil;
}


#pragma mark -- private --

- (UIImageView *)createCaptureView
{
    UIGraphicsBeginImageContext(self.view.bounds.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    [self.view.layer renderInContext:context];
    
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    CGFloat width  = image.size.width  * image.scale;
    CGFloat height = image.size.height * image.scale;
    
    CGImageRef imageRef   = CGImageCreateWithImageInRect(image.CGImage, CGRectMake(0, 0, width, height));
    UIImage *captureImage = [[UIImage alloc] initWithCGImage:imageRef];
    CFRelease(imageRef);
    
    return [[UIImageView alloc] initWithImage:captureImage];
}

@end
