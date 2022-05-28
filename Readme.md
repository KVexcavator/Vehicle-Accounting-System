Vehicle Accounting System

Production run with docker-compose:
docker-compose up --build

open http://localhost:4567


Debugging Information

Migration:
docker-compose run --rm app bundle exec rake db:create
docker-compose run --rm app bundle exec rake db:migrate
docker-compose run --rm app bundle exec rake db:migrate RACK_ENV="test"

Problem rebuild:
docker stop $(docker ps -a -q)
docker rm $(docker ps -a -q)
sudo chown -R $USER tmp/db

Run local(need reset with local database):
bundle _2.3.10_ install
bundle exec rerun app.rb

Test Docker:
docker build --tag vas .
docker run -p 4567:4567 vas

Run test rspec:
docker-compose run --rm app bundle exec rspec
