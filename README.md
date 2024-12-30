# velocore

Collection of reusable widgets and utils.

You can add it to your project by adding this to your pubspec.yaml:
`velocore: 0.0.2`

Some of widgets: 

`ScrollKeyboardCloser`
Hide keyboard on scroll
```
ScrollKeyboardCloser(
    child: child,
)
```

`ScrollableColumn`
Column, where you can use `Expanded` and `Spacer` while being in a scroll view
```
ScrollbaleColumn(
    children: [
        Header(),
        Expanded(ContentWidget()),
        BottomButton(), // <- this one will be in the bottom of the screen 
        // if the Content can fit. Otherwise, the button will be in the end of the scroll content
    ],
)
```

`CustomSlopeTapDetector`
A tap detector with a customizable touch slope
```
CustomSlopeTapDetector(
    onTap: _onTap,
    factor: 2, <- that will multiply the default touch slope by 2
)
```

`MeasureSize`
Widget that notify about it's child's size changes
```
MeasureSize(
    onChange: (size) => print(size),
    child: child,
)
```