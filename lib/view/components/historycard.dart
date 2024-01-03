import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatefulWidget {
  HistoryCard({
    super.key,
    required this.mainPercentage,
    required this.date,
    required this.diffPercentage,
  });

  final int mainPercentage;
  final DateTime date;
  final String diffPercentage;

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: 11),
      padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      height: 76,
      width: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        color: AppColor.kButtonColor,
        border: Border.all(
          color: AppColor.kTextColor,
          width: 1.60,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${widget.mainPercentage}%',
                style: TextStyle(
                  color: AppColor.kBackgroundColor,
                  fontSize: 20,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w500,
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 3),
                alignment: Alignment.center,
                height: 21,
                width: 58,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(4),
                  color: Color(0xFF1F1F1F),
                ),
                child: Text(
                  widget.diffPercentage,
                  style: TextStyle(
                    color: Color(0xFFA1F99F),
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
          Text(
            '${DateFormat('dd MMMM').format(widget.date)}',
            style: TextStyle(
              color: AppColor.kBackgroundColor,
              fontSize: 16,
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
            ),
          )
        ],
      ),
    );
  }
}
