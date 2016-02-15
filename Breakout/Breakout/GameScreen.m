
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
        block1 = [[UIImageView alloc] initWithFrame:CGRectMake(10+i*70, 40, 60, 30)];
          block1.image = [UIImage imageNamed:@"block.png"];
        [self addSubview:block1];
      //  [block1 setBackgroundColor:[UIColor greenColor]];
        [blocks addObject:block1];
    
    
    }
    
    
    for (int i =0 ;i<10 ;i++ ){
        UIView *block1;
         block1 = [[UIView alloc] initWithFrame:CGRectMake(10+i*70, 80, 60, 30)];
        [self addSubview:block1];
        [block1 setBackgroundColor:[UIColor redColor]];
        [blocks addObject:block1];
        
        
    }
    
    for (int i =0 ;i<10 ;i++ ){
        UIView *block1;
             block1 = [[UIView alloc] initWithFrame:CGRectMake(10+i*70, 120, 60, 30)];
        [self addSubview:block1];
        [block1 setBackgroundColor:[UIColor blueColor]];
        [blocks addObject:block1];
        
        
    }
    
    for (int i =0 ;i<10 ;i++ ){
        UIView *block1;
             block1 = [[UIView alloc] initWithFrame:CGRectMake(10+i*70, 160, 60, 30)];
        [self addSubview:block1];
        [block1 setBackgroundColor:[UIColor purpleColor]];
        [blocks addObject:block1];
        
        
    }
	paddle = [[UIView alloc] initWithFrame:CGRectMake(20, 40, 60, 20)];
	[self addSubview:paddle];
	[paddle setBackgroundColor:[UIColor blackColor]];
    
//    block = [[UIView alloc] initWithFrame:CGRectMake(20, 40, 60, 30)];
//    [self addSubview:block];
//    [block setBackgroundColor:[UIColor greenColor]];
// 
//	
//    block1 = [[UIView alloc] initWithFrame:CGRectMake(100, 40, 60, 30)];
//    [self addSubview:block1];
//    [block1 setBackgroundColor:[UIColor greenColor]];
//    
//    block2 = [[UIView alloc] initWithFrame:CGRectMake(100, 40, 60, 30)];
//    [self addSubview:block2];
//    [block2 setBackgroundColor:[UIColor greenColor]];
//    
//    block3 = [[UIView alloc] initWithFrame:CGRectMake(180, 40, 60, 30)];
//    [self addSubview:block3];
//    [block3 setBackgroundColor:[UIColor greenColor]];
//    
//    block = [[UIView alloc] initWithFrame:CGRectMake(260, 40, 60, 30)];
//    [self addSubview:block];
//    [block setBackgroundColor:[UIColor greenColor]];
    
    
	ball = [[UIImageView alloc] initWithFrame:CGRectMake(400, 400, 20, 20)];
    ball.image = [UIImage imageNamed:@"ball.png"];
	[self addSubview:ball];
	//[ball setBackgroundColor:[UIColor redColor]];
	
    
    
//    
//        CGFloat w = self.paddle.bounds.size.width  / sqrtf( 2.0f );
//        CGFloat h = self.paddle.bounds.size.height / sqrtf( 2.0f );
//        NSLog( @"%@ w=%f", NSStringFromCGRect( self.paddle.bounds ), w );
//    
//        [UIView animateWithDuration:.5 animations:^{
//            self.paddle.transform = CGAffineTransformMakeRotation(M_PI/2);
//            self.paddle.bounds = CGRectMake( 0, 0, w, h );
//        }];
//    
//        NSLog( @"%@", NSStringFromCGRect( self.paddle.frame ) );
    
    
	dx = 10;
	dy = 10;
}

-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	for (UITouch *t in touches)
	{
		CGPoint p = [t locationInView:self];
        
      //  p.y = 200;
		[paddle setCenter:p];
	}
}

-(void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
	[self touchesBegan:touches withEvent:event];
}

-(IBAction)startAnimation:(id)sender
{
	timer = [NSTimer scheduledTimerWithTimeInterval:.1	target:self selector:@selector(timerEvent:) userInfo:nil repeats:YES];

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
	
	if ((p.y + dy) > bounds.size.height)
		dy = -dy;
	
	p.x += dx;
	p.y += dy;
	[ball setCenter:p];
	
	// Now check to see if we intersect with paddle.  If the movement
	// has placed the ball inside the paddle, we reverse that motion
	// in the Y direction.
	if (CGRectIntersectsRect([ball frame], [paddle frame]))
	{
		dy = -dy;
		p.y += 2*dy;
		[ball setCenter:p];
	}
	
    
    for (UIView *block1 in blocks){
        
        if (CGRectIntersectsRect([ball frame], [block1 frame]))
        {
            
            
            [block1 setBackgroundColor:[UIColor grayColor]];
            block1.bounds = CGRectMake(0, 0, 0, 0);
            block1.frame = CGRectMake(0, 0, 0, 0);
            dy = -dy;
            p.y += 2*dy;
            difficulty++;
            [ball setFrame:CGRectMake([ball frame].origin.x, [ball frame].origin.y, 20+difficulty, 20+difficulty)];
            [ball setCenter:p];
            
            
        }

        
    }
    
//    if (CGRectIntersectsRect([ball frame], [block frame]))
//    {
//        block.bounds = CGRectMake(0, 0, 0, 0);
//        dy = -dy;
//        p.y += 2*dy;
//        [ball setCenter:p];
//    }

    
    
    

}

@end
