SimpleSwitchButton
==================

On/Off切り替え可能なボタン(Switchのようなボタン)を作成できます。
それぞれの状態に対し、画像を設定することでボタンの状態を分かりやすく変更できます。

複数のボタンをSwitchButtonCollectionで管理することによって、
* Switchボタンのうちどれか一つのみを選択できるラジオボタン
* いくつでも選択可能なチェックボックス

のようなUIをつくることができます。

![動作イメージ](https://github.com/matsu-chara/SimpleSwitchButton/SimpleSwitchButton/images/capture.png)

ついでにAll ON/OFFメソッドなども用意しました。


## インストール

デモ内にある以下の4つをプロジェクトに追加

* SwitchButtonCollection.h
* SwitchButtonCollection.m
* SwitchButton.h
* SwitchButton.m

使用したいファイルでSwitchButtonCollection.hをインポート

以下のように、switchButtonCollectionを一つと、SwitchButtonを必要なだけ生成し、ビューに加える。

```objective-c
SwitchButtonCollection* switchButtonCollection = [[SwitchButtonCollection alloc] initWithSwitchButtonMode:asCheckBox];

SwitchButton *ore = [switchButtonCollection createSwitchButtonForKey:@"ore" ButtonFrame:CGRectMake(0, 50, 100, 100) OnImageName:@"ore_on.png" OffImageName:@"ore_off.png"];
[self.view addSubview:ore];

SwitchButton *mido = [switchButtonCollection createSwitchButtonForKey:@"mido" ButtonFrame:CGRectMake(100, 50, 100, 100) OnImageName:@"mido_on.png" OffImageName:@"mido_off.png"];
[self.view addSubview:mido];

```

ONになっているキーの数や、ONになっているキーを取得したい場合は以下のように

```objective-c
int counter = [switchButtonCollection countOnItems];
NSArray* onKeys = [switchButtonCollection getKeysOfOnItem]);
```



詳しくはデモを参照。  
勢いで作ったのでちゃんとテストしてません。  
むしろバグがあったら教えてください・・・。
