//
//  Copyright (c) 2013 Tap for Tap. All rights reserved.
//

#import "TFTMoPubBanner.h"

@implementation TFTMoPubBanner

-(id) init {
    self = [super init];
    if (self) {
        [TFTTapForTap initializeWithAPIKey:@"YOUR_API_KEY"];
    }
    return self;
}

-(void) dealloc {
    self.banner.delegate = nil;
    self.banner = nil;
}

-(void) requestAdWithSize:(CGSize)size customEventInfo:(NSDictionary *)info {
    self.banner = [TFTBanner bannerWithFrame:[self frameForCustomEventInfo:info] delegate:self];
    self.banner.forceLoad = YES;
    self.banner.autoRollover = NO;
    
    CLLocation *location = self.delegate.location;
    if (location) {
        [TFTTapForTap setLocation:location];
    }
    [self.banner startShowingAds];
}

- (CGRect)frameForCustomEventInfo:(NSDictionary *)info
{
    CGFloat width = [[info objectForKey:@"adWidth"] floatValue];
    CGFloat height = [[info objectForKey:@"adHeight"] floatValue];
    
    if (width < 320 && height < 50) {
        width = 320;
        height = 50;
    }
    return CGRectMake(0, 0, width, height);
}

-(void) tftBannerDidReceiveAd:(TFTBanner *)banner {
    // Must user self.banner as in 3.0.2 the banner returned is nil. Will be fix in next release.
    [self.delegate bannerCustomEvent:self didLoadAd:self.banner];
}

-(void) tftBanner:(TFTBanner *)banner didFailToReceiveAd:(NSString *)reason {
    [self.delegate bannerCustomEvent:self didFailToLoadAdWithError:nil];
    
}

-(void) tftBannerWasTapped:(TFTBanner *)banner {
    [self.delegate bannerCustomEventWillLeaveApplication:self];
}

@end
