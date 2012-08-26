//
//  ViewController.m
//  LightsOut
//
//  Created by 濁沼 広樹 on 12/07/27.
//  Copyright (c) 2012年 横浜国立大学. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController
@synthesize LevelLabel;
@synthesize ScoreLabel;
@synthesize level;
@synthesize score;
@synthesize hint;
@synthesize resetBtn;

@synthesize button11;
@synthesize button12;
@synthesize button13;
@synthesize button14;
@synthesize button15;

@synthesize button21;
@synthesize button22;
@synthesize button23;
@synthesize button24;
@synthesize button25;

@synthesize button31;
@synthesize button32;
@synthesize button33;
@synthesize button34;
@synthesize button35;

@synthesize button41;
@synthesize button42;
@synthesize button43;
@synthesize button44;
@synthesize button45;

@synthesize button51;
@synthesize button52;
@synthesize button53;
@synthesize button54;
@synthesize button55;




- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    //reSetArray
    reSetAry = [[NSMutableArray alloc] init];
    
    //初期レベルの設定(最初は1)
    self.level = 1;
    self.LevelLabel.text = [NSString stringWithFormat:@"%d", self.level];
    
    //初期スコアの設定(最初は0)
    self.score = 0;
    self.ScoreLabel.text = [NSString stringWithFormat:@"%d", self.score];
    
    //ヒントをレベルと同じにする
    self.hint = self.level;
    
    //バックグラウンドを配置
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"back.png"]];
    [self.view addSubview:background];
    [self.view sendSubviewToBack:background];
    [background release];
    
    
    //最初の問題をセット
    [self preSet:self.level];
    
    
}
/* 問題プリセット */
- (void)preSet:(int)Level{
    
    //初期化
    UIImage *on = [UIImage imageNamed:@"notLight.png"];
    for (int i= 0; i < 5 ;i++) {
        for(int j=0; j < 5 ;j++){
            UIButton *btn = (UIButton*) [self.view viewWithTag:((i*5)+j)+1000];
            [btn setTitle:@"1" forState:UIControlStateNormal];
            [btn setImage:on forState:UIControlStateNormal];
        }
    }
    
    //問題をランダムに作成
    int pushBtn = 0;
    reSetAry = [[NSMutableArray alloc] init];
    srand(time(NULL));
    for(int k=0; k < Level; k++){
        pushBtn = rand() % 25;
        UIButton *randBtn = (UIButton*) [self.view viewWithTag:(1000 + pushBtn)];
        [self rvsBtn:randBtn];
        
        //リセットするための記憶
        NSNumber *NSpushBtn = [NSNumber numberWithInt:pushBtn];
        [reSetAry addObject:NSpushBtn];
    }
}

/* 問題リセット */
- (void)reSet:(int)Level{
    
    //初期化
    UIImage *on = [UIImage imageNamed:@"notLight.png"];
    for (int i= 0; i < 5 ;i++) {
        for(int j=0; j < 5 ;j++){
            UIButton *btn = (UIButton*) [self.view viewWithTag:((i*5)+j)+1000];
            [btn setTitle:@"1" forState:UIControlStateNormal];
            [btn setImage:on forState:UIControlStateNormal];
        }
    }
    
    //最初の状態に戻す
    for(int i=0;i<Level;i++){
        int reSetBtnNum = [[reSetAry objectAtIndex:i] intValue];
        
        UIButton *reSetBtn = (UIButton*)[self.view viewWithTag:1000 + reSetBtnNum];
        [self rvsBtn:reSetBtn];
    }
    
}


/* 成功判定 */
- (void)judge{
    int count=0;
    for (int i= 0; i < 5 ;i++) {
        for(int j=0; j < 5 ;j++){
            UIButton *btn = (UIButton*) [self.view viewWithTag:((i*5)+j)+1000];
            if([[btn currentTitle] isEqual:@"1"]) {
                count++;
            }else{
                break;
            }
        }
    }
    if(count == 25){
        
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Success!" message:@"next" delegate:self cancelButtonTitle:@"same Level" otherButtonTitles:@"next Level", nil];
        [alert show];
        [alert release];
        
        //成功したらスコアがアップ
        self.score += 50*self.level;
        self.ScoreLabel.text = [NSString stringWithFormat:@"%d", self.score];
    }
}

