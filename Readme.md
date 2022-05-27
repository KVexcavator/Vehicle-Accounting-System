Vehicle Accounting System

Run local:
bundle _2.3.10_ install
bundle exec rerun app.rb

Run with Docker:
docker build --tag vas .
docker run -p 4567:4567 vas


open http://localhost:4567
