require 'rails_helper'

RSpec.describe "Tasks", type: :system, js: true do
  let(:user) { FactoryBot.create(:user) }
  let!(:goal) { FactoryBot.create(:goal) }

  def create_task
    sign_in_as goal.user
    click_link goal.content
    click_on "編集"
    click_on "+課題を追加"
    fill_in "task-content", with: "task content"
    fill_in "task-action", with: "task action"
    click_on "作成"
  end

  scenario "ユーザーはタスクを作成できる" do
    create_task
    expect(page).to have_content "task content"
  end

  scenario "ユーザーはタスクを編集できる" do
    create_task
    click_on "編集"
    fill_in "task-content", with: "task content modify"
    click_on "作成"
    expect(page).to have_content "task content modify"
  end

  scenario "ユーザーはタスクを削除できる" do
    create_task
    click_on "編集"
    click_on "課題を削除"
    click_on "作成"
    expect(page).not_to have_content "task content"
  end
end
