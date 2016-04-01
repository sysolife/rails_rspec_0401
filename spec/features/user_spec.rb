require 'rails_helper'
require 'spec_helper'
require 'faker'

describe 'UsersController' do

  it 'UsersList' do



    visit '/users'


    expect(page).to have_content('Users')

  end


  it 'UsersCRUD' do



    visit '/users/new'
    new_user = FactoryGirl.build(:user)
    within('#new_user') do
      fill_in 'user_name', with: new_user.name
      fill_in 'user_mobile', with:new_user.mobile
    end
    click_button 'Create User'
    expect(page).to have_content('successfully created')


    click_link 'Back'
    expect(page).to have_content(new_user.name)
    click_link 'Edit'

    within('#edit_user_1') do
      fill_in 'user_name', with: Faker::Name.name
      fill_in 'user_mobile', with: Faker::PhoneNumber.cell_phone
    end
    click_button 'Update User'

    expect(page).to have_content('successfully updated')

    click_link 'Delete'

    page.driver.browser.switch_to.alert.accept

    expect(page).to have_content('successfully destroyed')
  end



end