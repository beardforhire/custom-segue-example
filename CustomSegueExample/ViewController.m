//
//  ViewController.m
//  CustomSegueExample
//
//  Created by Shaun Lewis on 2/1/15.
//  Copyright (c) 2015 Shaun Lewis. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	// Setup a background pattern to make the segue more obvious
	// Pattern found on ColourLovers: http://www.colourlovers.com/pattern/1027817/Youre_the_Only_One
	[self.view setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"pattern.png"]]];
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

@end
