// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'player_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentlyPlayingHash() => r'ae1adc7cee83ff8b4da64e2b90d07c60c4c83da7';

/// See also [CurrentlyPlaying].
@ProviderFor(CurrentlyPlaying)
final currentlyPlayingProvider =
    AutoDisposeNotifierProvider<CurrentlyPlaying, ContentItem?>.internal(
  CurrentlyPlaying.new,
  name: r'currentlyPlayingProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentlyPlayingHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentlyPlaying = AutoDisposeNotifier<ContentItem?>;
String _$playerNotifierHash() => r'a35053ff2c1b84d535d4dba6a160da8b9d27f94b';

/// See also [PlayerNotifier].
@ProviderFor(PlayerNotifier)
final playerNotifierProvider =
    AutoDisposeNotifierProvider<PlayerNotifier, PlayerStateData>.internal(
  PlayerNotifier.new,
  name: r'playerNotifierProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$playerNotifierHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlayerNotifier = AutoDisposeNotifier<PlayerStateData>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
