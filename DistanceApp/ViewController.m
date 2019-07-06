//
//  ViewController.m
//  DistanceApp
//
//  Created by Amy Graff on 7/6/19.
//  Copyright © 2019 Amy Graff. All rights reserved.
//

#import "ViewController.h"
#import "DistanceGetter/DGDistanceRequest.h"

@interface ViewController ()

@property (nonatomic) DGDistanceRequest *req;

@property (weak, nonatomic) IBOutlet UITextField *startLocation;

@property (weak, nonatomic) IBOutlet UITextField *endLocation1;
@property (weak, nonatomic) IBOutlet UILabel *distance1;

@property (weak, nonatomic) IBOutlet UITextField *endLocation2;
@property (strong, nonatomic) IBOutlet UIView *distance2;

@property (weak, nonatomic) IBOutlet UITextField *endLocation3;
@property (weak, nonatomic) IBOutlet UILabel *distance3;

@property (weak, nonatomic) IBOutlet UIButton *calculateButton;

@end

@implementation ViewController

- (IBAction)calculateButtonTapped:(id)sender {
    
    self.calculateButton.enabled = NO;
    
    // allocate space for distance
    self.req = [DGDistanceRequest alloc];
    
    // Grab input from user
    NSString *start = self.startLocation.text;
    NSString *dest1 = self.endLocation1.text;
    NSString *dest2 = self.endLocation2.text;
    NSString *dest3 = self.endLocation3.text;
    
    // Construct an array for destinations
    NSArray *dests = @[dest1, dest2, dest3];
    
    // Initalize object with those starting points
    self.req = [self.req initWithLocationDescriptions:dests sourceDescription:start];
    
    // Callback function for DGDistance
    self.req.callback= ^(NSArray *responses){
        self.distance1.text = @"callback";
        self.calculateButton.enabled = YES;
        
    };
    // Call the function
    [self.req start];
}

@end
