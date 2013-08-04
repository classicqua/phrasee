#coding: utf-8

# パス通し
env :PATH, ENV['PATH']   # 開発時はdevelompent環境で実行

# Use this file to easily define all of your cron jobs.
#
# It's helpful, but not entirely necessary to understand cron before proceeding.
# http://en.wikipedia.org/wiki/Cron

# Example:
#
# set :output, "/path/to/my/cron_log.log"
#
# every 2.hours do
#   command "/usr/bin/some_great_command"
#   runner "MyModel.some_method"
#   rake "some:great:rake:task"
# end
#
# every 4.days do
#   runner "AnotherModel.prune_old_records"
# end

# Learn more: http://github.com/javan/whenever

### set env ###

set :environment, @environment
#set :environment, :development # development

log_path = Whenever.path + '/log/cron.log'
error_log_path = Whenever.path + '/log/error.log'
set :output, {:standard => log_path, :error => error_log_path }

### task ###

# tweet bot
every 20.minutes do
  rake "twitter:tweet"
end

# MailChimpで毎週配信
=begin
every 2.minutes do
  #mailmag "Newsletter", :to => "bossp0424-test@yahoo.co.jp"
  runner "Tasks::NewsLetter.execute"
end
=end