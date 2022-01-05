require 'rails_helper'

RSpec.feature "Goals", type: :feature do
  scenario "ユーザーが新しい目標を作成する" do
    user = FactoryBot.create(:user)
    visit "/"
    click_link "ログイン"
    fill_in "login-email", with: user.email
    fill_in "login-password", with: user.password
    click_button "login-submit"

    expect {
      click_link "投稿する"
      fill_in "goal-new-goal", with: "test goal"
      select "予定", from: "goal_result"
      fill_in "task-content", with: "test task"
      fill_in "task-action", with: "test action"
      select "予定", from: "goal_tasks_attributes_0_status"
      click_button "作成"
      expect(page).to have_current_path "/"
      expect(page).to have_content "test goal"
    }.to change(user.goals, :count).by(1)
  end

  scenario "ユーザーが既存の目標を編集する" do
    goal = FactoryBot.create(:goal)
    visit "/"
    click_link "ログイン"
    fill_in "login-email", with: goal.user.email
    fill_in "login-password", with: goal.user.password
    click_button "login-submit"

    click_link "test"
    click_link "編集"
    fill_in "goal-edit-goal", with: "test goal modify"
    click_button "作成"
    expect(page).to have_content "test goal modify"
  end

  scenario "ユーザーが既存の目標を削除する" do
    goal = FactoryBot.create(:goal)
    visit "/"
    click_link "ログイン"
    fill_in "login-email", with: goal.user.email
    fill_in "login-password", with: goal.user.password
    click_button "login-submit"

    click_link "test"
    click_link "削除"
    expect {
      expect(page).to_not have_content "test"
    }.to change(goal.user.goals, :count).by(0)
  end
end
