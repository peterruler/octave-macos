score = input('Enter a Score (0 to 100):');
fprintf('Score: %d\n', score);
if score >= 90
  letterGrade = 'A';
elseif score >= 80
  letterGrade =  'B';
elseif score >= 70
  letterGrade =  'C';
else
  letterGrade =  'F';
end
fprintf('Letter Grade is: %c\n', letterGrade);
