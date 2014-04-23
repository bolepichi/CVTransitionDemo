//
//  MainViewController.m
//  CVTransitionDemo
//
//  Created by Taagoo'iMac on 14-4-23.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import "MainViewController.h"

#import "ModalViewController.h"

#import "BouncePresentAnimation.h"

#import "NormalDismissAnimation.h"

#import "SwipeUpInteractiveTransition.h"


@interface MainViewController ()<ModalViewControllereDelegate, UIViewControllerTransitioningDelegate>


@property (nonatomic, strong) BouncePresentAnimation *presentAnimation;

@property (nonatomic, strong) NormalDismissAnimation *dismissAnimation;

@property (nonatomic, strong) SwipeUpInteractiveTransition *transitionController;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
        
        _presentAnimation = [BouncePresentAnimation new];
        
        _dismissAnimation = [NormalDismissAnimation new];
        
        _transitionController = [SwipeUpInteractiveTransition new];
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view
    UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    button.frame = CGRectMake(80.0, 210.0, 160.0, 40.0);
    [button setTitle:@"Clik me" forState:UIControlStateNormal];
    [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    
}


- (void) buttonClicked:(id)sender{
    ModalViewController *mvc = [[ModalViewController alloc]init];
    mvc.delegate = self;
    mvc.transitioningDelegate =self;
    
    [self.transitionController wireToViewController:mvc];
    
    [self presentViewController:mvc animated:YES completion:nil];
}


- (void)modalViewControllerDidClickedDismissButton:(ModalViewController *)viewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
}


-(id <UIViewControllerAnimatedTransitioning>)animationControllerForPresentedController:(UIViewController *)presented presentingController:(UIViewController *)presenting sourceController:(UIViewController *)source
{
    return self.presentAnimation;
}


-(id <UIViewControllerAnimatedTransitioning>)animationControllerForDismissedController:(UIViewController *)dismissed{
    return self.dismissAnimation;
}

-(id<UIViewControllerInteractiveTransitioning>)interactionControllerForDismissal:(id<UIViewControllerAnimatedTransitioning>)animator {
    return self.transitionController.interacting ? self.transitionController : nil;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
