A light package aimed at reducing the boiler-plate code required when using the camera package. This package relies on https://pub.dev/packages/camera


## Features

* Automatically initialize and dispose Camera Controller within an state
* Receive callbacks through stream controller whenever the camera controller is initialized so that you can build CameraPreview
* A helper method for showing CameraPreview whenever camera controller is ready (shows a customizable loading widget if camera controller is not initialized yet)

## Getting started

Follow the section for getting started of the camera package https://pub.dev/packages/camera. Notice that you have to add some required lines to different files for Android, iOS, and Web for camera package to work.

## Usage

Simply extend a class with StreamCameraState
```dart
class _MyHomePageState extends StreamCameraState<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      
      // helper for showing the camera preview
      body: buildCameraPreview(
        previewBuilder: (context, controller) {
          return CameraPreview(controller);
        },
      ),
    );
  }

  // this is called whenever the camera controller is initialized for the first time
  @override
  void onCameraControllerInitialized() {
    print('camera controller initialized');
  }

  // this is called everytime the camera sends an image
  @override
  void onCameraImageAvailable(CameraImage cameraImage) {
    print('image available');
  }
}
```

## Additional information
If you have questions please let me know. This package should remove most of the boiler-plate codes that you wrote in order to get an image from camera controller image stream. Works well with anything AI releated. You can do various image processing on the cameraImage once it is passed to you inside the onCameraImageAvailable method.
