// ColorBanners 2 API, starting in v1.2.3.

@class CBRColoringInfo, NCNotificationViewController;

// You can call these methods to get coloring information for a NCNotificationViewController.
//
// NOTE:
// - may return nil if the notification doesn't have an icon or ColorBanners 2 is disabled
// - this method doesn't color anything, it just returns the coloring information
@interface CBRColorBanners : NSObject
+ (nullable CBRColoringInfo *)bannerColoringInfoForNotification:(nonnull NCNotificationViewController *)notification;
+ (nullable CBRColoringInfo *)lockScreenColoringInfoForNotification:(nonnull NCNotificationViewController *)notification;
+ (nullable CBRColoringInfo *)notificationCenterColoringInfoForNotification:(nonnull NCNotificationViewController *)notification;
@end

@interface CBRColoringInfo : NSObject
@property(nonatomic, retain) UIColor *color;
@property(nonatomic, retain) UIColor *gradientColor;
@property(nonatomic, retain) UIColor *highlightColor;

@property(nonatomic, assign) CGFloat backgroundAlpha;
@property(nonatomic, assign) BOOL isForLongLook;

@property(nonatomic, readonly) UIColor *contrastColorForLookType;
@end
