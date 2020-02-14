FROM elixir:1.10.1-alpine

# Create app directory and copy the Elixir projects into it
RUN mkdir /app
WORKDIR /app

# Install hex package manager
# By using --force, we don’t need to type “Y” to confirm the installation
RUN mix local.hex --force
