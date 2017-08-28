(defun disable-all-enabled-themes ()
  (-map #'disable-theme custom-enabled-themes))


(defun not-current? (theme)
  (not (eq (car custom-enabled-themes)
           theme)))

(defun not-shit? (theme)
  ;; dammit subatomic256!!
  (not (or (eq 'subatomic theme)
           (eq 'zonokai theme)
           (eq 'apropospriate theme)
           (eq 'hemisu theme)
           (eq 'solarized theme)
           (eq 'tao theme))))


(defun remaining ()
  (cdr (-drop-while #'not-current?
                    (-filter #'not-shit?
                             (custom-available-themes)))))

(defun next ()
  (or  (car (remaining))
       (car (custom-available-themes))))


(defun load-theme! (theme)
  (progn
    (disable-all-enabled-themes)
    (load-theme theme t)))

(defun load-next1 ()
  (progn
    (let ((next (next)))
      (load-theme! next)
      `[curr: ,next || remaining: ,(length (remaining))])))

(defun insert-curr-at-point ()
  (insert (concat "\n;; "
                  (symbol-name (car custom-enabled-themes)))))

(lambda playground ()

  (disable-all-enabled-themes)
  custom-enabled-themes
  (remaining)
  (next)
  (load-next1)

  (load-theme! 'apropospriate-light)

  )


;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(insert-curr-at-point)

darktooth
farmhouse-light
firebelly
gruvbox
gruvbox-dark-hard
gruvbox-dark-medium
gruvbox-dark-soft
gruvbox-light-soft
hc-zenburn
jazz
majapahit-dark
majapahit-light
material
material-light
minimal
minimal-light
molokai
monokai
nord
obsidian
oldlace
omtose-softer
phoenix-dark-pink
planet
purple-haze
sanityinc-solarized-dark
sanityinc-solarized-light
sanityinc-tomorrow-day
sanityinc-tomorrow-night
seti
smyx
soft-charcoal
solarized
sunny-day
tango-plus
tao
tao-yin
twilight-bright
zenburn
zonokai-blue
