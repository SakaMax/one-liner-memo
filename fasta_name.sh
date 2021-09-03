cat example.fna | grep ">" | sed -r 's/^>(.*)$/\1/' > fasta_name
