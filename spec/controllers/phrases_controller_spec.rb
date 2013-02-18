# encoding: UTF-8
require 'spec_helper'

# This spec was generated by rspec-rails when you ran the scaffold generator.
# It demonstrates how one might use RSpec to specify the controller code that
# was generated by Rails when you ran the scaffold generator.
#
# It assumes that the implementation code is generated by the rails scaffold
# generator.  If you are using any extension libraries to generate different
# controller code, this generated spec may or may not pass.
#
# It only uses APIs available in rails and/or rspec-rails.  There are a number
# of tools you can use to make these specs even more expressive, but we're
# sticking to rails and rspec-rails APIs to keep things simple and stable.
#
# Compared to earlier versions of this generator, there is very limited use of
# stubs and message expectations in this spec.  Stubs are only used when there
# is no simpler way to get a handle on the object needed for the example.
# Message expectations are only used when there is no simpler way to specify
# that an instance is receiving a specific message.

describe PhrasesController do
=begin
  let(:user){ FactoryGirl.create(:user,
                  email: "test_example@railstutorial.org", 
                  #encrypted_password: "$2a$10$JymMnGN12NaUz7HGMH2IleQw8Z04YMrUqutuMfEXH3gV...",
                  name: "TESTTESTUSER", confirmation_token: nil, 
                  profile_image: nil, 
                  introduction: nil, 
                  gender: 2, 
                  birth: "1981-12-31", 
                  country: "New Zealand", 
                  postal_code: nil, 
                  mail_flg: false) }
  let(:category){ FactoryGirl.create(:category, category_name:"あいさつ" ) }

  # This should return the minimal set of attributes required to create a valid
  # Phrase. As you add validations to Phrase, be sure to
  # update the return value of this method accordingly.
  def valid_attributes
    { 
      japanese: "【テスト】駅はどっちですか？", 
      english: "[TEST]Where is the station?", 
      user_id: user.id, 
      category_id: category.id, 
      source: "", 
      story: "道ばたで聞かれました。" 
      #launch_flg: true 
    }
  end

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PhrasesController. Be sure to keep this updated too.
  def valid_session
    {}
  end

  describe "GET index" do
    it "assigns all phrases as @phrases" do
      phrase = Phrase.create! valid_attributes
      get :index, {}, valid_session
      assigns(:phrases).should eq([phrase])
    end
  end

  describe "GET show" do
    it "assigns the requested phrase as @phrase" do
      phrase = Phrase.create! valid_attributes
      get :show, {:id => phrase.to_param}, valid_session
      assigns(:phrase).should eq(phrase)
    end
  end

  describe "GET new" do
    it "assigns a new phrase as @phrase" do
      get :new, {}, valid_session
      assigns(:phrase).should be_a_new(Phrase)
    end
  end

  describe "GET edit" do
    it "assigns the requested phrase as @phrase" do
      phrase = Phrase.create! valid_attributes
      get :edit, {:id => phrase.to_param}, valid_session
      assigns(:phrase).should eq(phrase)
    end
  end

  describe "POST create" do
    describe "with valid params" do
      it "creates a new Phrase" do
        expect {
          post :create, {:phrase => valid_attributes}, valid_session
        }.to change(Phrase, :count).by(1)
      end

      it "assigns a newly created phrase as @phrase" do
        post :create, {:phrase => valid_attributes}, valid_session
        assigns(:phrase).should be_a(Phrase)
        assigns(:phrase).should be_persisted
      end

      it "redirects to the created phrase" do
        post :create, {:phrase => valid_attributes}, valid_session
        response.should redirect_to(Phrase.last)
      end
    end

    describe "with invalid params" do
      it "assigns a newly created but unsaved phrase as @phrase" do
        # Trigger the behavior that occurs when invalid params are submitted
        Phrase.any_instance.stub(:save).and_return(false)
        post :create, {:phrase => {  }}, valid_session
        assigns(:phrase).should be_a_new(Phrase)
      end

      it "re-renders the 'new' template" do
        # Trigger the behavior that occurs when invalid params are submitted
        Phrase.any_instance.stub(:save).and_return(false)
        post :create, {:phrase => {  }}, valid_session
        response.should render_template("new")
      end
    end
  end

  describe "PUT update" do
    describe "with valid params" do
      it "updates the requested phrase" do
        phrase = Phrase.create! valid_attributes
        # Assuming there are no other phrases in the database, this
        # specifies that the Phrase created on the previous line
        # receives the :update_attributes message with whatever params are
        # submitted in the request.
        Phrase.any_instance.should_receive(:update_attributes).with({ "these" => "params" })
        put :update, {:id => phrase.to_param, :phrase => { "these" => "params" }}, valid_session
      end

      it "assigns the requested phrase as @phrase" do
        phrase = Phrase.create! valid_attributes
        put :update, {:id => phrase.to_param, :phrase => valid_attributes}, valid_session
        assigns(:phrase).should eq(phrase)
      end

      it "redirects to the phrase" do
        phrase = Phrase.create! valid_attributes
        put :update, {:id => phrase.to_param, :phrase => valid_attributes}, valid_session
        response.should redirect_to(phrase)
      end
    end

    describe "with invalid params" do
      it "assigns the phrase as @phrase" do
        phrase = Phrase.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Phrase.any_instance.stub(:save).and_return(false)
        put :update, {:id => phrase.to_param, :phrase => {  }}, valid_session
        assigns(:phrase).should eq(phrase)
      end

      it "re-renders the 'edit' template" do
        phrase = Phrase.create! valid_attributes
        # Trigger the behavior that occurs when invalid params are submitted
        Phrase.any_instance.stub(:save).and_return(false)
        put :update, {:id => phrase.to_param, :phrase => {  }}, valid_session
        response.should render_template("edit")
      end
    end
  end

  describe "DELETE destroy" do
    it "destroys the requested phrase" do
      phrase = Phrase.create! valid_attributes
      expect {
        delete :destroy, {:id => phrase.to_param}, valid_session
      }.to change(Phrase, :count).by(-1)
    end

    it "redirects to the phrases list" do
      phrase = Phrase.create! valid_attributes
      delete :destroy, {:id => phrase.to_param}, valid_session
      response.should redirect_to(phrases_url)
    end
  end
=end
end
