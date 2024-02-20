import 'package:flutter/material.dart';
import 'package:gsc2024/model/constants.dart';
import 'package:intl/intl.dart';

class HistoryCard extends StatefulWidget {
  HistoryCard({
    super.key,
    required this.mainPercentage,
    required this.date,
    required this.diffPercentage,
    this.lastCard,
  });

  final int mainPercentage;
  final DateTime date;
  final String diffPercentage;
  final bool? lastCard;

  @override
  State<HistoryCard> createState() => _HistoryCardState();
}

class _HistoryCardState extends State<HistoryCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(right: widget.lastCard == true ? 0 : 16),
      padding: EdgeInsets.all(8),
      height: 76,
      width: 170,
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
