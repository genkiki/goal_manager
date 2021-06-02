require 'rails_helper'

RSpec.describe GoalState, type: :model do
  describe "必須入力チェック" do
    context "必須入力項目が入力されている場合" do
      it "すべての項目が入力されていると有効" do
        goal_state = FactoryBot.build(:goal_state)
        expect(goal_state).to be_valid
      end
    end

    context "必須入力項目が空欄の場合" do
      it "状態が空欄だと無効" do
        goal_state = FactoryBot.build(:goal_state, state: nil)
        expect(goal_state).not_to be_valid
      end
    end
  end
end
