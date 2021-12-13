import 'dart:async';
import 'dart:ui';
import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flame/game.dart';
import 'package:flame/sprite.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ordered_set/ordered_set.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Flame.device.setLandscape();
  await Flame.device.fullScreen();
   final game = InspectorWells();

  runApp(
    MaterialApp(
      theme: ThemeData(
        ///From here https://www.dafont.com/de/my font.font
        fontFamily: 'my font',
      ),
      home: GameWidget(
        game: game,
        //Work in progress loading screen on game start
        loadingBuilder: (context) => const Material(
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
        //Work in progress error handling
        errorBuilder: (context, ex) {
          //Print the error in th dev console
          debugPrint(ex.toString());
          return const Material(
            child: Center(
              child: Text('You are broke, please start from last save point'),
            ),
          );
        },
        overlayBuilderMap: {
          'pause': (context, InspectorWells game) => PauseMenu(game: game),
        },
      ),
    ),
  );
}

/// This class encapulates the whole game.
class InspectorWells extends FlameGame
    with
        HasCollidables,
        HasTappables,
        HasKeyboardHandlerComponents,
        HasDraggables {
  ///Interface to play audio
  // late final InspectorWellsAudioPlayer audioPlayer;

  /// Depending on the active overlay state we turn of the engine or not.
  void onOverlayChanged() {
    if (overlays.isActive('pause')) {
      pauseEngine();
    } else {
      resumeEngine();
    }
  }

  @override
  bool get debugMode => GameState.showDebugInfo;

  /// Restart the current level.
  void restart() {
    // TODO(wolfen): Implement restart of current level.
    GameState.playState = PlayingState.playing;
    (children.firstWhere((child) => child is LastTurn)
    as LastTurn)
        .reset();
  }

  @override
  void onMount() {
    overlays.addListener(onOverlayChanged);
    super.onMount();
  }

  @override
  void onRemove() {
    overlays.removeListener(onOverlayChanged);
    super.onRemove();
  }

  @override
  Future<void> onLoad() async {
    final image = await images.load('joystick.png');
    final sheet = SpriteSheet.fromColumnsAndRows(
      image: image,
      columns: 6,
      rows: 1,
    );
    camera.viewport = FixedVerticalResolutionViewport(800);
    //Init and load the audio assets
    audioPlayer = InspectorWellsAudioPlayer();
    await audioPlayer.loadAssets();

    overlays.addListener(onOverlayChanged);
    return super.onLoad();
  }

  @override
  VoidCallback? pauseEngineFn;

  @override
  VoidCallback? resumeEngineFn;

  @override
  bool runOnCreation;

  @override
  Viewport viewport;

  @override
  Future<void> add(Component c) {
    // TODO: implement add
    throw UnimplementedError();
  }

  @override
  void addAll(Iterable<Component> components) {
    // TODO: implement addAll
  }

  @override
  void assertHasLayout() {
    // TODO: implement assertHasLayout
  }

  @override
  // TODO: implement assets
  AssetsCache get assets => throw UnimplementedError();

  @override
  void attach(PipelineOwner owner, GameRenderBox gameRenderBox) {
    // TODO: implement attach
  }

  @override
  Color backgroundColor() {
    // TODO: implement backgroundColor
    throw UnimplementedError();
  }

  @override
  // TODO: implement buildContext
  BuildContext? get buildContext => throw UnimplementedError();

  @override
  // TODO: implement camera
  Camera get camera => throw UnimplementedError();

  @override
  // TODO: implement canvasSize
  Vector2 get canvasSize => throw UnimplementedError();

  @override
  void clear() {
    // TODO: implement clear
  }

  @override
  // TODO: implement components
  OrderedSet<Component> get components => throw UnimplementedError();

  @override
  Vector2 convertGlobalToLocalCoordinate(Vector2 point) {
    // TODO: implement convertGlobalToLocalCoordinate
    throw UnimplementedError();
  }

  @override
  Vector2 convertLocalToGlobalCoordinate(Vector2 point) {
    // TODO: implement convertLocalToGlobalCoordinate
    throw UnimplementedError();
  }

  @override
  double currentTime() {
    // TODO: implement currentTime
    throw UnimplementedError();
  }

  @override
  set debugMode(bool _debugMode) {
    // TODO: implement debugMode
  }

  @override
  void detach() {
    // TODO: implement detach
  }

  @override
  double fps([int average = 1]) {
    // TODO: implement fps
    throw UnimplementedError();
  }

  @override
  // TODO: implement hasLayout
  bool get hasLayout => throw UnimplementedError();

  @override
  // TODO: implement images
  Images get images => throw UnimplementedError();

  @override
  // TODO: implement isAttached
  bool get isAttached => throw UnimplementedError();

  @override
  void lifecycleStateChange(AppLifecycleState state) {
    // TODO: implement lifecycleStateChange
  }

  @override
  Future<Sprite> loadSprite(String path, {Vector2? srcSize, Vector2? srcPosition}) {
    // TODO: implement loadSprite
    throw UnimplementedError();
  }

  @override
  Future<SpriteAnimation> loadSpriteAnimation(String path, SpriteAnimationData data) {
    // TODO: implement loadSpriteAnimation
    throw UnimplementedError();
  }

  @override
  void onAttach() {
    // TODO: implement onAttach
  }

  @override
  void onDetach() {
    // TODO: implement onDetach
  }

  @override
  void onResize(Vector2 canvasSize) {
    // TODO: implement onResize
  }

  @override
  void onTimingsCallback(List<FrameTiming> timings) {
    // TODO: implement onTimingsCallback
  }

  @override
  // TODO: implement overlays
  ActiveOverlaysNotifier get overlays => throw UnimplementedError();

  @override
  void pauseEngine() {
    // TODO: implement pauseEngine
  }

  @override
  void prepare(Component c) {
    // TODO: implement prepare
  }

  @override
  Vector2 projectVector(Vector2 vector) {
    // TODO: implement projectVector
    throw UnimplementedError();
  }

  @override
  void remove(Component c) {
    // TODO: implement remove
  }

  @override
  void removeAll(Iterable<Component> components) {
    // TODO: implement removeAll
  }

  @override
  void render(Canvas canvas) {
    // TODO: implement render
  }

  @override
  void renderComponent(Canvas canvas, Component c) {
    // TODO: implement renderComponent
  }

  @override
  void resumeEngine() {
    // TODO: implement resumeEngine
  }

  @override
  Vector2 scaleVector(Vector2 vector) {
    // TODO: implement scaleVector
    throw UnimplementedError();
  }

  @override
  // TODO: implement size
  Vector2 get size => throw UnimplementedError();

  @override
  Vector2 unprojectVector(Vector2 vector) {
    // TODO: implement unprojectVector
    throw UnimplementedError();
  }

  @override
  Vector2 unscaleVector(Vector2 vector) {
    // TODO: implement unscaleVector
    throw UnimplementedError();
  }

  @override
  void update(double dt) {
    // TODO: implement update
  }
}