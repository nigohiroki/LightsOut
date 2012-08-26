//
//  StartViewController.m
//  LightsOut
//
//  Created by 濁沼 広樹 on 12/07/28.
//  Copyright (c) 2012年 横浜国立大学. All rights reserved.
//

#import "StartViewController.h"
#import "ViewController.h"

@interface StartViewController ()

@end

@implementation StartViewController
@synthesize startBtn;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"start.png"]];
    UIImage *startBtnImage = [UIImage imageNamed:@"startBtn.png"];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    [self.startBtn setImage:startBtnImage forState:UIControlStateNormal];
    
}

- (void)viewDidUnload
{
    [self setStartBtn:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

/*
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([[segue identifier] isEqualToString:@"startSegue"]){
        ViewController *viewController = [segue destinationViewController];
        NSInteger level = (int)self.levelField.text;
        viewController.level = level;
    }
}
 */

- (void)dealloc {
    [startBtn release];
    [super dealloc];
}
@end
