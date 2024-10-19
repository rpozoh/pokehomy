'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "d53f370fbbb0281bfe095572c82bd182",
"assets/AssetManifest.bin.json": "5c0294af129af606398d324c36d79cc8",
"assets/AssetManifest.json": "e0b2f691fe1570b540ea9e907fe9f1ee",
"assets/assets/images/absol.png": "f83221812bfcf409615e87fe1860e6d0",
"assets/assets/images/aegislash.png": "3167ecdefb6f7ce41ef2cdddf4258545",
"assets/assets/images/alolan-ninetales.png": "e62f1393c6ec857de0680f33fb6181e2",
"assets/assets/images/armarouge.png": "1bcab2f7132f540d7cd32cd6254b20eb",
"assets/assets/images/azumarill.png": "e2d898c5bf0d7c08cd77dcf97c5eb10d",
"assets/assets/images/blastoise.png": "0d8d45984c58b3ceaecdd471ac1b10d1",
"assets/assets/images/blaziken.png": "0ae12f4dd94603a144feed05fc67174d",
"assets/assets/images/blissey.png": "f80b955539989535fc1036c730433608",
"assets/assets/images/buzzwole.png": "8941b92d9087f3a014563c3fc89ff51f",
"assets/assets/images/ceruledge.png": "6abc21db05bfe60d0d6eef82a6e263cc",
"assets/assets/images/chandelure.png": "7fd2d839e14b465a4299bbda931ff9d9",
"assets/assets/images/charizard.png": "cfa1376c475e4d98279436f17890a732",
"assets/assets/images/cinderace.png": "751136a795a342b250403283045482af",
"assets/assets/images/clefable.png": "4b31c1842a03d7856336e13fa0fcf50d",
"assets/assets/images/comfey.png": "8f777598a9b0d46bcd0b187e6d95cb7a",
"assets/assets/images/cramorant.png": "486955b58af274d60c04079159fd534e",
"assets/assets/images/crustle.png": "84f04da4a0f8005321f8bea5c28beb40",
"assets/assets/images/darkrai.png": "d40c89ac55ea9ffc2c75f5a416e215d6",
"assets/assets/images/decidueye.png": "e997b6953fee4740b09adbab8cb0c0ce",
"assets/assets/images/default.png": "3c531a8dd178aa71057183ac8c0dee13",
"assets/assets/images/delphox.png": "c512374bcc034e4bcf36caa27cb54b52",
"assets/assets/images/dodrio.png": "75d505e8087251dd6cb85776395aa4ab",
"assets/assets/images/dragapult.png": "3b5b2095c7ea2c7770e9150bd94cb16d",
"assets/assets/images/dragonite.png": "66ecefca21eef93d24a243d19255030b",
"assets/assets/images/duraludon.png": "a0dcfcfe6227100435ce88a8ed34c937",
"assets/assets/images/eldegoss.png": "e11d55c20423bef05c8b24249400faf4",
"assets/assets/images/espeon.png": "2fb0d5f1242e4fe739f8bc950c91e00e",
"assets/assets/images/falinks.png": "037edf8c8799b79e4d915b74b7f3a487",
"assets/assets/images/garchomp.png": "7c0dff5fbaa00bfc4644dbfaf6157b4c",
"assets/assets/images/gardevoir.png": "d74d85e5478187d77869221eb7ff8545",
"assets/assets/images/gengar.png": "a0394a144580e985af4fc3cd1946eb59",
"assets/assets/images/glaceon.png": "cab9514699ef9791eec047099f22043b",
"assets/assets/images/goodra.png": "bb8fe2817d10a0fb6e2f511183ca83d0",
"assets/assets/images/greedent.png": "3522a747615b37a93970ffca44d46d0b",
"assets/assets/images/greninja.png": "9304f32bca4b429ba1672d08150a8b4f",
"assets/assets/images/gyarados.png": "858c72e89bde1b486970ce19a3319c8c",
"assets/assets/images/ho-oh.png": "ebfe8ed179fe22b9a3cd6c344e3fe85b",
"assets/assets/images/hoopa.png": "6aa9c1bbf187423c1e0e2c968b84743a",
"assets/assets/images/inteleon.png": "da23890881f51b0d1fb7df394ca8d84c",
"assets/assets/images/lapras.png": "fc127327833b0b890b7633871a863205",
"assets/assets/images/leafeon.png": "639c39f97737a831c4501247993a7f25",
"assets/assets/images/lucario.png": "39a9b96446aa1fc41e6d24dec530f33e",
"assets/assets/images/machamp.png": "be42f329f335c70aa867187126bd948a",
"assets/assets/images/mamoswine.png": "a6207e6a04f82430673ab57ceb1e6360",
"assets/assets/images/meowscarada.png": "aba6f1b6fe71af9f8f50c8874e52afd5",
"assets/assets/images/metagross.png": "5e774acf56376b6796fd6ed26f46c817",
"assets/assets/images/mew.png": "9591a9fefc6c08c878a6a074d67976c9",
"assets/assets/images/mewtwoX.png": "89566401ffa7e5ea5abb361b3b988353",
"assets/assets/images/mewtwoY.png": "da802e05a88ba7410ac9c3a0ec8c0e18",
"assets/assets/images/mimikyu.png": "456a57c8dbd35eda31d52143d28210bb",
"assets/assets/images/miraidon.png": "f9ff3b46505231ed75b146f4604f2cec",
"assets/assets/images/mr-mime.png": "0bd54b9fd2559b3c2c887a073e976493",
"assets/assets/images/pikachu.png": "b95badb09a4595673c4712041e30ad03",
"assets/assets/images/psyduck.png": "7146ce8a6a916650e3a8b0e8d0e4b9c6",
"assets/assets/images/sableye.png": "d96144a71d63ebf7b78b47619b6888e8",
"assets/assets/images/scizor.png": "a36bbf9c967a45030dd7ec3c4576549c",
"assets/assets/images/slowbro.png": "f64864f11fba557167f8c9bb3e965acb",
"assets/assets/images/snorlax.png": "14cbea513f8881ddbf84c23d0660938f",
"assets/assets/images/sylveon.png": "0db1d729b1f9f2e51cc38a406ccbb4c3",
"assets/assets/images/talonflame.png": "2753c9d3926fcd0b258ab2d3bc724624",
"assets/assets/images/trevenant.png": "8fd6bb680ed52113fbfd60dd37457aa1",
"assets/assets/images/tsareena.png": "f3be5e130baab5e85adb0ab2b8d81f6f",
"assets/assets/images/tyranitar.png": "811174aea6bea6061a77fb88f27f70b0",
"assets/assets/images/umbreon.png": "b79918971e484027d23335cff3c06415",
"assets/assets/images/urshifu.png": "792741e6bcf17b57c8e105d130dd45d5",
"assets/assets/images/venusaur.png": "4014b0ffaeef570e561b628f59313366",
"assets/assets/images/wigglytuff.png": "72a61451a7ce8e3c3ead4853d9329f49",
"assets/assets/images/zacian.png": "61454e3e6703716d7eabf51a4b51d62b",
"assets/assets/images/zeraora.png": "80d20b0054d3d7b72cefc102f4dd8343",
"assets/assets/images/zoroark.png": "0425ef7eec59355b8b966543a12683b3",
"assets/FontManifest.json": "5a32d4310a6f5d9a6b651e75ba0d7372",
"assets/fonts/MaterialIcons-Regular.otf": "32fce58e2acb9c420eab0fe7b828b761",
"assets/NOTICES": "09c5c408928a4ce43f2e54c7faa982f9",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "89ed8f4e49bcdfc0b5bfc9b24591e347",
"assets/packages/font_awesome_flutter/lib/fonts/fa-brands-400.ttf": "80a63aff7fdc78c8a1f22a1929b7164b",
"assets/packages/font_awesome_flutter/lib/fonts/fa-regular-400.ttf": "f3307f62ddff94d2cd8b103daf8d1b0f",
"assets/packages/font_awesome_flutter/lib/fonts/fa-solid-900.ttf": "04f83c01dded195a11d21c2edf643455",
"assets/shaders/ink_sparkle.frag": "4096b5150bac93c41cbc9b45276bd90f",
"canvaskit/canvaskit.js": "eb8797020acdbdf96a12fb0405582c1b",
"canvaskit/canvaskit.wasm": "73584c1a3367e3eaf757647a8f5c5989",
"canvaskit/chromium/canvaskit.js": "0ae8bbcc58155679458a0f7a00f66873",
"canvaskit/chromium/canvaskit.wasm": "143af6ff368f9cd21c863bfa4274c406",
"canvaskit/skwasm.js": "87063acf45c5e1ab9565dcf06b0c18b8",
"canvaskit/skwasm.wasm": "2fc47c0a0c3c7af8542b601634fe9674",
"canvaskit/skwasm.worker.js": "bfb704a6c714a75da9ef320991e88b03",
"favicon.png": "90f6d5afa6add31e0cdee6830d79cf94",
"flutter.js": "59a12ab9d00ae8f8096fffc417b6e84f",
"icons/Icon-192.png": "8463611bf4d29fe7bfb183f6508b05f4",
"icons/Icon-512.png": "325db30d3c7972adc21421357a41c7c5",
"icons/Icon-maskable-192.png": "8463611bf4d29fe7bfb183f6508b05f4",
"icons/Icon-maskable-512.png": "325db30d3c7972adc21421357a41c7c5",
"index.html": "b1caa0507329136f12aa8677b61b8849",
"/": "b1caa0507329136f12aa8677b61b8849",
"main.dart.js": "01c7475966027f9cec49a2c35e79acd7",
"manifest.json": "a2603969a23eaf8e0087acb3f6b5ef3f",
"version.json": "826605dc04359a56efa6d950c9238b77"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"assets/AssetManifest.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
