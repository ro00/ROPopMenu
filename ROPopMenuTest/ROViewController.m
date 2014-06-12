//
//  ROViewController.m
//  ROPopMenuTest
//
//  Created by iamro on 14-5-4.
//  Copyright (c) 2014年 iamro. All rights reserved.
//

#import "ROViewController.h"
#import "ROPopMenu.h"

@interface ROViewController ()

@end

@implementation ROViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    ROPopMenu *menu = [[ROPopMenu alloc] initWithIconImages:@[]];
    [self.view addSubview:menu];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
