#!/usr/bin/env bash
set -x
set -eo pipefail

cargo install sqlx-cli --no-default-features --features postgres,rustls
cargo install cargo-sort
cargo install bunyan
cargo install just
