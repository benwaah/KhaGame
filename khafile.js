var project = new Project('LiveGame');

project.addAssets('Assets/**');
project.addSources('Sources');
project.addLibrary('minject');
project.addLibrary('continuation');

return project;
