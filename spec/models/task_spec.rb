require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:user) { FactoryBot.build(:user) }
  let(:goal) { FactoryBot.build(:goal, user: user) }
  let(:task) { FactoryBot.build(:task, user: user, goal: goal) }
  describe "必須入力チェック" do
    context "必須入力項目が入力されている場合" do
      it "すべての項目が入力されていると有効" do
        expect(task).to be_valid
      end

      it "開始日と終了日は空欄でも有効" do
        # task = FactoryBot.build(:task, start_date: nil, end_date: nil)
        task.start_date = nil
        task.end_date = nil
        expect(task).to be_valid
      end
    end

    context "必須入力項目が空欄の場合" do
      it "関連するゴールが無いと無効" do
        task.goal = nil
        expect(task).not_to be_valid
      end

      it "関連するユーザーが無いと無効" do
        task.user = nil
        expect(task).not_to be_valid
      end

      it "内容が空欄だと無効" do
        task.content = nil
        expect(task).not_to be_valid
      end

      it "アクションが空欄だと無効" do
        task.action = nil
        expect(task).not_to be_valid
      end

      it "ステータスが空欄だと無効" do
        task.status = nil
        expect(task).not_to be_valid
      end
    end
  end
end
