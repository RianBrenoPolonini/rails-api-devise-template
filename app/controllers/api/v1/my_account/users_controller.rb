# frozen_string_literal: true

module Api
  module V1
    module MyAccount
      class UsersController < ApplicationController
        load_and_authorize_resource

        def show
          render(json: @current_user)
        end

        def update
          if @current_user.update(user_params)
            render(json: @current_user)
          else
            render(json: @current_user.errors, status: :unprocessable_entity)
          end
        end

        def destroy
          @current_user.destroy
        end

        private

        def user_params
          params.require(:user).permit(:email, :password, :password_confirmation)
        end
      end
    end
  end
end
