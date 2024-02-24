function H = bandrejectFilter(M, N, D0, W, n)
    % สร้างเมทริกซ์กริดตามขนาดของภาพ
    u = 0:(M-1);
    v = 0:(N-1);
    idx = find(u > M/2);
    u(idx) = u(idx) - M;
    idy = find(v > N/2);
    v(idy) = v(idy) - N;
    [V, U] = meshgrid(v, u);

    % คำนวณระยะห่างจากจุดกลาง
    D = sqrt(U.^2 + V.^2);

    % สร้างฟิลเตอร์ Band Reject
    H = 1 ./ (1 + ((D.*W)./(D.^2 - D0^2)).^(2*n));
end