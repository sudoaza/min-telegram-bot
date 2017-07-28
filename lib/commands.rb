# Define your bot's methods here

COMMAND_WHITELIST = %w(start help).map(&:to_sym).freeze

def start(args)
  message, *args = args
  message = message
  if message.chat.type == 'group'
    to = message.chat.title
  else
    to = message.from.first_name
  end
  $bot.api.send_message(
      chat_id: message.chat.id,
      text: %Q(Hello, #{to}.
Type /help if you have any doubts.))
end

def help(args)
  message, topic = args
  $bot.api.send_message(
      chat_id: message.chat.id,
      text: %q( Available commands are:

/sub :topic
Subscribe to a topic.

/list
List subscriptions

/unsub :topic
Unsubscribe from topic.

/help
This help. Duh!

/help topics
List available topics))
end

