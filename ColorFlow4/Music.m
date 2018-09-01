/*
If you're a developer, you can add ColorFlow 4 support to your Music app tweak.

This API is consistent across ColorFlow 1 - ColorFlow 4.

ColorFlow 4 will post notifications when the music app is colored/reverted:
- @"ColorFlowMusicAppColorReversionNotification" : posted when the UI controls should revert to normal
- @"ColorFlowMusicAppColorizationNotification" : posted when UI controls should colorize, containing the following keys
   + @"BackgroundColor" : UIColor *
   + @"PrimaryColor" : UIColor *
   + @"SecondaryColor" : UIColor *
   + @"IsBackgroundDark" : NSNumber * (with boolValue)

Thus, you can register for these notifications in the Music app (to [NSNotificationCenter defaultCenter]).

Note that depending on the lifetime of your objects, you may need to have another object (some sort of
manager) register for notifications if your objects aren't always present. Contact me if you need more
information/help.

See the example code below.
*/

- (instancetype)init {
  self = [super init];
  if (self) {
    // Do your init...
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(revertUI:)
                                                 name:@"ColorFlowMusicAppColorReversionNotification"
                                               object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(colorizeUI:)
                                                 name:@"ColorFlowMusicAppColorizationNotification"
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
  // Don't forget to remove the observer!
  [[NSNotificationCenter defaultCenter] removeObserver:self];
  [super dealloc];
}
