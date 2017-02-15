(defun disable-all-enabled-themes ()
  (-map #'disable-theme custom-enabled-themes))

(defun not-current? (theme)
  (not (eq (car custom-enabled-themes)
           theme)))

(defun not-subatomic? (theme)
  ;; dammit subatomic256!!
  (not (eq 'subatomic theme)))

(defun remaining ()
  (cdr (-drop-while #'not-current?
                    (-filter #'not-subatomic?
                             (custom-available-themes)))))
(remaining)

(defun next ()
  (or  (car (remaining))
       (car (custom-available-themes))))

(next)

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


(load-next1)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
(insert-curr-at-point)

;; seti
soft-charcoal
tao
zenburn
sanityinc-solarized-light
sanityinc-solarized-dark
sanityinc-tomorrow-night
sanityinc-tomorrow-day
solarized
darktooth
farmhouse-light
firebelly
gruvbox
hc-zenburn
jazz
majapahit-light
majapahit-dark
molokai
monokai
obsidian
oldlace
