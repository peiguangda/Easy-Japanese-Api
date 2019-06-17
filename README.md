# README

Deploy:
git add . 
git commit --amend --no-edit
git push heroku master -f
heroku pg:reset DATABASE_URL --confirm easy-japan-api
heroku run rake db:migrate
heroku run rake db:seed
remote: https://git.heroku.com/easy-japan-api.git


Run Project
install ruby
bundle install
rails db:create
rails db:migrate
rails db:seed
rails s