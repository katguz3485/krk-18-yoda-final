# frozen_string_literal: true

class BucketsController < ApplicationController
  expose(:bucket, attibutes: :bucket_params)
  expose :buckets, -> {Bucket.all}

  def create
    if bucket.save
      redirect_to root_path, notice: I18n.t('shared.created', resource: 'Bucket')
    else
      render :new
    end
  end

  def update
    if bucket.update(bucket_params)
      redirect_to root_path, notice: I18n.t('shared.updated', resource: 'Bucket')
    else
      render :edit
    end
  end

  def destroy
    if bucket.destroy
      redirect_to root_path, notice: I18n.t('shared.deleted', resource: 'Bucker')
    else
      render :index
    end
  end

  private

  def bucket_params
    params.require(:bucket).permit(:name, :user_id)
  end
end
