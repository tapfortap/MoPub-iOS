//
//  TFTViewController.h
//  mopub
//
//  Created by Phil Laird on 2013-09-09.
//  Copyright (c) 2013 Tap for Tap. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "MPAdView.h"
#import "MPInterstitialAdController.h"

@interface TFTViewController : UIViewController <MPAdViewDelegate, MPInterstitialAdControllerDelegate>
@property (nonatomic, retain) MPAdView *adView;
@property (nonatomic, retain) MPInterstitialAdController *interstitial;
@end
