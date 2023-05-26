import 'package:flutter/material.dart';
import 'package:flutter_spotify_ui/data/data.dart';
import 'package:flutter_spotify_ui/models/current_track.dart';
import 'package:provider/provider.dart';

class TracksList extends StatelessWidget {
  const TracksList({super.key, required this.tracks});

  final List<Song> tracks;

  @override
  Widget build(BuildContext context) {
    return DataTable(
      dataRowHeight: 54,
      headingTextStyle: Theme.of(context).textTheme.labelSmall?.copyWith(fontSize: 12),
      showCheckboxColumn: false,
      columns: const [
        DataColumn(label: Text('TITLE')),
        DataColumn(label: Text('ARTIST')),
        DataColumn(label: Text('ALBUM')),
        DataColumn(label: Icon(Icons.access_time)),
      ],
      rows: tracks.map((e) {
        final selected = context.watch<CurrentTrackModel>().selectedSong?.id == e.id;
        final textstyle =
            TextStyle(color: selected ? Theme.of(context).colorScheme.secondary : Theme.of(context).iconTheme.color);
        return DataRow(
            selected: selected,
            onSelectChanged: (_) => context.read<CurrentTrackModel>().selectSong(e),
            cells: [
              DataCell(Text(
                e.title,
                style: textstyle,
              )),
              DataCell(Text(
                e.artist,
                style: textstyle,
              )),
              DataCell(Text(
                e.album,
                style: textstyle,
              )),
              DataCell(Text(
                e.duration,
                style: textstyle,
              )),
            ]);
      }).toList(),
    );
  }
}
