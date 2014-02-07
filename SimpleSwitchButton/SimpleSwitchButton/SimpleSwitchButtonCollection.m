#import "SimpleSwitchButtonCollection.h"

@implementation SimpleSwitchButtonCollection {
    NSMutableDictionary *simpleSwitchButtons;
    SimpleSwitchButtonType type;
}

-(id)init {
    self = [super init];
    if(self){
        simpleSwitchButtons = [NSMutableDictionary dictionaryWithCapacity:0];
        type = asRadioButton;
    }
    return self;
}

-(id)initWithSimpleSwitchButtonMode:(SimpleSwitchButtonType)buttonType {
    simpleSwitchButtons = [NSMutableDictionary dictionaryWithCapacity:0];
    type = buttonType;
    return self;
}

// ボタンの追加
-(SimpleSwitchButton *)createSimpleSwitchButtonForKey:(NSString *)key ButtonFrame:(CGRect)frame OnImageName:(NSString *)onImageName OffImageName:(NSString *)offImageName {
    SimpleSwitchButton * simpleSwitchButton = [[SimpleSwitchButton alloc] initWithFrame:frame ForKey:key OnImageName:onImageName OffImageName:offImageName];
    simpleSwitchButton.delegate = self;

    [simpleSwitchButton setType:type];
    [simpleSwitchButtons setObject:simpleSwitchButton forKey:key];
    return simpleSwitchButton;
}

// ボタンの追加(タップ中の画像も指定する場合はこちら)
-(SimpleSwitchButton *)createSimpleSwitchButtonForKey:(NSString *)key ButtonFrame:(CGRect)frame OnImageName:(NSString *)onImageName OnHighlitedImageName:(NSString *)onHighlitedImageName OffImageName:(NSString *)offImageName OffHighlitedImageName:(NSString *)offHighlitedImageName {

    SimpleSwitchButton * simpleSwitchButton = [[SimpleSwitchButton alloc] initWithFrame:frame ForKey:key OnImageName:onImageName OnHighlitedImageName:onHighlitedImageName OffImageName:offImageName OffHighlitedImageName:offHighlitedImageName];
    simpleSwitchButton.delegate = self;

    [simpleSwitchButton setType:type];
    [simpleSwitchButtons setObject:simpleSwitchButton forKey:key];
    return simpleSwitchButton;
}

/*
 * configArrayはボタンの設定を記したNSDictionaryが複数個入っているNSArrayです。
 * configArray = [[@"key", @"frame", @"onImageName", @"offImageName"],[@"key", @"frame", @"onImageName", @"offImageName"],...];
 *
 * OPTION: NSDictionary中に@"onHighlitedImageName", @"offHighlitedImageName"を追加するとボタンのタップ中画像も指定出来ます。
 */
-(NSArray *)createSimpleSwitchButtons:(NSArray *)configArray {
    NSString *key;
    NSValue *frameValue;
    NSString *onImageName;
    NSString *onHighlitedImageName;
    NSString *offImageName;
    NSString *offHighlitedImageName;
    NSMutableArray *buttonArray = [NSMutableArray arrayWithCapacity:0];
    
    for(NSDictionary *config in configArray) {
        key = [config objectForKey:@"key"];
        frameValue = [config objectForKey:@"frame"];
        onImageName = [config objectForKey:@"onImageName"];
        onHighlitedImageName = [config objectForKey:@"onHighlitedImageName"];
        offImageName = [config objectForKey:@"offImageName"];
        offHighlitedImageName = [config objectForKey:@"offHighlitedImageName"];
        
        if(key && frameValue && onImageName && offImageName) {
            if(onHighlitedImageName && offHighlitedImageName) {
                [buttonArray addObject:[self createSimpleSwitchButtonForKey:key ButtonFrame:frameValue.CGRectValue OnImageName:onImageName OnHighlitedImageName:onHighlitedImageName OffImageName:offImageName OffHighlitedImageName:offHighlitedImageName]];
            }
            else{
                [buttonArray addObject:[self createSimpleSwitchButtonForKey:key ButtonFrame:frameValue.CGRectValue OnImageName:onImageName OffImageName:offImageName]];
            }
        }
        else {
            NSLog(@"array with invalid structure was passed to addSwitchButtons");
        }
    }
    return buttonArray;
}

