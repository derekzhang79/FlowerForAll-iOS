//
//  CalibrationApp.h
//  FlowerForAll
//
//  Created by Pierre-Mikael Legris (Perki) on 12.09.11.
//  Copyright 2011 fondation Defitech. All rights reserved.
//

#import "FlowerApp.h"
#import "DoubleSlider.h"
#import "CalibrationApp_NeedleView.h"
#import "CalibrationApp_NeedleGL.h"

@interface CalibrationApp : FlowerApp {
    IBOutlet UILabel *targetFrequencyRangeLabel;
	IBOutlet UILabel *minLabel;
	IBOutlet UILabel *maxLabel;
    IBOutlet UILabel *targetFreqLabelValue;
    
    
    IBOutlet UILabel *lastFreqLabelValue;
    IBOutlet UILabel *lastFreqLabelTitle;

    IBOutlet UIButton *goToDurationButton;

    //double Slide
    IBOutlet DoubleSlider *slider;
    
    IBOutlet CalibrationApp_NeedleView *needle;
}



@property (nonatomic, retain) UILabel *targetFrequencyRangeLabel;
@property (nonatomic, retain) UILabel *minLabel;
@property (nonatomic, retain) UILabel *maxLabel;
@property (nonatomic, retain) UILabel *targetFreqLabelValue;

@property (nonatomic, retain) UILabel *lastFreqLabelValue;
@property (nonatomic, retain) UILabel *lastFreqLabelTitle;

@property (nonatomic, retain)  UIButton *goToDurationButton;
@property (nonatomic, retain) IBOutlet DoubleSlider *slider;

- (IBAction) goToDurationAction:(id) sender;

@end
