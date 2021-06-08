require 'rails_helper'

RSpec.describe Task, type: :model do
  describe "必須入力チェック" do
    context "必須入力項目が入力されている場合" do
      it "すべての項目が入力されていると有効" do
        task = FactoryBot.build(:task)
        expect(task).to be_valid
      end

      it "原因と改善は空欄でも有効" do
        task = FactoryBot.build(:task, term: nil)
        expect(task).to be_valid
      end
    end

    context "必須入力項目が空欄の場合" do
      it "ゴールIDが空欄だと無効" do
        task = FactoryBot.build(:task, goal_id: nil)
        expect(task).not_to be_valid
      end

      it "ユーザーIDが空欄だと無効" do
        task = FactoryBot.build(:task, user_id: nil)
        expect(task).not_to be_valid
      end

      it "内容が空欄だと無効" do
        task = FactoryBot.build(:task, content: nil)
        expect(task).not_to be_valid
      end

      it "取り組みが空欄だと無効" do
        task = FactoryBot.build(:task, action: nil)
        expect(task).not_to be_valid
      end

      it "状態が空欄だと無効" do
        task = FactoryBot.build(:task, status: nil)
        expect(task).not_to be_valid
      end
    end
  end
end
