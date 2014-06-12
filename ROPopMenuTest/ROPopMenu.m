//
//  ROPopMenu.m
//  ROPopMenuTest
//
//  Created by iamro on 14-5-4.
//  Copyright (c) 2014年 iamro. All rights reserved.
//

#import "ROPopMenu.h"

@implementation ROPopMenu{
    NSMutableArray *buttons;
    int selectingIndex;
    BOOL isAnimating;
    BOOL isExpanded;
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (id)initWithIconImages:(NSArray*)imgs
{
    self = [super initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 200)];
    if (self) {
        // Initialization code
        selectingIndex = 0;
        buttons = [[NSMutableArray alloc] init];
        for (int i =0; i<6; i++) {
            UIImage *img = [UIImage imageNamed:@"button.png"];
            UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(10, 10, 80, 80)];
            [button setImage:img forState:UIControlStateNormal];
            [self addSubview:button];
            [buttons addObject:button];
            [button addTarget:self action:@selector(buttonTapped:) forControlEvents:UIControlEventTouchUpInside];
            if(i>0){
                [button setAlpha:0];
            }
        }
        [self refreshButtons];

    }
    return self;
}

-(void)refreshButtons{
//    if(!isExpanded){
//        int index = 0;
//        for (UIButton *b in buttons) {
//            if(index!=selectingIndex){
//                [b SET];
//            }
//                
//            index++;
//        }
//    }
}

-(void)buttonTapped:(id)sender{
    if(isAnimating)return;
    //int index = [buttons objectAtIndex:sender];
    if(!isExpanded){
        [self goExpand];
    }else{
        [self goShrink];
    }
}

-(void)goExpand{
    for (int i = buttons.count-1;i>=0;i--) {
        UIButton *b = buttons[i];
        [self bringSubviewToFront:b];
    }
    
    UIButton *first = buttons[0];
    CGPoint toCenter=CGPointMake(first.center.x+10, first.center.y+10);
    [UIView animateWithDuration:0.2 delay:0 options:UIViewAnimationOptionCurveEaseIn animations:^{
        first.transform = CGAffineTransformMakeScale(1.3, 1.3);
        first.center = toCenter;
    } completion:^(BOOL finished) {
        
    }];
    //int index = 1;
    for (int i = 1;i<buttons.count;i++) {
        UIButton *b = buttons[i];
        b.center = toCenter;
        b.alpha=0;
        BOOL left = arc4random()%2==0;
        float xP = b.bounds.size.width/2.;
        if(left){
            xP = -b.bounds.size.width/2.;
        }
        
        toCenter=CGPointMake(toCenter.x+xP,b.bounds.size.height/2.+toCenter.y);
        [UIView animateWithDuration:0.2 delay:0.2*i options:UIViewAnimationOptionCurveLinear animations:^{
            b.center = toCenter;
            b.alpha=1;
        } completion:^(BOOL finished) {
            
        }];
    }
    isExpanded = YES;
}

-(void)goShrink{
    for (int i = buttons.count-1;i>0;i--) {
        UIButton *b = buttons[i];
        //b.center = [buttons[i-1] center];
        b.alpha=1;
        CGPoint toCenter=[buttons[i-1] center];
        [UIView animateWithDuration:0.2 delay:0.2*(buttons.count-i) options:UIViewAnimationOptionCurveLinear animations:^{
            b.center = toCenter;
            b.alpha=0;
        } completion:^(BOOL finished) {
            
        }];
    }
    UIButton *first = buttons[0];
    CGPoint toCenter=CGPointMake(first.center.x-10, first.center.y-10);
    [UIView animateWithDuration:0.2 delay:0.2*buttons.count options:UIViewAnimationOptionCurveEaseIn animations:^{
        first.transform = CGAffineTransformMakeScale(1, 1);
        first.center = toCenter;
    } completion:^(BOOL finished) {
        
    }];
    
    isExpanded = NO;

}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
