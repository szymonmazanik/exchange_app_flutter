import 'package:exchange_app/app/utils/app_colors.dart';
import 'package:flutter/material.dart';
///Source: https://github.com/IronLad85/bubble_animated_tabbar/blob/master/lib/bubble_animated_tabbar.dart
///but modified a lot
class AnimatedTabbarWidget extends StatefulWidget {
  final int currentIndex;
  final onTap;
  final BoxDecoration containerDecoration;
  final EdgeInsets padding;
  List<Widget> tabBarChildren = [];

  AnimatedTabbarWidget(
      {Key key,
      @required this.currentIndex,
      @required this.onTap,
      @required List<Map> children,
      @required this.padding,
      this.containerDecoration})
      : super(key: key) {
    children.asMap().forEach((int index, Map tabData) {
      tabBarChildren.add(Expanded(
          flex: 0,
          child: AnimatedTabBarItem(
              tabData: tabData,
              index: index,
              onTap: onTap,
              tabState: getTabState(children, tabData))));
    });
  }

  getTabState(children, data) {
    return children.indexOf(data) == this.currentIndex ? "ACTIVE" : "INACTIVE";
  }

  @override
  AnimatedTabbarWidgetState createState() => AnimatedTabbarWidgetState();
}

class AnimatedTabbarWidgetState extends State<AnimatedTabbarWidget> {
  getContainerDecoration() {
    return widget.containerDecoration ?? BoxDecoration();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        // color:Color.fromRGBO(0,0,0,.21),
        decoration: getContainerDecoration(),
        padding: widget.padding,
        child: Row(
            children: widget.tabBarChildren,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.center));
  }
}

class AnimatedTabBarItem extends StatefulWidget {
  final tabData;
  final String tabState;
  final onTap;
  final int index;

  void onTabTap() {
    onTap(index);
  }

  AnimatedTabBarItem(
      {Key key,
      @required this.tabData,
      @required this.tabState,
      @required this.onTap,
      @required this.index})
      : super(key: key);

  @override
  AnimatedTabBarItemState createState() => AnimatedTabBarItemState();
}

class AnimatedTabBarItemState extends State<AnimatedTabBarItem>
    with SingleTickerProviderStateMixin {
  AnimationController controller;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  getTabColor() {
    return widget.tabData['color'];
  }

  getTabFontColor() {
    return widget.tabState == "ACTIVE"
        ? AppColors.textColor
        : widget.tabData['inactiveIconColor'] ?? Color.fromRGBO(0, 0, 0, 0.65);
  }

  Text getTabTextWidget() {
    if (widget.tabState == "ACTIVE") {
      return new Text(widget.tabData['title'] ?? "",
          style: TextStyle(color: getTabFontColor()));
    } else {
      return Text("");
    }
  }

  wrapAnimatedContainer(String tabState) {
    return AnimatedSize(
        vsync: this,
        curve: Curves.fastOutSlowIn,
        duration: Duration(milliseconds: 250),
        reverseDuration: Duration(milliseconds: 150),
        child: Container(
            padding: tabState == "ACTIVE"
                ? EdgeInsets.only(left: 6, right: 2)
                : EdgeInsets.all(0),
            child: getTabTextWidget()));
  }

  @override
  Widget build(BuildContext context) => GestureDetector(
      onTap: widget.onTabTap,
      child: AnimatedContainer(
          duration: Duration(milliseconds: 120),
          curve: Curves.easeInCirc,
          padding:
              widget.tabData['tabPadding'] ?? EdgeInsets.fromLTRB(10, 4, 10, 4),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(30)),
            color: widget.tabState == "ACTIVE"
                ? AppColors.secondaryColor
                : Color.fromRGBO(0, 0, 0, 0),
          ),
          child: Row(children: [
            Text(
              widget.tabData['symbol'],
              style: TextStyle(
                color: AppColors.textColor,
                fontSize: 24,
              ),
            ),
//                  new Icon(widget.tabData['icon'], color: getTabFontColor(), size: (widget.tabData['iconSize']?? 20).toDouble()),
            wrapAnimatedContainer(widget.tabState)
          ])));
}

