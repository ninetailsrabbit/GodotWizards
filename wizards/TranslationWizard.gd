## https://docs.godotengine.org/en/stable/tutorials/i18n/locales.html
class_name TranslationWizard

enum LANGUAGES {
	ENGLISH,
	CZECH,
	DANISH,
	GERMAN,
	GREEK,
	ESPERANTO,
	SPANISH,
	FRENCH,
	INDONESIAN,
	ITALIAN,
	LATVIAN,
	POLISH,
	PORTUGUESE_BRAZILIAN,
	PORTUGUESE,
	RUSSIAN,
	CHINESE_SIMPLIFIED,
	CHINESE_TRADITIONAL,
	NORWEGIAN_BOKMAL,
	HUNGARIAN,
	ROMANIAN,
	KOREAN,
	TURKISH,
	JAPANESE,
	UKRAINIAN
}

const AVAILABLE_LANGUAGES = {
	LANGUAGES.ENGLISH: ["en", "en_US", "English", "English"],
	LANGUAGES.FRENCH: ["fr", "fr_FR", "Français", "French"],
	LANGUAGES.CZECH: ["cs", "cs_CZ", "Czech", "Czech"],
	LANGUAGES.DANISH: ["da", "da_DK", "Dansk", "Danish"],
	LANGUAGES.GERMAN: ["de", "de_DE", "Deutsch", "German"],
	LANGUAGES.GREEK: ["el", "el_GR", "Ελληνικά", "Greek"],
	LANGUAGES.ESPERANTO: ["eo", "eo_UY", "Esperanto", "Esperanto"],
	LANGUAGES.SPANISH: ["es", "es_ES", "Español", "Spanish"],
	LANGUAGES.INDONESIAN: ["id", "id_ID", "Indonesian", "Indonesian"],
	LANGUAGES.ITALIAN: ["it", "it_IT", "Italiano", "Italian"],
	LANGUAGES.LATVIAN: ["lv", "lv_LV", "Latvian", "Latvian"],
	LANGUAGES.POLISH: ["pl", "pl_PL", "Polski", "Polish"],
	LANGUAGES.PORTUGUESE_BRAZILIAN: ["pt_BR", "pt_BR", "Português Brasileiro", "Brazilian Portuguese"],
	LANGUAGES.PORTUGUESE: ["pt", "pt_PT", "Português", "Portuguese"],
	LANGUAGES.RUSSIAN: ["ru", "ru_RU", "Русский", "Russian"],
	LANGUAGES.CHINESE_SIMPLIFIED: ["zh_CN", "zh_CN", "简体中文", "Chinese Simplified"],
	LANGUAGES.CHINESE_TRADITIONAL: ["zh_TW", "zh_TW", "繁體中文", "Chinese Traditional"],
	LANGUAGES.NORWEGIAN_BOKMAL: ["nb", "nb_NO", "Norsk Bokmål", "Norwegian Bokmål"],
	LANGUAGES.HUNGARIAN: ["hu", "hu_HU", "Magyar", "Hungarian"],
	LANGUAGES.ROMANIAN: ["ro", "ro_RO", "Română", "Romanian"],
	LANGUAGES.KOREAN: ["ko", "ko_KR", "한국어", "Korean"],
	LANGUAGES.TURKISH: ["tr", "tr_TR", "Türkçe", "Turkish"],
	LANGUAGES.JAPANESE: ["ja", "ja_JP", "日本語", "Japanese"],
	LANGUAGES.UKRAINIAN: ["uk", "uk_UA", "Українська", "Ukrainian"]
}


static func english() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.ENGLISH]

static func french() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.FRENCH]

static func czech() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.CZECH]

static func danish() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.DANISH]

static func german() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.GERMAN]

static func greek() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.GREEK]

static func esperanto() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.ESPERANTO]

static func spanish() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.SPANISH]

static func indonesian() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.INDONESIAN]

static func italian() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.ITALIAN]

static func latvian() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.LATVIAN]

static func polish() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.POLISH]

static func portuguese_brazilian() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.PORTUGUESE_BRAZILIAN]
	
static func russian() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.RUSSIAN]

static func chinese_simplified() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.CHINESE_SIMPLIFIED]

static func chinese_traditional() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.CHINESE_TRADITIONAL]

static func norwegian_bokmal() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.NORWEGIAN_BOKMAL]

static func hungarian() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.HUNGARIAN]

static func romanian() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.ROMANIAN]

static func korean() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.KOREAN]

static func turkish() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.TURKISH]

static func japanese() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.JAPANESE]

static func ukrainian() -> Array:
	return AVAILABLE_LANGUAGES[LANGUAGES.UKRAINIAN]