- (void)alertView:(UIAlertView*)alertView clickedButtonAtIndex:(NSInteger)buttonIndex{
    switch (buttonIndex) {
        case 0:
            //同じレベルをキープしてもスコアが下がる
            self.score -= 50;
            //キープの場合hintをレベルと同じ値にする
            self.hint = self.level;
            ScoreLabel.text = [NSString stringWithFormat:@"%d", self.score];
            [self preSet:self.level];
            break;
        case 1:
            self.level++;
            //レベルが上がるとヒント配列も上がる
            self.hint = self.level;
            self.LevelLabel.text = [NSString stringWithFormat:@"%d", self.level];
            [self preSet:self.level];
            break;
        default:
            break;
    }
}

/* 反転するコア */
- (void)rvsBtnCore:(UIButton*)btn:(int)n{
    UIButton *rvsBtn = (UIButton*)[self.view viewWithTag:(btn.tag + n)];
    UIImage *off = [UIImage imageNamed:@"Light.png"];
    UIImage *on = [UIImage imageNamed:@"notLight.png"];
    if([[rvsBtn currentTitle] isEqual:@"1"]){
        [rvsBtn setTitle:@"0" forState:UIControlStateNormal];
        [rvsBtn setImage:off forState:UIControlStateNormal];
    }else{
        [rvsBtn setTitle:@"1" forState:UIControlStateNormal];
        [rvsBtn setImage:on forState:UIControlStateNormal];
    }
}

/* 反転する */
- (void)rvsBtn:(UIButton*)btn{
    int x=0;
    
    x = btn.tag - 1000;
    
    if(x < 5){
        if((x%5) == 0){
            int n[3] = {0,1,5};
            for(int i=0;i < 3; i++){
                [self rvsBtnCore:btn :n[i]];
            }
            
        }else if((x%5) == 4){
            int n[3] = {-1,0,5};
            for(int i=0;i < 3; i++){
                [self rvsBtnCore:btn :n[i]];
            }
        }else{
            int n[4] = {-1,0,1,5};
            for(int i=0;i < 4; i++){
                [self rvsBtnCore:btn :n[i]];
            }
        }
    }else if(x > 19){
        if((x%5) == 0){
            int n[3] = {-5,0,1};
            for(int i=0;i < 3; i++){
                [self rvsBtnCore:btn :n[i]];
            }
        }else if((x%5) == 4){
            int n[3] = {-5,-1,0};
            for(int i=0;i < 3; i++){
                [self rvsBtnCore:btn :n[i]];
            }
        }else{
            int n[4] = {-5,-1,0,1};
            for(int i=0;i < 4; i++){
                [self rvsBtnCore:btn :n[i]];
            }
        }
    }else {
        if((x%5) == 0){
            int n[4] = {-5,0,1,5};
            for(int i=0;i < 4; i++){
                [self rvsBtnCore:btn :n[i]];
            }
        }else if((x%5) == 4){
            int n[4] = {-5,-1,0,5};
            for(int i=0;i < 4; i++){
                [self rvsBtnCore:btn :n[i]];
            }
        }else{
            int n[5] = {-5,-1,0,1,5};
            for(int i=0;i < 5; i++){
                [self rvsBtnCore:btn :n[i]];
            }
        }
    }
}




