FROM ghcr.io/platten/rust-musl-builder:latest

COPY entrypoint.sh /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"]
