//
//  ABViewController.m
//  Abstract
//
//  Created by Jon Como on 8/15/14.
//  Copyright (c) 2014 Jon Como. All rights reserved.
//

#import "ABViewController.h"

#import "ABNetwork.h"
#import "ABNetworkView.h"

@interface ABViewController ()
{
    ABNetwork *network;
    ABNetworkView *netView;
}

@end

@implementation ABViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    network = [ABNetwork new];
    netView = [[ABNetworkView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, self.view.frame.size.width)];
    netView.network = network;
    network.view = netView;
    [self.view addSubview:netView];
    
    ABNeuron *outputNeuron = ((ABColumn *)network.columns[0]).neurons[0];
    outputNeuron.becameActive = ^(ABNeuron *neuron){
        NSLog(@"Caught the block");
    };
    
    NSLog(@"Active columns: %@", [network activeColumns]);
    
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(randomInput) userInfo:nil repeats:YES];
}

-(void)randomInput
{
    [network inputActiveColumn:@[@(arc4random()%16), @(arc4random()%16), @(arc4random()%16)]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end