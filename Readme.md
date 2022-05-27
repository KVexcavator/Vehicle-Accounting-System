Vehicle Accounting System

Run local(need reset database):
bundle _2.3.10_ install
bundle exec rerun app.rb

Test Docker:
docker build --tag vas .
docker run -p 4567:4567 vas

Run with docker-compose:
docker-compose up --build
Use Ctrl-C to stop after first run
docker-compose run --rm app bundle exec rake db:create

open http://localhost:4567



docker-compose run --rm app bundle exec rspec
