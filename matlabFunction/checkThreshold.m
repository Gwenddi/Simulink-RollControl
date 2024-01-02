function [leftWarning,rightWarning] = checkThreshold(rollRate)
    % 当rollRate超过阈值的时候发出警告
    % 初始化
    leftWarning=false;
    rightWarning=false;
    threshold=20.0;
    
    % 判断是否超过阈值
    if rollRate<-threshold
        leftWarning=true
    elseif rollRate>threshold
        rightWarning=true;
    end
end

