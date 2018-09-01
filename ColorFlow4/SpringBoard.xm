#import "SpringBoard.h"

@interface YourViewController : UIViewController<CFWColorDelegate>
@end

@implementation YourViewController

- (void)viewWillAppear:(BOOL)animated {
  [super viewWillAppear:animated];

  [[%c(CFWSBMediaController) sharedInstance] addColorDelegateAndNotify:self];
}

- (void)viewWillDisappear:(BOOL)animated {
  [super viewWillDisappear:animated];

  [[%c(CFWSBMediaController) sharedInstance] removeColorDelegate:self];
}

- (void)songAnalysisComplete:(nonnull MPModelSong *)song
                     artwork:(nonnull UIImage *)artwork
                   colorInfo:(nonnull CFWColorInfo *)colorInfo {
  // Color your UI here.
}

- (void)songHadNoArtwork:(nullable MPModelSong *)song {
  // Revert your UI here.
}

@end
