//
//  ViewController.h
//  Breakout
//
//  Created by Utku Dora on 13/02/16.
//  Copyright © 2016 Utku Dora Ozdemir. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GameScreen.h"

@interface ViewController : UIViewController

@property (weak, nonatomic) IBOutlet GameScreen *gameScreen;

@end

