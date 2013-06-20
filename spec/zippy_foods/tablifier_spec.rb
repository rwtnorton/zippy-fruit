require_relative File.join('..', 'common')
require 'set'

test_class = ZippyFoods::Tablifier

describe test_class do
  describe "given constructor without arguments" do
    it "barfs" do
      lambda {
        test_class.new
      }.must_raise ArgumentError
    end
  end

  describe "given constructor with required arguments" do
    before do
      @source = {
        :bleach => %w[ Ichigo Rukia Orihime Sado Ishida ],
        :dbz => %w[ Goku Kuririn Roshi Piccolo Vegeta Yamcha Tenshinhan ],
        :autobots => %w[ OptimusPrime OmegaSupreme Grimlock ],
      }
      @subject = test_class.new(@source)
    end

    it "must have the correct source" do
      @subject.source.must_equal(@source)
    end

    it "must produce the correct headings" do
      Set.new(@subject.headings).must_equal(Set[:bleach, :dbz, :autobots])
    end

    it "must produce the correct row_count" do
      @subject.row_count.must_equal(7)
    end

    it "is not affected by modifying the source object" do
      @source[:gobots] = %w{ LeaderOne Turbo Scooter }
      Set.new(@subject.source.keys).wont_equal(Set.new(@source.keys))
    end

    it "generates the correct rows" do
      expected = [
                  ['OptimusPrime', 'Ichigo',     'Goku',        ],
                  ['OmegaSupreme', 'Rukia',      'Kuririn',     ],
                  ['Grimlock',     'Orihime',    'Roshi',       ],
                  [ nil,           'Sado',       'Piccolo',     ],
                  [ nil,           'Ishida',     'Vegeta',      ],
                  [ nil,            nil,         'Yamcha',      ],
                  [ nil,            nil,         'Tenshinhan',  ],
                 ]
      @subject.rows.must_equal(expected)
    end

    it "generates the correct table" do
      expected = [
                  [:autobots,      :bleach,      :dbz,          ],
                  ['OptimusPrime', 'Ichigo',     'Goku',        ],
                  ['OmegaSupreme', 'Rukia',      'Kuririn',     ],
                  ['Grimlock',     'Orihime',    'Roshi',       ],
                  [ nil,           'Sado',       'Piccolo',     ],
                  [ nil,           'Ishida',     'Vegeta',      ],
                  [ nil,            nil,         'Yamcha',      ],
                  [ nil,            nil,         'Tenshinhan',  ],
                 ]
      @subject.table.must_equal(expected)
    end
  end
end
