// @ts-nocheck
// This file uses Flutter build-time template syntax ({{ }}) which is replaced
// by the Flutter toolchain before serving. IDE lint errors here are expected and harmless.
{{flutter_js}}

{{flutter_build_config}}

_flutter.loader.load({
  serviceWorkerSettings: {
    serviceWorkerVersion: {{flutter_service_worker_version}},
  },
  onEntrypointLoaded: async function(engineInitializer) {
    let appRunner = await engineInitializer.initializeEngine({
      renderer: "canvaskit",
      canvasKitVariant: "chromium",
    });
    await appRunner.runApp();
  }
});
