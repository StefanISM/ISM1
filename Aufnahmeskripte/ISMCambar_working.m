 
%% Open the TCP/IP-Connection
% IP address of the PC on which cambarserver is running.
ipAddr = '134.28.45.63';

jTcpObj = jtcp('request', ipAddr, 3000,'serialize',false); pause(0.1);
mssg = char(jtcp('read',jTcpObj)); disp(mssg)

%% Send the keyword to authorize the client
jtcp('write',jTcpObj,int8('mtec')); pause(0.5);
mssg = char(jtcp('read',jTcpObj)); disp(mssg)
 
%%
% A loop to aquire data continously  

%LoadLocator(jTcpObj, 'C:\Users\CamAdmin\Desktop\CambarServer - Kopie\locators\ISM1.xml') 
 
i=1;
pause;
k=0;
markersSave=struct;
first = true;
while (i<=1)
    
    j=0;
    while (j<100)
       j=j+1; 
        [markers,timestamp] = GetMarkerPositions(jTcpObj);
        k=k+1;
        markersSave(k).timestamp=timestamp;
        markersSave(k).markers=markers;
    end
    if first
        %File has to exist and be filled with at least one entry
        save 'markers' markersSave '-v7.3';
        first = false;
    else
        %Expand the .mat file
        mObj = matfile('markers');
        mObj.Properties.Writable=true;
        sizeMarkers = size(mObj, 'markersSave');
        mObj.markersSave( : , sizeMarkers(2)+1:sizeMarkers(2)+length(markersSave) ) = markersSave;
    end
    k=0;    
end
%%n 
% If 'Quit' used, then you will need to start rob6server again
% jtcp('write',jTcpObj,int8('quit'));
jTcpObj = jtcp('close',jTcpObj);