// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'content_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$contentListHash() => r'c9162a4a13f7b77819bcd4c6724e2f479e910165';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [contentList].
@ProviderFor(contentList)
const contentListProvider = ContentListFamily();

/// See also [contentList].
class ContentListFamily extends Family<AsyncValue<List<ContentItem>>> {
  /// See also [contentList].
  const ContentListFamily();

  /// See also [contentList].
  ContentListProvider call({
    String? categoryId,
    bool featured = false,
  }) {
    return ContentListProvider(
      categoryId: categoryId,
      featured: featured,
    );
  }

  @override
  ContentListProvider getProviderOverride(
    covariant ContentListProvider provider,
  ) {
    return call(
      categoryId: provider.categoryId,
      featured: provider.featured,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'contentListProvider';
}

/// See also [contentList].
class ContentListProvider extends AutoDisposeFutureProvider<List<ContentItem>> {
  /// See also [contentList].
  ContentListProvider({
    String? categoryId,
    bool featured = false,
  }) : this._internal(
          (ref) => contentList(
            ref as ContentListRef,
            categoryId: categoryId,
            featured: featured,
          ),
          from: contentListProvider,
          name: r'contentListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$contentListHash,
          dependencies: ContentListFamily._dependencies,
          allTransitiveDependencies:
              ContentListFamily._allTransitiveDependencies,
          categoryId: categoryId,
          featured: featured,
        );

  ContentListProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.categoryId,
    required this.featured,
  }) : super.internal();

  final String? categoryId;
  final bool featured;

  @override
  Override overrideWith(
    FutureOr<List<ContentItem>> Function(ContentListRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ContentListProvider._internal(
        (ref) => create(ref as ContentListRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        categoryId: categoryId,
        featured: featured,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<ContentItem>> createElement() {
    return _ContentListProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ContentListProvider &&
        other.categoryId == categoryId &&
        other.featured == featured;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, categoryId.hashCode);
    hash = _SystemHash.combine(hash, featured.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin ContentListRef on AutoDisposeFutureProviderRef<List<ContentItem>> {
  /// The parameter `categoryId` of this provider.
  String? get categoryId;

  /// The parameter `featured` of this provider.
  bool get featured;
}

class _ContentListProviderElement
    extends AutoDisposeFutureProviderElement<List<ContentItem>>
    with ContentListRef {
  _ContentListProviderElement(super.provider);

  @override
  String? get categoryId => (origin as ContentListProvider).categoryId;
  @override
  bool get featured => (origin as ContentListProvider).featured;
}

String _$categoriesHash() => r'ccfe65ed4b3c9c176e02401b5e15d70b766511d5';

/// See also [categories].
@ProviderFor(categories)
final categoriesProvider = AutoDisposeFutureProvider<List<Category>>.internal(
  categories,
  name: r'categoriesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$categoriesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CategoriesRef = AutoDisposeFutureProviderRef<List<Category>>;
String _$coursesHash() => r'12205a3d6140ab6c09721eb7ba11e6cf15a46db9';

/// See also [courses].
@ProviderFor(courses)
final coursesProvider = AutoDisposeFutureProvider<List<Course>>.internal(
  courses,
  name: r'coursesProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$coursesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef CoursesRef = AutoDisposeFutureProviderRef<List<Course>>;
String _$selectedCategoryHash() => r'1701f6cfe8a3609209b04690b5362d0d3dd06e8c';

/// See also [SelectedCategory].
@ProviderFor(SelectedCategory)
final selectedCategoryProvider =
    AutoDisposeNotifierProvider<SelectedCategory, String?>.internal(
  SelectedCategory.new,
  name: r'selectedCategoryProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$selectedCategoryHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$SelectedCategory = AutoDisposeNotifier<String?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
