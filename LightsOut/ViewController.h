//
//  ViewController.h
//  LightsOut
//
//  Created by 濁沼 広樹 on 12/07/27.
//  Copyright (c) 2012年 横浜国立大学. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AudioToolbox/AudioServices.h"

@interface ViewController : UIViewController{
    IBOutlet UIButton *button11;
    IBOutlet UIButton *button12;
    IBOutlet UIButton *button13;
    IBOutlet UIButton *button14;
    IBOutlet UIButton *button15;
    
    IBOutlet UIButton *button21;
    IBOutlet UIButton *button22;
    IBOutlet UIButton *button23;
    IBOutlet UIButton *button24;
    IBOutlet UIButton *button25;
    
    IBOutlet UIButton *button31;
    IBOutlet UIButton *button32;
    IBOutlet UIButton *button33;
    IBOutlet UIButton *button34;
    IBOutlet UIButton *button35;
    
    IBOutlet UIButton *button41;
    IBOutlet UIButton *button42;
    IBOutlet UIButton *button43;
    IBOutlet UIButton *button44;
    IBOutlet UIButton *button45;
    
    IBOutlet UIButton *button51;
    IBOutlet UIButton *button52;
    IBOutlet UIButton *button53;
    IBOutlet UIButton *button54;
    IBOutlet UIButton *button55;
    
    
    UIButton *resetBtn;
    
    NSMutableArray *reSetAry;
        
    NSInteger level;
    
}
- (IBAction)button11:(id)sender;
@property (weak, nonatomic) UIButton *button11;
- (IBAction)button12:(id)sender;
@property (weak, nonatomic) UIButton *button12;
- (IBAction)button13:(id)sender;
@property (weak, nonatomic) UIButton *button13;
- (IBAction)button14:(id)sender;
@property (weak, nonatomic) UIButton *button14;
- (IBAction)button15:(id)sender;
@property (weak, nonatomic) UIButton *button15;

- (IBAction)button21:(id)sender;
@property (weak, nonatomic) UIButton *button21;
- (IBAction)button22:(id)sender;
@property (weak, nonatomic) UIButton *button22;
- (IBAction)button23:(id)sender;
@property (weak, nonatomic) UIButton *button23;
- (IBAction)button24:(id)sender;
@property (weak, nonatomic) UIButton *button24;
- (IBAction)button25:(id)sender;
@property (weak, nonatomic) UIButton *button25;


- (IBAction)button31:(id)sender;
@property (weak, nonatomic) UIButton *button31;
- (IBAction)button32:(id)sender;
@property (weak, nonatomic) UIButton *button32;
- (IBAction)button33:(id)sender;
@property (weak, nonatomic) UIButton *button33;
- (IBAction)button34:(id)sender;
@property (weak, nonatomic) UIButton *button34;
- (IBAction)button35:(id)sender;
@property (weak, nonatomic) UIButton *button35;

- (IBAction)button41:(id)sender;
@property (weak, nonatomic) UIButton *button41;
- (IBAction)button42:(id)sender;
@property (weak, nonatomic) UIButton *button42;
- (IBAction)button43:(id)sender;
@property (weak, nonatomic) UIButton *button43;
- (IBAction)button44:(id)sender;
@property (weak, nonatomic) UIButton *button44;
- (IBAction)button45:(id)sender;
@property (weak, nonatomic) UIButton *button45;

- (IBAction)button51:(id)sender;
@property (weak, nonatomic) UIButton *button51;
- (IBAction)button52:(id)sender;
@property (weak, nonatomic) UIButton *button52;
- (IBAction)button53:(id)sender;
@property (weak, nonatomic) UIButton *button53;
- (IBAction)button54:(id)sender;
@property (weak, nonatomic) UIButton *button54;
- (IBAction)button55:(id)sender;
@property (weak, nonatomic) UIButton *button55;

- (IBAction)resetButton:(id)sender;
@property (weak, nonatomic) UIButton *resetBtn;

@property (retain, nonatomic) IBOutlet UILabel *LevelLabel;
@property (retain, nonatomic) IBOutlet UILabel *ScoreLabel;

- (IBAction)nextLevel:(id)sender;
- (IBAction)prevLevel:(id)sender;
- (IBAction)hintBtn:(id)sender;
@property (nonatomic, readwrite) NSInteger hint;


@property (nonatomic, readwrite) NSInteger level;
@property (nonatomic, readwrite) NSInteger score;


@end

