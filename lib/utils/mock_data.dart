import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:instagram_clone_flutter/models/user.dart';

const String mockUid = 'ui-test-user-001';

const User mockUser = User(
  username: 'brontes.studio',
  uid: mockUid,
  photoUrl: 'https://picsum.photos/seed/brontes/200',
  email: 'ui@test.local',
  bio: 'Conta de teste de UI - Brontes Studios',
  followers: ['ui-test-user-001', 'walking-camera-guy'],
  following: ['ui-test-user-001'],
);

final List<Map<String, dynamic>> mockPosts = [
  {
    'postId': 'mock-post-1',
    'username': 'brontes.studio',
    'uid': mockUid,
    'profImage': 'https://picsum.photos/seed/brontes/200',
    'postUrl': 'https://picsum.photos/seed/sunset-rio/600/800',
    'description': 'Teste de UI - post um do feed.',
    'likes': [mockUid],
    'datePublished': Timestamp.fromMillisecondsSinceEpoch(1726150000000),
  },
  {
    'postId': 'mock-post-2',
    'username': 'walking.camera',
    'uid': 'walking-camera-guy',
    'profImage': 'https://picsum.photos/seed/camera/200',
    'postUrl': 'https://picsum.photos/seed/street/600/800',
    'description': 'Um post visual para testar o layout.',
    'likes': ['walking-camera-guy', mockUid],
    'datePublished': Timestamp.fromMillisecondsSinceEpoch(1726060000000),
  },
  {
    'postId': 'mock-post-3',
    'username': 'brontes.studio',
    'uid': mockUid,
    'profImage': 'https://picsum.photos/seed/brontes/200',
    'postUrl': 'https://picsum.photos/seed/night-city/600/800',
    'description': 'Mais um card para rolar o feed.',
    'likes': [mockUid],
    'datePublished': Timestamp.fromMillisecondsSinceEpoch(1725970000000),
  },
];

final List<Map<String, dynamic>> mockComments = [
  {
    'name': 'walking.camera',
    'profilePic': 'https://picsum.photos/seed/camera/200',
    'text': 'UI bonita demais!',
    'datePublished': Timestamp.fromMillisecondsSinceEpoch(1726060000000),
  },
  {
    'name': 'brontes.studio',
    'profilePic': 'https://picsum.photos/seed/brontes/200',
    'text': 'obrigada!',
    'datePublished': Timestamp.fromMillisecondsSinceEpoch(1726050000000),
  },
];

class FakeSnap {
  final Map<String, dynamic> dataMap;
  FakeSnap(this.dataMap);
  data() => dataMap;
}