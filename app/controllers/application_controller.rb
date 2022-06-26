# frozen_string_literal: true

class ApplicationController < ActionController::API
  SECRET = ENV.fetch('SECRET_KEY_JWT')

  def authentication
    header = request.headers['access-token']
    header = header.split.last if header
    begin
      @decoded = JWT.decode(header, SECRET, true, { algorithm: 'HS256' })
      @current_user = User.find(@decoded[0]['user_id'])
    rescue ActiveRecord::RecordNotFound => e
      render(json: { errors: e.message }, status: :unauthorized)
    rescue JWT::DecodeError
      render(json: { error: 'Invalid access-token!' }, status: :unauthorized)
    end
  end

  def current_ability
    @current_ability ||= Ability.new(@current_user)
  end

  def encode_user_data(payload, exp = 1.minute.from_now)
    payload[:exp] = exp.to_i
    JWT.encode(payload, SECRET, 'HS256')
  end

  rescue_from CanCan::AccessDenied do
    render(json: { error: 'Not authorized!' }, status: :unauthorized)
  end
end
