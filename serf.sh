#!/bin/bash
# A bot which dutifully spams commands to the Twitch Plays Pokemon channel

set -e # Exit with failure if any commands fail
if [ -a twitch.input ]
then
  head -n 3 twitch.input > temp
  mv temp twitch.input
else
  touch twitch.input
  echo "Please provide your twitch API key. This key will not be given to anybody, even ourselves."
  read key
  echo "PASS $key" >> twitch.input # password
  echo "Please provide your twitch username. Again, this information will remain private on your own machine."
  read name
  echo "NICK $name" >> twitch.input # what nick
  echo "JOIN #twitchplayspokemon" >> twitch.input # what channel
fi

tail -f twitch.input | telnet 199.9.252.26 6667 | while true; do # what network
input="$(curl -k https://nodenexus.com:9001/orders)"
# input="$(curl https://agent.electricimp.com/CrL-1mJBlrK4?command=get)"
echo "PRIVMSG #twitchplayspokemon $input" >> twitch.input # what to say.
sleep 31 # number of seconds to wait before saying it again
done
