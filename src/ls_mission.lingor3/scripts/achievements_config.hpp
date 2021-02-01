/*
	Author: Demellion Dismal
	Description:
		Master configuration for achievements module

	Class structure:
		title - Display name of the achievement
		description - Description of the achievement.
		milestoneValue - Value that determines achievement completion. If value is = 1 - then system will treat achievement as boolean type.
		milestoneFraction - Stored value divisor. Example: milestone is determined in hours, data is stored in seconds = 3600 will convert seconds to hours.
		rewardAction - code-string of action to perform when achievement is done.
		rewardText - additional title text to display a goal of a reward (Structured Text).
		secret - achievement will only be shown when achieved, otherwise hidden under secret counter.

	Function usage
		['Example',100] call DT_fnc_achievementGateway
		
		Adds 100 points to Example achievement milestone.
*/

class CfgAchievements {
	dialogKey = 0x57; // Key used to open achievements dialog (default: TAB).

	class Achievements {
		// You can add your own achievements below
	};
};