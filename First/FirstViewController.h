//
//  FirstViewController.h
//  First
//
//  Created by Thiago Silva on 6/26/12.
//  Copyright (c) 2012 LPJ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface FirstViewController : UIViewController{

    UIImageView *campFireView;
    UIImageView *timerClock;
    
}

@property (nonatomic, retain) UIImageView *campFireView;

@property (nonatomic, retain) UIImageView *timerClock;

-(IBAction)playAnime:(id)sender;

@end
