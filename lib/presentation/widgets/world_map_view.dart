import 'package:flutter/material.dart';
import '../../core/constants/game_constants.dart';
import '../../core/theme/app_colors.dart';
import '../../domain/entities/game_models.dart';

class WorldMapView extends StatelessWidget {
  const WorldMapView({
    super.key,
    required this.tiles,
    this.interactive = true,
  });

  final List<MapTile> tiles;
  final bool interactive;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final painter = _WorldMapPainter(tiles: tiles);
        final child = CustomPaint(
          painter: painter,
          size: Size(constraints.maxWidth, constraints.maxHeight),
        );
        if (!interactive) return child;
        return InteractiveViewer(
          minScale: 0.8,
          maxScale: 4,
          child: child,
        );
      },
    );
  }
}

class _WorldMapPainter extends CustomPainter {
  _WorldMapPainter({required this.tiles});

  final List<MapTile> tiles;

  @override
  void paint(Canvas canvas, Size size) {
    if (tiles.isEmpty) return;
    final tw = size.width / GameConstants.mapWidth;
    final th = size.height / GameConstants.mapHeight;

    final oceanPaint = Paint()..color = AppColors.ocean;
    final landPaint = Paint();
    final borderPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 0.6
      ..color = Colors.black.withOpacity(0.15);

    for (final tile in tiles) {
      final rect = Rect.fromLTWH(tile.x * tw, tile.y * th, tw + 0.5, th + 0.5);
      Color fill;
      switch (tile.type) {
        case TileType.ocean:
          fill = const Color(0xFF0E2A45);
        case TileType.coast:
          fill = const Color(0xFF1A4A5C);
        case TileType.plains:
          fill = const Color(0xFF1F4A38);
        case TileType.forest:
          fill = const Color(0xFF163828);
        case TileType.hills:
          fill = const Color(0xFF3A4A2E);
        case TileType.mountains:
          fill = const Color(0xFF4A5560);
        case TileType.desert:
          fill = const Color(0xFF5A4A2E);
      }

      if (tile.ownerId.isNotEmpty) {
        final ownerColor = _ownerColor(tile.ownerId);
        fill = Color.lerp(fill, ownerColor, 0.45)!;
      }

      landPaint.color = tile.type == TileType.ocean ? AppColors.ocean : fill;
      canvas.drawRect(rect, tile.type == TileType.ocean ? oceanPaint : landPaint);
      canvas.drawRect(rect, borderPaint);

      if (tile.resource != null) {
        final rp = Paint()..color = AppColors.gold.withOpacity(0.75);
        canvas.drawCircle(rect.center, tw * 0.12, rp);
      }

      if (tile.hasRoad) {
        final road = Paint()
          ..color = AppColors.mist.withOpacity(0.5)
          ..strokeWidth = 1.2;
        canvas.drawLine(
          Offset(rect.left, rect.center.dy),
          Offset(rect.right, rect.center.dy),
          road,
        );
      }

      if (tile.hasPort) {
        final port = Paint()..color = AppColors.info;
        canvas.drawCircle(rect.center.translate(0, th * 0.15), tw * 0.14, port);
      }

      if (tile.hasCity) {
        final cityFill = Paint()..color = AppColors.gold;
        final cityStroke = Paint()
          ..style = PaintingStyle.stroke
          ..strokeWidth = 1.4
          ..color = AppColors.ice;
        final r = RRect.fromRectAndRadius(
          Rect.fromCenter(center: rect.center, width: tw * 0.55, height: th * 0.55),
          const Radius.circular(3),
        );
        canvas.drawRRect(r, cityFill);
        canvas.drawRRect(r, cityStroke);
      }
    }

    // soft vignette
    final vignette = Paint()
      ..shader = RadialGradient(
        colors: [
          Colors.transparent,
          AppColors.voidBlack.withOpacity(0.35),
        ],
      ).createShader(Offset.zero & size);
    canvas.drawRect(Offset.zero & size, vignette);
  }

  Color _ownerColor(String id) {
    if (id == GameConstants.playerCountryId) return AppColors.playerTerritory;
    var hash = 0;
    for (final c in id.codeUnits) {
      hash = (hash + c * 37) % 360;
    }
    return HSLColor.fromAHSL(1, hash.toDouble(), 0.45, 0.38).toColor();
  }

  @override
  bool shouldRepaint(covariant _WorldMapPainter oldDelegate) =>
      oldDelegate.tiles != tiles;
}
