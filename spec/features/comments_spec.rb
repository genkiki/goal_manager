require 'rails_helper'

RSpec.feature "Comments", type: :feature do
  let(:user) { FactoryBot.create(:user) }
  # let(:goal) { FactoryBot.create(:goal) }

  scenario "コメントを投稿できる" do
    goal = FactoryBot.create(:goal)
    sign_in_as user
    click_link goal.content

    fill_in "comment_comment", with: "test comment"
    click_on "add-comment"

    expect(page).to have_content "コメント(1)"
    expect(page).to have_content "test comment"
  end

  # scenario "コメントを編集できる" do
  #   goal = FactoryBot.create(:goal)
  #   sign_in_as user
  #   click_link goal.content

  #   fill_in "comment_comment", with: "test comment"
  #   click_on "add-comment"

  #   expect(page).to have_content "コメント(1)"
  #   expect(page).to have_content "test comment"

  #   click_on "edit-comment"
  #   fill_in "comment_comment", with: "test comment modify"
  #   expect(page).to have_content "test comment modify"
  # end

  scenario "コメントを削除できる" do
    goal = FactoryBot.create(:goal)
    sign_in_as user
    click_link goal.content

    fill_in "comment_comment", with: "test comment"
    click_on "add-comment"
    expect(page).to have_content "コメント(1)"
    expect(page).to have_content "test comment"
    click_link "remove-comment"
    expect(page).to have_content "コメント(0)"
    expect(page).to_not have_content "test comment"
  end
end
