require 'rails_helper'
RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録がうまくいくとき' do
      it 'nicknameとemail、passwordとpassword_confirmation、first_nameとlast_name、first_furiganaとlast_furigana、birthdayが存在すれば登録できる' do
        expect(@user).to be_valid
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ)であれば登録できる' do
        @user.first_name = '阿ああア'
        expect(@user).to be_valid
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ)であれば登録できる' do
        @user.last_name = '胃いいイ'
        expect(@user).to be_valid
      end
      it 'first_furiganaが全角（カタカナ)であれば登録できる' do
        @user.first_furigana = 'アアアア'
        expect(@user).to be_valid
      end
      it 'last_furiganaが全角（カタカナ)であれば登録できる' do
        @user.last_furigana = 'テテテテ'
        expect(@user).to be_valid
      end
      it 'passwordが6文字以上で半角英数字混合であれば登録できる' do
        @user.password = 'nini22nini'
        @user.password_confirmation = 'nini22nini'
        expect(@user).to be_valid
      end
    end

    context '新規登録がうまくいかないとき' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end
      it '重複したemailが存在する場合登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
      it 'passwordが5文字以下であれば登録できない' do
        @user.password = 'ni2'
        @user.password_confirmation = 'ni2'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end
      it 'passwordが半角英数字混合でなければ登録できない' do
        @user.password = '555555'
        @user.password_confirmation = '555555'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is invalid')
      end
      it 'passwordが存在してもpassword_confirmationが空では登録できない' do
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end
      it 'first_nameが空では登録できない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name can't be blank")
      end
      it 'first_nameが全角（漢字・ひらがな・カタカナ)でなければ登録できない' do
        @user.first_name = 'jjjj'
        @user.valid?
        expect(@user.errors.full_messages).to include('First name is invalid')
      end
      it 'last_nameが空では登録できない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name can't be blank")
      end
      it 'last_nameが全角（漢字・ひらがな・カタカナ)でなければ登録できない' do
        @user.last_name = 'jjjj'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last name is invalid')
      end
      it 'first_furiganaが空では登録できない' do
        @user.first_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First furigana can't be blank")
      end
      it 'first_furiganaが全角（漢字・ひらがな・カタカナ)でなければ登録できない' do
        @user.first_furigana = 'jjjj'
        @user.valid?
        expect(@user.errors.full_messages).to include('First furigana is invalid')
      end
      it 'last_furiganaが空では登録できない' do
        @user.last_furigana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last furigana can't be blank")
      end
      it 'last_furiganaが全角（漢字・ひらがな・カタカナ)でなければ登録できない' do
        @user.last_furigana = 'jjjj'
        @user.valid?
        expect(@user.errors.full_messages).to include('Last furigana is invalid')
      end
      it 'birthdayが空では登録できない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
