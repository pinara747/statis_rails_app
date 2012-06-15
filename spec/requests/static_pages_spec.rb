require 'spec_helper'

describe "StaticPages" do    

  subject { page }    
  
#Home Page  
  describe "Home page" do  
    before { visit root_path } 
      it { should have_selector('h1', text: "Pinar\'s Sample Rails App")} 
      #it { should have_selector('title', text: full_title(''))}
      it { should_not have_selector 'title', text: '| Home' }   
      describe "for signed-in users" do
            let(:user) { FactoryGirl.create(:user) }
            before do
              FactoryGirl.create(:micropost, user: user, content: "Lorem")
              FactoryGirl.create(:micropost, user: user, content: "Ipsum")
              sign_in user
              visit root_path
            end

            it "should render the user's feed" do
              user.feed.each do |item|
                page.should have_selector("li##{item.id}", text: item.content)
              end
            end

            describe "follower/following counts" do
              let(:other_user) { FactoryGirl.create(:user) }
              before do
                other_user.follow!(user)
                visit root_path
              end

              it { should have_link("0 following", href: following_user_path(user)) }
              it { should have_link("1 followers", href: followers_user_path(user)) }
            end
         end
    end   
    
#Help Page 
  describe "Help page" do  
    before { visit help_path }  
      it { should have_selector('h1', text: 'Help')}
      #it { should have_selector('title', text: full_title('Help'))}    
    end     
    
#About Page  
  describe "About page" do  
    before { visit about_path }  
      it { should have_selector('h1', text: 'All About Me')}
      #it { should have_selector('title', text: full_title(''))}
    end  
    
#Contact Page 
 describe "Contact page" do 
   before { visit contact_path }  
      it {should have_selector('h1', text: 'Contact Me')}
      #it { should have_selector('title', text: full_title('Contact'))}
  end    
end