require 'rails_helper'

RSpec.describe Document, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to :bucket }
  end

  describe 'delegations' do
    it { should delegate_method(:user).to(:bucket) }
  end

  describe 'database columns' do
    it { is_expected.to have_db_column :name}
    it { is_expected.to have_db_column :url}
    it { is_expected.to have_db_column :document_type}
    it { is_expected.to have_db_column :file}
    it { is_expected.to have_db_column :issue_date}
    it { is_expected.to have_db_column :bucket_id}
    it { is_expected.to have_db_column :created_at}
    it { is_expected.to have_db_column :updated_at}
  end

end


