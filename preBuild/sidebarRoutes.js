const sidebars = require('../sidebars.js');
let sidebarRoutes = [];

function processSidebarItems(items, level) {
  for (let item of items) {
    if (item.type === 'doc') {
      sidebarRoutes.push({
        id: item.id,
        label: item.label,
        level: level,
      });
    } else if (item.type === 'category') {
      if (item.link?.type === 'generated-index') {
        sidebarRoutes.push({
          id: 'gen-index-' + item.label.toLowerCase(),
          label: item.label,
          level: level,
        });
      } else {
        sidebarRoutes.push({
          id: item.link.id,
          label: item.label,
          level: level,
        });
      }
      processSidebarItems(item.items, level + 1);
    }
  }
}

processSidebarItems(sidebars.tutorialSidebar, 0);

module.exports = sidebarRoutes;