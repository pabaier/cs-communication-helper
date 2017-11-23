require 'rails_helper'

describe UsersController do
    describe "#create" do
        it 'should create a new user object and add it to the db' do
            Group.create!(:title => 'Computer Science', :description => 'test')
            
			expect{
			    post :create, { :user => { :first_name => 'first', :last_name => 'last', :email => 'firstlast@citadel.edu',
                :password => 'password1234', :status => 'Student', :graduation_date => '3-May-2018' } }
			}.to change(User, :count).by(1)
		end
    end
    
    describe "#destroy" do
        it 'should delete a student user object from the db' do
            User.create(:id => 1, :status => 'Student')
            expect{ 
                delete :destroy, :id => 1
            }.to change(User, :count).by(-1)
        end
        
        it 'should not delete an admin user object from the db' do
            User.create(:id => 2, :status => 'Admin')
            expect{
                delete :destroy, :id => 2
            }.to change(User, :count).by(0)
        end
    end
    
    describe "#update" do
        it 'should update a user object from the db' do
            @user = User.create(:id => 1, :first_name => 'first', :last_name => 'last', :email => 'firstlast@citadel.edu',
                :password => 'password1234', :status => 'Student', :graduation_date => '3-May-2018')
            put :update, :id => @user, :user => {:first_name => 'newfirst'}
            @user.reload
            expect(@user.first_name).to eq("newfirst")
        end
    end
    
    describe "#show" do
        it 'should show the specified user object from the db' do
            @user = User.create(:id => 1, :first_name => 'first', :last_name => 'last', :email => 'firstlast@citadel.edu',
                :password => 'password1234', :status => 'Student', :graduation_date => '3-May-2018')
            get :show, :id => @user
        end
    end
    
    describe "#index" do
        it 'should show all users' do
            get :index
            expect(response).to be_success
        end
    end
    
    describe "#new" do
        it 'should show new template' do
            get :new
            expect(response).to render_template("users/new")
        end
    end
end