require 'spec_helper'

describe '../public/index.html' do
  before(:each) do
    visit '../public/index.html'
  end
  
  it {expect(page).to have_css 'section#header'}
  it {expect(page).to have_css 'section#main'}
  it {expect(page).to have_css 'section#footer'}
  
  it 'should have project name in header' do
    within 'section#header' do
      expect(page).to have_css 'h1', text: 'Static1'
    end
  end
  it 'should have p tags in main' do 
    within 'section#main' do    
      expect(page).to have_css 'p', count: 3
    end
  end
  
  context 'should have content in the right p tag' do
    before(:each) do
      within 'section#main' do
        @paragraph = page.all('p')
      end
    end
    
    it { expect(@paragraph[0]).to have_text 'My content - Static1 Nitrous is awesome' }  
    it { expect(@paragraph[1]).to have_text 'Lorem ipsum' }
    
    it 'should contain a sign-up form' do
      expect(page).to have_css 'form#sign-up input.form-control#user-email'
    end
    
    it 'should contain submit button' do
      expect(page).to have_css 'button[type="submit"].btn.btn-default', text:'Submit'
    end

    it 'should hide text on page load' do
      expect(page).to_not have_text 'form submitted'
    end
   
    it 'should show text on button click' do
      click_button 'Submit'
      expect(page).to have_text 'form submitted', visible: true
    end
       
  end

  describe 'footer' do
    
    it 'should contain \'My footer\'' do
      within 'section#footer' do
        expect(page).to have_css 'address', text: '1600 Pennsylvania Ave.'
      end
    end

    it 'should contain contact info' do
      within 'section#footer' do
        expect(page).to have_css 'p', text: 'Contact Us'
        expect(page).to have_link 'info@random.com', href: 'mailto:info@random.com'
      end
    end

  end
end