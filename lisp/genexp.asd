; genexp : generate expression randomly
(defsystem :genexp
  :description "genexp: generate expressions randomluy"
  :version "0.1"
  :author "Shinichi OMURA(song.of.sand@gmail.com)"
  :licence "Apache"
  :serial t
  :components
    (
      (:file genexp-package)
      (:file gen-symbol)
      (:file gen-term)
    )
)
