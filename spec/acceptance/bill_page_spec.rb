require_relative '../acceptance_helper'

feature 'User visiting the bill page' do
  scenario 'See the bill summary' do
    visit '/my/bill'
    expect(page).to have_content('Your bill summary')
  end
end
