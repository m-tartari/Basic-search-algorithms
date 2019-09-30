function plot_on_map(i,j,P,color1,color2)
                      if(P(i,j)==100)
                        plot(j,i,'-h',...
                            'MarkerSize',8,...
                            'MarkerEdgeColor',color1,...
                            'MarkerFaceColor',color2);
                      else
                        if(P(i,j)==10)
                            plot(j,i,'-s',...
                            'MarkerSize',5,...
                            'MarkerEdgeColor',color1,...
                            'MarkerFaceColor',color2);
                        else
                            plot(j,i,'-o',...
                            'MarkerSize',4,...
                            'MarkerEdgeColor',color1,...
                            'MarkerFaceColor',color2);
                        end
end