//
//  NNViewController.m
//  MyNeuralNetwork
//
//  Created by Jon Como on 11/25/12.
//  Copyright (c) 2012 Jon Como. All rights reserved.
//

#import "NNViewController.h"
#import "NNNetwork.h"

@interface NNViewController () <NNNetworkDelegate>
{
    NNNetwork *network;
}

@end

@implementation NNViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    network = [[NNNetwork alloc] initWithDelegate:self];
    [self generateNewNetwork];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma Touches

-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    CGPoint touchPoint = [[touches anyObject] locationInView:networkView];
    [network tapNetworkAtPoint:touchPoint withCharge:1];
}

#pragma NNNetwork delegate

-(void)networkGenerated:(NNNetwork *)network withNeurons:(NSArray *)neurons
{
    [activityView stopAnimating];
    networkView.neurons = neurons;
}

-(void)displayNetwork:(NNNetwork *)network withNeurons:(NSArray *)neurons
{
    [networkView setNeedsDisplay];
}

- (IBAction)reorient:(id)sender
{
    [network reorientNeurons];
}

- (IBAction)reinforcementChanged:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
            network.beneficialCoefficient = -1;
            break;
        
        case 1:
            network.beneficialCoefficient = 1;
            break;
            
        default:
            break;
    }
}

- (IBAction)zeroCharges:(id)sender
{
    [network setAllCharges:0];
}

- (IBAction)newNetwork:(id)sender
{
    [self generateNewNetwork];
}

-(void)generateNewNetwork
{
    [network generateNetworkWithNeuronCount:2000 size:CGSizeMake(320, 320)];
}

@end
