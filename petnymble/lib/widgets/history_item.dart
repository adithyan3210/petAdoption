import 'package:flutter/material.dart';
import 'package:petnymble/model/history_model.dart';

class AdoptHistoryItem extends StatefulWidget {
  final HistoryItemModel historyItem;

  const AdoptHistoryItem({
    super.key,
    required this.historyItem,
  });

  @override
  State<AdoptHistoryItem> createState() => _HistoryItemState();
}

class _HistoryItemState extends State<AdoptHistoryItem> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(
        top: 20,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            width: size.width * 0.30,
            height: size.height * 0.13,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(14),
            ),
            child: Center(
              child: Image.network(
                widget.historyItem.petModel.image,
                width: 70,
                height: 70,
                fit: BoxFit.contain,
              ),
            ),
          ),
          SizedBox(
            width: size.width * 0.45,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.historyItem.petModel.name,
                  style:TextStyle(
                    fontSize: size.width * 0.035,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: size.height * 0.005,
                ),
                Text(
                  "\$${widget.historyItem.petModel.price}",
                  style:TextStyle(
                    fontSize: size.width * 0.035,
                  ),
                ),
                SizedBox(
                  height: size.width * 0.030,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
