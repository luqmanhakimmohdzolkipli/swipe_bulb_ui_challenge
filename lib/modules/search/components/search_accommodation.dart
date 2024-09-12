import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class SearchAccommodation extends StatelessWidget {
  const SearchAccommodation({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const Expanded(
          flex: 6,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('KLCC - KL TOWER'),
              SizedBox(height: 5),
              Row(
                children: [
                  Icon(
                    FontAwesomeIcons.bed,
                    size: 15,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    FontAwesomeIcons.personSwimming,
                    size: 15,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    FontAwesomeIcons.bowlFood,
                    size: 15,
                  ),
                  SizedBox(width: 20),
                  Icon(
                    FontAwesomeIcons.wifi,
                    size: 15,
                  ),
                ],
              )
            ],
          ),
        ),
        Expanded(
          flex: 4,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      'Available',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const Spacer(),
                    Text(
                      '6/10',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              LinearPercentIndicator(
                barRadius: const Radius.circular(50),
                percent: 0.6,
              ),
            ],
          ),
        )
      ],
    );
  }
}
