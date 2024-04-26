import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:widgets_app/config/theme/app_theme.dart';

//Un simple boolean
final isDarkmodeProvider = StateProvider((ref) => false);

//Listado de colores inmutable
final colorListProvider = Provider((ref) => colorList);

//Listado de colores inmutable
final selectedColorProvider = StateProvider((ref) => 0);

//Un objeto de tipo AppTheme (custom)
final themeNotifierProvider = StateNotifierProvider<ThemeNotifier, AppTheme>(
  (ref) => ThemeNotifier(),
);

//Controller o Notifier
class ThemeNotifier extends StateNotifier<AppTheme>{
  // STATE = ESTADO = newAppTheme()
  ThemeNotifier(): super(AppTheme());

  void toggleDarkmode(){
    state = state.copyWith(isDarkmode: !state.isDarkmode);
  }

  void changeColorIndex(int colorIndex){
    state = state.copyWith(selectedColor: colorIndex);
  }
}