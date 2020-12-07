require 'rails_helper.rb'

describe 'the signin process', type: :feature do
  before :each do
    @test_user = User.create(name: 'Alex', email: 'alex@gmail.com')
  end
  it 'Display Create Event Button when create a new user' do
    visit '/users/new'

    fill_in 'user_name', with: 'Alex'
    fill_in 'user_email', with: 'alex@gmail.com'

    click_button 'Create User'
    expect(page).to have_content 'User was successfully created.'
  end

  it 'Display New Event Button when user log in' do
    visit '/login'

    fill_in 'email', with: 'alex@gmail.com'

    click_button 'Login'
    expect(page).to have_content 'New Event'
  end

  it 'Users Index page Show the User' do
    visit '/login'

    fill_in 'email', with: 'alex@gmail.com'

    click_button 'Login'
    visit '/events'
    expect(page).to have_content 'Logged in as: Alex'
    visit '/my-events'
  end

  it 'Users Index page Show the Events' do
    visit '/login'

    fill_in 'email', with: 'alex@gmail.com'

    click_button 'Login'
    visit '/my-events'
    expect(page).to have_content 'Created Events'
    expect(page).to have_content 'Events Attended'
  end
end
