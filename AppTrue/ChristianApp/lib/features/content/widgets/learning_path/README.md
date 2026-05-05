# Learning Path Widget 🗺️

A procedural, scrollable learning path inspired by Duolingo. It visualizes progress through lessons using a zig-zag node layout and smooth S-curve connectors.

## Features

- **Procedural Connectors:** Uses a `CustomPainter` to draw smooth S-curves between nodes.
- **Floating Animation:** The active (current) lesson floats and pulses to draw attention.
- **Responsive Layout:** Nodes automatically alternate left and right positions.
- **Configurable:** Number of items and completed count can be passed as parameters.

## Files

- `learning_path_view.dart`: The main container for the path.
- `path_node.dart`: Individual lesson nodes with animations and state.
- `path_connector_painter.dart`: The mathematics for drawing the curves.

## How to Enable

In `lib/core/config/app_config.dart`, set:

```dart
static const bool enableLearningPath = true;
```

## Usage

Embed the path in a `CustomScrollView` or any column:

```dart
LearningPathView(
  itemCount: 10,
  completedCount: 3,
  onNodeTap: (index) => print("Tapped node $index"),
)
```

## Customization

- Colors are pulled from `BrandConfig.xpColor` (completed), `BrandConfig.primaryColor` (active), and `Colors.grey` (locked).
- The "floating" effect for active nodes is handled via an `AnimationController` inside `PathNode`.
