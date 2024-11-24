g= function(c)
  return (exp(-0.002*(c-500)) / (1+ exp(-0.002*(c-500))))

f= function(c)
  return (10000/c)

jednaSim= function(brSoba,c,brDanaSimulacije) {
  vektorSoba= c(rep(0,brSoba))
  lambda= f(c)
  profit=0
  
  #brojanje zauzetih soba
  for (j in 1:brDanaSimulacije){
    trenutanBrLjudiUHotelu= 0
    for (k in 1:brSoba){
      if (vektorSoba[k]>0){
        trenutanBrLjudiUHotelu= trenutanBrLjudiUHotelu + 1
        vektorSoba[k]= vektorSoba[k] - 1
      }
    }
    
    slucUnif= runif(1)
    noviLjudi=-1
    
    for (z in 0:99){
      vjerojatnostDaJeDoslo_zLjudi= dpois(z,lambda)
      slucUnif= slucUnif - vjerojatnostDaJeDoslo_zLjudi
      if (slucUnif<=0){
        noviLjudi= z
        break
      }
    }
    
    if (noviLjudi==-1)
      noviLjudi= 100
     
    
    
    #tjeranje viška gostiju
    if ((trenutanBrLjudiUHotelu+noviLjudi) >100)
      noviLjudi= 100 - trenutanBrLjudiUHotelu
    
    trenutanBrLjudiUHotelu= trenutanBrLjudiUHotelu + noviLjudi
    
    #punimo sobe s novim gostima (dok god ima novih ljudi)
    for (k in 1:brSoba){
      if (vektorSoba[k]==0){
        vektorSoba[k]= rgeom(1,1-g(c))
        
        noviLjudi= noviLjudi - 1
        if (noviLjudi==0)
          break
      }
    }

    profit= profit + trenutanBrLjudiUHotelu*c
    
  }
  
  return (profit)
  
}



set.seed(33)


brSim=100
pocetnaCijena=200

brSoba= 100
c= pocetnaCijena
brDanaSimulacije= 100
najveciProfit=0
najboljaCijena=-1
listaProfita= c()

for (i in 1:brSim){
  profit= jednaSim(brSoba,c,brDanaSimulacije)
  listaProfita = append(listaProfita,profit)
  if(profit>najveciProfit){
    najveciProfit= profit
    najboljaCijena= c
  }
  c= c+1
}

print(najboljaCijena)
print(najveciProfit/brDanaSimulacije)

plot(pocetnaCijena:(pocetnaCijena+brSim-1), listaProfita, type="l")







