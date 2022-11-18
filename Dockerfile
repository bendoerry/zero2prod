# Chef stage - Install rust's compilation dependecies
FROM lukemathwalker/cargo-chef:latest-rust-1.65.0 AS chef
WORKDIR /app
RUN apt update && apt install lld clang -y

# Planner stage - Prepare for installing project dependecies
FROM chef as planner
COPY . .
# Compute a lock-like file for our project
RUN cargo chef prepare --recipe-path recipe.json

# Builder stage - Build project
FROM chef as builder
COPY --from=planner /app/recipe.json recipe.json
# Build our project dependencies, not our application!
RUN cargo chef cook --release --recipe-path recipe.json
# Up to this point, if our dependency tree stays the sname,
# all layers should be cached
COPY . .
ENV SQLX_OFFLINE true
RUN cargo build --release

# Runtime stage - Runtime enviroment for our app
FROM gcr.io/distroless/cc AS runtime

WORKDIR /app
COPY --from=builder /app/target/release/zero2prod zero2prod
COPY configuration configuration
ENV APP_ENVIRONMENT production
ENTRYPOINT [ "./zero2prod" ]
