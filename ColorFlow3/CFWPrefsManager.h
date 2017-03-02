@interface CFWPrefsManager : NSObject
@property(nonatomic, assign, getter=isLockScreenEnabled) BOOL lockScreenEnabled;
@property(nonatomic, assign, getter=isMusicEnabled) BOOL musicEnabled;
@property(nonatomic, assign, getter=isSpotifyEnabled) BOOL spotifyEnabled;

@property(nonatomic, assign, getter=shouldRemoveArtworkShadow) BOOL removeArtworkShadow;

+ (instancetype)sharedInstance;

@end
