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
LOCK STEERING TO R(0,0,90) + UP.
UNTIL MAXTHRUST > 0.0 {
  WAIT 0.5.
  PRINT "Initial staging".
  STAGE.
}
UNTIL ALTITUDE > 1000
{
  WAIT 0.5.
}

// Kick
SET KICKHEADING TO 87.
LOCK STEERING TO R(0,0,90) + HEADING(90, KICKHEADING).
UNTIL ALTITUDE > 2000
{
  WAIT 0.5.
}

// Gravity turn
LOCK STEERING TO SHIP:VELOCITY:SURFACE.
UNTIL SHIP:APOAPSIS > 72000 OR SHIP:VERTICALSPEED < 0.0
{
  WAIT 0.5.
}

// Landing
LOCK THROTTLE TO 0.0.
UNTIL SHIP:VERTICALSPEED < 0.0
{
  WAIT 0.5.
}
LOCK STEERING TO (-1) * SHIP:VELOCITY:SURFACE.
UNTIL ALTITUDE < 25000
{
  WAIT 0.5.
}
IF SHIP:VELOCITY:SURFACE > 250
{
  LOCK THROTTLE TO 1.0.
  UNTIL SHIP:VELOCITY:SURFACE < 250
  {
    WAIT 0.5.
  }
  LOCK THROTTLE TO 0.0.
}

STAGE. //Parachutes
UNLOCK STEERING.
UNTIL ALTITUDE < 50
{
  WAIT 0.5.
}
IF SHIP:VELOCITY:SURFACE > 6
{
  LOCK THROTTLE TO 0.25.
}
UNTIL SHIP:VELOCITY:SURFACE < 1
{
  WAIT 0.5.
}
LOCK THROTTLE TO 0.0.
