import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class PlaylistHeader extends StatelessWidget {
  const PlaylistHeader({super.key, required this.playlist});

  final Playlist playlist;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Image.asset(
              playlist.imageURL,
              height: 200,
              width: 200,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 16),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'PLAYLIST',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12),
                ),
                const SizedBox(height: 12),
                Text(
                  playlist.name,
                  maxLines: 2,
                  style: Theme.of(context).textTheme.displayMedium,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Text(
                  playlist.description,
                  style: Theme.of(context).textTheme.titleMedium,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
                const SizedBox(height: 16),
                Text(
                  "created by ${playlist.creator} • ${playlist.songs.length} songs, ${playlist.duration} ",
                  style: Theme.of(context).textTheme.titleLarge,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 2,
                ),
              ],
            ))
          ],
        ),
        const SizedBox(height: 16),
        _PlayListButtons(followers: playlist.followers)
      ],
    );
  }
}

class _PlayListButtons extends StatelessWidget {
  const _PlayListButtons({required this.followers});

  final String followers;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        TextButton(
          onPressed: () {},
          style: TextButton.styleFrom(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 40.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            backgroundColor: Theme.of(context).colorScheme.secondary,
            foregroundColor: Theme.of(context).iconTheme.color,
            textStyle: Theme.of(context).textTheme.bodySmall?.copyWith(
                  fontSize: 12,
                  letterSpacing: 2,
                ),
          ),
          child: const Text("PLAY"),
        ),
        const SizedBox(width: 8),
        IconButton(iconSize: 30, onPressed: () {}, icon: const Icon(Icons.favorite_border)),
        IconButton(iconSize: 30, onPressed: () {}, icon: const Icon(Icons.more_vert)),
        const Spacer(),
        Text(
          "FOLLOWERS \n$followers",
          style: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12),
          textAlign: TextAlign.right,
        )
      ],
    );
  }
}
