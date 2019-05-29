Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1F342DDBB
	for <lists+freedreno@lfdr.de>; Wed, 29 May 2019 15:08:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 627D48901F;
	Wed, 29 May 2019 13:08:27 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x143.google.com (mail-lf1-x143.google.com
 [IPv6:2a00:1450:4864:20::143])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DD6798901F
 for <freedreno@lists.freedesktop.org>; Wed, 29 May 2019 13:08:25 +0000 (UTC)
Received: by mail-lf1-x143.google.com with SMTP id y13so1996534lfh.9
 for <freedreno@lists.freedesktop.org>; Wed, 29 May 2019 06:08:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:subject:to:cc:references:from:openpgp:autocrypt
 :message-id:date:mime-version:in-reply-to:content-language
 :content-transfer-encoding;
 bh=/CpNHaur0JCUznHHnGtOPfrzDeuaNPXaSbiFGzeqYeo=;
 b=nDcro5J1SJdtTD9vG6UBAAR9Io8a4/pR1WJIgU53f8z7B9X7M3dk1x9UXMM5Fn2x+O
 IxXLHHEcAT1P1b8MLl1hoP036l4i8+0iH0nq1+sEIetO3oRf9gzAroe8wIoKYnz0689e
 zVcIieFL5UhuZWN9sfPX/Hhc/MJkvYa5f0Dn71M7biNKP8+zH3pmdASZmf3Z/TOhxngw
 HvndIgmDE30NoS7NRvoIbePMeNLzZv3WPxpY3JNr4hK14/Jdww8Vb8H1ElMwgMvpwcg2
 rXwgFLywUvd/iC3/7dv2puXHvPsrdhA6LODMbhqebFiqkesRn0eh6IePLONZJ/nlkT7k
 djSA==
X-Gm-Message-State: APjAAAU0nel1GbITMLfHVGN9KaLMmXfeI23EJASv5Wt6zWx2iuim9Suo
 GIF/5E/PwV75MHV06sJyyWUifQ==
X-Google-Smtp-Source: APXvYqwvl2EHpoMtj25pladUH3GfBC88lN+uk0l+0ZSmJ5F03BcGdq9r7IrimydFom9RHbicWEsPaA==
X-Received: by 2002:ac2:4c3c:: with SMTP id u28mr11156310lfq.136.1559135304341; 
 Wed, 29 May 2019 06:08:24 -0700 (PDT)
Received: from [10.44.66.8] ([212.45.67.2])
 by smtp.googlemail.com with ESMTPSA id z24sm3471962lfh.63.2019.05.29.06.08.19
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Wed, 29 May 2019 06:08:23 -0700 (PDT)
To: Rob Clark <robdclark@gmail.com>, dri-devel@lists.freedesktop.org
References: <20190508204219.31687-1-robdclark@gmail.com>
 <20190508204219.31687-6-robdclark@gmail.com>
From: Georgi Djakov <georgi.djakov@linaro.org>
Openpgp: preference=signencrypt
Autocrypt: addr=georgi.djakov@linaro.org; prefer-encrypt=mutual; keydata=
 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
 KEmKjLDvB0pePJkdTw==
Message-ID: <73ae9093-1348-b092-80f2-09c0d3d90975@linaro.org>
Date: Wed, 29 May 2019 16:08:16 +0300
MIME-Version: 1.0
In-Reply-To: <20190508204219.31687-6-robdclark@gmail.com>
Content-Language: en-US
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=subject:to:cc:references:from:openpgp:autocrypt:message-id:date
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/CpNHaur0JCUznHHnGtOPfrzDeuaNPXaSbiFGzeqYeo=;
 b=fiyYUhziklgcsU+tFUNEJYtehLkQLk60ClGKolnp8dHjqZza7Aay/Xi65RUu/nfuH1
 AzFkAM6/uUsN1bwEQl1oO1gz0JoYIZAFJZqSA+nKyUWBYiprdkuMVTx7c2e+Ogx4+TFR
 lGH4AvVI2HpBl3MVu7tZlEyc/5VSIRrwT0MWJG4ejvlWW8mklrYTJ7tivwXPOWYlcM5E
 rUXN7oJhvklu/0UH1Fg+c1cHNMJSeGNO+SPHM1yZdsEEYcyj2/rq9DipmF7S8Y/I5RvY
 jD7tK96MaYKx3Vd6wxzoydzb90hWQlLxghVTVtPVtBgn4+59fhLM9iFRYPs+tBdDziG9
 +oJg==
Subject: Re: [Freedreno] [PATCH 5/5] drm/msm/mdp5: Use the interconnect API
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
Precedence: list
List-Id: Freedreno graphics driver community testing & development
 <freedreno.lists.freedesktop.org>
