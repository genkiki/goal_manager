require 'rails_helper'

RSpec.describe "Notifications", type: :system do

  let!(:user) { FactoryBot.create(:user, name: "user") }
  let!(:other_user) { FactoryBot.create(:user, name:"other_user") }
  let!(:goal) { FactoryBot.create(:goal) }

  scenario "フォローされた時に通知が一覧に表示される" do
    sign_in_as user
    click_link goal.user.name
    click_on "フォローする"

    check "label1"
    click_link "ログアウト"

    sign_in_as goal.user
    check "label1"
    click_link "通知"

    expect(page).to have_content "#{user.name}さんが あなたをフォローしました"
  end

  scenario "コメントされた時に通知が一覧に表示される" do
    sign_in_as user
    click_link goal.content

    fill_in "comment_comment", with: "test comment"
    click_on "add-comment"
    check "label1"
    click_link "ログアウト"

    sign_in_as goal.user
    check "label1"
    click_link "通知"
    expect(page).to have_content "#{user.name}さんが あなたの記事にコメントしました"
  end

  scenario "ブックマークされた時に通知が一覧に表示される" do
    sign_in_as user
    click_link goal.content
    click_link "add-bookmark"

    check "label1"
    click_link "ログアウト"

    sign_in_as goal.user
    check "label1"
    click_link "通知"

    expect(page).to have_content "#{user.name}さんが あなたの記事をブックマークしました"
  end
end
