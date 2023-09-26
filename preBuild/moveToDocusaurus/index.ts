import * as fs from 'fs';
const sidebarRoutes = require('../sidebarRoutes');
const fromDir = "_docs"
const toDir = "docs"

for (const { id: routeId } of sidebarRoutes) {
  const from = `${fromDir}/${routeId}.md`;
  const to = `${toDir}/${routeId}.md`;
  if (!fs.existsSync(from)) continue;
  const content = fs.readFileSync(from, "utf8");
  try {
    const oldContent = fs.readFileSync(to, "utf8");
    // skip writing if unchanged
    if(content === oldContent) continue;
  } catch {} // dismiss error when `to` does not exist
  fs.writeFileSync(to, content);
}
