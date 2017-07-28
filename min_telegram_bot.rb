require 'telegram/bot'
require './lib/commands.rb'
require './db.rb'

# /command[@botname] [param1 param2]
def route(message)
  puts message.inspect
  return nil unless message.text
  command = extract_command(message.text)
  return nil unless COMMAND_WHITELIST.include? command

  Chat.first_or_create(chat_id: message.chat.id) || return

  params = [message] + extract_params(message.text)
  send(command, params)
end

def extract_command(msg_txt)
  msg_txt.split(' ').first.sub(/^\//,'').sub(/@.*/,'').to_sym
end

def extract_params(msg_txt)
  _, params = msg_txt.split(' ', 2)
  return [] if params.nil?
  params.strip.split(' ')
end

Telegram::Bot::Client.run(ENV['TELEGRAM_TOKEN']) do |bot|
  $bot = bot
  bot.listen do |message|
    route(message)
  end
end
