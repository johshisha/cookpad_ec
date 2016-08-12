require 'rails_helper'

RSpec.feature "See shop items", type: :feature do
  scenario 'A user can see various items' do
    create(:item, name: '包丁')
    create(:item, name: 'フライパン')

    visit items_path

    expect(page).to have_text('包丁')
    expect(page).to have_text('フライパン')
  end

  scenario 'Recommend' do
    create(:item, name: '包丁', recommended: true)
    create(:item, name: 'フライパン')

    visit recommended_items_path

    expect(page).to have_text('包丁')
    expect(page).not_to have_text('フライパン')
  end

  scenario 'A user can see categorized items from portal', type: :feature do
    kitchenware = create(:category, name: '調理器具')
    kitchenware.items.create!(name: '包丁', recommended: true)
    kitchenware.items.create!(name: 'フライパン')
    tableware = create(:category, name: '食器')
    tableware.items.create!(name: '大皿')
    visit root_path
    click_on '調理器具'
    save_and_open_page
    expect(page).to have_text('包丁')
    expect(page).to have_text('フライパン')
    expect(page).not_to have_text('大皿')
  end

end
