import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 280,
      height: double.infinity,
      color: Theme.of(context).primaryColor,
      child: Column(
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Image.asset(
                  'assets/spotify_logo.png',
                  filterQuality: FilterQuality.high,
                  height: 55,
                ),
              ),
            ],
          ),
          buildSideMenuIconTab(context, Icons.home, 'Home'),
          buildSideMenuIconTab(context, Icons.search, 'Search'),
          buildSideMenuIconTab(context, Icons.audiotrack, 'Radio'),
          const SizedBox(height: 12),
          const _LibraryPlaylist()
        ],
      ),
    );
  }

  ListTile buildSideMenuIconTab(BuildContext context, IconData icon, String title) {
    return ListTile(
      leading: Icon(
        icon,
        color: Theme.of(context).iconTheme.color,
        size: 28,
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
        overflow: TextOverflow.ellipsis,
      ),
      onTap: () {},
    );
  }
}

class _LibraryPlaylist extends StatefulWidget {
  const _LibraryPlaylist({Key? key}) : super(key: key);

  @override
  State<_LibraryPlaylist> createState() => __LibraryPlaylistState();
}

class __LibraryPlaylistState extends State<_LibraryPlaylist> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView(
        padding: const EdgeInsets.symmetric(vertical: 12),
        physics: const ClampingScrollPhysics(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  'YOUR LIBRARY',
                  style: Theme.of(context).textTheme.headlineMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ...yourLibrary.map((e) => ListTile(
                    dense: true,
                    title: Text(e, style: Theme.of(context).textTheme.bodyMedium),
                    onTap: () {},
                  ))
            ],
          ),
          const SizedBox(height: 24),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8),
                child: Text(
                  'PLAYLISTS',
                  style: Theme.of(context).textTheme.headlineMedium,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              ...playlists.map((e) => ListTile(
                    dense: true,
                    title: Text(e, style: Theme.of(context).textTheme.bodyMedium),
                    onTap: () {},
                  ))
            ],
          )
        ],
      ),
    );
  }
}
