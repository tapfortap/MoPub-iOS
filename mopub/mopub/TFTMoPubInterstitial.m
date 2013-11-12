//
//  Copyright (c) 2013 Tap for Tap. All rights reserved.
//

#import "TFTMoPubInterstitial.h"

@implementation TFTMoPubInterstitial
- (id) init {
    self = [super init];
    if (self) {
        [TFTTapForTap initializeWithAPIKey:@"YOUR _API_KEY"];
        self.interstitial = [TFTInterstitial interstitialWithDelegate:self];
    }
    return self;
}

- (void) dealloc {
    [interstitial release];
    interstitial = nil;
}

- (void)requestInterstitialWithCustomEventInfo:(NSDictionary *)info
{
    [self.interstitial load];
    // If Tap for Tap already has an interstitial ready let MoPub know
    if (self.interstitial.readyToShow) {
        [self.delegate interstitialCustomEvent:self didLoadAd:self];
    }
    CLLocation *location = self.delegate.location;
    if (location) {
        [TFTTapForTap setLocation:location];
    }
}

- (void)showInterstitialFromRootViewController:(UIViewController *)rootViewController {
    [self.interstitial showWithViewController:rootViewController];
}

- (void)tftInterstitialDidReceiveAd:(TFTInterstitial *)interstitial {
    [self.delegate interstitialCustomEvent:self didLoadAd:self];
}

- (void)tftInterstitial:(TFTInterstitial *)interstitial didFail:(NSString *)reason {
    [self.delegate interstitialCustomEvent:self didFailToLoadAdWithError:nil];
}

- (void)tftInterstitialDidShow:(TFTInterstitial *)interstitial {
    [self.delegate interstitialCustomEventDidAppear:self];
}

- (void)tftInterstitialWasTapped:(TFTInterstitial *)interstitial {
    [self.delegate interstitialCustomEventDidReceiveTapEvent:self];
}

- (void) tftInterstitialWasDismissed:(TFTInterstitial *)interstitial {
    [self.delegate interstitialCustomEventDidDisappear:self];
}

@end
