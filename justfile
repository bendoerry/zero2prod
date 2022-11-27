@_list:
    just --list

# Format code
format:
    cargo fmt
    cargo sort

# Build code
build:
    cargo build

# Check code
check: init build
    cargo clippy
    cargo sqlx prepare --check -- --bin zero2prod
    cargo fmt --check
    cargo sort --check

# Init db
init:
    SKIP_DOCKER=true ./scripts/init_db.sh

# Update offline sqlx
sqlx: init
    cargo sqlx prepare -- --lib

# Run app
run: init
    cargo run | bunyan

# Test
test:
    cargo test
