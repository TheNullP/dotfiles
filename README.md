### **Passo 1: Criar o Repositório**

1. Crie um repositório chamado algo como `dotfiles` no GitHub, GitLab ou outro provedor de sua escolha.
    
    ```bash
    git init --bare $HOME/.dotfiles
    ```
    
    - O `-bare` cria um repositório sem uma working tree, ideal para gerenciar arquivos diretamente no seu `$HOME`.
2. Configure um alias para facilitar o uso do Git com seu repositório de dotfiles:
    
    ```bash
    alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    ```
    
3. Adicione o alias ao seu `~/.zshrc` ou `~/.bashrc` para torná-lo permanente:
    
    ```bash
    echo "alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> ~/.zshrc
    ```
    
4. Certifique-se de ignorar a pasta `.dotfiles` para evitar loops:
    
    ```bash
    echo ".dotfiles" >> ~/.gitignore
    ```
    

---

### **Passo 2: Adicionar e Versionar Configurações**

1. Adicione arquivos ou pastas que deseja versionar (como `.tmux.conf`, `.zshrc`, ou `~/.config/alacritty/alacritty.yml`):
    
    ```bash
    dotfiles add ~/.zshrc
    dotfiles add ~/.config/alacritty/alacritty.yml
    dotfiles add ~/.tmux.conf
    ```
    
2. Faça commit e envie para o repositório remoto:
    
    ```bash
    dotfiles commit -m "Adicionando configurações iniciais"
    dotfiles remote add origin git@github.com:seu-usuario/dotfiles.git
    dotfiles push -u origin main
    ```
    

---

### **Passo 3: Recuperar Configurações em Outros Dispositivos**

1. Clone o repositório para o novo dispositivo:
    
    ```bash
    git clone --bare git@github.com:seu-usuario/dotfiles.git $HOME/.dotfiles
    ```
    
2. Configure o alias novamente:
    
    ```bash
    alias dotfiles='git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
    ```
    
3. Restaure os arquivos para o `$HOME`:
    
    ```bash
    dotfiles checkout
    ```
    
4. Caso tenha conflitos, force a restauração:
    
    ```bash
    dotfiles checkout 2>&1 | grep "error" | awk '{print $3}' | xargs rm -rf
    dotfiles checkout
    ```
