# frozen_string_literal: true

module Api
  module V1
    class TestAutheticationController < ApplicationController
      before_action :authentication

      def hello_world
        render(json: { message: 'Hello World!' }, status: :ok)
      end
    end
  end
end
