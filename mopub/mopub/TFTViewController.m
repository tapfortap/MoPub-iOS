//
//  Copyright (c) 2013 Tap for Tap. All rights reserved.
//

#import "TFTViewController.h"

#import "MPAdView.h"

@implementation TFTViewController

- (void)viewDidLoad {
    self.adView = [[MPAdView alloc] initWithAdUnitId:@"BANN_AD_ID" size:MOPUB_BANNER_SIZE];
    self.adView.delegate = self;
    CGRect frame = self.adView.frame;
    CGSize size = [self.adView adContentViewSize];
    frame.origin.y = [[UIScreen mainScreen] applicationFrame].size.height - size.height;
    self.adView.frame = frame;
    [self.view addSubview:self.adView];
    [self.adView loadAd];    
    
    self.interstitial = [MPInterstitialAdController interstitialAdControllerForAdUnitId:@"INTERSTITIAL_AD_ID"];
    self.interstitial.delegate = self;
    [self.interstitial loadAd];
    
    int width = self.view.frame.size.width;
    
    UIButton* showInterstitialButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [showInterstitialButton addTarget:self action:@selector(showInterstitial) forControlEvents:UIControlEventTouchUpInside];
    [showInterstitialButton setTitle:@"Show Interstitial" forState:UIControlStateNormal];
    showInterstitialButton.frame = CGRectMake(width / 2 - 200 / 2, 110, 200, 75);

    
    [self.view addSubview:showInterstitialButton];
    [super viewDidLoad];
}


- (void)dealloc {
    self.adView = nil;
}

- (void) showInterstitial {
    [self.interstitial loadAd];
}

#pragma mark - <MPAdViewDelegate>
- (UIViewController *)viewControllerForPresentingModalView {
    return self;
}


#pragma mark - <MPInterstitialAdControllerDelegate>
- (void)interstitialDidLoadAd:(MPInterstitialAdController *)interstitial {
    [self.interstitial showFromViewController:self];
}

@end
