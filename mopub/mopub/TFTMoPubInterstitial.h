//
//  Copyright (c) 2013 Tap for Tap. All rights reserved.
//

#import "MPInterstitialCustomEvent.h"

#import "TFTTapForTap.h"

@interface TFTMoPubInterstitial : MPInterstitialCustomEvent <TFTInterstitialDelegate>
@property (nonatomic, retain) TFTInterstitial *interstitial;
@end
