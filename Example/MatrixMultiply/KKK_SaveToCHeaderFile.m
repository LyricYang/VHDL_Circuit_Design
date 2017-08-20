function [] = KKK_SaveToCHeaderFile(var,fn)  
    fid = fopen(fn,'w');  
    var = reshape(var.',1,[]);  
    fprintf(fid,'%d,\r\n',var);  
    fclose(fid);  
end