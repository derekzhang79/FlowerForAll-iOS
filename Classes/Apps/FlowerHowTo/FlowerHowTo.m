//
//  FlowerHowTo.m
//  FlowerForAll
//
//  Created by Pierre-Mikael Legris on 27.06.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "FlowerHowTo.h"
#import <MediaPlayer/MediaPlayer.h>

@implementation FlowerHowTo

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)dealloc
{
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

MPMoviePlayerController *player;
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSString *url = [[NSBundle mainBundle] 
                     pathForResource:@"FlowerHowTo" 
                     ofType:@"m4v"];
    
    player = 
    [[MPMoviePlayerController alloc] 
     initWithContentURL:[NSURL fileURLWithPath:url]];
    [player setUseApplicationAudioSession:YES];
    
    
    [[NSNotificationCenter defaultCenter] 
     addObserver:self
     selector:@selector(movieFinishedCallback:)                                                 
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];
    
  
    
    //---play partial screen---
    player.view.frame = CGRectMake(0, 0, 460, 320);
    player.view.center = CGPointMake(160, 230);
    player.view.transform = CGAffineTransformMakeRotation(M_PI/ 2);
    [self.view addSubview:player.view];
    
    //---play movie---
    [player play];    
  
    
    NSLog(@"Playing %@",url);   
}

- (void) movieFinishedCallback:(NSNotification*) aNotification {
    MPMoviePlayerController *player = [aNotification object];
    [[NSNotificationCenter defaultCenter] 
     removeObserver:self
     name:MPMoviePlayerPlaybackDidFinishNotification
     object:player];    
    NSLog(@"Finished Playing"); 
  
}

- (void)viewDidAppear:(BOOL)animated
{
    [player play];    
}


- (void)viewWillDisappear:(BOOL)animated
{
    [player pause];    
    [super viewWillDisappear:animated];
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
    // switch to Activitiy chooser
    [player release];    
}

//Allows view to autorotate
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)toInterfaceOrientation{
	return (toInterfaceOrientation == UIInterfaceOrientationPortrait || toInterfaceOrientation == UIInterfaceOrientationPortraitUpsideDown);
}

@end