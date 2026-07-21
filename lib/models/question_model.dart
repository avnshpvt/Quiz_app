class QuestionModel {
  final int id;
  final String questionText;
  final List<String> options;
  final int correctAnswerIndex;
  final String explanation;

  QuestionModel({
    required this.id,
    required this.questionText,
    required this.options,
    required this.correctAnswerIndex,
    required this.explanation,
  });
}

final List<QuestionModel> sampleQuestions = [
  QuestionModel(
    id: 1,
    questionText:
        'A train passes a station platform in 36 seconds and a man standing on the platform in 20 seconds. If the speed of the train is 54 km/hr, what is the length of the platform?',
    options: ['120 m', '240 m', '300 m', 'None of these'],
    correctAnswerIndex: 1,
    explanation:
        'Speed of train = 54 km/hr = 54 × (5/18) = 15 m/sec.\nLength of the train = (Speed × time to pass man) = 15 × 20 = 300 m.\nLet length of platform be L.\n(L + 300) / 15 = 36  ⇒  L + 300 = 540  ⇒  L = 240 m.',
  ),
  QuestionModel(
    id: 2,
    questionText:
        'A sum of money at simple interest amounts to \$815 in 3 years and to \$854 in 4 years. The sum is:',
    options: ['\$650', '\$690', '\$698', '\$700'],
    correctAnswerIndex: 2,
    explanation:
        'Simple Interest for 1 year = \$854 - \$815 = \$39.\nSI for 3 years = \$39 × 3 = \$117.\nPrincipal Sum = \$815 - \$117 = \$698.',
  ),
  QuestionModel(
    id: 3,
    questionText:
        'Two numbers are in the ratio 3 : 5. If 9 is subtracted from each, the new numbers are in the ratio 12 : 23. The smaller number is:',
    options: ['27', '33', '49', '55'],
    correctAnswerIndex: 1,
    explanation:
        'Let numbers be 3x and 5x.\n(3x - 9) / (5x - 9) = 12 / 23\n23(3x - 9) = 12(5x - 9)\n69x - 207 = 60x - 108\n9x = 99  ⇒  x = 11.\nSmaller number = 3 × 11 = 33.',
  ),
  QuestionModel(
    id: 4,
    questionText:
        'If A can do a piece of work in 6 days and B can do the same in 12 days, how long will they take working together?',
    options: ['3 days', '4 days', '5 days', '6 days'],
    correctAnswerIndex: 1,
    explanation:
        'A\'s 1 day work = 1/6.\nB\'s 1 day work = 1/12.\nCombined 1 day work = 1/6 + 1/12 = 3/12 = 1/4.\nTotal time taken = 4 days.',
  ),
  QuestionModel(
    id: 5,
    questionText:
        'What is the compound interest on \$10,000 at 10% per annum for 2 years compounded annually?',
    options: ['\$2,000', '\$2,100', '\$2,200', '\$2,500'],
    correctAnswerIndex: 1,
    explanation:
        'Amount = P(1 + r/100)^t = 10000(1 + 10/100)^2 = 10000 × (1.1)^2 = \$12,100.\nCompound Interest = \$12,100 - \$10,000 = \$2,100.',
  ),
  QuestionModel(
    id: 6,
    questionText:
        'A vendor bought toffees at 6 for a rupee. How many for a rupee must he sell to gain 20%?',
    options: ['3', '4', '5', '6'],
    correctAnswerIndex: 2,
    explanation:
        'CP of 6 toffees = Re 1  ⇒  CP of 1 toffee = Re 1/6.\nSP of 1 toffee = (120/100) × (1/6) = 1/5.\nFor Re 1, number of toffees sold = 5.',
  ),
  QuestionModel(
    id: 7,
    questionText:
        'Find the average of all prime numbers between 30 and 50.',
    options: ['39.8', '38', '41', '37'],
    correctAnswerIndex: 0,
    explanation:
        'Prime numbers between 30 and 50 are: 31, 37, 41, 43, 47.\nSum = 31 + 37 + 41 + 43 + 47 = 199.\nAverage = 199 / 5 = 39.8.',
  ),
  QuestionModel(
    id: 8,
    questionText:
        'A watch is sold for \$440 at a loss of 12%. What was the cost price of the watch?',
    options: ['\$480', '\$500', '\$520', '\$550'],
    correctAnswerIndex: 1,
    explanation:
        'SP = 88% of CP.\n440 = (88/100) × CP  ⇒  CP = (440 × 100) / 88 = \$500.',
  ),
  QuestionModel(
    id: 9,
    questionText:
        'If log2(x) = 5, then the value of x is:',
    options: ['10', '25', '32', '64'],
    correctAnswerIndex: 2,
    explanation:
        'Logarithmic definition: log_b(a) = c  ⇒  b^c = a.\nHere 2^5 = x  ⇒  x = 32.',
  ),
  QuestionModel(
    id: 10,
    questionText:
        'The perimeter of a square is 48 cm. What is its area?',
    options: ['96 cm²', '120 cm²', '144 cm²', '196 cm²'],
    correctAnswerIndex: 2,
    explanation:
        'Perimeter = 4 × side = 48 cm  ⇒  side = 12 cm.\nArea = side² = 12 × 12 = 144 cm².',
  ),
  QuestionModel(
    id: 11,
    questionText:
        'In how many different ways can the letters of the word "LEADING" be arranged so that the vowels always come together?',
    options: ['360', '480', '720', '5040'],
    correctAnswerIndex: 2,
    explanation:
        'Word "LEADING" has 7 letters with vowels: E, A, I (3 vowels) and consonants: L, D, N, G (4 consonants).\nTreat (E,A,I) as 1 group.\nTotal units to arrange = 4 consonants + 1 group = 5 units → 5! = 120 ways.\nVowels inside group can be arranged in 3! = 6 ways.\nTotal arrangements = 120 × 6 = 720 ways.',
  ),
  QuestionModel(
    id: 12,
    questionText:
        'The speed of a boat in still water is 15 km/hr and the rate of current is 3 km/hr. Find the distance traveled downstream in 12 minutes.',
    options: ['1.8 km', '2.4 km', '3.6 km', '4.2 km'],
    correctAnswerIndex: 2,
    explanation:
        'Downstream speed = 15 + 3 = 18 km/hr.\nTime = 12 minutes = 12/60 hour = 1/5 hour.\nDistance = Speed × Time = 18 × (1/5) = 3.6 km.',
  ),
  QuestionModel(
    id: 13,
    questionText:
        'What is the probability of getting a sum of 9 when two dice are thrown simultaneously?',
    options: ['1/6', '1/9', '1/12', '5/36'],
    correctAnswerIndex: 1,
    explanation:
        'Total sample space = 6 × 6 = 36 outcomes.\nFavorable outcomes for sum = 9: (3,6), (4,5), (5,4), (6,3) → 4 outcomes.\nProbability = 4/36 = 1/9.',
  ),
  QuestionModel(
    id: 14,
    questionText:
        'A tank can be filled by pipe A in 20 minutes and pipe B in 30 minutes. If both pipes are opened together, how long will it take to fill the tank?',
    options: ['10 min', '12 min', '15 min', '25 min'],
    correctAnswerIndex: 1,
    explanation:
        'A\'s rate = 1/20 tank/min.\nB\'s rate = 1/30 tank/min.\nCombined rate = 1/20 + 1/30 = (3+2)/60 = 5/60 = 1/12.\nTime required = 12 minutes.',
  ),
  QuestionModel(
    id: 15,
    questionText:
        'A, B and C start a business with investments of \$20,000, \$30,000 and \$40,000 respectively. Out of a total profit of \$18,000, find B\'s share.',
    options: ['\$4,000', '\$6,000', '\$8,000', '\$9,000'],
    correctAnswerIndex: 1,
    explanation:
        'Ratio of investments A : B : C = 2 : 3 : 4.\nSum of ratio parts = 2 + 3 + 4 = 9.\nB\'s share = (3/9) × 18,000 = \$6,000.',
  ),
  QuestionModel(
    id: 16,
    questionText:
        'The diagonal of a rectangle is 10 cm and its width is 6 cm. Find its area.',
    options: ['36 cm²', '48 cm²', '60 cm²', '80 cm²'],
    correctAnswerIndex: 1,
    explanation:
        'Using Pythagoras theorem: Length = √(10² - 6²) = √(100 - 36) = √64 = 8 cm.\nArea = Length × Width = 8 × 6 = 48 cm².',
  ),
  QuestionModel(
    id: 17,
    questionText:
        'What principal will yield \$120 interest at 6% simple interest per annum in 4 years?',
    options: ['\$400', '\$500', '\$600', '\$800'],
    correctAnswerIndex: 1,
    explanation:
        'SI = (P × R × T) / 100  ⇒  120 = (P × 6 × 4) / 100\n120 = 24P / 100  ⇒  P = (120 × 100) / 24 = \$500.',
  ),
  QuestionModel(
    id: 18,
    questionText:
        'If 15 men can complete a project in 20 days, how many men are needed to complete the same project in 12 days?',
    options: ['20 men', '22 men', '25 men', '30 men'],
    correctAnswerIndex: 2,
    explanation:
        'Man-days formula: M1 × D1 = M2 × D2.\n15 × 20 = M2 × 12  ⇒  300 = 12 × M2  ⇒  M2 = 300 / 12 = 25 men.',
  ),
  QuestionModel(
    id: 19,
    questionText:
        'Simplify: 128 / (16 / (4 / 2))',
    options: ['8', '16', '32', '64'],
    correctAnswerIndex: 1,
    explanation:
        'Inner bracket: (4 / 2) = 2.\nMiddle bracket: (16 / 2) = 8.\nOuter expression: 128 / 8 = 16.',
  ),
  QuestionModel(
    id: 20,
    questionText:
        'The average age of a class of 30 students is 15 years. If the teacher\'s age is included, the average becomes 16 years. What is the teacher\'s age?',
    options: ['40 years', '42 years', '46 years', '50 years'],
    correctAnswerIndex: 2,
    explanation:
        'Total age of 30 students = 30 × 15 = 450 years.\nTotal age of 31 people (students + teacher) = 31 × 16 = 496 years.\nTeacher\'s age = 496 - 450 = 46 years.',
  ),
];
