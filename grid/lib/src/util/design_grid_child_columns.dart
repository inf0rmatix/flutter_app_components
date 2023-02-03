import 'package:design_grid/design_grid.dart';

abstract class DesignGridChildColumns {
  const DesignGridChildColumns();

  // TODO maybe to make this more adjustable, do not use an enum but a class to enable custom breakpoints?
  int getColumns(DesignGridDisplaySize displaySize);
}
