import 'package:flutter/material.dart';

class HerMessageBubble extends StatelessWidget {
  const HerMessageBubble({super.key});


  @override
  Widget build(BuildContext context) {

    final colors = Theme.of(context).colorScheme;
    
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 50,
            decoration: BoxDecoration(
              color: colors.secondary,
              borderRadius: BorderRadius.circular(20)
            ),
            child: 
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: Text(
                "lorem ipsum dolor sit amet, consectetur adipiscing elit",
                style: TextStyle(color: Colors.white, fontSize: 16),
              ),
            )
        ),
        const SizedBox(height: 10),
        const _ImageBubble(),       
        const SizedBox(height: 10),     
      ],
    );
  }
}

class _ImageBubble extends StatelessWidget {
  const _ImageBubble({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Image.network("https://yesno.wtf/assets/no/6-4bf0a784c173f70a0cab96efd9ff80c9.gif",
        width: size.width * 0.7,
        height: size.height * 0.2,
        fit: BoxFit.cover,      
        loadingBuilder: (context, child, loadingProgress) {
          if (loadingProgress == null) return child;
          
          return Container(
            width: size.width * 0.7,
            height: size.height * 0.2,
            child: const Text("Loading..."),
          );
        },
      ),
    );
  }
}
