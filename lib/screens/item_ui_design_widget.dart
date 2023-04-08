import 'package:codeshastra/screens/item_details_screen.dart';
import 'package:codeshastra/screens/items.dart';
import 'package:codeshastra/utils/constants.dart';
import 'package:flutter/material.dart';

class ItemUIDesignWidget extends StatefulWidget {
  Items? itemsInfo;
  BuildContext? context;

  ItemUIDesignWidget({
    this.itemsInfo,
    this.context,
  });

  @override
  State<ItemUIDesignWidget> createState() => _ItemUIDesignWidgetState();
}

class _ItemUIDesignWidgetState extends State<ItemUIDesignWidget> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        //send user to the item detail screen
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (c) => ItemDetailsScreen(
                      clickedItemInfo: widget.itemsInfo,
                    )));
      },
      splashColor: Colors.purple,
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Color(0xffbebebe).withOpacity(0.2),
              ),
              child: Column(
                children: [
                  //image
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 5),
                      child: Image.network(
                        widget.itemsInfo!.itemImage.toString(),
                        width: 140,
                        height: 140,
                      ),
                    ),
                  ),

                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const SizedBox(height: 10),

                        //item name
                        Expanded(
                          child: Text(
                            widget.itemsInfo!.itemName.toString(),
                            maxLines: 2,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ),

                        //seller name
                        Expanded(
                          child: Text(
                            widget.itemsInfo!.sellerName.toString(),
                            maxLines: 2,
                            style: const TextStyle(
                              color: kPrimaryColor,
                              fontSize: 14,
                            ),
                          ),
                        ),

                        //show discount badge - 50% OFF badge
                        //price origional
                        // new price
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //50% OFF badge

                            //origional price
                            //new price
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //origional price
                                Row(
                                  children: [
                                    const Text(
                                      "\₹",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                    Text(
                                      (double.parse(widget
                                                  .itemsInfo!.itemPrice!) +
                                              double.parse(
                                                  widget.itemsInfo!.itemPrice!))
                                          .toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: Colors.white,
                                        decoration: TextDecoration.lineThrough,
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                //new price
                                Row(
                                  children: [
                                    const Text(
                                      "",
                                      style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.grey,
                                      ),
                                    ),
                                    const Text(
                                      "\₹",
                                      style: TextStyle(
                                        fontSize: 16,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                    Text(
                                      widget.itemsInfo!.itemPrice.toString(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        color: kPrimaryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Transform.rotate(
            angle:
                -0.785, // Rotate by 45 degrees counter-clockwise (in radians)
            child: Container(
              padding: EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: kPrimaryColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                '50% OFF',
                style: TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
