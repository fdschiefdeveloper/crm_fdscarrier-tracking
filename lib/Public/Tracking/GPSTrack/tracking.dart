// ignore_for_file: must_be_immutable

import 'package:crm_fdscarrier/DatabaseFunction/Functions.dart';
import 'package:crm_fdscarrier/responsive.dart';
import 'package:flutter/material.dart';
import 'package:crm_fdscarrier/ReusableElements/index.dart';
import 'package:crm_fdscarrier/globals.dart';

late List<dynamic> infoTracking;
Future<bool> getDataTracking(String where) async {
  infoTracking = await getTrackingInfo(where);

  return infoTracking.isEmpty ? true : false;
}

class Tracking extends StatefulWidget {
  const Tracking({Key? key}) : super(key: key);

  @override
  State<Tracking> createState() => _TrackingState();
}

class _TrackingState extends State<Tracking> {
  refresh() {
    setState(() {});
  }

  @override
  void initState() {
    infoTracking = [];
    super.initState();
  }

  late SearchBar searchBarTracking = SearchBar(
    selfvalidateAccions: () {},
    validateAccions: () {
      for (var item in [indicatorsContent] as dynamic) {
        item.searchValue = searchBarTracking.searchValue;
        item.selfvalidateAccions();
      }
    },
    hintText: "Type a tracking ID",
    searchValue: '',
  );

  late IndicatorsTracking indicatorsContent = IndicatorsTracking(
    validateAccions: () {},
    selfvalidateAccions: () {},
    searchValue: "",
  );

  Container logo = Container(
    margin: const EdgeInsets.symmetric(vertical: 50),
    constraints: const BoxConstraints(maxHeight: 150, maxWidth: 250),
    child: Image.asset(logoFDS),
  );

