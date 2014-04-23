//
//  ModalViewController.h
//  CVTransitionDemo
//
//  Created by Taagoo'iMac on 14-4-23.
//  Copyright (c) 2014年 Taagoo. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ModalViewController;
@protocol ModalViewControllereDelegate <NSObject>

-(void) modalViewControllerDidClickedDismissButton:(ModalViewController*)viewController;

@end

@interface ModalViewController : UIViewController

@property (nonatomic, weak)id<ModalViewControllereDelegate> delegate;


@end
