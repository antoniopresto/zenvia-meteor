Package.describe({
  name: 'presto:zenvia',
  version: '0.0.4',
  // Brief, one-line summary of the package.
  summary: 'Simple Zenvia SMS integration',
  // URL to the Git repository containing the source code for this package.
  git: 'https://github.com/smartdemocracy/zenvia-meteor.git',
  // By default, Meteor will default to using README.md for documentation.
  // To avoid submitting documentation, set this field to null.
  documentation: 'README.md'
});

Npm.depends({
  'request': '2.58.0'
});

Package.onUse(function(api) {
  api.use('coffeescript');
  api.versionsFrom('0.9.0');
  api.addFiles('zenvia.coffee', 'server');
});

Package.onTest(function(api) {
  api.use('tinytest');
  api.use('zenvia');
  api.addFiles('zenvia-tests.js');
});