  @override
  Widget build(BuildContext context) {
    // Responsive responsive = Responsive(context);
    return Scaffold(
      //  backgroundColor: greyDefault,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                scale: 3.25,
                repeat: ImageRepeat.repeat,
                opacity: 0.05,
                image: AssetImage(logoFDS))),
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: ScrollBarDefault(
          child: Column(
            children: [
              logo,
              searchBarTracking,
              indicatorsContent,
              Container(
                padding: const EdgeInsets.symmetric(vertical: 50),
                color: Colors.transparent,
                child: const Text(
                  "© FDS 2022. All Rights Reserved",
                  style: TextStyle(
                    fontSize: 16,
                    color: Color.fromARGB(255, 95, 95, 95),
                    fontWeight: FontWeight.w700,
                    fontFamily: "Montserrat",
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class IndicatorsTracking extends StatefulWidget
    implements SearchBarRequirments {
  IndicatorsTracking(
      {Key? key,
      required this.selfvalidateAccions,
      required this.validateAccions,
      required this.searchValue})
      : super(key: key);

  @override
  State<IndicatorsTracking> createState() => _IndicatorsTrackingState();

  @override
  Function selfvalidateAccions;

  @override
  Function validateAccions;

  @override
  String searchValue;
}

class _IndicatorsTrackingState extends State<IndicatorsTracking> {
  Map<String, List<dynamic>> contentMap = {
    "Tracking_Code": [Icons.numbers, "Tracking ID"],
    "Driver_Name": [Icons.person, "Driver Name"],
    "Status": [Icons.online_prediction_outlined, "Status"],
    // "Last_Update_Time": [Icons.refresh, "Last update"],
    "Last_Location": [Icons.location_pin, "Latest Location"],
    "On_Duty_Week": [Icons.timer_sharp, "Week Cycle"],
  };
  List<Widget> listIndicators = [];
  List<Widget> creationIndicators() {
    listIndicators = [];
    if (widget.searchValue == "") {
      listIndicators.clear();
    } else if (infoTracking.isEmpty) {
      listIndicators.add(
        Container(
          color: Colors.transparent,
          margin: const EdgeInsets.only(bottom: 40),
          child: Column(
            children: const [
              Icon(
                Icons.warning_rounded,
                size: 100,
                color: colorPrimario,
              ),
              Padding(
                padding: EdgeInsets.only(top: 20, left: 10, right: 10),
                child: Text(
                  "Tracking ID not founded. Please check your code or contact your dispatcher.",
                  style: TextStyle(
                      color: colorTerciario,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
              ),
            ],
          ),
        ),
      );
    } else if (infoTracking.length == 1) {
      for (var key in contentMap.keys) {
        listIndicators.add(
          Container(
            margin: const EdgeInsets.all(10),
            width: 200,
            constraints: const BoxConstraints(minHeight: 200),
            decoration: BoxDecoration(
              border: Border.all(color: colorTerciario, width: 2),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Stack(
              children: [
                Column(
                  children: [
                    Container(
                      decoration: const BoxDecoration(
                          color: colorTerciario,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8),
                            topRight: Radius.circular(8),
                          )),
                      padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                      margin: const EdgeInsets.only(bottom: 10),
                      alignment: Alignment.center,
                      child: Text(
                        contentMap[key]![1],
                        style: FontStylesMonserrat.titleH1,
                        textAlign: TextAlign.center,
                      ),
                    ),
                    Container(
                      constraints: const BoxConstraints(minHeight: 120),
                      color: Colors.transparent,
                      alignment: Alignment.center,
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: Text(
                        infoTracking[0][key],
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          fontSize: 18,
                          color: Color.fromARGB(255, 60, 60, 60),
                          fontWeight: FontWeight.w700,
                          fontFamily: "Montserrat",
                        ),
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.transparent,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ///// WIDGET CREADO PARA AJUSTAR ICONO EN STACK /////
                      Container(
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 15),
                        alignment: Alignment.center,
                        child: Text(
                          contentMap[key]![1],
                          style: const TextStyle(
                            fontSize: 24,
                            color: Colors.transparent,
                            fontWeight: FontWeight.w500,
                            fontFamily: "Montserrat",
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 5),
                        padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            border: Border.all(color: colorTerciario, width: 3),
                            color: Colors.white,
                            shape: BoxShape.circle),
                        child: Icon(
                          contentMap[key]![0],
                          size: 25,
                          color: colorPrimario,
                        ),
                      ),
                    ],
                  ),
                )
                // )
              ],
            ),
          ),
        );
      }
    } else {
      List<Widget> aux = [];
      for (var i = 0; i < infoTracking.length; i++) {
        aux = [];
        for (var key in contentMap.keys) {
          aux.add(
            Container(
              margin: const EdgeInsets.all(10),
              width: 200,
              constraints: const BoxConstraints(minHeight: 200),
              decoration: BoxDecoration(
                border: Border.all(color: colorTerciario, width: 2),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        decoration: const BoxDecoration(
                            color: colorTerciario,
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(8),
                              topRight: Radius.circular(8),
                            )),
                        padding: const EdgeInsets.fromLTRB(0, 40, 0, 40),
                        margin: const EdgeInsets.only(bottom: 10),
                        alignment: Alignment.center,
                        child: Text(
                          contentMap[key]![1],
                          style: FontStylesMonserrat.titleH1,
                          textAlign: TextAlign.center,
                        ),
                      ),
                      Container(
                        constraints: const BoxConstraints(minHeight: 120),
                        color: Colors.transparent,
                        alignment: Alignment.center,
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          infoTracking[i][key],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                            fontSize: 18,
                            color: Color.fromARGB(255, 60, 60, 60),
                            fontWeight: FontWeight.w700,
                            fontFamily: "Montserrat",
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    color: Colors.transparent,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ///// WIDGET CREADO PARA AJUSTAR ICONO EN STACK /////
                        Container(
                          padding: const EdgeInsets.fromLTRB(0, 40, 0, 15),
                          alignment: Alignment.center,
                          child: Text(
                            contentMap[key]![1],
                            style: const TextStyle(
                              fontSize: 24,
                              color: Colors.transparent,
                              fontWeight: FontWeight.w500,
                              fontFamily: "Montserrat",
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(left: 5),
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              border:
                                  Border.all(color: colorTerciario, width: 3),
                              color: Colors.white,
                              shape: BoxShape.circle),
                          child: Icon(
                            contentMap[key]![0],
                            size: 25,
                            color: colorPrimario,
                          ),
                        ),
                      ],
                    ),
                  )
                  // )
                ],
              ),
            ),
          );
        }
        listIndicators.add(
          Container(
            margin: const EdgeInsets.symmetric(vertical: 10),
            child: Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: aux),
          ),
        );
      }
    }
    return listIndicators;
  }

  @override
  void initState() {
    widget.selfvalidateAccions = () async {
      await loadingTracking();
      setState(() {});
    };
    super.initState();
  }

  Future loadingTracking() async => {
        await dialogLoading(context, getDataTracking(widget.searchValue)),
        creationIndicators(),
      };

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(
              color: Color.fromARGB(255, 156, 156, 156),
              offset: Offset(0, 4),
              spreadRadius: 0,
              blurRadius: 8)
        ],
      ),
      margin: const EdgeInsets.only(top: 50),
      child: infoTracking.length <= 1
          ? Wrap(
              alignment: WrapAlignment.center,
              spacing: 10,
              children: listIndicators)
          : Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(bottom: 30, top: 20),
                  child: Text(
                    "Drivers",
                    style: FontStylesMonserrat.titleInspection,
                  ),
                ),
                ...listIndicators
              ],
            ),
    );
  }
}

