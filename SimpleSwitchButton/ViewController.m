#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    /*
     * checkBox風ボタン
     */
    
    // Collectionの作成 switchButtonModeをasCheckBoxとする。
    SimpleSwitchButtonCollection* simpleSwitchButtonCollection = [[SimpleSwitchButtonCollection alloc] initWithSimpleSwitchButtonMode:asCheckBox];
    simpleSwitchButtonCollection.delegate = self;
    // ボタンの作成
    SimpleSwitchButton *ore = [simpleSwitchButtonCollection createSimpleSwitchButtonForKey:@"ore" ButtonFrame:CGRectMake(0, 50, 100, 100) OnImageName:@"ore_on.png" OffImageName:@"ore_off.png"];
    SimpleSwitchButton *mido = [simpleSwitchButtonCollection createSimpleSwitchButtonForKey:@"mido" ButtonFrame:CGRectMake(100, 50, 100, 100) OnImageName:@"mido_on.png" OffImageName:@"mido_off.png"];
    SimpleSwitchButton *mura = [simpleSwitchButtonCollection createSimpleSwitchButtonForKey:@"mura" ButtonFrame:CGRectMake(200, 50, 100, 100) OnImageName:@"mura_on.png" OffImageName:@"mura_off.png"];
    
    // デモ用のラベル等を作成
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(5, 10, 100, 50)];
    label.text = @"Checkbox風";
    UIButton *allOnButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    allOnButton.frame = CGRectMake(105, 10, 60, 50);
    [allOnButton setTitle:@"全部ON" forState:UIControlStateNormal];
    [allOnButton addTarget:simpleSwitchButtonCollection action:@selector(setAllItemsToOn) forControlEvents:UIControlEventTouchDown];
    UIButton *allOffButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    allOffButton.frame = CGRectMake(165, 10, 60, 50);
    [allOffButton setTitle:@"全部OFF" forState:UIControlStateNormal];
    [allOffButton addTarget:simpleSwitchButtonCollection action:@selector(setAllItemsToOff) forControlEvents:UIControlEventTouchDown];
    UIButton *allToggleButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    allToggleButton.frame = CGRectMake(225, 10, 60, 50);
    [allToggleButton setTitle:@"入れ替え" forState:UIControlStateNormal];
    [allToggleButton addTarget:simpleSwitchButtonCollection action:@selector(toggleAllItems) forControlEvents:UIControlEventTouchDown];
    _counterLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 150, 300, 50)];
    _counterLabel.text = [NSString stringWithFormat:@"ON = %d個, OFF = %d個, ALL = %d個", [simpleSwitchButtonCollection countOnItems], [simpleSwitchButtonCollection countOffItems], [simpleSwitchButtonCollection countAllItems]];
    
    
    /*
     * RadioButton風ボタン
     */
    
    // collectionに設定 switchButtonModeをasRadioButtonに設定
    SimpleSwitchButtonCollection* simpleSwitchButtonCollection2 = [[SimpleSwitchButtonCollection alloc] initWithSimpleSwitchButtonMode:asRadioButton];
    
    // ボタンの作成
    SimpleSwitchButton *ore2 = [simpleSwitchButtonCollection2 createSimpleSwitchButtonForKey:@"ore" ButtonFrame:CGRectMake(0, 250, 100, 100) OnImageName:@"ore_on.png" OffImageName:@"ore_off.png"];
    SimpleSwitchButton *mido2 = [simpleSwitchButtonCollection2 createSimpleSwitchButtonForKey:@"mido" ButtonFrame:CGRectMake(100, 250, 100, 100) OnImageName:@"mido_on.png" OffImageName:@"mido_off.png"];
    SimpleSwitchButton *mura2 = [simpleSwitchButtonCollection2 createSimpleSwitchButtonForKey:@"mura" ButtonFrame:CGRectMake(200, 250, 100, 100) OnImageName:@"mura_on.png" OffImageName:@"mura_off.png"];
    
    // デモ用のラベル等を作成
    UILabel* label2 = [[UILabel alloc] initWithFrame:CGRectMake(5, 210, 120, 50)];
    label2.text = @"Radiobutton風";
    UIButton* allOnButton2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    allOnButton2.frame = CGRectMake(105, 210, 100, 50);
    [allOnButton2 setTitle:@"全部OFF" forState:UIControlStateNormal];
    [allOnButton2 addTarget:simpleSwitchButtonCollection2 action:@selector(setAllItemsToOff) forControlEvents:UIControlEventTouchDown];
    
    // ビューに追加
    [self.view addSubview:ore];
    [self.view addSubview:mido];
    [self.view addSubview:mura];
    [self.view addSubview:label];
    [self.view addSubview:allOnButton];
    [self.view addSubview:allOffButton];
    [self.view addSubview:allToggleButton];
    [self.view addSubview:_counterLabel];
    [self.view addSubview:ore2];
    [self.view addSubview:mido2];
    [self.view addSubview:mura2];
    [self.view addSubview:label2];
    [self.view addSubview:allOnButton2];
}

-(void)simpleSwitchButtonTapped:(SimpleSwitchButtonCollection *)simpleSwitchButtonCollection TappedKey:(NSString *)tappedKey{
    _counterLabel.text = [NSString stringWithFormat:@"ON = %d個, OFF = %d個, ALL = %d個", [simpleSwitchButtonCollection countOnItems], [simpleSwitchButtonCollection countOffItems], [simpleSwitchButtonCollection countAllItems]];
    NSLog(@"%@", [simpleSwitchButtonCollection getKeysOfOnItem]);
    
}

@end
