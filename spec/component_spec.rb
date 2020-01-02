require 'rvc_rails/component'

describe Rvc::Component do
  class TestComponent < Rvc::Component
    def render
      return_render do
        div do
          div { component.message }
        end
        div { 'hello i am carlos' }
        div { 'hello i am not carlos'}
      end
    end

    def message
      'i am a deeply nested message'
    end
  end

  describe '#render' do
    subject { TestComponent.new.render }

    let(:expected_string) do
      '<div><div>i am a deeply nested message</div></div>' \
      '<div>hello i am carlos</div>' \
      '<div>hello i am not carlos</div>' \
    end

    it { is_expected.to eq expected_string }
  end
end