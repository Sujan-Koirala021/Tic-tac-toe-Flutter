List buttonList = [];
List oList = [];
List xList = [];
List availableButtonList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
bool oWins = false;
bool xWins = false;

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
  availableButtonList = [1, 2, 3, 4, 5, 6, 7, 8, 9];
  oWins = false;
  xWins = false;
}

void checkWin() {
  //  Convert lists to sets
  Set oSet = Set.of(oList);
  Set xSet = Set.of(xList);

  for (int i = 0; i < ticTacWin.length; i++) {
    //  Check if set contains winning combo
    oWins = oSet.containsAll(ticTacWin[i]);
    xWins = xSet.containsAll(ticTacWin[i]);
    if (oWins) break;
    if (xWins) break;
    if (!oWins && !xWins && availableButtonList.isEmpty) break;

  }
}

bool isValid(int index) {
  //  Check if the button is occupied
  if (availableButtonList.contains(index)) {
    return true;
  } else {
    return false;
  }
}
