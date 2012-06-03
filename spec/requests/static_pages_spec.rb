require 'spec_helper'

describe "StaticPages" do    
  
  let(:base_title) { "Pinar On Rails" }  
  subject { page }    
  
#Home Page  
  describe "Home page" do  
    before { visit root_path } 
    it { should have_selector('title', text: "Pinar On Rails")} 
    it { should have_selector('title', text: full_title(''))}
    it {should_not have_selector('title', text: '| Home')}
    end   
    
#Help Page 
  describe "Help page" do  
   before { visit help_path }  
    it {should have_selector('h1', :text => 'Help')}
    it { should have_selector('title', text: full_title('Help'))}    
    end     
    
#About Page  
  describe "About page" do  
  before { visit about_path }  
  it {should have_selector('h1', :text => 'About')}
  it { should have_selector('title', text: full_title('About Us'))}
    end  
    
#Contact Page 
 describe "Contact page" do 
 before { visit contact_path }  
 it {should have_selector('h1', :text => 'Contact')}
 it { should have_selector('title', text: full_title('Contact Us'))}
  end    
end