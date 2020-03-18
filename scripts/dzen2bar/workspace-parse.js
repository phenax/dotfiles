const [ command, str, ...args ] = process.argv.slice(2);

const MAX_WORKSPACES = 10;

const parse = str => {
  const ws = str.split(':').slice(1, MAX_WORKSPACES + 1);

  return ws.map(id => id
    .replace(/^f/, 'empty ')
    .replace(/^(O|F)/, 'active ')
    .replace(/^o/, 'filled ')
  );
};

const getNonEmpty = workspaces =>
  workspaces.filter(id => !id.startsWith('empty'));

const getWorkspace = n => workspaces => workspaces[n - 1];


const workspaces = parse(str);

switch (command) {
  case 'active': result = getNonEmpty(workspaces); break;
  case 'get':
    const [num] = args;
    result = [getWorkspace(Number(num))(workspaces)];
    break;
  default: result = workspaces; break;
}

console.log(result.join('   '));

