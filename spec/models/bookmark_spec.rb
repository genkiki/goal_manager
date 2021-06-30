require 'rails_helper'

RSpec.describe Bookmark, type: :model do
  describe "必須入力チェック" do
    context "必須入力項目が入力されている場合" do
      it "すべての項目が入力されていると有効" do
        bookmark = FactoryBot.build(:bookmark)
        expect(bookmark).to be_valid
      end
    end

    context "必須入力項目が空欄の場合" do
      it "ユーザーIDが空欄だと無効" do
        bookmark = FactoryBot.build(:bookmark, user_id: nil)
        expect(bookmark).not_to be_valid
      end

      it "ゴールIDが空欄だと無効" do
        bookmark = FactoryBot.build(:bookmark, goal_id: nil)
        expect(bookmark).not_to be_valid
      end
    end
  end
end
