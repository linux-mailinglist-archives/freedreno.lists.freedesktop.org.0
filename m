Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07CAB15D96
	for <lists+freedreno@lfdr.de>; Tue,  7 May 2019 08:38:55 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B21B089D9B;
	Tue,  7 May 2019 06:38:53 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pf1-x442.google.com (mail-pf1-x442.google.com
 [IPv6:2607:f8b0:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A78D689D9B
 for <freedreno@lists.freedesktop.org>; Tue,  7 May 2019 06:38:51 +0000 (UTC)
Received: by mail-pf1-x442.google.com with SMTP id c6so2910922pfa.10
 for <freedreno@lists.freedesktop.org>; Mon, 06 May 2019 23:38:51 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=wWtp0jnKgCQgvYHJQP0mFqZsKhLPzrO6V1C+32VkFts=;
 b=B0i8Fi8ztSGY0Awm7sn5Skrt7TYeHkKNXjQxcJJzrdPbjrE6mh1FCq2ZBUJ/H9zC41
 sz5zxB5yqTFmw4bRGdYC4IIjC3FCT+4Nr+ukWO6N40/TPgIVvft3n6osAZIm8kn47ukC
 fvIflF+i9hvIgUEIMJY1FwL/ckpJSKh+JuC2SgZ2mwo5Slk4kzCFqqKKgVDCfHR7DwJb
 hpg8ihsbaS2vCBmg7g1Z2b4hZtqJ0vmFx6gWgWYOSh0GCu5OfEMaD7gp0WePOEpRLK5u
 L7vSuOx/FTgjmtEDUr9nkrB4wshVkZhD9MTn557gZBO+n1qgsp4kdLQR/ojKBVq4f39Q
 Ot6g==
X-Gm-Message-State: APjAAAXklx3WEA0np2TQ5HLV96Tg/oMQ2bOqFTI6Omb+Ybh2UrxAFbd7
 JlAdi5jBaYg91SMsVy7k+7tnAw==
X-Google-Smtp-Source: APXvYqwY91xBBVJv/756Xx6HEZCctbmrzp1jJLE/1sryCLnIM8LwzomLH62O4ev8IQJQJLg+ufVU8g==
X-Received: by 2002:a62:6842:: with SMTP id d63mr39964616pfc.9.1557211130015; 
 Mon, 06 May 2019 23:38:50 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id f2sm18843390pgc.30.2019.05.06.23.38.48
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Mon, 06 May 2019 23:38:49 -0700 (PDT)
Date: Mon, 6 May 2019 23:39:02 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Message-ID: <20190507063902.GA2085@tuxbook-pro>
References: <20190505130413.32253-1-masneyb@onstation.org>
 <20190505130413.32253-5-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190505130413.32253-5-masneyb@onstation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=wWtp0jnKgCQgvYHJQP0mFqZsKhLPzrO6V1C+32VkFts=;
 b=nYKXcx42aO3MAUePdnRAiJ9/V6lyE5FcjpoFwRX8BMynr8FAmMbfC31a5SOnBmTMYP
 PDkho2ZE0OpqizZTZUU7EyGn8V0iipQwESQo4HxtxQ7G04peOASIu+JmnHkxsalwxihD
 t8100G13Dr1QASK8RXQZ6b1UPHUqUH7B0sGBvVx4lnLoBF4qJrqT82Vvq4l9JrXfOuOa
 dzbCOI2t7m1lobnq2FyseXkvsLCqlfRfWiOepvom8swe/loDKYzz/akLUeb7Xhd6kzaJ
 aeYYMcnnJr0om+4NUfgNIKz0ffecitJ+H4aEMnNgDyknUm5GS122n6ls93W6MCAw+KGj
 U2BQ==
Subject: Re: [Freedreno] [PATCH RFC 4/6] ARM: dts: msm8974: add display
 support
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
Cc: sean@poorly.run, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 linus.walleij@linaro.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, daniel@ffwll.ch,
 freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gU3VuIDA1IE1heSAwNjowNCBQRFQgMjAxOSwgQnJpYW4gTWFzbmV5IHdyb3RlOgo+IGRpZmYg
LS1naXQgYS9hcmNoL2FybS9ib290L2R0cy9xY29tLW1zbTg5NzQuZHRzaSBiL2FyY2gvYXJtL2Jv
b3QvZHRzL3Fjb20tbXNtODk3NC5kdHNpClsuLl0KPiArCQkJZHNpMDogZHNpQGZkOTIyODAwIHsK
PiArCQkJCXN0YXR1cyA9ICJkaXNhYmxlZCI7Cj4gKwo+ICsJCQkJY29tcGF0aWJsZSA9ICJxY29t
LG1kc3MtZHNpLWN0cmwiOwo+ICsJCQkJcmVnID0gPDB4ZmQ5MjI4MDAgMHgxZjg+Owo+ICsJCQkJ
cmVnLW5hbWVzID0gImRzaV9jdHJsIjsKPiArCj4gKwkJCQlpbnRlcnJ1cHQtcGFyZW50ID0gPCZt
ZHNzPjsKPiArCQkJCWludGVycnVwdHMgPSA8NCBJUlFfVFlQRV9MRVZFTF9ISUdIPjsKPiArCj4g
KwkJCQlhc3NpZ25lZC1jbG9ja3MgPSA8Jm1tY2MgQllURTBfQ0xLX1NSQz4sCj4gKwkJCQkgICAg
ICAgICAgICAgICAgICA8Jm1tY2MgUENMSzBfQ0xLX1NSQz47Cj4gKwkJCQlhc3NpZ25lZC1jbG9j
ay1wYXJlbnRzID0gPCZkc2lfcGh5MCAwPiwKPiArCQkJCSAgICAgICAgICAgICAgICAgICAgICAg
ICA8JmRzaV9waHkwIDE+Owo+ICsKPiArCQkJCWNsb2NrcyA9IDwmbW1jYyBNRFNTX01EUF9DTEs+
LAo+ICsJCQkJICAgICAgICAgPCZtbWNjIE1EU1NfQUhCX0NMSz4sCj4gKwkJCQkgICAgICAgICA8
Jm1tY2MgTURTU19BWElfQ0xLPiwKPiArCQkJCSAgICAgICAgIDwmbW1jYyBNRFNTX0JZVEUwX0NM
Sz4sCj4gKwkJCQkgICAgICAgICA8Jm1tY2MgTURTU19QQ0xLMF9DTEs+LAo+ICsJCQkJICAgICAg
ICAgPCZtbWNjIE1EU1NfRVNDMF9DTEs+LAo+ICsJCQkJICAgICAgICAgPCZtbWNjIE1NU1NfTUlT
Q19BSEJfQ0xLPjsKPiArCQkJCWNsb2NrLW5hbWVzID0gIm1kcF9jb3JlIiwKPiArCQkJCSAgICAg
ICAgICAgICAgImlmYWNlIiwKPiArCQkJCSAgICAgICAgICAgICAgImJ1cyIsCj4gKwkJCQkgICAg
ICAgICAgICAgICJieXRlIiwKPiArCQkJCSAgICAgICAgICAgICAgInBpeGVsIiwKPiArCQkJCSAg
ICAgICAgICAgICAgImNvcmUiLAo+ICsJCQkJICAgICAgICAgICAgICAiY29yZV9tbXNzIjsKClVu
bGVzcyBJIGVuYWJsZSBNTVNTX01NU1NOT0NfQVhJX0NMSyBhbmQgTU1TU19TMF9BWElfQ0xLIEkg
Z2V0IHNvbWUKdW5kZXJydW4gZXJyb3IgZnJvbSBEU0kuIFlvdSBkb24ndCBzZWUgYW55dGhpbmcg
bGlrZSB0aGlzPwoKKFRoZXNlIGNsb2NrcyBhcmUgY29udHJvbGxlZCBieSBtc21fYnVzIGRvd25z
dHJlYW0gYW5kIHNob3VsZCBiZSBkcml2ZW4KYnkgaW50ZXJjb25uZWN0IHVwc3RyZWFtKQoKCkFw
YXJ0IGZyb20gdGhpcywgSSB0aGluayB0aGlzIGxvb2tzIG5pY2UuIEhhcHB5IHRvIHNlZSB0aGUg
cHJvZ3Jlc3MuCgpSZWdhcmRzLApCam9ybgpfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5m
cmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0
aW5mby9mcmVlZHJlbm8=
