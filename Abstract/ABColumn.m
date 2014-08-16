//
//  ABColumn.m
//  Abstract
//
//  Created by Jon Como on 8/15/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import "ABColumn.h"

@implementation ABColumn

-(id)init
{
    if (self = [super init]) {
        //init
        self.neurons = [NSMutableArray array];
        for (int i = 0; i<1; i++){
            ABNeuron *neuron = [ABNeuron new];
            neuron.column = self;
            [self.neurons addObject:neuron];
        }
    }
    
    return self;
}

-(void)activate
{
    for (ABNeuron *neuron in self.neurons){
        [neuron activate];
    }
}

-(void)processState
{
    for (ABNeuron *neuron in self.neurons){
        [neuron processState];
    }
}

-(void)neuronWasPredictive:(ABNeuron *)neuron
{
    for (ABNeuron *vertNeuron in self.neurons){
        if (vertNeuron == neuron) continue;
        vertNeuron.energy = 0;
    }
}

@end
