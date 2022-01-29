%% Equivalent Resistance using 3 Resistors
% This code will take any three resistors and an wanted resistance and will
% calculate the order (i.e. series or parallel) they must be in to get the closest resistance

r1 = input('Enter the resistance in ohms of the first resistor: ');
r2 = input('Enter the resistance in ohms of the second resistor: ');
r3 = input('Enter the resistance in ohms of the third resistor: ');
desired_resistance = input('Enter the desired resistance in ohms: ');

if desired_resistance == r1
    fprintf("To achieve %3.2f ohms, use the first resistor in series.\n", desired_resistance)
elseif desired_resistance == r2
    fprintf("To achieve %3.2f ohms, use the second resistor in series.\n", desired_resistance)
elseif desired_resistance == r3
    fprintf("To achieve %3.2f ohms, use the third resistor in series.\n", desired_resistance)
else
    eqr1 = 1/((1/(r2+r3))+(1/r1));
    eqr2 = 1/((1/(r1+r3))+(1/r2));
    eqr3 = 1/((1/(r2+r1))+(1/r3));
    values = [(eqr1-desired_resistance) abs(eqr2-desired_resistance) abs(eqr3-desired_resistance)];
    min_eqr_difference = min([values]);
    closest_res = desired_resistance + min_eqr_difference;
    index = find(min_eqr_difference==values);
    if index == 1
        fprintf("The closest resistance with these resistors is %3.2f. \n The order of resistance is %3.2f ohm and %3.2f ohm resistors in series and those will be in parallel with the %3.2f ohm resistor.\n", closest_res, r2, r3, r1)
    elseif index == 2
        fprintf("The closest resistance with these resistors is %3.2f. \n The order of resistance is %3.2f ohm and %3.2f ohm resistors in series and those will be in parallel with the %3.2f ohm resistor.\n", closest_res, r1, r3, r2)
    else
        fprintf("The closest resistance with these resistors is %3.2f. \n The order of resistance is %3.2f ohm and %3.2f ohm resistors in series and those will be in parallel with the %3.2f ohm resistor.\n", closest_res, r2, r1, r3)
    end
end