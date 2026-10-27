import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/network/api_client.dart';
import '../../../core/config/app_config.dart';
import '../../../brand_config.dart';
import 'models/content_item.dart';

class ContentRepository {
  final ApiClient _client;
  ContentRepository(this._client);

  Future<List<ContentItem>> getContent({String? categoryId, bool featured = false}) async {
    if (AppConfig.useMockData) {
      return _getMockContent(categoryId: categoryId, featured: featured);
    }

    final params = <String, String>{};
    if (categoryId != null) params['category'] = categoryId;
    if (featured) params['featured'] = 'true';

    final data = await _client.get(
      '/content/${BrandConfig.channelSlug}',
      params: params,
    );
    return (data as List).map((e) => ContentItem.fromJson(e)).toList();
  }

  Future<List<Category>> getCategories() async {
    if (AppConfig.useMockData) {
      return [
        const Category(id: 'cat-01', name: 'Meditations', slug: 'meditations'),
        const Category(id: 'cat-02', name: 'Premium Courses', slug: 'courses'),
        const Category(id: 'cat-03', name: 'Free Resources', slug: 'free'),
      ];
    }
    final data = await _client.get('/content/${BrandConfig.channelSlug}/categories');
    return (data as List).map((e) => Category.fromJson(e)).toList();
  }

  Future<List<Course>> getCourses() async {
    if (AppConfig.useMockData) return [];
    final data = await _client.get('/content/${BrandConfig.channelSlug}/courses');
    return (data as List).map((e) => Course.fromJson(e)).toList();
  }

  Future<void> saveProgress({
    required String contentId,
    required int progressSeconds,
    bool completed = false,
  }) async {
    if (AppConfig.useMockData) return;
    await _client.post('/content/progress', body: {
      'contentId': contentId,
      'progressSeconds': progressSeconds,
      'completed': completed,
    });
  }

  List<ContentItem> _getMockContent({String? categoryId, bool featured = false}) {
    final all = [
      const ContentItem(
        id: '1',
        title: 'Introduction to Mindfulness',
        isPremium: false,
        categoryId: 'cat-01',
        isFeatured: true,
      ),
      const ContentItem(
        id: 'premium-01',
        title: 'Advanced Course: Module 1',
        isPremium: true,
        categoryId: 'cat-02',
        thumbnailUrl: 'https://images.unsplash.com/photo-1544367567-0f2fcb009e0b?q=80&w=400',
        videoUrl: 'https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/BigBuckBunny.mp4',
      ),
      const ContentItem(
        id: 'free-01',
        title: 'Quick Relaxation Guide',
        isPremium: false,
        categoryId: 'cat-03',
        thumbnailUrl: 'https://images.unsplash.com/photo-1506126613408-eca07ce68773?q=80&w=400',
      ),
    ];

    if (categoryId != null) {
      return all.where((item) => item.categoryId == categoryId).toList();
    }
    if (featured) {
      return all.where((item) => item.isFeatured).toList();
    }
    return all;
  }
}

final contentRepositoryProvider = Provider<ContentRepository>((ref) {
  return ContentRepository(ref.watch(apiClientProvider));
});
