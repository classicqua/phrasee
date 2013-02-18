#coding: utf-8
require 'spec_helper'

describe CommentsController do
  pending "CommentsController"
=begin
  subject{ page }

  let(:user){ FactoryGirl.create(:user) }
  before{ sign_in user }

  let(:category){ FactoryGirl.create(:category, category_name:"あいさつ" ) }
  let(:phrase) do
    FactoryGirl.create(:phrase, user: user, 
                                japanese: "RSpec用のコメント", english:"comment for RSpec", 
                                story:"てすとようエピソード", category: category  )
  end
  let(:comment){ FactoryGirl.create(:comment, content: "Lorem ipsum", phrase_id: phrase.id, user_id: user.id ) }


  describe "POST comments to 'create'" do
    before{ visit phrase_path(phrase) }
    let(:submit){ "コメントする" } # 送信ボタン
    before do
      FactoryGirl.create(:comment, user: user, content: "Lorem ipsum", phrase: phrase)
      #FactoryGirl.create(:comment, user: user, content: "Dolor sit amet")
    end


    # 正常パターン
    describe "with valid information" do
      before do
        fill_in "comment_content", with:"Lorem ipsum"
      end

      # 投稿されたことを確認
      it "should create a micropost" do
        expect { click_button submit }.to change(Comment, :count).by(1)
      end
    end
  end
=end
end
