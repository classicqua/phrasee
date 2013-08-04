# encoding: UTF-8
require 'twitter'

namespace :twitter do
    desc "ツイートする"
    task :tweet => :environment do
        ## アプリ登録時に取得したCONSUMER_KEY/CONSUMER_SECRET
        CONSUMER_KEY = ENV["CONSUMER_KEY"]
        CONSUMER_SECRET = ENV["CONSUMER_SECRET"]
        ## irbで取得したAccess Token/Access Secret
        OAUTH_TOKEN = ENV["OAUTH_TOKEN"]
        OAUTH_TOKEN_SECRET = ENV["OAUTH_TOKEN_SECRET"]

        Twitter.configure do |config|
          config.consumer_key       = CONSUMER_KEY
          config.consumer_secret    = CONSUMER_SECRET
          config.oauth_token        = OAUTH_TOKEN
          config.oauth_token_secret = OAUTH_TOKEN_SECRET
        end

        # ランダムに1フレーズ取得
        ph_num = Phrase.all.count
        tw_phrase_id = rand(ph_num)+1
        tw_phrase = Phrase.find(tw_phrase_id)
        tweet = "「" + tw_phrase.japanese + "」を英語で言うと？\n→『" + tw_phrase.english + "』\n" + "http://www.phrasee.jp/phrases/" + tw_phrase_id.to_s;

        # ツイート！
        update(tweet)
    end

    def update(tweet)
        begin
            tweet = (tweet.length > 140) ? tweet[0..139].to_s : tweet
            Twitter.update(tweet.chomp)
        rescue => e
            Rails.logger.error "<<twitter.rake::tweet.update ERROR : #{e.message}>>"
        end
    end
end