- (void)viewDidUnload
{
    [self setButton15:nil];
    [self setLevelLabel:nil];
    [self setScoreLabel:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    
    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

- (IBAction)button11:(id)sender {
    
    [self rvsBtn:button11];
    
    [self judge];
}

- (IBAction)button12:(id)sender {
    [self rvsBtn:button12];
    [self judge];
}

- (IBAction)button13:(id)sender {
    [self rvsBtn:button13];
    [self judge];
}

- (IBAction)button14:(id)sender {
    [self rvsBtn:button14];
    [self judge];
}

- (IBAction)button15:(id)sender {
    [self rvsBtn:button15];
    [self judge];
}

- (IBAction)button21:(id)sender {
    [self rvsBtn:button21];
    
    [self judge];
    
}

- (IBAction)button22:(id)sender {
    [self rvsBtn:button22];
    
    [self judge];
}

- (IBAction)button23:(id)sender {
    [self rvsBtn:button23];
    
    [self judge];
}

- (IBAction)button24:(id)sender {
    [self rvsBtn:button24];
    
    [self judge];
}

- (IBAction)button25:(id)sender {
    [self rvsBtn:button25];
    
    [self judge];
}

- (IBAction)button31:(id)sender {
    [self rvsBtn:button31];
    
    [self judge];
}

- (IBAction)button32:(id)sender {
    [self rvsBtn:button32];
    
    [self judge];
}

- (IBAction)button33:(id)sender {
    [self rvsBtn:button33];
    
    [self judge];
}
- (IBAction)button34:(id)sender {
    [self rvsBtn:button34];
    [self judge];
}
- (IBAction)button35:(id)sender {
    [self rvsBtn:button35];
    
    [self judge];
}


- (IBAction)button41:(id)sender {
    [self rvsBtn:button41];
    
    [self judge];
}
- (IBAction)button42:(id)sender {
    [self rvsBtn:button42];
    
    [self judge];
}

- (IBAction)button43:(id)sender {
    [self rvsBtn:button43];
    
    [self judge];
    
}

- (IBAction)button44:(id)sender {
    [self rvsBtn:button44];
    
    [self judge];
}

- (IBAction)button45:(id)sender {
    [self rvsBtn:button45];
    
    [self judge];
}

- (IBAction)button51:(id)sender {
    [self rvsBtn:button51];
    [self judge];
}

- (IBAction)button52:(id)sender {
    [self rvsBtn:button52];
    
    [self judge];
    
}

- (IBAction)button53:(id)sender {
    [self rvsBtn:button53];
    [self judge];
}

- (IBAction)button54:(id)sender {
    [self rvsBtn:button54];
    
    [self judge];
}

- (IBAction)button55:(id)sender {
    [self rvsBtn:button55];
    
    [self judge];
}
- (IBAction)resetButton:(id)sender {
    //リセットしたらスコアがダウン
    self.score -= 50;
    self.ScoreLabel.text = [NSString stringWithFormat:@"%d", self.score];
    [self reSet:self.level];
}

- (void)dealloc {
    [reSetAry release];
    [button15 release];
    [LevelLabel release];
    [ScoreLabel release];
    [super dealloc];
}
- (IBAction)nextLevel:(id)sender {
    
    self.level++;
    self.hint = self.level;
    LevelLabel.text = [NSString stringWithFormat:@"%d", self.level];
    [self preSet:self.level];
}

- (IBAction)prevLevel:(id)sender {
    
    if(self.level == 1){
        self.level = 1;
    }else{
        self.level--;
    }
    //レベルを下げるとスコアも下がる
    self.score -= 50;
    self.ScoreLabel.text = [NSString stringWithFormat:@"%d", self.score];
    self.hint = self.level;
    LevelLabel.text = [NSString stringWithFormat:@"%d", self.level];
    ScoreLabel.text = [NSString stringWithFormat:@"%d", self.score];
    [self preSet:self.level];
}


/* hintボタン */
- (IBAction)hintBtn:(id)sender {
    if(self.hint != 0){
        self.score -= 50;
        self.ScoreLabel.text = [NSString stringWithFormat:@"%d", self.score];
        int hintBtnNum = [[reSetAry objectAtIndex:(self.hint - 1)] intValue];
        UIButton *flashBtn = (UIButton *)[self.view viewWithTag:1000+hintBtnNum];
        [flashBtn setImage:[UIImage imageNamed:@"hintLight.png"] forState:UIControlStateNormal];
        self.hint--;
    }
}
@end
