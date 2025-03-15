import 'package:html/dom.dart';

import 'base.dart';
import 'util.dart';

/// Parses [Metadata] from `<meta>`, `<title>`, and `<img>` tags.
class HtmlMetaParser with BaseMetaInfo {
  /// The [Document] to parse.
  final Document? _document;

  HtmlMetaParser(this._document);

  /// Get the [Metadata.title] from the <title> tag.
  @override
  String? get title => _document?.head?.querySelector('title')?.text;

  /// Get the [Metadata.desc] from the content of the
  /// <meta name="description"> tag.
  @override
  String? get desc => _document?.head
      ?.querySelector("meta[name='description']")
      ?.attributes
      .get('content');

  /// Get the [Metadata.image] from the first <img> tag in the body.
  @override
  String? get image =>
      _document?.body?.querySelector('img')?.attributes.get('src');

  /// Get the [Metadata.siteName] from the content of the
  /// <meta name="site_name"> meta tag.
  @override
  String? get siteName => _document?.head
      ?.querySelector("meta[name='site_name']")
      ?.attributes
      .get('content');

  @override
  String toString() => parse().toString();
}
