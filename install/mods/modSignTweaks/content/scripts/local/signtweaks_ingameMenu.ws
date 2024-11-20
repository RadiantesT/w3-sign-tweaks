@wrapMethod(CR4IngameMenu) function OnClosingMenu()
{
	//update settings when closing menu instead of fetch config every magic cast
	st_update_st_settings();
	wrappedMethod();
}