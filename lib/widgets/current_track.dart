import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/models/current_track.dart';
import 'package:provider/provider.dart';

class CurrentTrack extends StatelessWidget {
  const CurrentTrack({super.key});

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selectedSong;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: selected == null ? 0 : 86,
      color: Colors.black87,
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          Expanded(
            child: LayoutBuilder(
              builder: (context, constraints) {
                return AnimatedOpacity(
                    opacity: (constraints.maxHeight / 62).toDouble(),
                    duration: const Duration(milliseconds: 300),
                    child: constraints.maxHeight > 40 ? const _TrackInfo() : const SizedBox.shrink());
              },
            ),
          )
        ],
      ),
    );
  }
}

class _TrackInfo extends StatelessWidget {
  const _TrackInfo();

  @override
  Widget build(BuildContext context) {
    final selected = context.watch<CurrentTrackModel>().selectedSong;
    if (selected == null) return const SizedBox.shrink();

    return Row(
      children: [
        Image.asset(
          'assets/lofigirl.jpg',
          height: 60,
          width: 60,
          fit: BoxFit.cover,
        ),
        const SizedBox(width: 12),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              selected.title,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            const SizedBox(height: 4),
            Text(
              selected.artist,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.grey[300], fontSize: 12),
            )
          ],
        ),
        const SizedBox(width: 8),
        IconButton(onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        const Spacer(),
        IconButton(
            onPressed: () {
              context.read<CurrentTrackModel>().selectSong(null);
            },
            icon: const Icon(Icons.close))
      ],
    );
  }
}
