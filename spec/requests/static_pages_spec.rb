require 'spec_helper'

describe "StaticPages" do    
  
  let(:base_title) { "Static Pages App" }      
  
#Home Page  
  describe "Home page" do
    it "should have the content 'Pinar's Sample Rails App'" do
      visit root_path
      page.should have_selector('h1', :text => 'Pinar\'s Sample Rails App')
    end       
    
    it "should have the base title" do
        visit root_path  
        page.should have_selector('title', :text => "Static Pages App")
      end

      it "should not have a custom page title" do
        visit root_path  
        page.should_not have_selector('title', :text => '| Home')
      end
    end   
    
#Help Page 
  describe "Help page" do
    it "should have the content 'Help'" do
      visit help_path
      page.should have_selector('h1', :text => 'Help')
    end   
    
    it "should have the base title" do
        visit help_path    
        page.should have_selector('title', :text => "Static Pages App")
      end

      it "should not have a custom page title" do
        visit help_path
        page.should_not have_selector('title', :text => '| Help')
      end
    end     
    
#About Page  
  describe "About page" do
    it "should have the content 'All About Me'" do
      visit about_path
      page.should have_selector('h1', :text => 'All About Me')
    end   
    
    it "should have the base title" do
        visit about_path
        page.should have_selector('title', :text => "Static Pages App")
      end

      it "should not have a custom page title" do
        visit about_path
        page.should_not have_selector('title', :text => '| About')
      end
    end  
    
#Contact Page 
 describe "Contact page" do
   it "should have the content 'Contact Us'" do
     visit contact_path
     page.should have_selector('h1', :text => 'Contact Us')
   end   
   
   it "should have the base title" do
       visit contact_path
       page.should have_selector('title', :text => "Static Pages App")
     end

     it "should not have a custom page title" do
       visit contact_path
       page.should_not have_selector('title', :text => '| Contact')
     end
   end
end