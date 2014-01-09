#!/bin/bash
source %ROOT%/global-paths.sh
if [ "$#" == "0" -o "$#" -gt "2" ]; then
  echo "usage: give-points USERNAME [NUM_POINTS]"
  exit 1
fi
GIVER=$(whoami)
TARGET="$1"
if [ -z "$(grep $GIVER $MEMBERS_LIST)" ]; then
  echo "you are not a member of the points system; please notify the administrators"
  exit 1
fi
if [ -z "$(grep $TARGET $MEMBERS_LIST)" ]; then
  echo "$TARGET is not a member of the points system. If you believe this is in error, please notify the administrators"
  exit 1
fi
if [ "$#" == "2" ]; then
  if echo -n "$2" | grep -q "^[1-9][0-9]*$"; then
    POINTS="$2"
  else
    echo "invalid points specified; must be positive integer"
    exit 1
  fi
else
  POINTS="1"
fi
GIVER_POINT_TOTAL=$($GET_SCORE_SCRIPT $GIVER)
AFTER_GIVER_POINT_TOTAL=$(echo "$GIVER_POINT_TOTAL - $POINTS" | bc)
if [ "$AFTER_GIVER_POINT_TOTAL" -lt "0" ]; then
  echo "cannot give away that many points"
  exit 1
else
  echo "transaction-time:$(date)" >> $SCORE_FILE
  echo "$GIVER:-$POINTS" >> $SCORE_FILE
  echo "$TARGET:$POINTS" >> $SCORE_FILE
  echo "new point totals"
  echo "$GIVER:$($GET_SCORE_SCRIPT $GIVER)"
  echo "$TARGET:$($GET_SCORE_SCRIPT $TARGET)"
fi
