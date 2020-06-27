class CustomizableMultiselectDialogOptions {

  const CustomizableMultiselectDialogOptions({
    this.title,
    this.okButtonLabel = 'Ok',
    this.cancelButtonLabel = 'Cancel',
    this.enableSearchBar = true,
  });

  final String title;
  final String okButtonLabel;
  final String cancelButtonLabel;
  final bool enableSearchBar;

}
