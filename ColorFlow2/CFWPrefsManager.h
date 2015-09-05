@interface CFWPrefsManager : NSObject

@property(nonatomic, assign, getter=isLockScreenEnabled) BOOL lockScreenEnabled;
@property(nonatomic, assign, getter=isMusicEnabled) BOOL musicEnabled;
@property(nonatomic, assign, getter=isSpotifyEnabled) BOOL spotifyEnabled;

@property(nonatomic, assign, getter=shouldRemoveArtworkShadow) BOOL removeArtworkShadow;

@property(nonatomic, assign, getter=shouldMusicColorFloatingButton) BOOL musicColorFloatingButton;
@property(nonatomic, assign, getter=shouldReplaceApplesAlgorithm) BOOL replaceApplesAlgorithm;

@property(nonatomic, assign, getter=shouldMusicColorStatusBar) BOOL musicColorStatusBar;
@property(nonatomic, assign, getter=isMusicStatusBarGradientEnabled) BOOL musicStatusBarGradientEnabled;
@property(nonatomic, assign, getter=shouldMusicColorStatusBarGradient) BOOL musicColorStatusBarGradient;

+ (instancetype)sharedInstance;

- (void)reload;

@end
