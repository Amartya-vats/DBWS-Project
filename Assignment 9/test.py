import re

pages = {
    '/~avats/admin_auth.php': r'\/~avats\/admin_auth\.php',
    '/~avats/admin_login.php': r'\/~avats\/admin_login\.php',
    '/~avats/failure.php': r'\/~avats\/failure\.php',
    '/~avats/general_account.php': r'\/~avats\/general_account\.php',
    '/~avats/index.php': r'\/~avats\/index\.php',
    '/~avats/': r'\/~avats\/',
    '/~avats/Info_for_sub_type.php': r'\/~avats\/Info_for_sub_type\.php',
    '/~avats/logout.php': r'\/~avats\/logout\.php',
    '/~avats/magazine.php': r'\/~avats\/magazine\.php',
    '/~avats/maintenance.php': r'\/~avats\/maintenance\.php',
    '/~avats/music_streaming.php': r'\/~avats\/music_streaming\.php',
    '/~avats/registration.php': r'\/~avats\/registration\.php',
    '/~avats/related_account.php': r'\/~avats\/related_account\.php',
    '/~avats/search_pages.php': r'\/~avats\/search_pages\.php',
    '/~avats/show_general_accounts.php': r'\/~avats\/show_general_accounts\.php',
    '/~avats/single_row.php': r'\/~avats\/single_row\.php',
    '/~avats/software_suites.php': r'\/~avats\/software_suites\.php',
    '/~avats/video_streaming.php': r'\/~avats\/video_streaming\.php',
    '/~avats/view_account_details.php': r'\/~avats\/view_account_details\.php',
    '/~avats/VPN.php': r'\/~avats\/VPN\.php'
}

count = {
    '/~avats/admin_auth.php': 0,
    '/~avats/admin_login.php': 0,
    '/~avats/failure.php': 0,
    '/~avats/general_account.php': 0,
    '/~avats/index.php': 0,
    '/~avats/': 0,
    '/~avats/Info_for_sub_type.php': 0,
    '/~avats/logout.php': 0,
    '/~avats/magazine.php': 0,
    '/~avats/maintenance.php': 0,
    '/~avats/music_streaming.php': 0,
    '/~avats/registration.php': 0,
    '/~avats/related_account.php': 0,
    '/~avats/search_pages.php': 0,
    '/~avats/show_general_accounts.php': 0,
    '/~avats/single_row.php': 0,
    '/~avats/software_suites.php': 0,
    '/~avats/video_streaming.php': 0,
    '/~avats/view_account_details.php': 0,
    '/~avats/VPN.php': 0
}

count2 = {
    'admin_auth': 0,
    'admin_login': 0,
    'failure': 0,
    'general_account': 0,
    'index': 0,
    'Info_for_sub_type': 0,
    'logout': 0,
    'magazine': 0,
    'maintenance': 0,
    'music_streaming': 0,
    'registration': 0,
    'related_account': 0,
    'search_pages': 0,
    'show_general_accounts': 0,
    'single_row': 0,
    'software_suites': 0,
    'video_streaming': 0,
    'view_account_details': 0,
    'VPN': 0
}

if __name__ == '__main__':
    line = '10.81.137.207 - - [11/Nov/2020:01:08:11 +0100] "GET /~avats/maintenance.php HTTP/1.1" 200 2395 "http://clabsql.clamv.jacobs-university.de/~avats/search_pages.php" "Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/85.0.4183.83 Safari/537.36"'
    pattern3 = re.compile(r'"\s"(\w|\W)*"')
    browser = pattern3.finditer(line)
    for match in browser:
        print(match.group(0)[3:-1])