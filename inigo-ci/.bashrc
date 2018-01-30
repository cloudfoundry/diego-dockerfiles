#!/usr/bin/env bash

if [ "x$LOCAL_DEVELOPMENT" == "xtrue" ]; then
    source /diego-release/scripts/ci/setup_inigo
    set +ex
fi
