# Twitter Timeline

## App Design / Gems

The app basically is using for comunicating with the Twitter Api [sferik/twitter](https://github.com/sferik/twitter),
since it's a very well known gem used for wrapping the Twitter EndPoints. For the authentication layer,
I decided to use [plataformatec/devise](https://github.com/plataformatec/devise),
because of the estipulated duration of this test, and also because its a great gem
for dealing with User's authentication.


## Local environment setup instructions

- Update Twitter Credentials:
    - You can either choose to add the twitter credentials (`TWITTER_CONSUMER_KEY`, `TWITTER_CONSUMER_SECRET`)
to your environment variables, or create a `.env` file (You can copy from `.env_sample`)
- Prepare your database with:
```console
$ bundle exec rake db:reset
```

## Basic Heroku deployment instructions

For basic Heroku Deployment you will need to:
- create the app
```console
$ heroku create
```
- After the app is created, add the git remote branch
```console
$ heroku git:remote -a YOUR_APP_NAME
```
- Lastly, you need to deploy
```console
$ git push heroku master
```

If your ever need more information about deployment your app into Heroku, you can
find more at [this guide](https://devcenter.heroku.com/articles/git).

## Test suite setup/execution instructions

After finishing seting up your local environment, you can run:
```console
$ rspec
```
inside the project's folder to run the specs.

