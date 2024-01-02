function result= myFunction(joystickCmd,leftAdverseYaw,rightAdverseYaw,onOffPressed)
    result=false;
    
    % 定义上下界
    BandOrigin=0.0;Tolerance=25.0;
    
    rollrate = NaN(15, 1);   
    
    for i=1:15
        rollrate(i,1) = calculateRollRate(joystickCmd(i,1), leftAdverseYaw(i,1), rightAdverseYaw(i,1),BandOrigin,Tolerance);
    end
    
    leftWarningArray = false(15, 1);
    rightWarningArray = false(15, 1);
    for i=1:15
        [leftWarningArray(i,1), rightWarningArray(i,1)]=checkThreshold(rollrate(i));   
    
    end
    
    Mode = cell(15, 1);
    onOffPressedString = cellstr(onOffPressed); % 将 categorical 转换为字符串
    onOffPressedLogical = strcmp(onOffPressedString, 'TRUE'); % 或者根据实际情况转换为逻辑类型
    
    for i=1:15
        if i==1
            Mode{1}='off';
            continue;
        else
            previousMode=Mode{i-1};
        end
        Mode{i} = determinMode(previousMode,rollrate(i,1),onOffPressedLogical(i-1,1));
    end
    disp(Mode);
end