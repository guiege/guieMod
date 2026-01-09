import 'dart:convert';

import 'package:http/http.dart' as http;

class Mod {
  final int id;
  final String authors;
  final String name;
  final String description;
  final String downloadUrl;
  final String thumbnailUrl;

  const Mod({
    required this.id,
    required this.authors,
    required this.name,
    required this.description,
    required this.downloadUrl,
    required this.thumbnailUrl,
  });
}

Future<Mod> fetchMod(int id) async {
  final response = await http
      .get(Uri.parse('https://api.gamebanana.com/Core/Item/Data?itemtype=Mod&itemid=$id&fields=Credits().ssvAuthorNames(),name,description,Url().sDownloadUrl(),Preview().sStructuredDataFullsizeUrl()'));

  final Iterable rawGameBananaData = jsonDecode(response.body);
  var responseList = rawGameBananaData.map((e) => e).toList();

  return Mod(
    id: id,
    authors: responseList[0],
    name: responseList[1],
    description: responseList[2],
    downloadUrl: responseList[3],
    thumbnailUrl: responseList[4],
  );

}