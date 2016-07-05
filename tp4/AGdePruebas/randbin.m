function randbin = randbin(n)
    randbin=de2bi(round(rand(n,1)*1000), 'left-msb');
end

