# Canary Hangman

Let's play hangman!

The easiest way to play this game is to pull my docker image from DockerHub. Run the following commands.

```
docker pull joshmenden/canary-hangman:latest
docker run -a stdin -a stdout -it joshmenden/canary-hangman:latest
```

Or, if you want to run it locally clone the repo, then run...

```
bundle install
ruby start_game.rb
```
