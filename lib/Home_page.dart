import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_recognition_api/Model/RealApi.dart';

class Home_Screen extends StatefulWidget {
  const Home_Screen({Key? key}) : super(key: key);

  @override
  State<Home_Screen> createState() => _Home_ScreenState();
}

class _Home_ScreenState extends State<Home_Screen> {
  final String url = "https://api.everypixel.com/v1/keywords";
  final String image =
      "https://dm0qx8t0i9gc9.cloudfront.net/thumbnails/video/4ZrVLdVKeijzurndz/people-emotion-and-facial-expression-concept-face-of-happy-smiling-middle-aged-woman-at-office_rleqp4y7g_thumbnail-1080_09.png";
  final String numKeywords = "10";

  Future<RealApi> getApi() async {
    final response = await http
        .get(Uri.parse("$url?url=$image&num_keywords=$numKeywords"), headers: {
      "Authorization": "Bearer TQh0mSBAn3JVDu68c66bBZiIb8hj3Q",
    });
    var mydata = jsonDecode(response.body);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      return RealApi.fromJson(mydata);
    } else {
      return RealApi.fromJson(mydata);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('EveryPixel Api'),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FutureBuilder(
                future: getApi(),
                builder: (context, snapshot) {
                  if (!snapshot.hasData) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  } else {
                    return ListView.separated(
                      shrinkWrap: true,
                      primary: false,
                      itemCount: snapshot.data!.keywords!.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: CircleAvatar(
                            child: Text('${index + 1}'),
                          ),
                          title: Text(snapshot.data!.keywords![index].keyword!),
                          subtitle: Text(
                            snapshot.data!.keywords![index].score
                                .toString()
                                .substring(0, 4),
                          ),
                        );
                      },
                      separatorBuilder: (_, index) => const Divider(
                        thickness: 3.0,
                      ),
                    );
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class Reusbalerow extends StatelessWidget {
  String title, value;

  Reusbalerow({Key? key, required this.title, required this.value})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title),
          Text(value),
        ],
      ),
    );
  }
}
