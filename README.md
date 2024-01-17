# Gemsweeper
It's like Minesweeper, but with gems.
Check it out [here!](https://gemsweeper-432d70138caa.herokuapp.com)

## Local Setup
1. Clone the repository
1. `bundle install`
1. `rails db:setup`
1. `rails s`

## Deploying to Heroku
Please follow the outlined steps to deploy to Heroku. You will need to have the Heroku CLI installed.
From within the project directory: 
1. `heroku login`
2. `heroku create <unique-app-name>` - replace `<unique-app-name>` with a unique name for your app
3. `heroku git:remote -a <unique-app-name>`
4. `git push heroku main`
5. `heroku run rails db:migrate db:seed -a <unique-app-name>`

## Bonus Work
- Pagination
- Test coverage
- Pre-generated board HMTL

## Notes
- The Tile object was added to favour readability over performance. We could remove this PORO and just keep tiles as a plain hash to improve performance.
- In the future, for extremely large boards we could offload the board generation to a job.
