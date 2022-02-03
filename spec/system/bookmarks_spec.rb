require 'rails_helper'

RSpec.describe "Bookmarks", type: :system do
  let(:user) { FactoryBot.create(:user) }
  # let(:goal) { FactoryBot.create(:goal) }

  scenario "ブックマークした記事は一覧に表示される" do
    goal = FactoryBot.create(:goal)
    sign_in_as user
    click_link goal.content
    click_link "add-bookmark"
    check "label1"
    click_link "マイページ"
    click_link "ブックマーク"

    expect(page).to have_content goal.content
  end

  scenario "ブックマーク解除した記事は一覧に表示されない test" do
    goal = FactoryBot.create(:goal)
    sign_in_as user
    click_link goal.content
    click_link "add-bookmark"
    check "label1"
    click_link "マイページ"
    click_link "ブックマーク"
    expect(page).to have_content goal.content

    click_link goal.content
    click_link "remove-bookmark"
    check "label1"
    click_link "マイページ"
    click_link "ブックマーク"
    expect(page).to_not have_content goal.content
  end

  scenario "ブックマーク数がカウントされる" do
    goal = FactoryBot.create(:goal)
    sign_in_as user
    click_link goal.content
    click_link "add-bookmark"
    visit "/"
    expect(page).to have_content "ブックマーク数：1"
  end

end
