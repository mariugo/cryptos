import 'package:cryptos/app/features/details/data/models/crypto_coin_chart_model.dart';
import 'package:cryptos/app/features/details/presentation/controller/detail_screen_controller.dart';
import 'package:cryptos/app/features/details/presentation/controller/detail_screen_state.dart';
import 'package:cryptos/app/features/home/data/models/cryto_coin_model.dart';
import 'package:cryptos/core/base_state.dart';
import 'package:cryptos/core/extensions/size_extensions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class DetailScreen extends StatefulWidget {
  final CryptoCoinModel coin;
  const DetailScreen({super.key, required this.coin});

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState
    extends BaseState<DetailScreen, DetailScreenController> {
  final List<String> timePeriod = ['1 day', '5 days', '1 month', '1 year'];
  final String startPeriod = '1 day';

  String getCryptoDataTitle(int index) {
    switch (index) {
      case 0:
        return '% change 24h';
      case 1:
        return '\$ change 24h';
      case 2:
        return 'Price';
      case 3:
        return 'Market cap';
      case 4:
        return '24h Low';
      case 5:
        return '24h High';
      case 6:
        return 'ATL';
      case 7:
        return 'ATH';
      default:
        return '';
    }
  }

  String getCryptoDataValue(CryptoCoinModel coin, int index) {
    switch (index) {
      case 0:
        return coin.priceChangePercentage24h.toStringAsFixed(2);
      case 1:
        return coin.priceChange24h.toStringAsFixed(2);
      case 2:
        return coin.currentPrice.toStringAsFixed(2);
      case 3:
        return coin.marketCap.toString();
      case 4:
        return coin.low24.toString();
      case 5:
        return coin.high24.toString();
      case 6:
        return coin.atl.toString();
      case 7:
        return coin.ath.toString();
      default:
        return '';
    }
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      controller.getCoinChart(widget.coin.id, 1);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          onPressed: () => Navigator.pop(context),
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        backgroundColor: Colors.transparent,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.bookmark_border,
              color: Colors.white,
            ),
          ),
        ],
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              child: Image.network(
                widget.coin.image,
                //height: 30,
                //width: 30,
              ),
            ),
            SizedBox(
              width: context.percentWidth(0.02),
            ),
            Text(
              widget.coin.name,
              style: const TextStyle(
                overflow: TextOverflow.ellipsis,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
      body: BlocConsumer<DetailScreenController, DetailScreenState>(
        listener: (context, state) {
          state.status.matchAny(
              any: () => hideLoader(),
              loading: () => showLoader(),
              error: () {
                hideLoader();
                showError(state.message!);
              });
        },
        buildWhen: (previous, current) => current.status.matchAny(
          any: () => false,
          initial: () => true,
          success: () => true,
        ),
        builder: (context, state) {
          return state.status == DetailScreenStatus.loading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : state.status == DetailScreenStatus.error
                  ? const Center(
                      child: Text(
                        'Error',
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  : SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            SizedBox(
                              width: double.infinity,
                              height: 300,
                              child: SfCartesianChart(
                                trackballBehavior:
                                    TrackballBehavior(enable: true),
                                crosshairBehavior:
                                    CrosshairBehavior(enable: true),
                                primaryXAxis: const DateTimeAxis(
                                  isVisible: false,
                                  borderColor: Colors.transparent,
                                ),
                                primaryYAxis: NumericAxis(
                                  numberFormat: NumberFormat.compact(),
                                  isVisible: false,
                                ),
                                plotAreaBorderWidth: 0,
                                series: <AreaSeries>[
                                  AreaSeries<CryptoCoinChartModel, dynamic>(
                                    enableTooltip: true,
                                    color: Colors.transparent,
                                    borderColor: Colors.purple,
                                    borderWidth: 2,
                                    dataSource: state.graphData,
                                    xValueMapper:
                                        (CryptoCoinChartModel graphData, _) =>
                                            graphData.date,
                                    yValueMapper:
                                        (CryptoCoinChartModel graphData, _) =>
                                            graphData.price,
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
        },
      ),
    );
  }
}
