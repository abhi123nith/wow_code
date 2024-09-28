import 'dart:async';
import 'dart:convert';

import 'package:http/http.dart' as http;

String homeUrl = "https://new.wowcodes.in/api.php?get_home_shop=";
String imageUrl = "http://new.wowcodes.in/seller/images";
String thumbnailUrl = "http://new.wowcodes.in/seller/images/thumbs/";

String loginUrl = "https://new.wowcodes.in/api.php?login=";
String SignUpUrl = "https://new.wowcodes.in/api.php?register=";

String initiatepasswordReset =
    "https://new.wowcodes.in/api.php?initiate_password_reset=";
String validatepasswordReset =
    "https://new.wowcodes.in/api.php?validate_password_reset=";

String referralUrl = "https://new.wowcodes.in/api.php?referral";
String tournamentApiLink = 'https://new.wowcodes.in/api.php?tournament';
String appDownloadLink = "https://appdownloadlink.com";

List<String> bannerImagesRaffle = [
  "https://imgs.search.brave.com/xIkKcO5b1E_eTOm3g4zCdd_q7pSzUnMvW5n9ikQBvmQ/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9tZWRp/YS5pc3RvY2twaG90/by5jb20vaWQvMTM2/MDUxNTY4OC92ZWN0/b3Ivd2VsY29tZS10/ZXh0LXJpYmJvbi1i/YW5uZXItdmVjdG9y/LWRlc2lnbi5qcGc_/cz02MTJ4NjEyJnc9/MCZrPTIwJmM9MWVO/c1cwajVrNU9fZEdh/V2RIaHlVTmw5ZWEt/b0o2S0JuTGpuV2Rz/a1RUST0",
  "https://imgs.search.brave.com/N5ACj0dt00TzcbOYwycaCIZUlzTbymHi6gAZKkvtIqw/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly90NC5m/dGNkbi5uZXQvanBn/LzAyLzkzLzc3Lzc3/LzM2MF9GXzI5Mzc3/Nzc5OV9UN0Q2MUpm/OEpIVjJNZU1LaHJT/TENpbkQwZGNOM3l1/Ti5qcGc"
];

String ImageUrsraffle1 =
    "https://imgs.search.brave.com/W1uV-J6qeiZLdEHFppSeJl_PXaINpmSb3LYjzZuCLMI/rs:fit:500:0:0:0/g:ce/aHR0cHM6Ly9wbmcu/cG5ndHJlZS5jb20v/cG5nLWNsaXBhcnQv/MjAxOTA5MTgvb3Vy/bWlkL3BuZ3RyZWUt/bWFrZXVwLWNvc21l/dGljcy1hbmQtY3J1/c2hlZC1wb3dkZXIt/cG5nLWltYWdlXzE3/MzA5MzQuanBn";

String raffleUrlLink = 'https://new.wowcodes.in/api.php?raffle';

Future<Map> getHomData() async {
  var url = Uri.parse(homeUrl);
  var req = http.Request('GET', url);
  var res = await req.send();
  final resBody = await res.stream.bytesToString();
  if (res.statusCode >= 200 && res.statusCode < 300) {
    Map data = jsonDecode(resBody);
    List alldata = data['JSON_DATA'];
    data = alldata[0];
    // print(data);
    return data;
    //   print(resBody);
  } else {
    //  print(res.reasonPhrase);
  }
  return {};
}

Future<String> getBannerData() async {
  final response = await http.get(Uri.parse(raffleUrlLink));
  print(response.body);
  if (response.statusCode == 200) {
    return response.body; // Return the JSON string
  } else {
    throw Exception("Failed to load banner data");
  }
}

Future<Map> getLotteryHoomeData() async {
  var url = Uri.parse(raffleUrlLink);
  var body = {'type': 'home', 'user_id': 'home'};
  var res = await http.post(url, body: body);

  if (res.statusCode >= 200 && res.statusCode < 300) {
     Map data = jsonDecode(res.body);
    List alldata = data['JSON_DATA'];
    data = alldata[0];
    // print(data);

    return data;
    // Adjust this according to the structure of your response
  } else {
    throw Exception("Failed to load data");
  }
}
