#  <#Title#>
<UIActionSheetDelegate>
- (void)settingClicked:(UIButton *)sender {
if (AboveIOS8) {
UIAlertController *alertController = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];

UIAlertAction *action = [UIAlertAction actionWithTitle:kHXStrTradeComfirOn style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
[HsConfigration writeUserDefaultWithKey:@"isShowConfirm" WithValue:[NSNumber numberWithBool:YES]];
}];
[alertController addAction:action];
[self updateTitleColorOfAlertAction:action];

UIAlertAction *action1 = [UIAlertAction actionWithTitle:kHXStrTradeComfirOff style:UIAlertActionStyleDefault handler:^(UIAlertAction *action) {
[HsConfigration writeUserDefaultWithKey:@"isShowConfirm" WithValue:[NSNumber numberWithBool:NO]];
}];
[alertController addAction:action1];
[self updateTitleColorOfAlertAction:action1];

UIAlertAction *action3 = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil];
[alertController addAction:action3];

// 会更改UIAlertController中所有字体的内容（此方法有个缺点，会修改所有字体的样式）
UILabel *appearanceLabel = [UILabel appearanceWhenContainedIn:UIAlertController.class, nil];
[appearanceLabel setAppearanceFont:FONT_16];


[[HsViewController sharedManager] presentViewController:alertController animated:YES completion:nil];
}
else {
UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:nil
delegate:self
cancelButtonTitle:@"取消"
destructiveButtonTitle:nil
otherButtonTitles:kHXStrTradeComfirOn, kHXStrTradeComfirOff, nil];
[actionSheet showInView:[UIApplication sharedApplication].keyWindow];
}
}


- (void)updateTitleColorOfAlertAction:(UIAlertAction *)action
{
NSString *title = action.title;
Boolean isConfirmOn = [[HsConfigration readUserDefaultWithKey:@"isShowConfirm"] boolValue];
if (AboveIOS8 && ([CurrentSystemVersion floatValue] >8.2)){
if ([title isEqualToString:kHXStrTradeComfirOn]) {
if (isConfirmOn){
[action setValue:HX_COLOR(BottomPop_Selected_Color) forKey:@"_titleTextColor"];
}else {
[action setValue:HX_COLOR(BottomPop_Default_Color) forKey:@"_titleTextColor"];
}
}
else if ([title isEqualToString:kHXStrTradeComfirOff]){
if (!isConfirmOn){
[action setValue:HX_COLOR(BottomPop_Selected_Color) forKey:@"_titleTextColor"];
}else {
[action setValue:HX_COLOR(BottomPop_Default_Color) forKey:@"_titleTextColor"];
}
}
}else {

}
}


#pragma mark - UIActionSheetDelegate

- (void)willPresentActionSheet:(UIActionSheet *)actionSheet
{
if (AboveIOS8) {
}
else {
Boolean isConfirmOn = [[HsConfigration readUserDefaultWithKey:@"isShowConfirm"] boolValue];
for (UIView *subView in actionSheet.subviews) {
if ([subView isKindOfClass:[UIButton class]]) {
UIButton *button = (UIButton *)subView;
if ([button.titleLabel.text isEqualToString:kHXStrTradeComfirOn]){
if (isConfirmOn){
[button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}else {
[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
}else if ([button.titleLabel.text isEqualToString:kHXStrTradeComfirOff]){
if (!isConfirmOn){
[button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
}else {
[button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}
}
button.titleLabel.font = [UIFont systemFontOfSize:16];
}
}
}
}
