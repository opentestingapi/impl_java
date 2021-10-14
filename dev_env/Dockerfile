FROM codercom/code-server:latest

#install environment requirements
RUN sudo apt update
RUN sudo apt install -y maven git
RUN sudo apt install -y openjdk-11-jdk

#install code extensions
RUN code-server --install-extension vscjava.vscode-java-pack
RUN code-server --install-extension GabrielBB.vscode-lombok
