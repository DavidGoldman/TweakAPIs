/*
 
As of v1.1.0, ColorFlow has Lockscreen support. It will by default colorize the NowPlaying UI and some of the Lockscreen elements.
However, it will most likely not colorize UI elements added by other tweaks.
 
If you're a developer, you can add ColorFlow LS support to your tweak. ColorFlow will post notifications when colorizing the UI:
- @"ColorFlowLockScreenColorReversionNotification" : posted when the UI controls should revert to normal
- @"ColorFlowLockScreenColorizationNotification" : posted when UI controls should colorize, containing the following keys
   + @"BackgroundColor" : UIColor *
   + @"PrimaryColor" : UIColor *
   + @"SecondaryColor" : UIColor *
   + @"IsBackgroundDark" : NSNumber * (with boolValue)
 
Thus, you can just register for these notifications within the SpringBoard process (to [NSNotificationCenter defaultCenter]). Some example code is below. Depending on the lifetime of your objects, elements themselves should register for these notifications, or you should have an ever present ColorManager which manages the proper colors (needed if your objects can be created/destroyed between notifications) - this is because repeated reversion/colorize notifications are not sent (once reversion is called, it will not be called again until after a colorize; once a colorize for a song is called, it will not be called again until the album artwork changes).
 
As of v1.2.1, ColorFlow has an API for music tweaks as well. It will post notifications inside the Music app process:
- @"ColorFlowMusicAppColorReversionNotification" : posted when the UI controls should revert to normal
- @"ColorFlowMusicAppColorizationNotification" : posted when UI controls should colorize, containing the following keys
   + @"BackgroundColor" : UIColor *
   + @"PrimaryColor" : UIColor *
   + @"SecondaryColor" : UIColor *
   + @"IsBackgroundDark" : NSNumber * (with boolValue)
 
Below is some sample code.
*/
 
- (instancetype)init {
    self = [super init];
    if (self) {
        // Do your init...
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(revertUI:)
                                                     name:@"ColorFlowLockScreenColorReversionNotification"
                                                   object:nil];
        [[NSNotificationCenter defaultCenter] addObserver:self
                                                 selector:@selector(colorizeUI:)
                                                     name:@"ColorFlowLockScreenColorizationNotification"
                                                   object:nil];
    }
    return self;
}
 
- (void)revertUI:(NSNotification *)notification {
    /* Revert your UI colors. i.e.
        self.tintColor = [UIColor whiteColor];
    */
}
 
- (void)colorizeUI:(NSNotification *)notification {
    NSDictionary *userInfo = [notification userInfo];
    UIColor *backgroundColor = userInfo[@"BackgroundColor"];
    UIColor *primaryColor = userInfo[@"PrimaryColor"];
    UIColor *secondaryColor = userInfo[@"SecondaryColor"];
    BOOL isBackgroundDark = [userInfo[@"IsBackgroundDark"] boolValue];
    /* Colorize your UI colors. i.e.
        self.tintColor = primary;
    */
}
 
- (void)dealloc {
    [[NSNotificationCenter defaultCenter] removeObserver:self];
    [super dealloc];
}