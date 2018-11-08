require 'rails_helper'

RSpec.describe Bucket, type: :model do


  describe 'associations' do
    it {is_expected.to belong_to :user}
  end

  describe 'validations' do
    it {is_expected.to validate_presence_of :name}
  end

  describe 'database columns' do
    it {is_expected.to have_db_column :name}
    it {is_expected.to have_db_column :user_id}
    it {is_expected.to have_db_column :created_at}
    it {is_expected.to have_db_column :updated_at}
  end


end
