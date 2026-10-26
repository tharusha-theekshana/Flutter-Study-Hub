import 'package:flutter_study_hub/features/testing/sections/integration_testing/models/post.dart';
import 'package:flutter_study_hub/features/testing/sections/integration_testing/services/post_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http/http.dart' as http;
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'post_service_test.mocks.dart';

@GenerateMocks([http.Client])
void main() {
  group("Post service test", () {
    test("Test get post functionality - Status code 200", () async {

      // Create a mock client
      final client = MockClient();

      when(
        client.get(Uri.parse("https://jsonplaceholder.typicode.com/posts")),
      ).thenAnswer(
        (_) async =>
            http.Response('[{"id": 1, "title": "Title", "body": "Body"}]', 200),
      );

      expect(await PostService(client).fetchPosts(), isA<List<Post>>());
    });

    test("Test get post functionality - Status code not 200", () {
      // Create a mock client
      final client = MockClient();

      when(
        client.get(Uri.parse("https://jsonplaceholder.typicode.com/posts")),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(PostService(client).fetchPosts(), throwsException);
    });

    test("Test get post by id functionality - Status code 200", () async {

      // Create a mock client
      final client = MockClient();

      when(
        client.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1")),
      ).thenAnswer(
        (_) async =>
            http.Response('{"id": 1, "title": "Title", "body": "Body"}', 200),
      );

      expect(await PostService(client).fetchPostById(1), isA<Post>());
    });

    test("Test get post by id functionality - Status code not 200", () {

      // Create a mock client
      final client = MockClient();

      when(
        client.get(Uri.parse("https://jsonplaceholder.typicode.com/posts/1")),
      ).thenAnswer((_) async => http.Response('Not Found', 404));

      expect(PostService(client).fetchPostById(1), throwsException);
    });
  });
}
