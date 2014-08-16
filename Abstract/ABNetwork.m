//
//  ABNetwork.m
//  Abstract
//
//  Created by Jon Como on 8/15/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import "ABNetwork.h"

#import "ABNetworkView.h"

@implementation ABNetwork

-(id)init
{
    if (self = [super init]) {
        //init
        _columns = [NSMutableArray array];
        
        for (int i = 0; i < 16; i++){
            [_columns addObject:[ABColumn new]];
        }
        
        for (int i = 0; i < 16; i++){
            ABColumn *column = _columns[i];
            column.index = i;
            for (ABNeuron *neuron in column.neurons){
                int index = [column.neurons indexOfObject:neuron];
                //link up to other neurons
                for (ABColumn *neighborColumn in _columns){
                    ABNeuron *neighborNeuron = neighborColumn.neurons[index];
                    [neuron.neighborNeurons addObject:neighborNeuron];
                    [neuron.neighborWeights addObject:@((float)(arc4random()%100)/100.0f)];
                }
            }
        }
    }
    
    return self;
}

-(void)inputActiveColumn:(NSArray *)indeces
{
    for (NSNumber *index in indeces){
        ABColumn *column = self.columns[[index intValue]];
        [column activate];
    }
    
    [self processState];
}

-(void)processState
{
    for (ABColumn *column in self.columns){
        [column processState];
    }
    
    //Update visualizaiton
    [self.view setNeedsDisplay];
}

-(NSArray *)activeColumns
{
    NSMutableArray *active = [NSMutableArray array];
    for (ABColumn *column in self.columns){
        if ([column isActive])
            [active addObject:column];
    }
    
    return active;
}

@end