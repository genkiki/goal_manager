require 'rails_helper'

RSpec.feature "Users", type: :feature do

  let(:user) { FactoryBot.create(:user) }

  scenario "未登録のユーザーはログインできない" do
    unregisted_user = User.new(name: "noregister",
                              email: "noregister",
                              password: "noregister")
    sign_in_as unregisted_user

    expect(page).to_not have_content "投稿する"
  end

  scenario "登録済みのユーザーはログインできる" do
    sign_in_as user
    expect(page).to have_content "投稿する"
  end

  scenario "ログインユーザーはマイページに遷移できる" do
    sign_in_as user
    check "label1"
    click_link "マイページ"
    expect(page).to have_current_path "/users/#{user.id}"
  end

  scenario "ログインユーザーはマイページを編集できる" do
    sign_in_as user
    check "label1"
    click_link "マイページ"
    click_on "編集"
    expect(page).to have_current_path "/users/#{user.id}/edit"
    fill_in "user_name", with: "tester modified"
    fill_in "user_introduce", with: "test modified"
    click_on "変更"
    expect(page).to have_current_path "/users/#{user.id}"
    expect(page).to have_content "tester modified"
    expect(page).to have_content "test modified"
  end

  scenario "ログインユーザーは自身の投稿記事一覧を参照できる" do
    sign_in_as user
    goal1 = FactoryBot.create(:goal, content: "goal1", user: user)
    goal2 = FactoryBot.create(:goal, content: "goal2", user: user)
    check "label1"
    click_link "マイページ"
    click_link "投稿記事"
    expect(page).to have_current_path posts_user_path(user.id)
    expect(page).to have_content "#{goal1.content}"
    expect(page).to have_content "#{goal2.content}"
  end
end
