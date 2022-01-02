require 'rails_helper'

RSpec.describe Relationship, type: :model do
  describe "必須入力チェック" do
    context "必須入力項目が入力されている場合" do
      it "すべての項目が入力されていると有効" do
        relationship = FactoryBot.build(:relationship)
        expect(relationship).to be_valid
      end
    end

    context "必須入力項目が空欄の場合" do
      it "フォローしたユーザーのIDが空欄だと無効" do
        relationship = FactoryBot.build(:relationship, follower_id: nil)
        expect(relationship).not_to be_valid
      end

      it "フォローされたユーザーのID空欄だと無効" do
        relationship = FactoryBot.build(:relationship, followed_id: nil)
        expect(relationship).not_to be_valid
      end
    end
  end
end
