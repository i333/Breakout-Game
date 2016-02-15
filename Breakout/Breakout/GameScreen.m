
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

-(void)createPlayField
{
	paddle = [[UIView alloc] initWithFrame:CGRectMake(20, 40, 60, 10)];
	[self addSubview:paddle];
	[paddle setBackgroundColor:[UIColor blackColor]];
    
    block = [[UIView alloc] initWithFrame:CGRectMake(20, 40, 60, 30)];
    [self addSubview:block];
    [block setBackgroundColor:[UIColor greenColor]];

	
    block = [[UIView alloc] initWithFrame:CGRectMake(100, 40, 60, 30)];
    [self addSubview:block];
    [block setBackgroundColor:[UIColor greenColor]];
    
    block = [[UIView alloc] initWithFrame:CGRectMake(100, 40, 60, 30)];
    [self addSubview:block];
    [block setBackgroundColor:[UIColor greenColor]];
    
    block = [[UIView alloc] initWithFrame:CGRectMake(180, 40, 60, 30)];
    [self addSubview:block];
    [block setBackgroundColor:[UIColor greenColor]];
    
    block = [[UIView alloc] initWithFrame:CGRectMake(260, 40, 60, 30)];
    [self addSubview:block];
    [block setBackgroundColor:[UIColor greenColor]];
    
    
	ball = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 10, 10)];
	[self addSubview:ball];
	[ball setBackgroundColor:[UIColor redColor]];
	
    
    
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
	
    if (CGRectIntersectsRect([ball frame], [block frame]))
    {
        block.bounds = CGRectMake(0, 0, 0, 0);
        dy = -dy;
        p.y += 2*dy;
        [ball setCenter:p];
    }

    
    
    

}

@end
