import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:metric/services/auth_service.dart';
import 'package:metric/services/unit_service.dart';
import 'package:metric/widgets/circular_material_spinner.dart';
import 'package:metric/widgets/unit_card.dart';

class StudentHomeScreen extends StatefulWidget {
  const StudentHomeScreen({Key key}) : super(key: key);

  @override
  _StudentHomeScreenState createState() => _StudentHomeScreenState();
}

class _StudentHomeScreenState extends State<StudentHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Container(
            color: Theme.of(context).primaryColor,
            padding: EdgeInsets.only(
                top: MediaQuery.of(context).viewInsets.top + 25),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        EvaIcons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                      Row(
                        children: [
                          Icon(
                            EvaIcons.bellOutline,
                            color: Colors.white,
                            size: 30,
                          ),
                          SizedBox(
                            width: 8,
                          ),
                          ClipRRect(
                            borderRadius:
                                BorderRadius.all(Radius.circular(150)),
                            child: Image.asset(
                              'assets/images/strath_logo.jpg',
                              height: 40,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Hi ${authService.authUser.name.split(' ')[0]}',
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                      color: Colors.white,
                    ),
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Text(
                    'Welcome To Metric',
                    style: TextStyle(color: Colors.white, letterSpacing: 1.0),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Row(
                      children: [
                        Expanded(
                          child: Container(
                            child: TextField(
                              decoration: InputDecoration(
                                  fillColor: Colors.white,
                                  isDense: true,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(8.0),
                                  ),
                                  filled: true,
                                  hintText: 'Search Unit'),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Icon(
                            EvaIcons.options2Outline,
                            color: Colors.white,
                            size: 30,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
              child: ValueListenableBuilder<bool>(
                  valueListenable: unitService.isGettingUnits,
                  builder: (context, isGettingUnits, _) {
                    return CircularMaterialSpinner(
                      loading: isGettingUnits,
                      color: Theme.of(context).primaryColor,
                      child: Column(
                        children: [
                          Expanded(child: UnitsGrid()),
                        ],
                      ),
                    );
                  }))
        ],
      ),
    );
  }
}

class UnitsGrid extends StatelessWidget {
  const UnitsGrid({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => unitService.loadUnits(),
      child: GridView.builder(
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 8,
            crossAxisSpacing: 4,
            childAspectRatio: 1.15),
        itemCount: unitService.units.length,
        itemBuilder: (context, index) => UnitCard(
          unit: unitService.units[index],
        ),
      ),
    );
  }
}
