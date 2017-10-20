# README

## Getting Started

Install Ruby on Rails 5.1 or higher on your local machine

Fork the repository or clone if you have been added as a contributor

```git clone https://github.com/ChristopherMaierInc/Dream-Stream.git```

Once you've got a local copy of the repo, open your terminal and cd into the app's directory.

Once there, run a bundle install to get the required gems onto your local copy.

```bundle install```

Then, run the migration to create a local schema.

```rails db:migrate```

The app has a seed.rb file to seed the database with the current products. Run the following command next.

```rails db:seed```

You should now be ready to work on the app as well as use the rails console which you can access via ```rails c```.

## Environmental Variables

Make sure to set the Stripe, MailGun and Heroku PostgreSQL environmental variables in your bash-profile file.

``` open ~/.bash-profile```

Copy and save them like so: ```export YOUR_ENV_VARIABLE="<Put the data here, e.g. password or a key>"```

Make sure to restart all terminals once you've done this before continuing.

## Heroku, Stripe, MailGun access

Contact one of the admins of the project to get access to the ENV key values that you'll need.
