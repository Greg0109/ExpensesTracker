require 'rails_helper'

RSpec.describe 'Test different features', type: :system do
  before do
    driven_by(:rack_test)
  end

  it 'Logs in' do
    user = User.create(name: 'Greg', email: 'Greg@gmail.com', password: '123456')
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
    expect(current_path).to eq(root_path)
  end

  it 'Creates user' do
    visit new_user_registration_path
    fill_in 'user[name]', with: 'Greg'
    fill_in 'user[email]', with: 'test@test.me'
    fill_in 'user[password]', with: '123456'
    fill_in 'user[password_confirmation]', with: '123456'
    find('.btn-success').click
    expect(current_path).to eq(root_path)
  end

  it 'Creates type' do
    user = User.create(name: 'Greg', email: 'Greg@gmail.com', password: '123456')
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
    visit new_type_path
    fill_in 'type[name]', with: 'Test'
    click_link_or_button 'Submit'
    visit types_path
    expect(page).to have_text('Test')
  end

  it 'Creates expense with no type' do
    user = User.create(name: 'Greg', email: 'Greg@gmail.com', password: '123456')
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
    visit new_expense_path
    fill_in 'expense[name]', with: 'Test'
    fill_in 'expense[amount]', with: 20
    click_link_or_button 'Submit'
    visit '/expenses/show'
    expect(page).to have_text('Test')
  end

  it 'Creates expense with type' do
    user = User.create(name: 'Greg', email: 'Greg@gmail.com', password: '123456')
    visit new_user_session_path
    fill_in 'user[email]', with: user.email
    fill_in 'user[password]', with: user.password
    click_button 'Log in'
    visit new_type_path
    fill_in 'type[name]', with: 'Test'
    click_link_or_button 'Submit'
    visit new_expense_path
    fill_in 'expense[name]', with: 'Test'
    fill_in 'expense[amount]', with: 20
    find('#expense_type_id').find(:xpath, 'option[1]').select_option
    click_link_or_button 'Submit'
    visit expenses_path
    expect(page).to have_text('Test')
  end
end
