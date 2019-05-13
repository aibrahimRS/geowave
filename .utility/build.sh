#!/bin/bash
set -ev

if [ "$TRAVIS_REPO_SLUG" == "locationtech/geowave" ] && [ "$BUILD_AND_PUBLISH" == "true" ]; then
  echo -e "Building docs...\n"
  mvn -P html -pl docs install
  
  echo -e "Installing local artifacts...\n"
  mvn -q install -DskipTests -Dfindbugs.skip
  
  echo -e "Building javadocs...\n"
  mvn -q javadoc:aggregate
fi
