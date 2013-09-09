//
//  Copyright (c) 2013 Tap for Tap. All rights reserved.
//

#import "MPBannerCustomEvent.h"

#import "TFTTapForTap.h"

@interface TFTMoPubBanner : MPBannerCustomEvent <TFTBannerDelegate>
@property (nonatomic, retain) TFTBanner *banner;
@end
