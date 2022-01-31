FROM codercom/code-server:3.11.1

#install environment requirements
RUN sudo apt update
RUN sudo apt install -y maven git
RUN sudo apt install -y openjdk-11-jdk

#install code extensions
RUN code-server --install-extension vscjava.vscode-java-pack
RUN code-server --install-extension GabrielBB.vscode-lombok
RUN code-server --install-extension SonarSource.sonarlint-vscode
RUN code-server --install-extension redhat.fabric8-analytics
