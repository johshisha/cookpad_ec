require 'rails_helper'

RSpec.feature "See shop items", type: :feature do
  scenario 'A user can see various items' do
    create(:item, name: '包丁')
    create(:item, name: 'フライパン')

    visit '/items'

    expect(page).to have_text('包丁')
    expect(page).to have_text('フライパン')
  end
end
