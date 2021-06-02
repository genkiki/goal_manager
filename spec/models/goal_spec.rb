require 'rails_helper'

RSpec.describe Goal, type: :model do
  describe "必須入力チェック" do
    context "必須入力項目が入力されている場合" do
      it "すべての項目が入力されていると有効" do
        goal = FactoryBot.build(:goal)
        expect(goal).to be_valid
      end

      it "原因と改善は空欄でも有効" do
        goal = FactoryBot.build(:goal, cause: nil, improvement: nil)
        expect(goal).to be_valid
      end
    end

    context "必須入力項目が空欄の場合" do
      it "ユーザーIDが空欄だと無効" do
        goal = FactoryBot.build(:goal, user_id: nil)
        expect(goal).not_to be_valid
      end

      it "内容が空欄だと無効" do
        goal = FactoryBot.build(:goal, content: nil)
        expect(goal).not_to be_valid
      end

      it "結果が空欄だと無効" do
        goal = FactoryBot.build(:goal, result: nil)
        expect(goal).not_to be_valid
      end
    end
  end
end
