require 'rails_helper'

RSpec.feature "Relationships", type: :feature do

  let!(:user) { FactoryBot.create(:user, name: "user") }
  let!(:other_user) { FactoryBot.create(:user, name:"other_user") }
  let!(:goal) { FactoryBot.create(:goal) }

  scenario "ユーザー情報画面でフォローしたユーザーが一覧に表示される" do
    sign_in_as user
    click_link goal.user.name
    click_on "フォローする"

    check "label1"
    click_link "マイページ"
    click_link "フォロー"

    expect(page).to have_content goal.user.name
  end

  let!(:relationshipAtoB) { FactoryBot.create(:relationship, follower: other_user, followed: user) }

  scenario "フォロワー一覧画面でフォローしたユーザーが一覧に表示される" do

    sign_in_as user
    check "label1"
    click_link "マイページ"
    click_link "フォロワー"
    click_on "フォローする"

    check "label1"
    click_link "マイページ"
    click_link "フォロー"

    expect(page).to have_current_path following_user_path(user.id)
    expect(page).to have_content other_user.name
  end

  scenario "ユーザー情報画面でフォロー解除したユーザーは一覧に表示されない" do

    sign_in_as user
    FactoryBot.create(:relationship, follower: user, followed: goal.user)
    click_link goal.user.name
    click_on "フォロー解除"

    check "label1"
    click_link "マイページ"
    click_link "フォロー"

    expect(page).to_not have_content goal.user.name
  end

  scenario "フォロワー一覧画面でフォロー解除したユーザーは一覧に表示されない" do
    FactoryBot.create(:relationship, follower: user, followed: other_user)
    sign_in_as user
    check "label1"
    click_link "マイページ"
    click_link "フォロワー"
    click_on "フォロー解除"

    check "label1"
    click_link "マイページ"
    click_link "フォロー"

    expect(page).to_not have_content other_user.name
  end

  scenario "フォロー一覧画面でフォロー解除したユーザーは一覧に表示されない" do
    FactoryBot.create(:relationship, follower: user, followed: other_user)
    sign_in_as user
    check "label1"
    click_link "マイページ"
    click_link "フォロー"
    click_on "フォロー解除"

    check "label1"
    click_link "マイページ"
    click_link "フォロー"
    expect(page).to_not have_content other_user.name
  end
end
