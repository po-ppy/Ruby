require 'qqbot'

class MyBot

  def initialize
    @qqbot = QQBot.new
    sleep 2

    @friend_name_map = {}
    @qqbot.get_friend_list.each { |friend| @friend_name_map[friend.id] = friend.markname || friend.nickname }
    sleep 2

    @group_name_map = {}
    @group_code_map = {}
    @qqbot.get_group_list.each do |group|
      @group_name_map[group.id] = group.markname || group.name
      @group_code_map[group.id] = group.code
    end
    sleep 2

    @discuss_name_map = {}
    @qqbot.get_discuss_list.each { |discuss| @discuss_name_map[discuss.id] = discuss.name }
    sleep 2

    @group_member_name_map = {}
    @discuss_member_name_map = {}
    @qq_map = {}
  end

  def init_group_member_name_map(group_id)
    unless @group_member_name_map[group_id]
      @group_member_name_map[group_id] = {}
      group_code = @group_code_map[group_id]
      @qqbot.get_group_info(group_code).members.each { |member| @group_member_name_map[group_id][member.id] = @friend_name_map[member.id] || member.markname || member.nickname }
    end
  end

  def init_discuss_member_name_map(discuss_id)
    unless @discuss_member_name_map[discuss_id]
      @discuss_member_name_map[discuss_id] = {}
      @qqbot.get_discuss_info(discuss.id).members.each { |member| @discuss_member_name_map[discuss_id][member.id] = @friend_name_map[member.id] || member.nickname }
    end
  end

  def init_qq_map(id)
    unless @qq_map[id]
      @qq_map[id] = @qqbot.get_qq_by_id(id)
    end
  end

  def run
    @qqbot.poll do |message|
      init_qq_map(message.send_id)
      if message.type == 0
        puts "#{@friend_name_map[message.from_id]}(#{@qq_map[message.from_id]}) 对你说：#{message.content}"
      elsif message.type == 1
        init_group_member_name_map message.from_id
        puts "群 #{@group_name_map[message.from_id]} 的 #{@group_member_name_map[message.from_id][message.send_id]}(#{@qq_map[message.send_id]}) 说：#{message.content}"
      elsif message.type == 2
        init_discuss_member_name_map message.from_id
        puts "讨论组 #{@discuss_name_map[message.from_id]} 的 #{@discuss_member_name_map[message.from_id][message.send_id]}(#{@qq_map[message.send_id]}) 说：#{message.content}"
      end
    end
  end
end

mybot = MyBot.new

mybot.run
