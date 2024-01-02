function rollRate = calculateRollRate(joystickCmd, leftAdverseYaw, rightAdverseYaw,BandOrigin,Tolerance)
    % 计算 rollCoupling
    rollCoupling = joystickCmd-(leftAdverseYaw - rightAdverseYaw) * 0.1;

    % 计算 rollRate
    rollRate = rollCoupling * 0.25;

    % 定义常数
    BandOrigin = 0.0;
    Tolerance = 25.0;

    % 计算上下界
    upperBound = BandOrigin + Tolerance;
    lowerBound = BandOrigin - Tolerance;

    % 过滤 rollRate
    if rollRate > upperBound
        rollRate = upperBound;
    elseif rollRate < lowerBound
        rollRate = lowerBound;
    end
end
