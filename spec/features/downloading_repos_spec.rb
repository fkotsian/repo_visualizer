require 'spec_helper'
require_relative '../../lib/git_client'

describe 'downloading a repo' do
  context 'given a public Github URL' do
    let(:repo_author) { 'fkotsian' }
    let(:repo_name) { 'repo_visualizer' }
    it 'downloads the repo to a temp folder' do
      client = GitClient.new
      client.clone('fkotsian', 'repo_visualizer')
      expect(Dir.exist?('/tmp/cloned/repo_visualizer')).to eq true
    end
  end
end
