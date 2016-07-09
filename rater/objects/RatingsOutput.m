classdef RatingsOutput
  properties
    strIncome
    strCost
    strDelCost
    strMedianCost
    qResults
    tResults
    strAll
    strMedian
    n
    i
  end
  
  methods
    function rOutput = RatingsOutput(numMatches)
      rOutput.strIncome = 0;
      rOutput.strCost = 0;
      rOutput.strDelCost = 0;
      zerosRow = zeros(1, 2);
      rOutput.qResults = zerosRow;
      rOutput.tResults = zerosRow;
      rOutput.n = 2 * numMatches;
      rOutput.strAll = zeros(numMatches, 2);
      rOutput.i = 1;
    end
    
    function rOutput = updateStrAll(rOutput, str)
      if (rOutput.i + 1 <= rOutput.n)
        rOutput.strAll(rOutput.i: rOutput.i + 1, :) = str;
        rOutput.i = rOutput.i + 2;
      end
    end
    
    function [rOutput strMedianCost] = updateStrMedianCost(rOutput)
      rOutput.strMedian = median(rOutput.strAll);
      strMedian = rOutput.strMedian;
      rOutput.strMedianCost = norm(log(strMedian(1))) + ...
          norm(log(strMedian(2)));
      strMedianCost = rOutput.strMedianCost;
    end
  end
end
