//	@file Version: 1.0
//	@file Name: missionDefines.sqf
//	@file Author: [404] Deadbeat, [404] Costlyy
//	@file Created: 08/12/2012 15:19

//Side Mission Colour = #4BC9B0 - Turquoise 
//Fail Mission Colour = #FF1717 - Light red
//Fail Mission Colour = #17FF41 - Light green
//Sub Colour = #FFF - White
#include "setup.sqf"
#ifdef __DEBUG__

	#define sideMissionTimeout 600
	#define sideMissionDelayTime 100

#else

#define sideMissionTimeout 600
#define sideMissionDelayTime 100
    
#endif

#define missionRadiusTrigger 50
#define sideMissionColor "#4BC9B0"
#define failMissionColor "#FF1717"
#define successMissionColor "#17FF41"
#define subTextColor "#FFFFFF"