part of 'pdf_view_pinch.dart';

typedef PdfViewPinchBuilder<T> = Widget Function(
  /// Build context
  BuildContext context,

  /// All passed builders
  PdfViewPinchBuilders<T> builders,

  /// Document loading state
  PdfLoadingState state,

  /// Loaded result builder
  WidgetBuilder loadedBuilder,

  /// Pdf document when he loaded
  PdfDocument? document,

  /// Error of pdf loading
  Exception? loadingError,
);

/// Optional per-page overlay builder for PdfViewPinch.
///
/// Return a widget to be stacked above the page textures. It will be placed
/// as a Positioned.fill child covering the page rect.
typedef PdfViewPinchPageOverlayBuilder = Widget? Function(
  BuildContext context,
  int pageNumber,
  Size pageSize,
);

class PdfViewPinchBuilders<T> {
  /// Widget showing when pdf document loading
  final WidgetBuilder? documentLoaderBuilder;

  /// Widget showing when pdf page loading
  final WidgetBuilder? pageLoaderBuilder;

  /// Show document loading error message inside [PdfView]
  final Widget Function(BuildContext, Exception error)? errorBuilder;

  /// Root view builder
  final PdfViewPinchBuilder<T> builder;

  /// Additional options for builder
  final T options;

  /// Optional per-page overlay builder stacked above textures
  final PdfViewPinchPageOverlayBuilder? pageOverlayBuilder;

  const PdfViewPinchBuilders({
    required this.options,
    this.builder = _PdfViewPinchState._builder,
    this.documentLoaderBuilder,
    this.pageLoaderBuilder,
    this.errorBuilder,
    this.pageOverlayBuilder,
  });
}
