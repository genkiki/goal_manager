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
end
