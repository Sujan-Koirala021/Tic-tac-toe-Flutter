List buttonList = [];
List oList = [];
List xList = [];
List boxText = ["", "", "", "", "", "", "", "", ""];
bool isOTurn = true;

//   Winning posture (Child list)
List ticTacWin = [
  [1, 2, 3],
  [4, 5, 6],
  [7, 8, 9],
  [1, 4, 7],
  [2, 5, 8],
  [3, 6, 9],
  [1, 5, 9],
  [3, 5, 7]
];

void resetGlobals() {
  buttonList = [];
  oList = [];
  xList = [];
  boxText = ["", "", "", "", "", "", "", "", ""];
  isOTurn = true;
}

void checkWin() {
  Set oSet = Set.of(oList);
  Set xSet = Set.of(xList);

  for (int i = 0; i < ticTacWin.length; i++) {
    bool oWins = oSet.containsAll(ticTacWin[i]);
    bool xWins = xSet.containsAll(ticTacWin[i]);
    if (oWins) print("O wins");
    if (xWins) print("X wins");

  }
}
