// ColorFlow 2 Public SpringBoard API Headers.

// Analyzed Info struct. Having a struct and Obj-C classes is a bit redudant, but I have no plans
// to change this at the moment. Sorry.
struct AnalyzedInfo {
  int bg;
  int primary;
  int secondary;
  BOOL darkBG;
};

// Contains color info about an analysis.
@interface CFWAnalyzedInfo : NSObject
@property(nonatomic, assign) int bgColor;
@property(nonatomic, assign) int primaryColor;
@property(nonatomic, assign) int secondaryColor;
@property(nonatomic, assign, getter=isDarkBG) BOOL darkBG;

- (struct AnalyzedInfo)analyzedInfo;
@end

// Your class should implement these methods for use as a CFWSBMediaController delegate.
@protocol CFWAnalysisDelegate<NSObject>
// Called when color analysis is complete for the current song. The nowPlayingInfo will contain the
// same entries that a MPUNowPlayingController's _currentNowPlayingInfo would.
- (void)nowPlayingInfo:(NSDictionary *)info 
               artwork:(UIImage *)artwork
      analysisComplete:(CFWAnalyzedInfo *)analyzedInfo;

// Called if the current song doesn't have artwork. Note that ColorFlow 2 might wait a second or so
// for artwork to potentially load before this is called.
- (void)nowPlayingInfoHadNoArtwork:(NSDictionary *)info;
@end


@interface CFWSBMediaController : NSObject
+ (instancetype)sharedInstance;

// Adds a delegate, but if a song is already playing, don't notify the delegate of it.
- (void)addAnalysisDelegate:(id<CFWAnalysisDelegate>)delegate;

// Adds a delegate and notify it if a song is already playing. Note that ColorFlow 2 analysis is
// deferred (lazy), so either:
//   1. The analysis is already complete and this method will immediately notify your delegate.
//   2. The analysis isn't already complete - this method will not immediately notify your delegate.
//      The delegate will be notified asynchronously when analysis is complete (on the main thread).
- (void)addAnalysisDelegateAndNotify:(id<CFWAnalysisDelegate>)delegate;

// Remove your delegate whenever you don't want analysis to occur - i.e. if your view is hidden.
- (void)removeAnalysisDelegate:(id<CFWAnalysisDelegate>)delegate;
@end

// Contains color info in object form.
@interface CFWColorInfo : NSObject
@property(nonatomic, retain) UIColor *backgroundColor;
@property(nonatomic, retain) UIColor *primaryColor;
@property(nonatomic, retain) UIColor *secondaryColor;
@property(nonatomic, assign, getter=isBackgroundDark) BOOL backgroundDark;

+ (instancetype)colorInfoWithAnalyzedInfo:(struct AnalyzedInfo)info;

- (instancetype)initWithAnalyzedInfo:(struct AnalyzedInfo)info;
@end

// Allows you to easily colorize media controls.
@interface MPUSystemMediaControlsView : UIView
@end
@interface MPUSystemMediaControlsView (ColorFlow2)
- (void)cfw_colorize:(CFWColorInfo *)colorInfo;
- (void)cfw_revert;
@end
