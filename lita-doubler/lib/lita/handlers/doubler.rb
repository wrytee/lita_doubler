module Lita
  module Handlers
    class Doubler < Handler

      route(
        /^double\s+(\d+)$/i,
        :respond_with_double,
        command: true,
        help: { 'double N' => 'prints N + N' }
        )

      def double_number(n)
        n + n
      end

      Lita.register_handler(self)
    end
  end
end
