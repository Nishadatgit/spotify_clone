import 'dart:developer';

import 'package:flutter/material.dart';

import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/models/current_track.dart';
import 'package:flutter_spotify_ui/widgets/playlist_header.dart';
import 'package:flutter_spotify_ui/widgets/tracks_list.dart';
import 'package:provider/provider.dart';

class PlaylistScreen extends StatefulWidget {
  const PlaylistScreen({
    Key? key,
    required this.playlist,
  }) : super(key: key);

  final Playlist playlist;

  @override
  State<PlaylistScreen> createState() => _PlaylistScreenState();
}

class _PlaylistScreenState extends State<PlaylistScreen> {
  late ScrollController _controller;
  @override
  void initState() {
    _controller = ScrollController()
      ..addListener(() {
        context.read<CurrentTrackModel>().changeOffset(_controller.offset);
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final offset = context.watch<CurrentTrackModel>().offset;

    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.black.withOpacity((offset / 350).clamp(0, 1).toDouble()),
        elevation: 0,
        leadingWidth: 140,
        leading: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              _buildAppbarButton(Icons.chevron_left),
              const SizedBox(width: 16),
              _buildAppbarButton(Icons.chevron_right),
            ],
          ),
        ),
        actions: [
          TextButton.icon(
              style: TextButton.styleFrom(foregroundColor: Theme.of(context).iconTheme.color),
              onPressed: () {},
              icon: const Icon(Icons.account_circle_rounded),
              label: const Text('Mohamed Nishad')),
          const SizedBox(width: 8),
          IconButton(padding: EdgeInsets.zero, onPressed: () {}, icon: const Icon(Icons.keyboard_arrow_down, size: 25)),
          const SizedBox(width: 12),
        ],
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            decoration: BoxDecoration(
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              stops: const [0, 0.3],
              colors: [
                // Colors.black.withOpacity((offset / 350).clamp(0, 1).toDouble())

                const Color(0xFFAF1018).withOpacity(1 - (offset / 450).clamp(0, 1).toDouble()),
                Theme.of(context).colorScheme.background.withOpacity(1 - (offset / 450).clamp(0, 1).toDouble()),
              ],
            )),
            child: ListView(
              controller: _controller,
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 20),
              children: [
                PlaylistHeader(playlist: widget.playlist),
                TracksList(tracks: widget.playlist.songs),
              ],
            ),
          ),
          
        ],
      ),
    );
  }

  InkWell _buildAppbarButton(IconData icon) {
    return InkWell(
      customBorder: const CircleBorder(),
      onTap: () {},
      child: Container(
        padding: const EdgeInsets.all(6),
        decoration: const BoxDecoration(color: Colors.black26, shape: BoxShape.circle),
        child: Icon(
          icon,
          size: 28,
        ),
      ),
    );
  }
}
