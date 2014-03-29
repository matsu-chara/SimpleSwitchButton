#import <Foundation/Foundation.h>
#import "SimpleSwitchButton.h"

@protocol SimpleSwitchButtonCollectionDelegate <NSObject>

// コレクションの管理しているボタンのどれかが押された時のイベント
-(void)simpleSwitchButtonTapped:(id)simpleSwitchButtonCollection TappedKey:(NSString *)tappedKey;

@end


@interface SimpleSwitchButtonCollection : NSObject <SimpleSwitchButtonDelegate>

@property (nonatomic, strong) id<SimpleSwitchButtonCollectionDelegate> delegate;

/* 他のボタンが押された時の挙動を指定
 * SimpleSwitchButtonType {
 *    asCheckBox,
 *    asRadioButton
 * }
 */
-(id)initWithSimpleSwitchButtonMode:(SimpleSwitchButtonType)buttonType;

// ボタンタイプの変更
-(void)setButtonType:(SimpleSwitchButtonType)newType;

// ボタンの追加
-(SimpleSwitchButton *)createSimpleSwitchButtonForKey:(NSString *)key ButtonFrame:(CGRect)frame OnImageName:(NSString *)onImageName OffImageName:(NSString *)offImageName;

// タップ中の画像も指定する場合はこちら
-(SimpleSwitchButton *)createSimpleSwitchButtonForKey:(NSString *)key ButtonFrame:(CGRect)frame OnImageName:(NSString *)onImageName OnHighlitedImageName:(NSString *)onHighlitedImageName OffImageName:(NSString *)offImageName OffHighlitedImageName:(NSString *)offHighlitedImageName;

/*
 * configArrayはボタンの設定を記したNSDictionaryが複数個入っているNSArrayです。
 *     frameはオブジェクトではないので、そのままではNSDictionaryには入れられません。
 *     [NSValue valueWithCGRect:rect];のようにNSValueでwrapしてNSArrayに入れてください
 *
 * configArray = [[@"key", @"frame", @"onImageName", @"offImageName"],[@"key", @"frame", @"onImageName", @"offImageName"],...];
 *
 * OPTION: NSDictionary中に@"onHighlitedImageName", @"offHighlitedImageName"を追加するとボタンのタップ中画像も指定出来ます。
 */
-(NSArray *)createSimpleSwitchButtons:(NSArray *)configArray;


// 既存のボタンに情報を付加(storyboardなどで初めから存在する場合)
-(void)registerSimpleSwitchButtonForKey:(NSString *)key SimpleSwitchButton:(SimpleSwitchButton *)simpleSwitchButton OnImageName:(NSString *)onImageName OffImageName:(NSString *)offImageName;

-(void)registerSimpleSwitchButtonForKey:(NSString *)key SimpleSwitchButton:(SimpleSwitchButton *)simpleSwitchButton OnImageName:(NSString *)onImageName OnHighlitedImageName:(NSString *)onHighlitedImageName OffImageName:(NSString *)offImageName OffHighlitedImageName:(NSString *)offHighlitedImageName;

-(void)removeSimpleSwitchButtonForKey:(NSString *)key;
-(void)removeAllSimpleSwitchButtonForKey;

-(int)countOnItems;
-(int)countOffItems;
-(int)countAllItems;

-(NSArray *)getKeysOfOnItem;
-(NSArray *)getKeysOfOffItem;

-(void)setAllItemsToOn;
-(void)setAllItemsToOff;
-(void)toggleAllItems;

-(void)setToOnForKey:(NSString *) key;
-(void)setToOffForKey:(NSString *) key;
-(void)addTargetForKey:(NSString *)key action:(SEL)action forControlEvents:(UIControlEvents)controlEvents;

// 一括でsetToOn(Off)ForKeyをするためのメソッド
-(void)setToOnForKeys:(NSArray *)keys setOthersOff:(BOOL)otherToOff;
-(void)setToOffForKeys:(NSArray *)keys setOthersOff:(BOOL)otherToOn;

@end
