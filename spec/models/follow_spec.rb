require 'rails_helper'

RSpec.describe Follow, type: :model do
  describe "必須入力チェック" do
    context "必須入力項目が入力されている場合" do
      it "follow_userとfollowed_userが入力されていると有効" do
        follow = FactoryBot.build(:follow)
        expect(follow).to be_valid
      end
    end

    context "必須入力項目が空欄の場合" do
      it "follow_userが空欄だと無効" do
        follow = FactoryBot.build(:follow, follow_user_id: nil)
        expect(follow).not_to be_valid
      end

      it "followed_userが空欄だと無効" do
        follow = FactoryBot.build(:follow, followed_user_id: nil)
        expect(follow).not_to be_valid
      end
    end
  end
end
