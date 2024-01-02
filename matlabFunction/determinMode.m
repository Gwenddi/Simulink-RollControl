function mode = determinMode(previousMode,rollRate,onOffPressed)
    % 阈值
    kFailSoftRoll=20.0;
    
    % 状态
    OFF='off';
    NOMINAL='nominal';
    FAILSOFT='failsoft';
    
    % 默认状态
    mode = previousMode;
    
    % 判断当前系统的运行状态
    if strcmp(previousMode,OFF) && ~onOffPressed
        if abs(rollRate)>kFailSoftRoll
            mode=FAILSOFT;
        else
            mode=NOMINAL;
        end
    elseif strcmp(previousMode,FAILSOFT) && onOffPressed
        if abs(rollRate)>kFailSoftRoll
            mode=FAILSOFT;
        else
            mode=NOMINAL;
        end
    elseif strcmp(previousMode,NOMINAL) && onOffPressed
        if abs(rollRate)<=kFailSoftRoll
            mode=NOMINAL;
        elseif abs(rollRate)>kFailSoftRoll
            mode=FAILSOFT;
        end
    elseif (strcmp(previousMode,FAILSOFT) | strcmp(previousMode,NOMINAL)) && ~onOffPressed
        mode=OFF;
    end
end
