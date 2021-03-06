#! /bin/bash

echo "**********************************************"
echo "* PUSH CHANGES TO GITHUB AND AFTER TO HEROKU *"
echo "**********************************************"

touch heroku.sh

git diff | grep +++

read -p "You want to continue? [y|*N*]: " OPTION

if [ "$OPTION" == "y" ]; then

    read -p "Write the commit message: " MESSAGE

    git add . && \
    git commit -m "$MESSAGE" && \
    git push && \
    git push heroku master && \
    heroku logs

fi
