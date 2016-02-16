
//
//  GameScreen.m
//  Breakout
//
//  Created by Utku Dora on 13/02/16.
//  Copyright © 2016 Utku Dora Ozdemir. All rights reserved.
//

#import "GameScreen.h"

@implementation GameScreen
@synthesize paddle, ball,block;
@synthesize timer;
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/


NSMutableArray *blocks;
int difficulty;
-(void)createPlayField





{difficulty = 0 ;
     blocks = [[NSMutableArray alloc] init];
//first line
    
    for (int i =0 ;i<10 ;i++ ){
    UIImageView *block1;
        block1 = [[UIImageView alloc] initWithFrame:CGRectMake(40+i*70, 40, 60, 30)];
          block1.image = [UIImage imageNamed:@"block.png"];
        [self addSubview:block1];
        [block1 setBackgroundColor:[UIColor blackColor]];
        [blocks addObject:block1];
    
    
    }
    
    
    for (int i =0 ;i<10 ;i++ ){
        UIView *block1;
         block1 = [[UIView alloc] initWithFrame:CGRectMake(40+i*70, 80, 60, 30)];
        [self addSubview:block1];
        [block1 setBackgroundColor:[UIColor redColor]];
        [blocks addObject:block1];
        
        
    }
    
    for (int i =0 ;i<10 ;i++ ){
        UIView *block1;
             block1 = [[UIView alloc] initWithFrame:CGRectMake(40+i*70, 120, 60, 30)];
        [self addSubview:block1];
        [block1 setBackgroundColor:[UIColor blueColor]];
        [blocks addObject:block1];
        
        
    }
    
    for (int i =0 ;i<10 ;i++ ){
        UIView *block1;
             block1 = [[UIView alloc] initWithFrame:CGRectMake(40+i*70, 160, 60, 30)];
        [self addSubview:block1];
        [block1 setBackgroundColor:[UIColor purpleColor]];
        [blocks addObject:block1];
        
        
    }
    
    for (int i =0 ;i<10 ;i++ ){
        UIView *block1;
        block1 = [[UIView alloc] initWithFrame:CGRectMake(40+i*70, 200, 60, 30)];
        [self addSubview:block1];
        [block1 setBackgroundColor:[UIColor grayColor]];
        [blocks addObject:block1];
        
        
    }
    
    
    for (int i =0 ;i<10 ;i++ ){
        UIImageView *block1;
        block1 = [[UIImageView alloc] initWithFrame:CGRectMake(40+i*70, 240, 60, 30)];
        block1.image = [UIImage imageNamed:@"block.png"];
        [self addSubview:block1];
          [block1 setBackgroundColor:[UIColor blackColor]];
        [blocks addObject:block1];
        
        
    }

    

	paddle = [[UIImageView alloc] initWithFrame:CGRectMake(520, 800, 160, 80)];
    paddle.image = [UIImage imageNamed:@"paddle-red.png"];
	[self addSubview:paddle];
	[paddle setBackgroundColor:[UIColor blackColor]];
    
  

    
    
	ball = [[UIImageView alloc] initWithFrame:CGRectMake(400, 400, 40, 40)];
    ball.image = [UIImage imageNamed:@"ball-blue.png"];
	[self addSubview:ball];
	//[ball setBackgroundColor:[UIColor redColor]];
	
 
    
    
	dx = 25;
	dy = 25;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	for (UITouch *t in touches)
	{
		CGPoint p = [t locationInView:self];
        
        p.y = 800-difficulty*10;
		[paddle setCenter:p];
	}
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	[self touchesBegan:touches withEvent:event];
}

-(IBAction)startAnimation:(id)sender
{
	timer = [NSTimer scheduledTimerWithTimeInterval:.05	target:self selector:@selector(timerEvent:) userInfo:nil repeats:YES];

}

-(IBAction)stopAnimation:(id)sender
{
	[timer invalidate];
    
}

-(void)timerEvent:(id)sender
{
	CGRect bounds = [self bounds]; // sets self bounds to "bounds"
	
	// NSLog(@"Timer event.");
	CGPoint p = [ball center];

	if ((p.x + dx) < 0)
		dx = -dx;
	
	if ((p.y + dy) < 0)
		dy = -dy;
	
	if ((p.x + dx) > bounds.size.width)
		dx = -dx;
	
    if ((p.y + dy) > bounds.size.height){
		dy = -dy;
    [timer invalidate];
    }
	p.x += dx;
	p.y += dy;
	[ball setCenter:p];
	
	// Now check to see if we intersect with paddle.  If the movement
	// has placed the ball inside the paddle, we reverse that motion
	// in the Y direction.
	if (CGRectIntersectsRect([ball frame], [paddle frame]))
    {   dx = dx+8; // to make sure it doesnt get stuck
		dy = -dy;
		p.y += 2*dy;
		[ball setCenter:p];
        
        UIImage * toImage = [UIImage imageNamed:@"paddle-red.png"];
        [UIView transitionWithView:paddle
                          duration:0.2f
                           options:UIViewAnimationOptionTransitionCrossDissolve
                        animations:^{
                            paddle.image = toImage;
                        } completion:nil];
        

        
        
        
        
	}
	
    
    for (UIView *block1 in blocks){
        
        if (CGRectIntersectsRect([ball frame], [block1 frame]))
        {
            if(block1.backgroundColor == [UIColor blackColor]){
            
            
                
                UIImage * toImage = [UIImage imageNamed:@"paddle-1.png"];
                [UIView transitionWithView:paddle
                                  duration:0.2f
                                   options:UIViewAnimationOptionTransitionCrossDissolve
                                animations:^{
                                    paddle.image = toImage;
                                } completion:nil];

            
            
            
            }
            else{
            
            
                
                            UIImage * toImage = [UIImage imageNamed:@"paddle-blue.png"];
                            [UIView transitionWithView:paddle
                                              duration:0.2f
                                               options:UIViewAnimationOptionTransitionCrossDissolve
                                            animations:^{
                                                paddle.image = toImage;
                                            } completion:nil];
                            

            
            
            }
            [block1 setBackgroundColor:[UIColor grayColor]];
            block1.bounds = CGRectMake(0, 0, 0, 0);
            block1.frame = CGRectMake(0, 0, 0, 0);
            dx = 25;
            dy = -dy;
            p.y += 2*dy;
            difficulty++;
            
            [paddle setFrame:CGRectMake([paddle frame].origin.x, [paddle frame].origin.y, 160-2*difficulty, 60)];
            
            [ball setFrame:CGRectMake([ball frame].origin.x, [ball frame].origin.y, 20+difficulty, 20+difficulty)];
            [ball setCenter:p];
            
//
        }

        
    }
    
    

}

@end
