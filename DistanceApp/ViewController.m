//
//  ViewController.m
//  DistanceApp
//
//  Created by Amy Graff on 7/6/19.
//  Copyright © 2019 Amy Graff. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
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
    
    self.distance3.text = @"It worked";
}




@end
