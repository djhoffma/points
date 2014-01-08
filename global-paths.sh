#!/bin/bash
ROOT_PATH=/admin/consult/bin/points
MEMBERS_LIST=$ROOT_PATH/members-list
SCORE_FILE=$ROOT_PATH/scores
SETUP_SCRIPT=$ROOT_PATH/setup-system
GLOBAL_VARS=$ROOT_PATH/global-paths.sh
GENERATE_MEMBERS_SCRIPT=$ROOT_PATH/generate-members
DISPLAY_SCORES_SCRIPT=$ROOT_PATH/display-scores
GET_SCORE_SCRIPT=$ROOT_PATH/get-member-score
GIVE_PTS_SCRIPT=$ROOT_PATH/give-points
FILES_LIST="$MEMBERS_LIST $SCORE_FILE $SETUP_SCRIPT $GLOBAL_VARS $GENERATE_MEMBERS_SCRIPT $DISPLAY_SCORES_SCRIPT $GET_SCORE_SCRIPT $GIVE_PTS_SCRIPT"
BASE_SCORE="10"
ADMIN_BASE_SCORE="10000"
