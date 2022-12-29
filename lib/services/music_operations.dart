import 'package:mymmusic/models/music.dart';

class MusicOperatiions{
  MusicOperatiions._(){}
  static List<Music> getMusic(){
    return <Music>[
      Music('Toofan',
        'https://th.bing.com/th/id/OIP.fElevk7qPTwQ5_sIPcXjUgAAAA?w=148&h=150&c=7&r=0&o=5&dpr=1.3&pid=1.7',
          'Dekh Toofan Aaya Hai',
      'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview122/v4/9f/50/9d/9f509dab-4fc8-e761-21fd-63ee6d7948b0/mzaf_15478495451126525488.plus.aac.p.m4a'),
      Music('Gully Boy',
          'https://pad.mymovies.it/filmclub/2018/12/094/imm.jpg',
          'Apna Time Ayega',
      'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview112/v4/0e/d5/52/0ed55222-e6ae-1e7f-24c1-284da449af4e/mzaf_169448091425248968.plus.aac.p.m4a'),
      Music('Ae Dil Hai Mushkil',
          'https://www.filmibeat.com/img/130x100x163/popcorn/movie_posters/ae-dil-hai-mushkil-20160830093704-14026.jpg',
          'Ae Dil Hai Mushkil',
      'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/09/17/bb/0917bbe1-58c3-6252-d00e-9b70d42ef5dc/mzaf_2269500085377778268.plus.aac.p.m4a'),
      Music('Bajirao Mastani',
          'https://th.bing.com/th/id/OIP.y5nOjqIXoYI2QyadAt59VwAAAA?w=158&h=94&c=7&r=0&o=5&dpr=1.3&pid=1.7',
          'Malhari',
      'https://audio-ssl.itunes.apple.com/itunes-assets/AudioPreview125/v4/71/f8/b2/71f8b2fd-b62b-55e2-cc4b-d3b0a4e5f0f8/mzaf_16351999812808951944.plus.aac.p.m4a')
    ];
  }
}