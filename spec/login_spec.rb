require 'spec_helper'
require 'capybara'
require 'capybara/dsl'
require 'capybara/rspec'
 
Capybara.run_server = false
Capybara.current_driver = :selenium
Capybara.app_host = 'http://localhost:9001'


describe 'bar', :type => :feature do
  it 'foo' do
    visit('/#/login')
    page.execute_script("localStorage.setItem('firstLaunch', true)")
    fill_in('email', with: 'watsy0007@gmail.com')
    fill_in('password', with: '123456')
    find(".login-btn").click
    expect(page).to have_content '恭喜你已认证通过'
  end
end
