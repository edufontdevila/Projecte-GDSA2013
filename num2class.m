function C = num2class (num)
    switch num
        case 1          %Class 1
            C = 'other';  %    
        case 2      %
            C = 'sports';  %Class     
        case 3      %concert
            C = 'concert';  %Class 3
        case 4      %non_event
            C = 'non_event';  %Class 4
        case 5     %conference/exhibition
            C = 'conference';
        case 6
            C = 'exhibition';
        case 7
            C = 'theater_dance';   
        case -1
            C = 'other'   ; 
  
    end
    C = cellstr(C);
end
