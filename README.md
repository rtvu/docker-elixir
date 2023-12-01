# DOCKER-ELIXIR

Docker image for Elixir and Erlang.

# Environment Variables

The following environment variables are set:

``` bash
# From Base Image
ENV LANG=C.UTF-8
ENV USER=user
ENV HOME=/home/${USER}

# New
ENV ASDF_VERSION=v0.13.1
ENV ERLANG_VERSION=26.1.2
ENV ELIXIR_VERSION=1.15.7-otp-26
```
