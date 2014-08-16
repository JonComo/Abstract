//
//  ABColumn.h
//  Abstract
//
//  Created by Jon Como on 8/15/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "ABNeuron.h"

@interface ABColumn : NSObject

@property (nonatomic, strong) NSMutableArray *neurons;

-(void)activate;
-(void)processState;

-(void)neuronWasPredictive:(ABNeuron *)neuron;

@end