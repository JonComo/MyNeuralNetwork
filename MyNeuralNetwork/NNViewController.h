//
//  NNViewController.h
//  MyNeuralNetwork
//
//  Created by Jon Como on 11/25/12.
//  Copyright (c) 2012 Jon Como. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NNNetworkView.h"

@interface NNViewController : UIViewController
{
    __weak IBOutlet NNNetworkView *networkView;
    
    __weak IBOutlet UIActivityIndicatorView *activityView;
}

- (IBAction)reorient:(id)sender;

- (IBAction)reinforcementChanged:(UISegmentedControl *)sender;

- (IBAction)zeroCharges:(id)sender;

- (IBAction)newNetwork:(id)sender;

@end