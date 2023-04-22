import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ebook_app/components/loading_widget.dart';
import 'package:flutter_ebook_app/models/category.dart';
import 'package:flutter_ebook_app/util/router.dart';
import 'package:uuid/uuid.dart';

import '../views/details/details.dart';
import 'ex_text.dart';

class BookListItem extends StatelessWidget {
  final Entry entry;

  BookListItem({
    Key? key,
    required this.entry,
  }) : super(key: key);

  static final uuid = Uuid();
  final String imgTag = uuid.v4();
  final String titleTag = uuid.v4();
  final String authorTag = uuid.v4();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        MyRouter.pushPage(
          context,
          Details(
            entry: entry,
            imgTag: imgTag,
            titleTag: titleTag,
            authorTag: authorTag,
          ),
        );
      },
      child: Container(
        // height: 150.0,
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            content(context),
            SizedBox(height: 10.0),
            Container(
              width: double.maxFinite,
              padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              decoration: BoxDecoration(
                border: Border.symmetric(
                  horizontal: BorderSide(
                    width: 1,
                    style: BorderStyle.solid,
                    strokeAlign: BorderSide.strokeAlignInside,
                    color: Theme.of(context).dividerColor,
                  ),
                ),
              ),
              child: ExText(
                "Read more",
                TextStyle(
                  color: Theme.of(context).colorScheme.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.bold,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget content(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                child: Hero(
                  tag: titleTag,
                  child: Material(
                    type: MaterialType.transparency,
                    child: Text(
                      '${entry.title!.t!.replaceAll(r'\', '')}',
                      style: TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Theme.of(context).textTheme.titleLarge?.color,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 5),
              Icon(
                Icons.turned_in_not,
                color: Theme.of(context).colorScheme.primary,
              ),
            ],
          ),
          SizedBox(height: 10),
          Hero(
            tag: authorTag,
            child: Material(
              type: MaterialType.transparency,
              child: Text(
                'by ${entry.author!.name!.t!}',
                style: TextStyle(
                  fontSize: 14.0,
                  color: Theme.of(context).colorScheme.secondary,
                ),
              ),
            ),
          ),
          SizedBox(height: 5.0),
          Text(
            '${entry.summary!.t!.length < 400 ? entry.summary!.t! : entry.summary!.t!.substring(0, 400)}...'
                .replaceAll(r'\n', '\n')
                .replaceAll(r'\r', '')
                .replaceAll(r'\"', '"'),
            style: TextStyle(
              fontSize: 14.0,
              color: Theme.of(context).textTheme.titleLarge?.color,
            ),
            strutStyle: StrutStyle(
              fontSize: 14.0,
              height: 1.8,
            ),
          ),
        ],
      ),
    );
  }
}

// Card(
//   shape: RoundedRectangleBorder(
//     borderRadius: BorderRadius.all(
//       Radius.circular(10.0),
//     ),
//   ),
//   elevation: 4,
//   child: ClipRRect(
//     borderRadius: BorderRadius.all(
//       Radius.circular(10.0),
//     ),
//     child: Hero(
//       tag: imgTag,
//       child: CachedNetworkImage(
//         imageUrl: '${entry.link![1].href!}',
//         placeholder: (context, url) => Container(
//           height: 150.0,
//           width: 100.0,
//           child: LoadingWidget(
//             isImage: true,
//           ),
//         ),
//         errorWidget: (context, url, error) => Image.asset(
//           'assets/images/place.png',
//           fit: BoxFit.cover,
//           height: 150.0,
//           width: 100.0,
//         ),
//         fit: BoxFit.cover,
//         height: 150.0,
//         width: 100.0,
//       ),
//     ),
//   ),
// ),
// SizedBox(width: 10.0),
