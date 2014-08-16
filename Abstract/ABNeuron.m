//
//  ABNeuron.m
//  Abstract
//
//  Created by Jon Como on 8/16/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import "ABNeuron.h"

#import "ABColumn.h"

@implementation ABNeuron

-(id)init
{
    if (self = [super init]) {
        //init
        _neighborNeurons = [NSMutableArray array];
        _neighborWeights = [NSMutableArray array];
    }
    
    return self;
}

-(void)activate
{
    if (self.energy > 0.2){
        NSLog(@"Neuron: <%p> predicted", self);
        [self.column neuronWasPredictive:self];
        //strengthen connections to previously active neurons
    }else{
        NSLog(@"Neuron: <%p> activated", self);
    }
    
    if (self.becameActive) self.becameActive(self);
    
    self.energy = 1;
}

-(void)processState
{
    self.energy *= 0.8;
}

@end
