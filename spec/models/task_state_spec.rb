require 'rails_helper'

RSpec.describe TaskState, type: :model do
  describe "必須入力チェック" do
    context "必須入力項目が入力されている場合" do
      it "コメントが入力されていると有効" do
        task_state = FactoryBot.build(:task_state)
        expect(task_state).to be_valid
      end
    end

    context "必須入力項目が空欄の場合" do
      it "状態が空欄だと無効" do
        task_state = FactoryBot.build(:task_state, state: nil)
        expect(task_state).not_to be_valid
      end
    end
  end
end
