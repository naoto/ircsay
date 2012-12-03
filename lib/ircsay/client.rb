#-*- coding:utf-8
require 'zircon'

module Ircsay
  class Client

    def initialize
      @client = Zircon.new(
          :server   => "chat.freenode.net",
          :port     => "6667",
          :channel  => "#TwitterOkinawaMac",
          :username => "saybot"
      )
    end

    def start
      @client.on_privmsg do |msg|
        `say -v Kyoko "#{msg.body}"`
      end
      @client.on_message do |message|
        puts "*** `on_message` responds with all received message ***"
        puts message.from
        puts message.to
        puts message.type
        puts message.body
      end
      @client.run!
    end

  end
end
