#   This script copies the githooks into the proper location.
#
#   This script should be called directly.

PARENTDIR=$(cd ../ && pwd)
PROJECTDIR=$(cd ../../ && pwd)
SRC_DIR="$PARENTDIR/git-hooks/"
DST_DIR="$PROJECTDIR/.git/hooks"
COPY_HIDDEN=
ORIG_IFS=$IFS
IFS=$(echo -en "\n\b")

if [[ ! -e "$SRC_DIR" ]]; then
  echo "error: Path does not exist: $SRC_DIR"
  exit 2
fi

#cp -a /$SRC_DIR/. /$DST_DIR/
# Copy gitHooks dir recursively
CODE=
if [[ -n $COPY_HIDDEN ]]; then
    rsync -Lra "$SRC_DIR" "$DST_DIR"
    CODE=$?
else
    rsync -Lra --exclude="- .*" "$SRC_DIR" "$DST_DIR"
    CODE=$?
fi

if [ $CODE -ne 0 ]; then
    echo "error: Error occurred on copying Code $CODE"
    exit 3
fi

IFS=$ORIG_IFS
