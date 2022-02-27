import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class StatScreen extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<StatScreen> {
  List<GDPData> _chartData;
  TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              centerTitle: true,
              title: const Text('Statystyki'),
            ),
            body: SfCircularChart(
              title: ChartTitle(
                text: 'Pieniądze uzyskane dzięki aplikacji',
                textStyle: TextStyle(fontWeight: FontWeight.bold),
              ),
              legend: Legend(
                  isVisible: true, overflowMode: LegendItemOverflowMode.wrap),
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
                RadialBarSeries<GDPData, String>(
                    dataSource: _chartData,
                    xValueMapper: (GDPData data, _) => data.continent,
                    yValueMapper: (GDPData data, _) => data.gdp,
                    dataLabelSettings: DataLabelSettings(isVisible: true),
                    enableTooltip: true,
                    maximumValue: 1000)
              ],
            )));
  }

  List<GDPData> getChartData() {
    final List<GDPData> chartData = [
      GDPData('MBank', 900),
      GDPData('Milenium', 490),
      GDPData('ING', 900),
      GDPData('PKO', 50),
    ];
    return chartData;
  }
}

class GDPData {
  GDPData(this.continent, this.gdp);
  final String continent;
  final int gdp;
}
