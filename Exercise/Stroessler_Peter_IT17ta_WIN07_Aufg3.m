% [y,value,abs_err,rel_err] = Stroessler_Peter_IT17ta_WIN07_Aufg3(1006.687, 2, 13)
% [y,value,abs_err,rel_err] = Stroessler_Peter_IT17ta_WIN07_Aufg3(2678.317, 5, 7)
% Vorkommastellen abzählen von Mantissenlänge für cut Nachkomma!
function [y,value,abs_err,rel_err] = Stroessler_Peter_IT17ta_WIN07_Aufg3(x, B, nmax)
    %%1<B<10 error
    if B < 2 || B > 9
       error('Input Error: B(asis) muss zwischen 2 und 9 sein!');
    end

    MAX_DECIMALS = 100;
    vorkomma = fix(x);
    sign_mantisse = get_sign_mantisse(x);
    unsigned_x = abs(x);
    unsigned_vorkomma = abs(vorkomma);%input unsigned
    unsigned_vorkomma2 = abs(vorkomma);

    count = 1;
    y = '';
    y1 = 2.* ones(MAX_DECIMALS,1);
    ganz_zahl = 1;

    %% before comma part digits
    while ganz_zahl ~= 0%stop calculation
        ganz_zahl = fix(unsigned_vorkomma / B);
        reverse_counter = MAX_DECIMALS+1-count;
        y1(reverse_counter,1) = mod(unsigned_vorkomma, B);
        unsigned_vorkomma = ganz_zahl;
        count = count + 1;
    end
    %strip out twos of decimals vector
    y1 = y1(end-count+2:end,1);

    %% floating point decimals
    count = 1;
    y2 = [];
    nachkomma = unsigned_x - unsigned_vorkomma2;

    while count < nmax + 1 %cut
        rg = nachkomma * B;
        ganz_zahl = fix(rg);
        y2(count, 1) = ganz_zahl;
        nachkomma = abs(rg - ganz_zahl);%abs error remainder
        count = count + 1;
    end

    %% OUTPUT concat y START
    %1. convert vector to output string of y
    %2. parallel build scientific notation of value
    lowest_row = 0;
    add = 0;

    for n = 1 : length(y1)
       val_vorkomma = num2str(y1(n,1));
       y = strcat(y, val_vorkomma);
       flag = str2double(val_vorkomma);
       if n==1%'horner'
           lowest_row = flag;
       else
           lowest_row = add + flag;
       end
       add = B * lowest_row;
    end
    value1  = lowest_row;

    %add decimals dot divider
    y = strcat(y,'.');

    add = 0;

    for n = 1 : length(y2)
       y = strcat(y, num2str(y2(n,1)));
       reverse_counter = length(y2) + 1 - n;
       flag = y2(reverse_counter,1);
       if reverse_counter == length(y2)%'horner'
           lowest_row = flag;
       else
           lowest_row = add + flag;
       end
       add = (B ^ -1) * lowest_row;
    end

    %% OUTPUT concat y END
    y = strcat(sign_mantisse, y);

    %% OUTPUT value
    value = get_value(x,value1+add);

    %% OUTPUT abs_err
    [abs_err, abs_err_raw] = get_abs_error(nachkomma, nmax, B);

    %% OUTPUT rel_err
    rel_err = get_rel_error(x, abs_err_raw);
end

%% get sign mantisse string
function vz = get_sign_mantisse(signed_value)
  if signed_value > 0
        vz = '+';
  else
        vz = '-';
  end
end

%% get sign mantisse string value
function vz = get_sign_mantisse_value(signed_value)
  if signed_value > 0
        vz = '';
  else
        vz = '-';
  end
end

%% format value
function value = get_value(x, value)
    value = sprintf('%s%0.4e',get_sign_mantisse_value(sign(x)), value);
end

%% format abs err
function [abs_err, abs_err_raw] = get_abs_error(absolute_error, nmax, B)
    abs_err_raw = (absolute_error *B^-nmax);
    abs_err = sprintf('%0.4e',abs_err_raw);
end

%% format rel error
function rel_err = get_rel_error(x, abs_err)
    rel_err_plain = abs(abs_err / x);
    rel_err = sprintf('%0.4e',rel_err_plain);
end
