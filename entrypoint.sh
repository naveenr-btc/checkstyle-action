#!/bin/sh

echo "Running check"
echo "creating docker image with alpine version: $CHECKSTYLE_VERSION"

export REVIEWDOG_GITHUB_API_TOKEN="${INPUT_GITHUB_TOKEN}"

exec java -jar /checkstyle.jar -c /"${INPUT_CHECKSTYLE_CONFIG}" "${INPUT_WORKDIR}" -f xml \
 | reviewdog -f=checkstyle -name="${INPUT_TOOL_NAME}" -reporter="${INPUT_REPORTER}" -level="${INPUT_LEVEL}"
