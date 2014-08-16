//
//  ABNeuron.h
//  Abstract
//
//  Created by Jon Como on 8/16/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import <Foundation/Foundation.h>

@class ABNeuron;
@class ABColumn;

typedef void (^BecameActive)(ABNeuron *neuron);

@interface ABNeuron : NSObject

@property (nonatomic, strong) NSMutableArray *neighborNeurons;
@property (nonatomic, strong) NSMutableArray *neighborWeights;

@property (copy) BecameActive becameActive;

@property float energy; //holds recent activity rate
@property (nonatomic, weak) ABColumn *column;

-(void)activate;
-(void)processState;

@end