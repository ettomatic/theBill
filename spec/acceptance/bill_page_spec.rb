require_relative '../acceptance_helper'

feature 'A user visiting the bill page' do
  scenario 'See the bill summary section' do
    visit '/my/bill'
    expect(page).to have_content('Bill summary')
  end

  scenario 'See the bill total in the summary section' do
    visit '/my/bill'
    within('.summary') do
      expect(page).to have_content('£ 136.03')
    end
  end

  scenario 'See the bill due date in the summary section' do
    visit '/my/bill'
    within('.summary') do
      expect(page).to have_content('Total amount due for the period')
    end
  end

  scenario 'See the bill details section' do
    visit '/my/bill'
    expect(page).to have_content('Bill details')
  end

  scenario 'See the subscriptions details' do
    visit '/my/bill'
    within('.details .subscriptions') do
      expect(page).to have_content('My subscriptions')
      expect(page).to have_content('£ 71.40')
    end
  end

  scenario 'See the Store details' do
    visit '/my/bill'
    within('.details .store') do
      expect(page).to have_content('Sky store')
      expect(page).to have_content('£ 24.97')
    end
  end

  scenario 'See the call charges details' do
    visit '/my/bill'
    within('.details .calls') do
      expect(page).to have_content('Call charges')
      expect(page).to have_content('£ 59.64')
    end
  end

  feature 'A user visiting the billing page with issues' do
    scenario 'See an error message' do
      stub_request(:get, %r[\/bill.json]).to_return(:status => [500, 'Internal Server Error'])
      visit '/my/bill'
      expect(page).to have_content("We're experiencing technical difficulties at the moment, please try later")
    end
  end
end
