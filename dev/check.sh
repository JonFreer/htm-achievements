#!/bin/sh

set -e

exec 1>&2

(
    cd api/
    isort --check \
        --multi-line=3 \
        --trailing-comma \
        --force-grid-wrap=0 \
        --use-parentheses \
        --line-width=88 \
        app/
    black --check app/
    mypy app
)

(
    cd admin/
    yarn format-check
)