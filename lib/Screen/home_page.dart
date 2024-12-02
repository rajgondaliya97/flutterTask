import 'package:flutter/material.dart';
import 'package:flutter_image_stack/flutter_image_stack.dart';
import 'package:multi_select_flutter/multi_select_flutter.dart';
import 'package:projectdemo/Controller/home_controller.dart';
import 'package:projectdemo/Model/dropdown_model.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final homePageController =
        Provider.of<HomeController>(context, listen: false);
    homePageController.fetchData();
    homePageController.fetchDropdownData();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Project Signup",
          style: TextStyle(color: Colors.white),
        ),
        actions: [
          Consumer<HomeController>(
            builder: (context, value, child) {
              return InkWell(
                onTap: () {
                  final _items = value.resultDrop!
                      .map((animal) => MultiSelectItem<DropdownModelResult>(
                          animal, animal.name.toString()))
                      .toList();
                  showModalBottomSheet<void>(
                    context: context,
                    builder: (context) {
                      return Container(
                        padding: EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(""),
                                Text(
                                  "Filter",
                                  style: TextStyle(
                                      fontSize: 20,
                                      color: Colors.blue,
                                      fontWeight: FontWeight.w900),
                                ),
                                InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: Icon(Icons.close),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Container(
                              width: width,
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(30)),
                              child: MultiSelectDialogField(
                                items: _items,
                                title: Text("Animals"),

                                selectedColor: Colors.blue,
                                decoration: BoxDecoration(
                                  color: Colors.blue.withOpacity(0.1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(40)),
                                  border: Border.all(
                                    color: Colors.blue,
                                    width: 2,
                                  ),
                                ),
                                onConfirm: (results) {},
                              ),
                            ),
                          ],
                        ),
                      );
                    },
                  );
                },
                child: Padding(
                  padding: EdgeInsets.only(right: 15),
                  child: Icon(
                    Icons.menu,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              );
            },
          ),
        ],
        backgroundColor: Colors.blue,
      ),
      body: Consumer<HomeController>(
        builder: (context, value, child) {
          return value.checkData == false
              ? value.result!.isEmpty
                  ? Center(
                      child: CircularProgressIndicator(),
                    )
                  : ListView.builder(
                      padding: EdgeInsets.all(8.0),
                      itemCount: value.result!.length,
                      itemBuilder: (context, index) {
                        return Stack(
                          children: [
                            Container(
                              padding: EdgeInsets.only(left: 12, right: 12),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.orange),
                                  borderRadius: BorderRadius.circular(10)),
                              margin: EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    children: [
                                      Icon(Icons.more_horiz),
                                    ],
                                  ),
                                  Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width / 1.5,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              value.result![index].userName
                                                  .toString(),
                                              style: const TextStyle(
                                                fontSize: 16,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.blue,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                            Text(
                                              value.result![index].customerPhone
                                                  .toString(),
                                              overflow: TextOverflow.ellipsis,
                                              style: const TextStyle(
                                                  fontSize: 14,
                                                  fontWeight: FontWeight.bold,
                                                  color: Colors.black45),
                                            ),
                                          ],
                                        ),
                                      ),
                                      FlutterImageStack(
                                        //imageList: _images,
                                        imageList: [
                                          value.result![index].projectTypeImage
                                              .toString(),
                                          "https://images.unsplash.com/photo-1593642532842-98d0fd5ebc1a?ixid=MXwxMjA3fDF8MHxwaG90by1wYWdlfHx8fGVufDB8fHw%3D&ixlib=rb-1.2.1&auto=format&fit=crop&w=2250&q=80"
                                        ],
                                        totalCount: 2,
                                        itemRadius: 50,
                                        itemCount: 2,
                                        itemBorderWidth: 1.5,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 5),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: width / 1.5,
                                            child: Text(
                                              "Project Number: ${value.result![index].projectNo.toString()}",
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 12.0,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                          SizedBox(height: 4.0),
                                          SizedBox(
                                            width: width / 1.5,
                                            child: Text(
                                              value.result![index].projectNo
                                                  .toString(),
                                              style: TextStyle(
                                                color: Colors.grey[600],
                                                fontSize: 12.0,
                                              ),
                                              overflow: TextOverflow.ellipsis,
                                            ),
                                          ),
                                        ],
                                      ),
                                      ElevatedButton(
                                        onPressed: () {},
                                        child: Text(
                                          " BOM ",
                                          style: TextStyle(
                                              fontSize: 17,
                                              color: Colors.white),
                                        ),
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.orange,
                                          shape: RoundedRectangleBorder(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Divider(),
                                  SizedBox(height: 5.0),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      SizedBox(
                                        width: width / 1.5,
                                        child: Text(
                                          "Total Quote Amount",
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 16.0,
                                              color: Colors.grey[700],
                                              fontWeight: FontWeight.w500),
                                        ),
                                      ),
                                      Text(
                                        "\u{20B9}${value.result![index].grnadTotal.toString()}/-",
                                        style: TextStyle(
                                          fontSize: 16.0,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.green,
                                        ),
                                        overflow: TextOverflow.ellipsis,
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 1.0),
                                  Text(
                                    "View Details",
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 12,
                                        fontWeight: FontWeight.bold),
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  SizedBox(height: 10.0),
                                ],
                              ),
                              // ),
                            ),
                            Positioned(
                              left: 20,
                              child: Container(
                                decoration: BoxDecoration(
                                    color: value.result![index].projectStatus
                                                .toString() ==
                                            "Pending For Payment"
                                        ? Colors.orange
                                        : Colors.blue,
                                    borderRadius: BorderRadius.circular(20)),
                                child: Padding(
                                  padding: EdgeInsets.only(
                                    right: 10,
                                    left: 10,
                                  ),
                                  child: Text(
                                    overflow: TextOverflow.ellipsis,
                                    value.result![index].projectStatus
                                        .toString(),
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        );
                      },
                    )
              : Center(
                  child: Text("Something Won't to wrong........"),
                );
        },
      ),
    );
  }
}
