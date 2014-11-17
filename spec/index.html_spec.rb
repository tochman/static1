require 'spec_helper'

describe '../public/index.html' do
  before(:each) do
    Capybara.current_driver = :webkit
    visit '../public/index.html'
  end

  
  
  after(:each) do
    Capybara.use_default_driver
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
    
    it 'should contain a button' do
      expect(page).to have_css 'button.btn.btn-default', text:'Click me'
    end

    it 'should hide text on page load', js: true do
      wait_for_ajax
      expect(page).to have_selector '#toggle', visible: false
      expect(page).to_not have_text 'button pressed'
    end
   
    it 'should show text on button click', js: true do
      click_button 'Click me'
      wait_for_ajax
      expect(page).to have_selector '#toggle', visible: true
      expect(page).to have_text 'button pressed'
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
  
  def wait_for_ajax
    Timeout.timeout(Capybara.default_wait_time) do
      loop until finished_all_ajax_requests?
    end
  end

  def finished_all_ajax_requests?
    page.evaluate_script('jQuery.active').zero?
  end
end