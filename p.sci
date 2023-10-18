// https://gist.github.com/sgonzalez/b03cde0a006812b3188181f8b37e0183
function y1 = p(u1)

    g = 9.80665; // meters per second^2
    R = 8.3144598; // Joules per mole per Kelvin
    dryAirMolarMass = 0.0289644; // kilograms per mole
    dryAirSpecificGasConstant = 287.058; // Joules per kilogram per Kelvin

    L0 = 0.; // meters
    L1 = 11000.; // meters
    L2 = 20000.; // meters
    L3 = 32000.; // meters

    T0 = 288.15; // Kelvin
    T1 = 216.65; // Kelvin
    T2 = 216.65; // Kelvin
    T3 = 228.65; // Kelvin

    B0 = -0.0065; // Kelvin per meter
    B1 = 0.; // Kelvin per meter
    B2 = 0.001; // Kelvin per meter
    B3 = 0.0028; // Kelvin per meter

    P0 = 101325.; // Pascals
    P1 = 22632.1; // Pascals
    P2 = 5474.89; // Pascals
    P3 = 868.02; // Pascals

    H = u1;
    t = 0.;
    if (H < L1) then
        pow = g * dryAirMolarMass / (R * B0);
        t = P0 * (T0 / (T0 + B0 * (H - L0)))^pow;
    elseif (H < L2) then
        t = P1 * exp(-g * dryAirMolarMass * (H - L1) / (R * T1));
    elseif (H < L3) then
        pow = g * dryAirMolarMass / (R * B2);
        t = P2 * (T2 / (T2 + B2 * (H - L2)))^pow;
    else
        pow = g * dryAirMolarMass / (R * B3);
        t = P3 * (T3 / (T3 + B3 * (H - L3)))^pow;
    end

    y1 = t;

endfunction
