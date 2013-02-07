//
//  NNNetworkView.m
//  MyNeuralNetwork
//
//  Created by Jon Como on 11/26/12.
//  Copyright (c) 2012 Jon Como. All rights reserved.
//

#import "NNNetworkView.h"
#import "NNNeuron.h"

@implementation NNNetworkView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
    
    CGContextRef contextRef = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(contextRef, 1);
    
    for (NNNeuron *neuron in _neurons)
    {
        //CGContextSetRGBFillColor(contextRef, neuron.chargeAmplitude/20, neuron.chargeAmplitude/20, neuron.chargeAmplitude, 1);
        CGContextSetRGBStrokeColor(contextRef, neuron.chargeAmplitude/20, neuron.chargeAmplitude/20, neuron.chargeAmplitude, 1);
        
        //CGContextFillEllipseInRect(contextRef, CGRectMake(neuron.somaLocation.x - 10, neuron.somaLocation.y - 10, 20, 20));
        
        //Axon line
        CGContextMoveToPoint(contextRef, neuron.somaLocation.x, neuron.somaLocation.y);
        CGContextAddLineToPoint(contextRef, neuron.axonEndLocation.x, neuron.axonEndLocation.y);
        
        //Axon dendrite lines
        for (NNNeuron *childNeuron in neuron.childrenNeurons)
        {
            CGContextMoveToPoint(contextRef, neuron.axonEndLocation.x, neuron.axonEndLocation.y);
            CGContextAddLineToPoint(contextRef, childNeuron.somaLocation.x, childNeuron.somaLocation.y);
        }
        
        CGContextStrokePath(contextRef);
    }
}


@end
