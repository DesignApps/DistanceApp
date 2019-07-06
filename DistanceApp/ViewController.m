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
@property (weak, nonatomic) IBOutlet UILabel *distance2;

@property (weak, nonatomic) IBOutlet UITextField *endLocation3;
@property (weak, nonatomic) IBOutlet UILabel *distance3;

@property (weak, nonatomic) IBOutlet UISegmentedControl *unitController;
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
    
    
    // Copy of the reference to self  __weak
    __weak ViewController *weakSelf = self;
    
    // Callback function for DGDistance
    self.req.callback= ^(NSArray *responses){
    
        ViewController *strongSelf = weakSelf;
        if(!strongSelf) return;
        
        // Flag that response is good
        NSNull *badResult = [NSNull null];
        
        // For distance1
        if(responses [0] != badResult){
            double num;
            
            //Convert
            if(strongSelf.unitController.selectedSegmentIndex == 0){
                num = ([responses[0] floatValue]/1.0);
                NSString *x = [NSString stringWithFormat:@"%.2f m", num];
                strongSelf.distance1.text = x;
            }
                
                else if(strongSelf.unitController.selectedSegmentIndex == 1){
                num = ([responses[0] floatValue]/1000.0);
                NSString *x = [NSString stringWithFormat:@"%.2f km", num];
                strongSelf.distance1.text = x;
                }
            else {
                num = ([responses[0] floatValue]/1609.344);
                NSString *x = [NSString stringWithFormat:@"%.2f mi", num];
                strongSelf.distance1.text = x;
                }
        }
        else {
            strongSelf.distance1.text = @"Error";
        }
        
        // For distance2
        if(responses [1] != badResult){
            double num;
            
            //Convert
            if(strongSelf.unitController.selectedSegmentIndex == 0){
                num = ([responses[1] floatValue]/1.0);
                NSString *x = [NSString stringWithFormat:@"%.2f m", num];
                strongSelf.distance2.text = x;
            }
            
            else if(strongSelf.unitController.selectedSegmentIndex == 1){
                num = ([responses[1] floatValue]/1000.0);
                NSString *x = [NSString stringWithFormat:@"%.2f km", num];
                strongSelf.distance2.text = x;
            }
            else {
                num = ([responses[1] floatValue]/1609.344);
                NSString *x = [NSString stringWithFormat:@"%.2f mi", num];
                strongSelf.distance2.text = x;
            }
        }
        else {
            strongSelf.distance2.text = @"Error";
        }
        
        // For distance3
        if(responses [2] != badResult){
            double num;
            
            //Convert
            if(strongSelf.unitController.selectedSegmentIndex == 0){
                num = ([responses[2] floatValue]/1.0);
                NSString *x = [NSString stringWithFormat:@"%.2f m", num];
                strongSelf.distance3.text = x;
            }
            
            else if(strongSelf.unitController.selectedSegmentIndex == 1){
                num = ([responses[2] floatValue]/1000.0);
                NSString *x = [NSString stringWithFormat:@"%.2f km", num];
                strongSelf.distance3.text = x;
            }
            else {
                num = ([responses[2] floatValue]/1609.344);
                NSString *x = [NSString stringWithFormat:@"%.2f mi", num];
                strongSelf.distance3.text = x;
            }
        }
        else {
            strongSelf.distance3.text = @"Error";
        }
        
        // Now use strongSelf instead of self
        strongSelf.req = nil;
        strongSelf.calculateButton.enabled = YES;
        
    };
    // Call the function
    [self.req start];
}

@end
