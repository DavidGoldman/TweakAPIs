#import "SpringBoard.h"

/*
Because of the way that CFWSBMediaController works, in order to use it you sadly need to make sure
you're using (either directly or indirectly) an MPUNowPlayingController. You also need to make sure
that -|MPUNowPlayingController shouldUpdateNowPlayingArtwork| is set to YES.

Say you wanted to add ColorFlow 2 support to Control Center. This would not be hard to do - the
Control Center already uses an MPUNowPlayingController internally. Otherwise, you'd need to create
your own instance (follow the MPUNowPlayingDelegate protocol and you should be okay).

Given that you're using an MPUNowPlayingController, here's example code to add ColorFlow 2 to your
SpringBoard tweak.
*/

@interface YourViewController : UIViewController<CFWAnalysisDelegate>
@end

@implementation YourViewController

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  [[%c(CFWSBMediaController) sharedInstance] addAnalysisDelegateAndNotify:self];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];

  [[%c(CFWSBMediaController) sharedInstance] removeAnalysisDelegate:self];
}

- (void)nowPlayingInfo:(NSDictionary *)info 
               artwork:(UIImage *)artwork
      analysisComplete:(CFWAnalyzedInfo *)analyzedInfo {
  // Color your UI here.
}

- (void)nowPlayingInfoHadNoArtwork:(NSDictionary *)info {
  // Revert your UI here.
}

@end
