
//
//  GameScreen.h
//  Breakout
//
//  Created by Utku Dora on 13/02/16.
//  Copyright © 2016 Utku Dora Ozdemir. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GameScreen : UIImageView
{
	float dx, dy;
    
}
@property (nonatomic, strong) UIImageView *paddle;
@property (nonatomic, strong) UIImageView *ball;
@property (nonatomic, strong) UIView *block;
@property (nonatomic, strong) NSTimer *timer;

-(void)createPlayField;

@end
