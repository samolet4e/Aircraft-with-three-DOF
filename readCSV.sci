// [T,CL,CD,CM]=readCSV()
function [T, CL, CD, CM] = readCSV()

    M = csvRead('aeroTable.csv',',','double',[],[],[],[],1);

//    V = struct('time',zeros(11,1),'values',zeros(11,1))
    T.time = M(1:11,5);
    T.values = M(1:11,6);

    CL.alpha = M(1:13,1);
    CL.values = M(1:13,2);

    CD.alpha = M(1:13,1);
    CD.values = M(1:13,3);

    CM.alpha = M(1:13,1);
    CM.values = M(1:13,4);

endfunction
