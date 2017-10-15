#!/bin/bash

export PORT=8000

mix deps.get
(cd assets && npm install)
(cd assets && ./node_modules/brunch/bin/brunch b -p)
mix phx.digest
mix release --env=prod

./_build/prod/rel/microblog/bin/microblog stop || true

mix ecto.migrate

./_build/prod/rel/microblog/bin/microblog start
