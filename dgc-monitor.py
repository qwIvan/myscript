import scrapy
import js2py
import time
import requests
from bs4 import BeautifulSoup
from pushbullet import PushBullet


def jschl(tag, domain='www.dgchost.net'):
    snippet, obj = '', None
    for line in tag.splitlines():
        if 's,t,o,p,b,r,e,a,k,i,n,g' in line and ' ' in line:
            define = line.rsplit(' ', maxsplit=1)[-1]
            if '=' in define and define.endswith(';'):
                obj = define.split('=')[0]
                snippet += define
        if 'submit()' in line:
            break
        if obj:
            for seg in line.split(';'):
                if seg.startswith(obj) and '=' in seg:
                    snippet += seg + ';'
    return js2py.eval_js(snippet) + len(domain)


class DGC(scrapy.Spider):
    name = 'dgc'
    handle_httpstatus_list = [503]
    start_urls = ['https://www.dgchost.net/client/cart.php?a=add&pid=58']
    custom_settings = {
        'RETRY_HTTP_CODES': [],
        'COOKIES_DEBUG': True,
    }

    def parse(self, response):
        # print(response.text)
        print('cookies:', response.request.cookies)
        if response.status == 503:
            tag = response.css('script').get()
            answer = jschl(tag)
            form = response.css('form')
            params = '&'.join(['='.join([i.xpath('@name').get(), i.xpath('@value').get() or '']) for i in form.css('input')])
            params += str(answer)
            time.sleep(4)
            yield response.follow('https://www.dgchost.net' + form.xpath('@action').get() + '?' + params)
        elif response.status == 200:
            if 'Out of Stock' in response.text:
                print('Out of Stock')


if __name__ == '__main__':
    session = requests.Session()
    resp = session.get('https://www.dgchost.net/client/cart.php?a=add&pid=58')
    soup = BeautifulSoup(resp.text, 'lxml')
    tag = soup.select_one('script').text
    answer = jschl(tag)
    form = soup.select_one('form')
    params = dict([(i['name'], i.get('value', None)) for i in form.select('input')])
    params['jschl_answer'] = answer
    params = '&'.join(['='.join([i['name'], i.get('value', '')]) for i in form.select('input')])
    params += str(answer)
    time.sleep(4)
    # session.get('https://www.dgchost.net' + form['action'], params=params, allow_redirects=False)
    session.get('https://www.dgchost.net' + form['action'] + '?' + params, allow_redirects=False)
    print('new session', session.cookies.get_dict())
    resp = session.get('https://www.dgchost.net/client/cart.php?a=add&pid=58')
    if 'Out of Stock' in resp.text:
        print('Out of Stock')
    else:
        pb = PushBullet('o.7UUdxcheLn4zVTwx0h6YARFiBLqADXd8')
        chrome = pb.get_device('Chrome')
        n5 = pb.get_device('LGE Nexus 5')
        chrome.push_link('dgc', 'https://www.dgchost.net/client/cart.php?gid=10')
        n5.push_link('dgc', 'https://www.dgchost.net/client/cart.php?gid=10')
