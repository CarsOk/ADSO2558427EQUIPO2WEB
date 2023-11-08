class ApplicationController < ActionController::Base
    def get_github_version
        # Obtenemos la información del repositorio de GitHub
        repo = GitHubRepository.new("https://github.com/CarsOk/ADSO2558427EQUIPO2WEB")
      
        # Obtenemos la última versión o release
        version = repo.latest_version
      
        # Devolvemos la versión o release
        return version
    end

end
