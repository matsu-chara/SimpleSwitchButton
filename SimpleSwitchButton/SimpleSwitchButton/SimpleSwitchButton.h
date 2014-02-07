#import <UIKit/UIKit.h>

@protocol SimpleSwitchButtonDelegate <NSObject>

// 押されたことをCollectionに伝えるメソッド
- (void)oneOfSimpleSwitchButtonTapped:(NSString *)tappedKey;

@end

@interface SimpleSwitchButton : UIButton

typedef enum {
    asCheckBox,
    asRadioButton
} SimpleSwitchButtonType;

@property (nonatomic, strong) id<SimpleSwitchButtonDelegate> delegate;

// 通常の初期化
-(id)initWithFrame:(CGRect)frame ForKey:(NSString *)key OnImageName:(NSString *)onImageName OffImageName:(NSString *)offImageName;

// タップ中の画像も指定する場合はこちら
-(id)initWithFrame:(CGRect)frame ForKey:(NSString *)key OnImageName:(NSString *)onImageName OnHighlitedImageName:(NSString *)onHighlitedImageName OffImageName:(NSString *)offImageName OffHighlitedImageName:(NSString *)offHighlitedImageName;

-(void)setType:(SimpleSwitchButtonType) buttonType;

-(void)changeStateByTappedKey:(NSString *)tappedKey;

@end
