//kOS Program, for liftoff and orbiting Kerbin
// States:
//  0: Null
//  5: Pre-flight check & user input
// 10: Pre-flight countdown
// 15: Flight initiation
// 20: Kick
// 25: Gravity turn & throttle control
// 30: Stage separation
// 35: Misc. mid-flight staging
// 40: Circularization maneuver
// 45: Return control
// 50: Exit program


CLEARSCREEN.

// Null Shipstate
PRINT "Running rocket launch program.".

// Pre-flight Check

// Pre-flight Countdown
FROM {LOCAL countdown IS 10.} UNTIL countdown = 0 STEP {SET countdown TO countdown - 1. } DO {
  PRINT "Takeoff: " + countdown.
  WAIT 1.
}

// Flight Initiation
LOCK THROTTLE TO 1.0.
LOCK STEERING TO UP.
UNTIL MAXTHRUST > 0.0 {
  WAIT 0.5.
  PRINT "Initial staging".
  STAGE.
}

Until SHIP:ALTITUDE
