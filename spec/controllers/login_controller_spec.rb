require 'rails_helper'

describe LoginController do
     describe "#index" do
         it 'should show login page' do
            get :index
            expect(response).to render_template("login/index")
         end
     end
end