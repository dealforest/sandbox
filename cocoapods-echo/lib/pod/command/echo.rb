module Pod
  class Command
    class Echo < Command
      self.arguments   = '[string ...]'
      self.summary     = 'echo'
      self.description = 'echo arguments'

      def self.options
        [
          [ '--test', 'dummy' ],
        ].concat(super)
      end

      def initialize(argv)
        @test  = argv.flag?('test')
        @names = argv.arguments! unless argv.arguments.empty?
        super
      end

      def validate!
        super
        help! 'arguments is required' unless @names
      end

      def run
        p @test ? 'test' : @names.join(':')
      end
    end
  end
end
