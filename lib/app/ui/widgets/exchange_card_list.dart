import 'package:exchange_app/app/ui/widgets/exchange_rate_renderer_widget.dart';
import 'package:exchange_app/app/ui/widgets/rotation_3d_widget.dart';
import 'package:exchange_app/app/utils/bloc_provider.dart';
import 'package:exchange_app/data/entity/internal/rate_info.dart';
import 'package:flutter/material.dart';

import '../home_bloc.dart';

class ExchangeCardList extends StatefulWidget {
  @override
  _ExchangeCardListState createState() => _ExchangeCardListState();
}

class _ExchangeCardListState extends State<ExchangeCardList>
    with SingleTickerProviderStateMixin {
  final double _maxRotation = 20;
  HomeBloc _bloc;
  PageController _pageController;

  double _cardWidth = 160;
  double _cardHeight = 200;
  double _normalizedOffset = 0;
  double _prevScrollX = 0;
  bool _isScrolling = false;

  AnimationController _tweenController;
  Tween<double> _tween;
  Animation<double> _tweenAnim;

  List<RateInfo> _rateInfoList;

  @override
  void initState() {
    super.initState();
    _bloc = BlocProvider.of<HomeBloc>(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var _cardHeight = (size.height * .48).clamp(300.0, 400.0);
    var _cardWidth = _cardHeight * .8;
    _pageController = PageController(
      initialPage: HomeBloc.initialCardIndex,
      viewportFraction: _cardWidth / size.width,
    );

    var listContent = Container(
      height: _cardHeight,
      child: StreamBuilder<List<RateInfo>>(
        stream: _bloc.rateInfoList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            _rateInfoList = snapshot.data;
            return PageView.builder(
              physics: BouncingScrollPhysics(),
              controller: _pageController,
              itemCount: _rateInfoList.length,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, i) => _buildItemRenderer(_rateInfoList[i]),
            );
          }
          return Container();
        },
      ),
    );

    return Listener(
      onPointerUp: _handlePointerUp,
      child: NotificationListener(
        onNotification: _handleScrollNotifications,
        child: listContent,
      ),
    );
  }

  Widget _buildItemRenderer(RateInfo item) => Container(
        child: Rotation3dWidget(
          rotationY: _normalizedOffset * _maxRotation,
          child: ExchangeRateRendererWidget(
            _normalizedOffset,
            rateInfo: item,
            cardWidth: _cardWidth,
            cardHeight: _cardHeight,
          ),
        ),
      );

  bool _handleScrollNotifications(Notification notification) {
    if (notification is ScrollUpdateNotification) {
      if (_isScrolling) {
        double dx = notification.metrics.pixels - _prevScrollX;
        double scrollFactor = .01;
        double newOffset = (_normalizedOffset + dx * scrollFactor);
        _setOffset(newOffset.clamp(-1.0, 1.0));
      }
      _prevScrollX = notification.metrics.pixels;
      _bloc.currentRateInfoIndexSink.add(_pageController.page.round());
    } else if (notification is ScrollStartNotification) {
      _isScrolling = true;
      _prevScrollX = notification.metrics.pixels;
      if (_tween != null) {
        _tweenController.stop();
      }
    }
    return true;
  }

  void _handlePointerUp(PointerUpEvent event) {
    if (_isScrolling) {
      _isScrolling = false;
      _startOffsetTweenToZero();
    }
  }

  void _setOffset(double value) {
    setState(() {
      _normalizedOffset = value;
    });
  }

  void _startOffsetTweenToZero() {
    int tweenTime = 1000;
    if (_tweenController == null) {
      _tweenController = AnimationController(
          vsync: this, duration: Duration(milliseconds: tweenTime));
      _tween = Tween<double>(begin: -1, end: 0);
      _tweenAnim = _tween.animate(new CurvedAnimation(
          parent: _tweenController, curve: Curves.elasticOut))
        ..addListener(() {
          _setOffset(_tweenAnim.value);
        });
    }

    _tween.begin = _normalizedOffset;
    _tweenController.reset();
    _tween.end = 0;
    _tweenController.forward();
  }
}
