use strict;
use warnings;

# Um Hash multidimensional para os destinos
my %multiverso = (
    "Dimensao_C137" => {
        "ano"     => 2026,
        "status"  => "Relativamente segura",
        "perigo"  => "Baixo"
    },
    "Dimensao_Cronenberg" => {
        "ano"     => 2014,
        "status"  => "Monstros por toda parte",
        "perigo"  => "Extremo"
    }
);

my $destino = "Dimensao_C137";

if ($multiverso{$destino}{"perigo"} eq "Extremo") {
    print "Wubba Lubba Dub Dub! Alerta de perigo em $destino!\n";
} else {
    print "Viajando para $destino no ano de " . $multiverso{$destino}{"ano"} . "...\n";
}