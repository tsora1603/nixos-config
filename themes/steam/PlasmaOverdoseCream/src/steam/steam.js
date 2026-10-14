// Unmodified Steam window helper from ricewind012/win95-themes v2.3.0.
const { LocalizationManager } = window.opener;

const tokens = (() => {
	switch (document.title) {
		case LocalizationManager.LocalizeString("#SignIn_Title"):
			return ["NavigateBack"];

		case LocalizationManager.LocalizeString("#MediaManager_Dialog_Header"):
		case "ScreenshotManager": // Overlay
			return ["Clip_Delete_Tooltip"];

		default:
			return [];
	}
})();

for (const token of tokens) {
	document.body.style.setProperty(
		`--${token}`,
		`'${LocalizationManager.LocalizeString(`#${token}`)}'`,
	);
}

switch (document.title) {
	case LocalizationManager.LocalizeString("#Menu_Servers"):
		SteamClient.Window.SetMinSize(500, 500);
		break;
}
