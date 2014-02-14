SimpleSwitchButton
==================

On/Off切り替え可能なボタン(Switchのようなボタン)を作成できます。
On, Offそれぞれの状態に対し画像を設定することで、ボタンの状態を表現できます。

複数のボタンをSimpleSwitchButtonCollectionで管理することによって、

* Switchボタンのうちどれか一つのみを選択できるラジオボタン
* いくつでも選択可能なチェックボックス

のようなUIをつくることができます。
ついでにall On/Offメソッドやtoggleメソッドなども用意しました。


動作イメージ:

![動作イメージ](https://github.com/matsu-chara/SimpleSwitchButton/blob/master/SimpleSwitchButton/images/capture.png?raw=true)

## インストール

デモ内にある以下の4つをプロジェクトに追加

* SimpleSwitchButtonCollection.h
* SimpleSwitchButtonCollection.m
* SimpleSwitchButton.h
* SimpleSwitchButton.m

使用したいファイルでSimpleSwitchButtonCollection.hをインポート

以下のように、simpleSwitchButtonCollectionを一つと、SimpleSwitchButtonを必要なだけ生成し、ビューに加える。

```objc
SimpleSwitchButtonCollection* simpleSwitchButtonCollection = [[SimpleSwitchButtonCollection alloc] initWithSimpleSwitchButtonMode:asCheckBox];

SimpleSwitchButton *ore = [simpleSwitchButtonCollection createSimpleSwitchButtonForKey:@"ore" ButtonFrame:CGRectMake(0, 50, 100, 100) OnImageName:@"ore_on.png" OffImageName:@"ore_off.png"];
[self.view addSubview:ore];

SimpleSwitchButton *mido = [simpleSwitchButtonCollection createSimpleSwitchButtonForKey:@"mido" ButtonFrame:CGRectMake(100, 50, 100, 100) OnImageName:@"mido_on.png" OffImageName:@"mido_off.png"];
[self.view addSubview:mido];

```

ONになっているキーの数や、ONになっているキーを取得したい場合は以下のように

```objc
int counter = [simpleSwitchButtonCollection countOnItems];
NSArray* onKeys = [simpleSwitchButtonCollection getKeysOfOnItem]);
```



詳しくはデモを参照。  
勢いで作ったのでちゃんとテストしてません。  
バグがあったら教えてください・・・。
