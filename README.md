# werewolf_quantjudge

A new Flutter project.

## Getting Started

This project is a starting point for a Flutter application.

A few resources to get you started if this is your first Flutter project:

- [Lab: Write your first Flutter app](https://flutter.dev/docs/get-started/codelab)
- [Cookbook: Useful Flutter samples](https://flutter.dev/docs/cookbook)

For help getting started with Flutter, view our
[online documentation](https://flutter.dev/docs), which offers tutorials,
samples, guidance on mobile development, and a full API reference.

## Judge

1. 发言逻辑行为：

是否在掰他人逻辑
是否在掰自己逻辑
是否与自己逻辑不相符


## TODOLIST

轮数选择器（暂时由date模拟）
角色选择器

## Demo

玩家根据角色的行为进行判定：
1. app只记录行为，不提供身份引导和判断
2. 记录的行为均以数值体现
3. 记录的行为均以tag形式体现，并且根据tag形成可视化
   3.1. 比如跳一个角色行为，隐含着跳还是明着跳，
        3.1.1. 明着跳的tag又分为悍跳还是正身份还是不确定


## Properties

EdgeInsets.symmetric：上下左右对称边界，用于margin

Container的边界
```Dart
decoration: 
  BoxDecoration(
    border: Border.all(
      color: Colors.black,
      width: 5,
    ),
  ),
```

ListView
```Dart
child: ListView.builder(
    itemCount: mappedBehaviors.length,
    itemBuilder: (ctx, index) { }
```

showModalBottomSheet(context: ctx, builder: (bCtx) {});

输入以后关闭
```Dart
Navigator.of(context).pop();
```

将list里的东西map出来
```Dart
Row (
  children: list.map((data) {
    return Text('$data['day']);
  }).toList(),
),
```

让chart在mainAxis里保持间距一致
```flex```后面的数字表示该区域所占分数，默认1
```Dart
return Flexible(
  flex: 5,
  fit: FlexFit.tight,
  child: ChartBar(
    individualRecord.player,
    individualRecord.maxBehaviorTotal,
    individualRecord.indBehaviorTotal,
    individualRecord.behaviorRecords,
  ),
);
```

固定区域里，text的大小随着text量改变
```Dart
FittedBox(
  child: Text(
    'P${player}',
    style: TextStyle(fontSize: 10),
  ),
),
```

### 改变AppIcon

在```pubspec.yaml```里，添加：
```yaml
dependencies:
  flutter_launcher_icons: "^0.7.0"

flutter_icons:
  image_path: "assets/images/IconWerewolf.png" 
  android: "launcher_icon"
  ios: true
```
Terminal指令：
```
flutter pub get
flutter pub pub run flutter_launcher_icons:main
```

### 没有解决的问题 ###

```
════════ Exception caught by gesture ═══════════════════════════════════════════
The following ConcurrentModificationError was thrown while handling a gesture:
Concurrent modification during iteration: Instance(length:1) of '_GrowableList'.

When the exception was thrown, this was the stack
#0      ListIterator.moveNext  (dart:_internal/iterable.dart:338:7)
#1      BehaviorController.regroupedIndividualRecordsAfterDelete 
package:werewolf_quantjudge/controllers/behaviorController.dart:134
#2      _MyHomePageState._deleteBehavior.<anonymous closure> 
#3      State.setState 
package:flutter/…/widgets/framework.dart:1141
#4      _MyHomePageState._deleteBehavior 
package:werewolf_quantjudge/main.dart:93
...
Handler: "onTap"
Recognizer: TapGestureRecognizer#fa6cc
    debugOwner: GestureDetector
    state: ready
    won arena
    finalPosition: Offset(374.7, 417.7)
    finalLocalPosition: Offset(28.7, 27.7)
    sent tap down
════════════════════════════════════════════════════════════════════════════════

git: 8a9b44fbc18bf0c7cb14ae1cc2bb13c96af4e22e
```