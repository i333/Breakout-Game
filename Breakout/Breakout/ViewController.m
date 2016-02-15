//
//  ViewController.m
//  Breakout
//
//  Created by Utku Dora on 13/02/16.
//  Copyright © 2016 Utku Dora Ozdemir. All rights reserved.
//

#import "ViewController.h"
#import "GameScreen.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *ScoreOutlet;

@end


@implementation ViewController
@synthesize gameScreen;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
 [gameScreen setBackgroundColor:[UIColor colorWithPatternImage:[UIImage imageNamed:@"background.jpg"]]];
 [gameScreen createPlayField];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
