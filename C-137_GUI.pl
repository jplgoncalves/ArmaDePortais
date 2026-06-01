use strict;
use warnings;
use Tk;

# 1. Criar a janela principal (O ecrã da pistola de portais)
my $janela = MainWindow->new;
$janela->title("SISTEMA OPERATIVO C-137");
$janela->geometry("500x400");
$janela->configure(-background => '#1a1a1a'); # Fundo cinzento escuro ciberpunk

# 2. Base de dados das dimensões
my %multiverso = (
    "Dimensao C-137"        => { ano => 2026, perigo => "Baixo" },
    "Dimensao Cronenberg"   => { ano => 2014, perigo => "Extremo" },
    "Mundo das Ferias"      => { ano => 3042, perigo => "Nulo" }
);

# Variável para guardar o destino selecionado
my $destino_selecionado = "Dimensao C-137";

# 3. Título estilizado (Verde fluorescente)
my $titulo = $janela->Label(
    -text       => "PORTAL GUN LOGIC v1.0",
    -font       => "Courier 16 bold",
    -foreground => "#00ff00", # Verde portal
    -background => '#1a1a1a'
)->pack(-pady => 15);

# 4. Texto de instrução
$janela->Label(
    -text       => "Selecione uma dimensao de destino:",
    -font       => "Arial 10 bold",
    -foreground => "#ffffff",
    -background => '#1a1a1a'
)->pack();

# 5. Menu de opções (Dropdown) para escolher o destino
my $menu = $janela->Optionmenu(
    -options  => [keys %multiverso],
    -variable => \$destino_selecionado,
    -background => '#333333',
    -foreground => '#ffffff',
    -activebackground => '#00ff00'
)->pack(-pady => 15);

# 6. Botão disparador do Portal
my $botao_portal = $janela->Button(
    -text             => "DISPARAR PORTAL VORTEX",
    -font             => "Courier 12 bold",
    -background       => "#00ff00", 
    -foreground       => "#000000",
    -activebackground => "#a6ff00",
    -command          => \&disparar_portal
)->pack(-pady => 20);

# 7. Consola de texto (onde o resultado aparece na própria janela)
my $ecra_log = $janela->Label(
    -text       => "Consola: Aguardando coordenadas...",
    -font       => "Courier 10",
    -foreground => "#00ff00",
    -background => '#000000',
    -width      => 55,
    -height     => 4
)->pack(-pady => 15);

# 8. Lógica do botão
sub disparar_portal {
    my $info = $multiverso{$destino_selecionado};
    
    if ($info->{perigo} eq "Extremo") {
        $ecra_log->configure(
            -text => "ERR: PERIGO EXTREMO AOBRIR PORTAL!\nLinha temporal em risco de colapso.\nWubba Lubba Dub Dub!!!",
            -foreground => "#ff0000" # Texto fica vermelho em caso de erro
        );
    } else {
        $ecra_log->configure(
            -text => "Sucesso! Portal gerado para $destino_selecionado.\nAno: " . $info->{ano} . " | Status: Seguro.",
            -foreground => "#00ff00" # Verde estável
        );
    }
}

# Iniciar o loop da interface gráfica
MainLoop;