-(void)removeSimpleSwitchButtonForKey:(NSString *)key {
    [simpleSwitchButtons removeObjectForKey:key];
}

-(void)removeAllSimpleSwitchButtonForKey {
    [simpleSwitchButtons removeAllObjects];
}

-(int)countOnItems {
    SimpleSwitchButton *simpleSwitchButton;
    int counter = 0;
    
    for(id key in simpleSwitchButtons.keyEnumerator) {
        simpleSwitchButton = simpleSwitchButtons[key];
        if(simpleSwitchButton.selected) ++counter;
    }
    return counter;
}

-(int)countOffItems {
    SimpleSwitchButton *simpleSwitchButton;
    int counter = 0;
    
    for(id key in simpleSwitchButtons.keyEnumerator) {
        simpleSwitchButton = simpleSwitchButtons[key];
        if(!simpleSwitchButton.selected) ++counter;
    }
    return counter;
}
-(int)countAllItems {
    return (int)simpleSwitchButtons.count;
}

-(NSArray *)getKeysOfOnItem {
    SimpleSwitchButton *simpleSwitchButton;
    NSMutableArray *onItems = [NSMutableArray arrayWithCapacity:0];
    
    for(id key in simpleSwitchButtons.keyEnumerator) {
        simpleSwitchButton = simpleSwitchButtons[key];
        if(simpleSwitchButton.selected) [onItems addObject:key];
    }
    return onItems;
}

-(NSArray *)getKeysOfOffItem {
    SimpleSwitchButton *simpleSwitchButton;
    NSMutableArray *offItems = [NSMutableArray arrayWithCapacity:0];
    
    for(id key in simpleSwitchButtons.keyEnumerator) {
        simpleSwitchButton = simpleSwitchButtons[key];
        if(!simpleSwitchButton.selected) [offItems addObject:key];
    }
    return offItems;
}

-(void)setAllItemsToOn {
    if(type == asRadioButton) {
        NSLog(@"this method only available when type equals to asCheckBox ");
        return;
    }

    SimpleSwitchButton *simpleSwitchButton;
    for(id key in simpleSwitchButtons.keyEnumerator) {
        simpleSwitchButton = simpleSwitchButtons[key];
        simpleSwitchButton.selected = YES;
    }
}

-(void)setAllItemsToOff {
    SimpleSwitchButton *simpleSwitchButton;
    
    for(id key in simpleSwitchButtons.keyEnumerator) {
        simpleSwitchButton = simpleSwitchButtons[key];
        simpleSwitchButton.selected = NO;
    }
}

-(void)toggleAllItems {
    if(type == asRadioButton) {
        NSLog(@"this method only available when type equals to asCheckBox ");
        return;
    }

    SimpleSwitchButton *simpleSwitchButton;
    for(id key in simpleSwitchButtons.keyEnumerator) {
        simpleSwitchButton = simpleSwitchButtons[key];
        simpleSwitchButton.selected = !simpleSwitchButton.selected;
    }
}

-(void)setToOnForKey:(NSString *) key {
    // ラジオボタンであれば、他が自動的にoffになるように、tapイベントを擬似的に発火させる。
    [self oneOfSimpleSwitchButtonTapped:key];
}

-(void)setToOffForKey:(NSString *) key {
    SimpleSwitchButton *simpleSwitchButton = simpleSwitchButtons[key];
    simpleSwitchButton.selected = NO;
}

-(void)addTargetForKey:(NSString *)key action:(SEL)action forControlEvents:(UIControlEvents)controlEvents {
    SimpleSwitchButton *simpleSwitchButton = simpleSwitchButtons[key];
    [simpleSwitchButton addTarget:simpleSwitchButton action:action forControlEvents:controlEvents];
}

-(void)oneOfSimpleSwitchButtonTapped:(NSString *)tappedKey {
    SimpleSwitchButton *simpleSwitchButton;
    
    for(id key in simpleSwitchButtons.keyEnumerator) {
        simpleSwitchButton = simpleSwitchButtons[key];
        [simpleSwitchButton changeStateByTappedKey:tappedKey];
    }
    
    if([self.delegate respondsToSelector:@selector(simpleSwitchButtonTapped:TappedKey:)]){
        [self.delegate simpleSwitchButtonTapped:self TappedKey:tappedKey];
    }

}

@end
