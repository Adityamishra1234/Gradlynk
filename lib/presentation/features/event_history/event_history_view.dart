import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:studentpanel/presentation/features/event_history/bloc/event_history_bloc.dart';
import 'package:studentpanel/ui/screen/fund/plan_fund.dart';
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
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<EventHistoryBloc, EventHistoryState>(
      bloc: eventHistoryBloc,
      listenWhen: (previous, current) => current is EventHistoryActionState,
      buildWhen: (previous, current) => current is! EventHistoryActionState,
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        return Scaffold(
          // appBar: const CustomAppBar('title'),
          drawer: CustomDrawer(
            index: 7,
          ),
          body: SafeArea(
            child: Container(
              alignment: Alignment.topCenter,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Image.network(
                      "https://sieceducation.in/assets/assets/images/logo.png",
                      width: 150,
                      height: 50,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  CustomAutoSizeTextMontserrat(text: 'Event History'),
                  SizedBox(
                    height: 15,
                  ),
                  SizedBox(
                    height: 30,
                    width: MediaQuery.sizeOf(context).width - 20,
                    child: customDropDownPlanFund(
                      model: const [
                        'ee',
                        'dede',
                        'ee',
                        'dede' 'ee',
                        'dede' 'ee',
                        'dede' 'ee',
                        'dede' 'ee',
                        'dede'
                      ],
                      callback: (value) {
                        // controller.selectedRelationship =
                        //     controller.relationShip[value];
                        // controller.update();
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Expanded(
                      child: Container(
                    decoration: BoxDecoration(
                        color: ThemeConstants.GreenColor,
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        )),
                  ))
                ],
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