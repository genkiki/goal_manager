require 'rails_helper'

RSpec.describe "Comments", type: :system, js: true do
  let(:user) { FactoryBot.create(:user) }
  let(:comment) { FactoryBot.create(:comment) }
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

  # 編集ボタンをクリック後にコメント編集フォームが表示されない
  # scenario "コメントを編集できる" do
  #   goal = FactoryBot.create(:goal)
  #   comment = FactoryBot.create(:comment, goal: goal, user: goal.user)

  #   sign_in_as goal.user
  #   click_link goal.content

  #   expect(page).to have_content "コメント(1)"
  #   expect(page).to have_content comment.comment
  #   find("a", id:"edit-comment").click
  #   sleep 5
  #   fill_in "js-textarea-comment-#{comment.id}", with: "test comment modify"
  #   click_on "comment-update-button"
  #   expect(page).to have_content "test comment modify"
  #   expect(page).to have_content "コメント(1)"
  # end

  scenario "コメントを削除できる" do
    goal = FactoryBot.create(:goal)
    sign_in_as user
    click_link goal.content

    fill_in "comment_comment", with: "test comment"
    click_on "add-comment"
    expect(page).to have_content "コメント(1)"
    expect(page).to have_content "test comment"
    page.accept_confirm do
      click_link "remove-comment"
    end
    expect(page).to have_content "コメント(0)"
    expect(page).not_to have_content "test comment"
  end
end
