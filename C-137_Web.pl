use strict;
use warnings;
use Mojolicious::Lite;

# Base de dados interdimensional
my %multiverso = (
    "C-137"      => { nome => "Dimensão C-137", ano => 2026, perigo => "Baixo" },
    "Cronenberg" => { nome => "Dimensão Cronenberg", ano => 2014, perigo => "Extremo" },
    "Ferias"     => { nome => "Mundo das Férias", ano => 3042, perigo => "Nulo" }
);

# Página principal do sistema da Arma de Portais
get '/' => sub {
    my $c = shift;
    
    # Captura a dimensão que o utilizador escolheu clicar (se houver)
    my $destino = $c->param('destino') || '';
    my $mensagem = "Consola: Aguardando coordenadas interdimensionais...";
    my $cor_alerta = "#00ff00"; # Verde padrão

    if ($destino && $multiverso{$destino}) {
        my $info = $multiverso{$destino};
        if ($info->{perigo} eq "Extremo") {
            $mensagem = "ERR: PERIGO EXTREMO! Linha temporal em risco de colapso. Wubba Lubba Dub Dub!!!";
            $cor_alerta = "#ff0000"; # Vermelho de erro
        } else {
            $mensagem = "Sucesso! Portal gerado para " . $info->{nome} . " (Ano: " . $info->{ano} . ")";
        }
    }

    # Envia os dados para renderizar no ecrã do navegador
    $c->render(template => 'index', mensagem => $mensagem, cor => $cor_alerta, multiverso => \%multiverso);
};

# Inicia o servidor local do Rick
app->start;

__DATA__

@@ index.html.ep
<!DOCTYPE html>
<html>
<head>
    <title>SISTEMA OPERATIVO C-137</title>
    <style>
        body { background-color: #1a1a1a; color: white; font-family: 'Courier New', Courier, monospace; text-align: center; padding: 50px; }
        h1 { color: #00ff00; text-shadow: 0 0 10px #00ff00; }
        .btn { background-color: #00ff00; color: black; border: none; padding: 15px 30px; font-size: 16px; font-weight: bold; cursor: pointer; border-radius: 5px; margin: 10px; }
        .btn:hover { background-color: #a6ff00; }
        .consola { background-color: black; color: <%= $cor %>; border: 2px solid #333; padding: 20px; width: 60%; margin: 30px auto; border-radius: 8px; font-size: 18px; box-shadow: 0 0 15px <%= $cor %>; }
    </style>
</head>
<body>

    <h1>🌀 PORTAL GUN LOGIC v2.0 🌀</h1>
    <p>Selecione a Dimensão de Destino para Disparar:</p>

    <div>
        % for my $chave (keys %$multiverso) {
            <a href="/?destino=<%= $chave %>"><button class="btn"><%= $multiverso->{$chave}{nome} %></button></a>
        % }
    </div>

    <div class="consola">
        <%= $mensagem %>
    </div>

</body>
</html>