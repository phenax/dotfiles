
const pathMap: Record<keyof DeleteProfileStateSchema['states'], string> = {
  findMatches: 'find-matches',
  'findMatches.throughShaadi': 'find-matches/through-shaadi',
};

const getPath = state => `/delete/${pathMap[state]}`;

<Route path={getPath('findMatches')} />


<Switch>
  <Route path={getPath('findMatches.throughShaadi')} />
</Switch>
