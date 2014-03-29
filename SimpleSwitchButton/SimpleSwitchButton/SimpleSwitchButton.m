#import "SimpleSwitchButton.h"

@implementation SimpleSwitchButton {
    NSString *myKey;
    SimpleSwitchButtonType type;
}

-(id)initWithFrame:(CGRect)frame ForKey:(NSString *)key OnImageName:(NSString *)onImageName OffImageName:(NSString *)offImageName {
    self = [self initWithFrame:frame];
    if(self) {
        [self setKey:key OnImageName:onImageName OffImageName:offImageName];
    }
    return self;
}

-(id)initWithFrame:(CGRect)frame ForKey:(NSString *)key OnImageName:(NSString *)onImageName OnHighlitedImageName:(NSString *)onHighlitedImageName OffImageName:(NSString *)offImageName OffHighlitedImageName:(NSString *)offHighlitedImageName {

    self = [self initWithFrame:frame];
    if(self) {
        [self setKey:key OnImageName:onImageName OnHighlitedImageName:onHighlitedImageName OffImageName:offImageName OffHighlitedImageName:offHighlitedImageName];
    }
    return self;
}

-(void)setKey:(NSString *)key OnImageName:(NSString *)onImageName OffImageName:(NSString *)offImageName {
    myKey = key;
    type = asCheckBox;
    self.selected = NO;
    
    // off画像
    [self setBackgroundImage:[UIImage imageNamed:offImageName] forState:UIControlStateNormal];
    
    // on画像
    [self setBackgroundImage:[UIImage imageNamed:onImageName] forState:UIControlStateNormal | UIControlStateSelected];
    
    [self addTarget:self action:@selector(SwitchButtonTapped:) forControlEvents:UIControlEventTouchDown];
}
-(void)setKey:(NSString *)key OnImageName:(NSString *)onImageName OnHighlitedImageName:(NSString *)onHighlitedImageName OffImageName:(NSString *)offImageName OffHighlitedImageName:(NSString *)offHighlitedImageName {

    [self setKey:key OnImageName:onImageName OnHighlitedImageName:onHighlitedImageName OffImageName:offImageName OffHighlitedImageName:offHighlitedImageName];
    
    // offタップ中画像
    [self setBackgroundImage:[UIImage imageNamed:offImageName] forState:UIControlStateHighlighted];
    
    // onタップ中画像
    [self setBackgroundImage:[UIImage imageNamed:onImageName] forState:UIControlStateHighlighted | UIControlStateSelected];
}


-(void)setType:(SimpleSwitchButtonType)buttonType {
    type = buttonType;
}

-(void)SwitchButtonTapped:(SimpleSwitchButton *)sender {
    //押されたことをSwitchButtonMangerに伝える。
    if(![self.delegate respondsToSelector:@selector(oneOfSimpleSwitchButtonTapped:)]) {
        NSLog(@"%@ error: oneOfSimpleSwitchButtonTapped is not be implemented in delegated class.", NSStringFromClass([self class]));
        return;
    }
    [self.delegate oneOfSimpleSwitchButtonTapped:myKey];

}

-(void)changeStateByTappedKey:(NSString *)tappedKey {
    switch (type) {
        case asRadioButton:
            // 押されたのが自分自身ならONにする。他が押されたらOFFにする。
            self.selected = ([myKey isEqualToString:tappedKey])? YES : NO;
            break;
        case asToggleRadioButton:
            // 押されたのが自分自身なら状態を反転する。他が押されたらOFFにする。
            self.selected = ([myKey isEqualToString:tappedKey])? !self.selected : NO;
            break;
        case asCheckBox:
            // 押されたのが自分自身なら状態を反転させる。他が押されていたらそのまま。
            self.selected = ([myKey isEqualToString:tappedKey])? !self.selected : self.selected;
            break;
        default:
            break;
    }
}

@end
