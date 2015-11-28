require 'spec_helper'
require 'fileutils'
require_relative '../../lib/git_client'

describe GitClient do
  describe 'cloning a repo' do
    let(:repo_author) { 'fkotsian' }
    let(:repo_name)   { 'repo_visualizer' }
    let(:test_dir)    { '/tmp/test' }
    let(:path_to_test_repo)    { "/tmp/test/#{repo_name}" }

    before do
      FileUtils.rm_rf path_to_test_repo if Dir.exist? path_to_test_repo
    end
    
    context 'when the repo does not exist at the path' do
      it 'clones the repo' do
        expect(Git).to receive(:clone)
        client = GitClient.new
        client.clone(repo_author, repo_name, nil, test_dir)
      end
    end

    context 'when the repo already exists at the path' do
      before { FileUtils.mkdir_p path_to_test_repo }
      it 'pulls the latest changes to the repo instead' do
        fake_repo = double('repo')
        expect(Git).to receive(:open).and_return fake_repo
        expect(fake_repo).to receive(:pull)
        
        client = GitClient.new
        client.clone(repo_author, repo_name, nil, test_dir)
      end
    end
  end
end
