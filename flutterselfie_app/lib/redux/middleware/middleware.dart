import '../../api/storage.dart';
import '../../redux/actions/actions.dart';
import '../../redux/models/app_state.dart';
import '../../widgets/camera.dart';
import 'package:redux/redux.dart';

void middleware(Store<AppState> store, action, NextDispatcher next) {
  if (action is LoadThumbsAction)
    Storage.getFilePaths().then((paths) {
      store.dispatch(LoadThumbsSucceededAction(paths));
    }).catchError((Object error) {
      store.dispatch(LoadThumbsFailedAction(error));
    });
  else if (action is CaptureImageAction)
    CameraState.captureImage().then((path) {
      store.dispatch(CaptureImageSucceededAction(path));
    }).catchError((Object error) {
      store.dispatch(CaptureImageFailedAction(error));
    });
  next(action);
}
