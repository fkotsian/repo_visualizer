require 'git'

class GitClient
  def clone(repo_author, repo_name, name=nil, path=nil)
    desired_name = name || repo_name
    desired_path = path || '/tmp/cloned'
    
    path_to_repo = "#{desired_path}/#{desired_name}"
    if Dir.exist? path_to_repo
      g = Git.open(path_to_repo)
      g.pull
    else
      repo_uri = "git@github.com:#{repo_author}/#{repo_name}"
      Git.clone(repo_uri, desired_name, path: desired_path)
    end
  end
end
