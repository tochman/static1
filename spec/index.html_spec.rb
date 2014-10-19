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
       
  end
end