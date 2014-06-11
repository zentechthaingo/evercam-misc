# Copyright (c) 2014, Evercam.io

module Evercam
  class EvercamError < StandardError
    def initialize(message=nil, code=400, *context)
      super(message)
      @code    = code
      @context = [].concat(context)
    end

    attr_reader :code, :context

    def self.status_code
      400
    end
  end

  class AuthenticationError < EvercamError
    def initialize(message=nil, *context)
      super((message || "Unauthenticated"), self.class.status_code, *context)
    end

    def self.status_code
      401
    end
  end

  class AuthorizationError < EvercamError
    def initialize(message=nil, *context)
      super((message || "Unauthorized"), self.class.status_code, *context)
    end

    def self.status_code
      403
    end
  end

  class NotFoundError < EvercamError
    def initialize(message=nil, *context)
      super((message || "Not Found"), self.class.status_code, *context)
    end

    def self.status_code
      404
    end
  end

  class CameraOfflineError < EvercamError
    def initialize(message=nil, *context)
      super((message || "Camera Offline"), self.class.status_code, *context)
    end

    def self.status_code
      501
    end
  end

  class OutcomeError < EvercamError
    def initialize(outcome, message=nil, *context)
      super(message, self.class.status_code, *context)
      @outcome = outcome
    end

    def message
      @outcome.errors.message_list.
        map(&:downcase)
    end

    def self.status_code
      400
    end
  end

  module WebErrors
    class BadRequestError < EvercamError
      def initialize(message=nil, *context)
        super((message || "Bad Request"), self.class.status_code, *context)
      end

      def self.status_code
        400
      end
    end

    class ComingSoonError < EvercamError
      def initialize(message=nil, *context)
        super((message || "Coming Soon"), self.class.status_code, *context)
      end

      def self.status_code
        501
      end
    end

    class ConflictError < EvercamError
      def initialize(message=nil, *context)
        super((message || "Conflict"), self.class.status_code, *context)
      end

      def self.status_code
        409
      end
    end
  end
end
