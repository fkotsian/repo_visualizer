require 'spec_helper'

describe 'analyzing a repo' do
  let(:repo_author) { 'fkotsian' }
  let(:repo_name) { 'repo_visualizer' }  
  before do
    client = GitClient.new
    client.clone('fkotsian', 'repo_visualizer')
  end

  it 'converts a directory into a set of object relations' do
    analyzer = RepoAnalyzer.new
    analysis = analyzer.analyze
    expect(analysis.objects).to include('git_client')
    expect(analysis.messages).to include('clone')
  end

end
