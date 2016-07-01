#!/bin/bash
if [ "$TMUX" = "" ]; then
	echo "Error: Please start tmux first by typing tmux"
	exit 1
fi

command_exists () {
  type "$1" &> /dev/null ;
}

echo Installing gems...
bundle install 

if ! command_exists 'redis-server'; then
  echo Installing redis...
  brew install redis
fi

echo Clearing redis...
redis-cli flushall

if [ ! -f /usr/local/sbin/rabbitmqctl ]; then
  echo Installing rabbitmq
  brew install rabbitmq
fi

echo Resetting rabbitmq...
/usr/local/sbin/rabbitmqctl stop_app
/usr/local/sbin/rabbitmqctl reset
/usr/local/sbin/rabbitmqctl start_app

bundle exec teamocil --here --layout teamocil.yml
