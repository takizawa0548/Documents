FROM docker.io/library/alpine:3.18.4

WORKDIR /tmp
ENV MDBOOK_VERSION=v0.4.35 \
    MDBOOK_MERMAID_VERSION=v0.12.6
RUN wget --quiet "https://github.com/rust-lang/mdBook/releases/download/${MDBOOK_VERSION}/mdbook-${MDBOOK_VERSION}-x86_64-unknown-linux-musl.tar.gz" && \
    tar xzvf "mdbook-${MDBOOK_VERSION}-x86_64-unknown-linux-musl.tar.gz" && \
    mv mdbook /usr/local/bin && \
    rm ./*
RUN wget --quiet "https://github.com/badboy/mdbook-mermaid/releases/download/${MDBOOK_MERMAID_VERSION}/mdbook-mermaid-${MDBOOK_MERMAID_VERSION}-x86_64-unknown-linux-musl.tar.gz" && \
    tar xzvf "mdbook-mermaid-${MDBOOK_MERMAID_VERSION}-x86_64-unknown-linux-musl.tar.gz" && \
    mv mdbook-mermaid /usr/local/bin && \
    rm ./*

WORKDIR /work

EXPOSE 3000

CMD ["sh", "-c", "mdbook-mermaid install . && mdbook serve --hostname 0.0.0.0"]