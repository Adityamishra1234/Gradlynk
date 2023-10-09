import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentpanel/presentation/features/event_history/bloc/event_history_bloc.dart';
import 'package:studentpanel/ui/screen/fund/plan_fund.dart';
import 'package:studentpanel/utils/constants.dart';
import 'package:studentpanel/utils/theme.dart';
import 'package:studentpanel/widgets/appbar.dart';
import 'package:studentpanel/widgets/customautosizetextmontserrat.dart';
import 'package:studentpanel/widgets/customdrawer.dart';

class EventHistoryView extends StatefulWidget {
  static const routeName = '/eventHistoryView';

  const EventHistoryView({super.key});

  @override
  State<EventHistoryView> createState() => _EventHistoryViewState();
}

class _EventHistoryViewState extends State<EventHistoryView> {
  late EventHistoryBloc eventHistoryBloc;

  @override
  void initState() {
    eventHistoryBloc = EventHistoryBloc();
    eventHistoryBloc.add(EventHistoryInitialEvent(0));
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventHistoryBloc, EventHistoryInitial>(
      bloc: eventHistoryBloc,
      listenWhen: (previous, current) => current is EventHistoryActionState,
      buildWhen: (previous, current) => current is! EventHistoryActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          appBar: const CustomAppBar('title'),
          drawer: CustomDrawer(
            index: 7,
          ),
          body: SafeArea(
            child: Container(
              alignment: Alignment.topCenter,
              child: Column(children: [
                if (state is EventHistoryInitial) ...[
                  if (state.status == Status.loading) ...[
                    getLoading(context)
                  ] else if (state.status == Status.loaded) ...[
                    // Padding(
                    //   padding: const EdgeInsets.only(top: 10),
                    //   child: Image.network(
                    //     "https://sieceducation.in/assets/assets/images/logo.png",
                    //     width: 150,
                    //     height: 50,
                    //   ),
                    // ),
                    const SizedBox(
                      height: 15,
                    ),
                    CustomAutoSizeTextMontserrat(
                      text: 'Event History',
                      fontSize: 25,
                      fontWeight: FontWeight.w600,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // if (state is EventHistoryFetchedState) ...[
                    SizedBox(
                      height: 30,
                      width: MediaQuery.sizeOf(context).width - 20,
                      child: customDropDownPlanFund(
                        model: state.nameListOfEventHistory,
                        callback: (value) {
                          print(value);
                          eventHistoryBloc
                              .add(EventHistoryClickEvent(value, ''));
                          // controller.selectedRelationship =
                          //     controller.relationShip[value];
                          // controller.update();
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Expanded(
                        child: Container(
                      padding: EdgeInsets.all(30),
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                          color: ThemeConstants.whitecolor,
                          boxShadow: const [
                            BoxShadow(
                                color: Color.fromARGB(29, 0, 0, 0),
                                offset: Offset.zero,
                                blurRadius: 3,
                                spreadRadius: 0.0)
                          ],
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          )),
                      child: ListView(children: [
                        Align(
                          alignment: Alignment.topLeft,
                          child: CustomAutoSizeTextMontserrat(
                              text: "${state.nameOfEvent}",
                              textColor: ThemeConstants.bluecolor,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        ...state.eventHistoryTimelineWidget
                      ]),
                    ))
                  ]
                ]
              ]
                  // ],
                  ),
            ),
          ),
        );
      },
    );
  }
}

/////
///
///
///      success: true,
///      model: [
/// {
/// name: "event start",
/// time: '120',
/// icon: '',
///
/// }
/// ]
