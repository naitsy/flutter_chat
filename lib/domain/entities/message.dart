enum FromWho { me, other }

class Message {
  final String text;
  final FromWho from;
  final String? imageURL;

  Message({required this.text, required this.from, this.imageURL});
}
