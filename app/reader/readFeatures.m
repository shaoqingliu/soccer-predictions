function [tTree mTree] = readFeatures(dataPath)
  loadUtilityConstants;
  tTree = buildType2AnyMap('char');
  mTree = buildType2AnyMap('char');
  T = buildTable(dataPath, 'matches.csv');
  n = height(T);
  i = 1;
  
  while (i <= n)
    [tTree homeTeam] = addTeam(T, i, tTree, true);
    [tTree awayTeam] = addTeam(T, i, tTree, false);
    mTree = addMatch(T, i, mTree, homeTeam, awayTeam, DATE_FORMAT);
    i = i + 1;
  end
end

function [tTree team] = addTeam(T, i, tTree, isHome)
  colHeader = 'Away';
  
  if (isHome)
    colHeader = 'Home';
  end
  
  teamName = char(T{i, strcat(colHeader, 'Team')});
  
  if (~isKey(tTree, teamName))
    tTree(teamName) = makeTeam(T, i, teamName);
  end
  
  team = tTree(teamName);
end

function mTree = addMatch(T, i, mTree, homeTeam, awayTeam, ...
    dateOutFormat)
  match = makeMatch(T, i, homeTeam, awayTeam, dateOutFormat);
  
  if (isKey(mTree, match.date))
    mTree(match.date) = [mTree(match.date) match];
  else
    mTree(match.date) = [match];
  end
end

function team = makeTeam(T, i, teamName)
  team = Team;
  team.name = teamName;
  team.str = [1 1];
  team.xp = 0;
end

function match = makeMatch(T, i, homeTeam, awayTeam, dateOutFormat)
  dateInFormat = 'mm/dd/yy';
  match = Match;
  match.contest = char(T{i, 'Contest'});
  match.date = datestr(datenum(char(T{i, 'Date'}), dateInFormat), ...
      dateOutFormat);
  match.id = i;
  match.teams = [homeTeam awayTeam];
  match.goals = [T{i, 'HomeGoals'} T{i, 'AwayGoals'}];
  match.homeAdvantage = T{i, 'HomeAdvantage'};
end