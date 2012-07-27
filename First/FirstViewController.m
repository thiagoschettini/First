//
//  FirstViewController.m
//  First
//
//  Created by Thiago Silva on 6/26/12.
//  Copyright (c) 2012 LPJ. All rights reserved.
//

#import "FirstViewController.h"
#import <AudioToolbox/AudioToolbox.h>

@implementation FirstViewController

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle
-(void)cleanStance {
    [campFireView setImage:nil];
    campFireView.animationImages = nil;
}

-(void)displayTimerClock {
    //initWithFrame =====> desenha o box da imagem
    timerClock = [[UIImageView alloc] initWithFrame:CGRectMake(10, 200, 100, 100)];
    [timerClock setImage:[UIImage imageNamed:@"timer1.png"]];
    timerClock .opaque = YES;
    [self.view addSubview:timerClock];
}

-(void)displayTimerAnime {
    timerClock = [[UIImageView alloc] initWithFrame:CGRectMake(10, 200, 100, 100)];
    timerClock.animationImages = [NSArray arrayWithObjects:    
                                    [UIImage imageNamed:@"timer1.png"],
                                    [UIImage imageNamed:@"timer-2.png"], nil];
    // all frames will execute in 1.75 seconds
    timerClock.animationDuration = .1;
    // repeat the annimation forever
    timerClock.animationRepeatCount = 50;
    // start animating
    [timerClock startAnimating];
    // add the animation view to the main window 
    [self.view addSubview:timerClock];
    // Override point for customization after application launch.
}

-(void)displayCat {
    //initWithFrame =====> desenha o box da imagem
    campFireView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 300, 400)];
    [campFireView setImage:[UIImage imageNamed:@"fall1.png"]];
    campFireView.opaque = YES;
    [self.view addSubview:campFireView];
}

- (void)displayAnimeStence {
    // Do any additional setup after loading the view, typically from a nib.
    campFireView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 10, 300, 400)];
    //initWithImage ======? inicia com a imagem e desenha o box pelo tamanho da imagem
    //campFireView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"fall1.png"]];
    // load all the frames of our animation
    campFireView.animationImages = [NSArray arrayWithObjects:    
                                    [UIImage imageNamed:@"fall1.png"],
                                    [UIImage imageNamed:@"fall2.png"],
                                    [UIImage imageNamed:@"fall3.png"],
                                    [UIImage imageNamed:@"fall4.png"],
                                    [UIImage imageNamed:@"fall5.png"],
                                    [UIImage imageNamed:@"fall6.png"],
                                    [UIImage imageNamed:@"fall7.png"],
                                    [UIImage imageNamed:@"fall8.png"],
                                    [UIImage imageNamed:@"fall9.png"],
                                    [UIImage imageNamed:@"fall10.png"],
                                    [UIImage imageNamed:@"fall11.png"],
                                    [UIImage imageNamed:@"fall12.png"],
                                    [UIImage imageNamed:@"fall13.png"],
                                    [UIImage imageNamed:@"fall14.png"],
                                    [UIImage imageNamed:@"fall15.png"],
                                    [UIImage imageNamed:@"fall16.png"],
                                    [UIImage imageNamed:@"fall17.png"],
                                    [UIImage imageNamed:@"fall18.png"],
                                    [UIImage imageNamed:@"fall19.png"],
                                    [UIImage imageNamed:@"fall20.png"],
                                    [UIImage imageNamed:@"fall21.png"],
                                    [UIImage imageNamed:@"fall22.png"],
                                    [UIImage imageNamed:@"fall23.png"],
                                    [UIImage imageNamed:@"fall24.png"],
                                    [UIImage imageNamed:@"fall25.png"],
                                    [UIImage imageNamed:@"fall26.png"],
                                    [UIImage imageNamed:@"fall27.png"],
                                    [UIImage imageNamed:@"fall28.png"],
                                    [UIImage imageNamed:@"fall29.png"],
                                    [UIImage imageNamed:@"fall30.png"],
                                    [UIImage imageNamed:@"fall31.png"],
                                    [UIImage imageNamed:@"fall32.png"], nil];
    // all frames will execute in 1.75 seconds
    campFireView.animationDuration = 1.75;
    // repeat the annimation forever
    campFireView.animationRepeatCount = 1;
    // start animating
    [campFireView startAnimating];
    // add the animation view to the main window 
    [self.view addSubview:campFireView];
    // Override point for customization after application launch.
}

-(IBAction)playAnime:(UITapGestureRecognizer *)sender{
    NSLog(@"TAPED");
    if (!campFireView.isAnimating){
        [self cleanStance];
        [self displayAnimeStence];
    }
    SystemSoundID sound1;
    NSURL *soundURL = [[NSBundle mainBundle] URLForResource:@"catMeaow"
                                              withExtension:@"wav"];
    AudioServicesCreateSystemSoundID((__bridge CFURLRef)soundURL, &sound1);
    AudioServicesPlayAlertSound(sound1);
}

-(IBAction)playTimer:(UITapGestureRecognizer *)sender{
    NSLog(@"TAPED_TIMER");
    [self displayTimerAnime];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self displayCat];
    [self displayTimerClock];
    campFireView.userInteractionEnabled = YES;
    timerClock.userInteractionEnabled = YES;
    UITapGestureRecognizer *doubleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playAnime:)];
    doubleTap.numberOfTapsRequired = 2;
    [campFireView addGestureRecognizer:doubleTap];
    [self.view addSubview:campFireView];
    
    UITapGestureRecognizer *doubleTapTimer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(playTimer:)];
    doubleTapTimer.numberOfTapsRequired = 1;
    [timerClock addGestureRecognizer:doubleTapTimer];
    [self.view addSubview:timerClock];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    self.campFireView = nil;
    self.timerClock = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
