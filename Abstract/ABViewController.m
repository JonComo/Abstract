//
//  ABViewController.m
//  Abstract
//
//  Created by Jon Como on 8/15/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import "ABViewController.h"

#import "ABNetwork.h"

@interface ABViewController ()
{
    ABNetwork *network;
}

@end

@implementation ABViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    network = [ABNetwork new];
    
    ABNeuron *outputNeuron = ((ABColumn *)network.columns[0]).neurons[0];
    outputNeuron.becameActive = ^(ABNeuron *neuron){
        NSLog(@"Caught the block");
    };
    
    [network inputActiveColumn:@[@0]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end