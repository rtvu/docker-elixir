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
ENV ASDF_VERSION=v0.14.0
ENV ERLANG_VERSION=27.0
ENV ELIXIR_VERSION=1.17.1-otp-27
```
