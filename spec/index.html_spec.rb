require 'spec_helper'

describe '../public/index.html' do
  before(:each) do
    visit '../public/index.html'
  end
  
  it {expect(page).to have_css 'section#header'}
  it {expect(page).to have_css 'section#main'}
  it {expect(page).to have_css 'section#footer'}
  
end