class SearchBar extends StatefulWidget implements WidgetRequirments {
  SearchBar(
      {Key? key,
      required this.validateAccions,
      required this.selfvalidateAccions,
      required this.hintText,
      required this.searchValue})
      : super(key: key);
  @override
  Function validateAccions;
  @override
  State<SearchBar> createState() => _SearchBarState();

  @override
  Function selfvalidateAccions;
  final String hintText;
  String searchValue;
}

class _SearchBarState extends State<SearchBar> {
  TextEditingController controller = TextEditingController();

  @override
  void initState() {
    widget.searchValue = "764328271485";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Responsive responsive = Responsive(context);
    return Container(
      constraints: const BoxConstraints(minWidth: 200, maxWidth: 700),
      margin: responsive.isMobile
          ? EdgeInsets.zero
          : EdgeInsets.symmetric(
              vertical: 30,
              horizontal: MediaQuery.of(context).size.width * 0.185),
      decoration: responsive.isMobile
          ? const BoxDecoration(color: Colors.transparent)
          : BoxDecoration(
              color: colorPrimario,
              boxShadow: const [BoxShadow(blurRadius: 0.5)],
              borderRadius: BorderRadius.circular(10),
            ),
      child: Row(
        mainAxisAlignment: responsive.isMobile
            ? MainAxisAlignment.spaceEvenly
            : MainAxisAlignment.center,
        children: [
          Flexible(
            flex: responsive.isMobile ? 3 : 1,
            child: Container(
              padding: const EdgeInsets.only(right: 15),
              margin: responsive.isMobile
                  ? const EdgeInsets.symmetric(vertical: 30)
                  : EdgeInsets.zero,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(width: 1, color: colorPrimario),
                  borderRadius: BorderRadius.circular(10)),
              child: TextFormField(
                  onFieldSubmitted: (value) {
                    widget.validateAccions();
                  },
                  decoration: InputDecoration(
                    hintText: widget.hintText,
                    border: InputBorder.none,
                    prefixIcon: const Padding(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Icon(
                        Icons.search,
                        color: Colors.grey,
                      ),
                    ),
                    suffixIcon: IconButton(
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      hoverColor: Colors.transparent,
                      icon: const Icon(Icons.cancel_rounded, color: Colors.red),
                      onPressed: () {
                        controller.text = "";
                        widget.searchValue = "";
                        widget.validateAccions();
                      },
                    ),
                  ),
                  controller: controller,
                  initialValue: null,
                  onChanged: (String value) {
                    widget.searchValue = value;
                  }),
            ),
          ),
          responsive.isMobile
              ? Flexible(
                  fit: FlexFit.loose,
                  child: Container(
                    margin: const EdgeInsets.only(left: 10),
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: colorSecundario,
                    ),
                    child: IconButton(
                      mouseCursor: SystemMouseCursors.click,
                      hoverColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      icon: const Icon(
                        Icons.search,
                        color: Colors.white,
                      ),
                      onPressed: () {
                        widget.validateAccions();
                      },
                    ),
                  ),
                )
              : InkWell(
                  onTap: () {
                    widget.validateAccions();
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    width: 150,
                    height: 50,
                    color: Colors.transparent,
                    alignment: Alignment.center,
                    child: const Text(
                      "SEARCH",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.w300,
                          fontFamily: "Montserrat",
                          letterSpacing: 2),
                    ),
                  ),
                ),
        ],
      ),
    );
  }
}

class ScrollBarDefault extends StatefulWidget {
  const ScrollBarDefault({Key? key, required this.child}) : super(key: key);

  final Widget child;

  @override
  State<ScrollBarDefault> createState() => _ScrollBarDefaultState();
}

class _ScrollBarDefaultState extends State<ScrollBarDefault> {
  final _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 5),
      child: Scrollbar(
        controller: _scrollController,
        trackVisibility: true,
        thickness: 12,
        child: SingleChildScrollView(
          controller: _scrollController,
          child: widget.child,
        ),
      ),
    );
  }
}
