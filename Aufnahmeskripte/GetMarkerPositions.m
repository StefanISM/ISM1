function [T, timestamp] = GetMarkerPositions(jTcpObj)

jtcp('write',jTcpObj,int8(['GetMarkerPosition']));
pause(0.05)
mssg = char(jtcp('read',jTcpObj)); %disp(mssg)
mssgSplit = strsplit(mssg,' ');
mssgSplitD = str2double(mssgSplit);
mssgSplitD2=mssgSplitD(~isnan(mssgSplitD));


T = reshape(mssgSplitD2(3:end), 3,[])';

timestamp = mssgSplitD(1);
end