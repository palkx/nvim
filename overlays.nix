{inputs, ...}: {
  overlays = [
    (final: prev: {
      inherit (inputs.groovyls.packages.${final.system}) groovyls;
      inherit (inputs.npm-groovy-lint.packages.${final.system}) npm-groovy-lint;
    })
  ];
}
