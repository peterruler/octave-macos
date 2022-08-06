height = [1.78 1.85 1.73 1.68 1.81];
weight = [68 89 64 51 106];

% BMI(1) = weight(1)/(height(1)^2)
for i = [1:5]
  BMI(i) = weight(i)/(height(i)^2);
  if BMI(i) < 18.5
    category = 'Underweight';
  elseif BMI(i) < 25
    category = 'Normal Weight';
  elseif BMI(i) < 30
    category = 'Overweight';
  else
    category = 'Obese';
  endif
  fprintf('%d %.2f %d %.1f %s\n', i, height(i), weight(i), BMI(i), category);
end