List-Unsubscribe: <https://lists.freedesktop.org/mailman/options/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=unsubscribe>
List-Archive: <https://lists.freedesktop.org/archives/freedreno>
List-Post: <mailto:freedreno@lists.freedesktop.org>
List-Help: <mailto:freedreno-request@lists.freedesktop.org?subject=help>
List-Subscribe: <https://lists.freedesktop.org/mailman/listinfo/freedreno>,
 <mailto:freedreno-request@lists.freedesktop.org?subject=subscribe>
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 Daniel Vetter <daniel@ffwll.ch>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gNS84LzE5IDIzOjQyLCBSb2IgQ2xhcmsgd3JvdGU6Cj4gRnJvbTogR2VvcmdpIERqYWtvdiA8
Z2VvcmdpLmRqYWtvdkBsaW5hcm8ub3JnPgo+IAoKTGV0J3MgcHV0IHNvbWUgdGV4dCBpbiB0aGUg
Y29tbWl0IG1lc3NhZ2U6CgpUaGUgaW50ZXJjb25uZWN0IEFQSSBwcm92aWRlcyBhbiBpbnRlcmZh
Y2UgZm9yIGNvbnN1bWVyIGRyaXZlcnMgdG8gZXhwcmVzcwp0aGVpciBiYW5kd2lkdGggbmVlZHMg
aW4gdGhlIFNvQy4gVGhpcyBkYXRhIGlzIGFnZ3JlZ2F0ZWQgYW5kIHRoZSBvbi1jaGlwCmludGVy
Y29ubmVjdCBoYXJkd2FyZSBpcyBjb25maWd1cmVkIHRvIHRoZSBtb3N0IGFwcHJvcHJpYXRlIHBv
d2VyL3BlcmZvcm1hbmNlCnByb2ZpbGUuCgpVc2UgdGhlIEFQSSB0byBjb25maWd1cmUgdGhlIGlu
dGVyY29ubmVjdHMgYW5kIHJlcXVlc3QgYmFuZHdpZHRoIGJldHdlZW4gRERSIGFuZAp0aGUgZGlz
cGxheSBoYXJkd2FyZSAoTURQIHBvcnQocykgYW5kIHJvdGF0b3IgZG93bnNjYWxlcikuCgoKPiBT
aWduZWQtb2ZmLWJ5OiBHZW9yZ2kgRGpha292IDxnZW9yZ2kuZGpha292QGxpbmFyby5vcmc+Cj4g
U2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgo+IC0tLQo+
ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1X2ttcy5jIHwgMTQgKysrKysrKysr
KysrKysKPiAgMSBmaWxlIGNoYW5nZWQsIDE0IGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0
IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYyBiL2RyaXZlcnMvZ3B1
L2RybS9tc20vZGlzcC9tZHA1L21kcDVfa21zLmMKPiBpbmRleCA5NzE3OWJlYzg5MDIuLjU0ZDJi
NGMyYjA5ZiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2Rpc3AvbWRwNS9tZHA1
X2ttcy5jCj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kaXNwL21kcDUvbWRwNV9rbXMuYwo+
IEBAIC0xNiw2ICsxNiw3IEBACj4gICAqIHRoaXMgcHJvZ3JhbS4gIElmIG5vdCwgc2VlIDxodHRw
Oi8vd3d3LmdudS5vcmcvbGljZW5zZXMvPi4KPiAgICovCj4gIAo+ICsjaW5jbHVkZSA8bGludXgv
aW50ZXJjb25uZWN0Lmg+Cj4gICNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4KPiAgCj4gICNpbmNs
dWRlICJtc21fZHJ2LmgiCj4gQEAgLTEwNTAsNiArMTA1MSwxOSBAQCBzdGF0aWMgY29uc3Qgc3Ry
dWN0IGNvbXBvbmVudF9vcHMgbWRwNV9vcHMgPSB7Cj4gIAo+ICBzdGF0aWMgaW50IG1kcDVfZGV2
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIHsKPiArCXN0cnVjdCBpY2Nf
cGF0aCAqcGF0aDAgPSBvZl9pY2NfZ2V0KCZwZGV2LT5kZXYsICJwb3J0MCIpOwo+ICsJc3RydWN0
IGljY19wYXRoICpwYXRoMSA9IG9mX2ljY19nZXQoJnBkZXYtPmRldiwgInBvcnQxIik7Cj4gKwlz
dHJ1Y3QgaWNjX3BhdGggKnBhdGhfcm90ID0gb2ZfaWNjX2dldCgmcGRldi0+ZGV2LCAicm90YXRv
ciIpOwoKSXQgd291bGQgYmUgYmV0dGVyIGNoYW5nZSBqdXN0IHRoZSBuYW1lcyB0byAibWRwMC1t
ZW0nLCAibWRwMS1tZW0iLAoicm90YXRvci1tZW0iIGZvciBjb25zaXN0ZW5jeSBhbmQgZGVub3Rl
IHRoYXQgdGhlIHBhdGggdGFyZ2V0IGlzIHRoZSBERFIgbWVtb3J5LgoKPiArCj4gKwlpZiAoSVNf
RVJSKHBhdGgwKSkKPiArCQlyZXR1cm4gUFRSX0VSUihwYXRoMCk7Cj4gKwlpY2Nfc2V0X2J3KHBh
dGgwLCAwLCBNQnBzX3RvX2ljYyg2NDAwKSk7Cj4gKwo+ICsJaWYgKCFJU19FUlIocGF0aDEpKQo+
ICsJCWljY19zZXRfYncocGF0aDEsIDAsIE1CcHNfdG9faWNjKDY0MDApKTsKPiArCWlmICghSVNf
RVJSKHBhdGhfcm90KSkKPiArCQlpY2Nfc2V0X2J3KHBhdGhfcm90LCAwLCBNQnBzX3RvX2ljYyg2
NDAwKSk7Cj4gKwo+ICAJREJHKCIiKTsKPiAgCXJldHVybiBjb21wb25lbnRfYWRkKCZwZGV2LT5k
ZXYsICZtZHA1X29wcyk7Cj4gIH0KPiAKClRoYW5rcywKR2VvcmdpCl9fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJl
ZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9y
Zy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
