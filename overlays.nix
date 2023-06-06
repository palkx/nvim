{inputs, ...}: {
  overlays = [
    (final: prev: {
      inherit (inputs.groovyls.packages.${final.system}) groovyls;
    })
  ];
}
