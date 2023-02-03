import 'package:design_grid/design_grid.dart';
import 'package:flutter/material.dart';

class DesignGridChildBreak extends DesignGridChild {
  const DesignGridChildBreak({super.key})
      : super(
          child: const SizedBox(),
          columns: const _DesignGridChildColumnsBreak(),
        );
}

class _DesignGridChildColumnsBreak extends DesignGridChildColumns {
  const _DesignGridChildColumnsBreak() : super(small: 0);
}
