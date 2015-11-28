require 'spec_helper'
require_relative '../../lib/file_analyzer'

describe FileAnalyzer do
  describe '#analyze' do
    it 'returns a list of all the messages sent in a file' do
      analyzer = FileAnalyzer.new
      messages = analyzer.call('/Users/fkotsian/workspace/repo_visualizer/lib/file_analyzer.rb')
      expect(messages[:call]).to eq 'RepoAnalyzer'
    end
  end
end
