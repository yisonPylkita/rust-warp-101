FROM rust:1.47 as builder
WORKDIR /usr/src/rust-warp-101
COPY . .
RUN cargo install --path .

FROM debian:buster-slim
# RUN apt-get update && apt-get install -y extra-runtime-dependencies && rm -rf /var/lib/apt/lists/*
COPY --from=builder /usr/local/cargo/bin/rust-warp-101 /usr/local/bin/rust-warp-101
CMD ["rust-warp-101"]
