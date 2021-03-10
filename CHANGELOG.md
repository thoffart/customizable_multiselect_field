
## [1.0.1] - 10/03/2021

  * small fixes.

## [1.0.0] - 10/03/2021

  * Adding null safety support.

## [0.0.5] - 01/08/2020

  * small fixes.

## [0.0.4] - 01/08/2020

  * small fixes.


## [0.0.3] - 01/08/2020

  * BREAKING CHANGE: Field `decoration` moved from `CustomizableMultiselectWidgetOptions` class to `CustomizableMultiselectField` class to keep the existing pattern within the fields of the flutter.
  * bug solved where when placing the values directly in the valueList field, the rebuilding act will make the values return to they original state.


## [0.0.2] - 28/06/2020

  * Small fixes.


## [0.0.1] - 28/06/2020

* First release
  * Supports multiples data sources with customs label keys and value keys. 
  * Includes custumization through the classes `CustomizableMultiselectWidgetOptions`, `CustomizableMultiselectDialogOptions` and  `DataSourceOptions`.
  * It's a `FormField` and contains the default properties of one (`onSaved`, `validator`, `autovalidate` and `onChanged`).