/////Source: https://github.com/IronLad85/bubble_animated_tabbar/blob/master/lib/bubble_animated_tabbar.dart
//
//import 'package:flutter/material.dart';
//
//import '../home_bloc.dart';
//
//class AnimatedTabbarWidget extends StatefulWidget {
//  final int currentIndex;
//  final HomeBloc _bloc;
//  final BoxDecoration containerDecoration;
//  final EdgeInsets padding;
//  List<Widget> tabBarChildren = [];
//
//  AnimatedTabbarWidget(this._bloc,
//      {Key key,
//      @required this.currentIndex,
//      @required List<Map> children,
//      @required this.padding,
//      this.containerDecoration})
//      : super(key: key) {
//    children.asMap().forEach(
//      (int index, Map tabData) {
//        tabBarChildren.add(
//          Expanded(
//            flex: 0,
//            child: AnimatedTabBarItem(
//              _bloc,
//              tabData: tabData,
//              index: index,
//              tabState: getTabState(children, tabData),
//            ),
//          ),
//        );
//      },
//    );
//  }
//
//  getTabState(children, data) {
//    return children.indexOf(data) == this.currentIndex ? "ACTIVE" : "INACTIVE";
//  }
//
//  @override
//  AnimatedTabbarWidgetState createState() => AnimatedTabbarWidgetState();
//}
//
//class AnimatedTabbarWidgetState extends State<AnimatedTabbarWidget> {
//  getContainerDecoration() {
//    return widget.containerDecoration ?? BoxDecoration();
//  }
//
//  @override
//  Widget build(BuildContext context) {
//    return Container(
//        // color:Color.fromRGBO(0,0,0,.21),
//        decoration: getContainerDecoration(),
//        padding: widget.padding,
//        child: Row(
//            children: widget.tabBarChildren,
//            mainAxisAlignment: MainAxisAlignment.spaceAround,
//            crossAxisAlignment: CrossAxisAlignment.center));
//  }
//}
//
//class AnimatedTabBarItem extends StatefulWidget {
//  final tabData;
//  final String tabState;
//  final HomeBloc _bloc;
//  final int index;
//
//  AnimatedTabBarItem(this._bloc,
//      {Key key,
//      @required this.tabData,
//      @required this.tabState,
//      @required this.index})
//      : super(key: key);
//
//  @override
//  AnimatedTabBarItemState createState() => AnimatedTabBarItemState();
//}
//
//class AnimatedTabBarItemState extends State<AnimatedTabBarItem>
//    with SingleTickerProviderStateMixin {
//  AnimationController controller;
//
//  @override
//  void initState() {
//    super.initState();
//  }
//
//  @override
//  void dispose() {
//    super.dispose();
//  }
//
//  getTabColor() {
//    return widget.tabData['color'];
//  }
//
//  getTabFontColor() {
//    return widget.tabState == "ACTIVE"
//        ? widget.tabData['textColor']
//        : widget.tabData['inactiveIconColor'] ?? Color.fromRGBO(0, 0, 0, 0.65);
//  }
//
//  Text getTabTextWidget() {
//    if (widget.tabState == "ACTIVE") {
//      if (widget.tabData['customTextStyle'] != null) {
//        return new Text(widget.tabData['title'] ?? "",
//            style: widget.tabData['customTextStyle']);
//      } else {
//        return new Text(widget.tabData['title'] ?? "",
//            style: TextStyle(color: getTabFontColor()));
//      }
//    } else {
//      return Text("");
//    }
//  }
//
//  wrapAnimatedContainer(String tabState) => AnimatedSize(
//        vsync: this,
//        curve: Curves.fastOutSlowIn,
//        duration: Duration(milliseconds: 250),
//        reverseDuration: Duration(milliseconds: 150),
//        child: Container(
//          padding: tabState == "ACTIVE"
//              ? EdgeInsets.only(left: 6, right: 2)
//              : EdgeInsets.all(0),
//          child: getTabTextWidget(),
//        ),
//      );
//
//  @override
//  Widget build(BuildContext context) => SafeArea(
//        child: GestureDetector(
//          onTap: onTap,
//          child: AnimatedContainer(
//            duration: Duration(milliseconds: 120),
//            curve: Curves.easeInCirc,
//            padding: widget.tabData['tabPadding'] ??
//                EdgeInsets.fromLTRB(10, 4, 10, 4),
//            decoration: BoxDecoration(
//              borderRadius: BorderRadius.all(Radius.circular(30)),
//              color: widget.tabState == "ACTIVE"
//                  ? getTabColor()
//                  : Color.fromRGBO(0, 0, 0, 0),
//            ),
//            child: Row(
//              children: [
//                Text('#'),
//                wrapAnimatedContainer(widget.tabState)
//              ],
//            ),
//          ),
//        ),
//      );
//
//  onTap() => widget._bloc.currentCurrencyBaseIndexSink.add(widget.index);
//}
