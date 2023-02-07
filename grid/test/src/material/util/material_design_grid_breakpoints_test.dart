import 'package:design_grid/design_grid.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('MaterialDesignGridBreakpoints', () {
    test('should return correct columns', () {
      expect(MaterialDesignGridBreakpoints.getColumns(0), 4);
      expect(MaterialDesignGridBreakpoints.getColumns(599), 4);
      expect(MaterialDesignGridBreakpoints.getColumns(600), 8);
      expect(MaterialDesignGridBreakpoints.getColumns(904), 8);
      expect(MaterialDesignGridBreakpoints.getColumns(905), 12);
      expect(MaterialDesignGridBreakpoints.getColumns(1239), 12);
      expect(MaterialDesignGridBreakpoints.getColumns(1240), 12);
      expect(MaterialDesignGridBreakpoints.getColumns(1439), 12);
      expect(MaterialDesignGridBreakpoints.getColumns(1440), 12);
    });

    test('should return correct margin', () {
      expect(MaterialDesignGridBreakpoints.getMargin(0), 16);
      expect(MaterialDesignGridBreakpoints.getMargin(599), 16);
      expect(MaterialDesignGridBreakpoints.getMargin(600), 32);
      expect(MaterialDesignGridBreakpoints.getMargin(904), 32);
      expect(MaterialDesignGridBreakpoints.getMargin(905), null);
      expect(MaterialDesignGridBreakpoints.getMargin(1239), null);
      expect(MaterialDesignGridBreakpoints.getMargin(1240), 200);
      expect(MaterialDesignGridBreakpoints.getMargin(1439), 200);
      expect(MaterialDesignGridBreakpoints.getMargin(1440), null);
    });

    test('should return correct body width', () {
      expect(MaterialDesignGridBreakpoints.getBodyWidth(0), null);
      expect(MaterialDesignGridBreakpoints.getBodyWidth(599), null);
      expect(MaterialDesignGridBreakpoints.getBodyWidth(600), null);
      expect(MaterialDesignGridBreakpoints.getBodyWidth(904), null);
      expect(MaterialDesignGridBreakpoints.getBodyWidth(905), 840);
      expect(MaterialDesignGridBreakpoints.getBodyWidth(1239), 840);
      expect(MaterialDesignGridBreakpoints.getBodyWidth(1240), null);
      expect(MaterialDesignGridBreakpoints.getBodyWidth(1439), null);
      expect(MaterialDesignGridBreakpoints.getBodyWidth(1440), 1040);
    });
  });
}
