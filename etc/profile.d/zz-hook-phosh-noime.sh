LIBRARY="libhook-phosh-noime.so"

case "${LD_PRELOAD}" in
	*${LIBRARY}*)
		# Already there
		return 0
		;;
	"")
		;;
	*)
		LIBRARY="${LIBRARY}:"
		;;
esac

export LD_PRELOAD="${LIBRARY}${LD_PRELOAD}"
