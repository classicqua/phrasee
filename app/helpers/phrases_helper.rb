#coding: utf-8
require 'uri'
# 書式
#URI.extract("text here http://foo.example.org/bla and here mailto:test@example.com and here also.") 
# => ["http://foo.example.com/bla", "mailto:test@example.com"]

module PhrasesHelper

  # 出典ソースの文字列にリンクをはる
  def show_linkable_source(source)
    source = source.include?("href") ? source : url2link_of_string(source) # URLのみ貼り付けだったらオートリンクを施す
    return sanitize source, tags: %w(a), attributes: %w(id class href rel)
  end

  private
    # 文字列中のURLオートリンク
    def url2link_of_string(html_string,options={})
      target=options[:target] || '_blank'
      URI.extract(html_string).uniq.each{|url|
        html_string.gsub!(url,"<a href='#{url}' rel='nofollow' target='#{target}' >#{url}</a>")
      }
      html_string
    end

    # aタグ中のhrefの中身(URL)抽出
    def get_url_in_a_tag(a_tag)
      URI.extract(a_tag).uniq.first.to_s 
    end
end