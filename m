Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 56120CDB9A
	for <lists+freedreno@lfdr.de>; Mon,  7 Oct 2019 07:48:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 950756E252;
	Mon,  7 Oct 2019 05:48:07 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com
 [IPv6:2607:f8b0:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E33AA6E452
 for <freedreno@lists.freedesktop.org>; Mon,  7 Oct 2019 05:48:05 +0000 (UTC)
Received: by mail-pg1-x544.google.com with SMTP id i76so348748pgc.0
 for <freedreno@lists.freedesktop.org>; Sun, 06 Oct 2019 22:48:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=5tzoF5jEWBGYn2YEncgp+nUwEVI8tjzoOCexGDe1hVc=;
 b=Ay4LoRduXYHXAewmSyp7Js7kfpQXQ65nIEDf6N+FCvuQ3FgNC2yx/BS1h0ti5CXLtP
 a520XY56Ip4Zn1h/Q5MYcqc9qKGLyd1SKz4RE21g1yfAAtruxUSFPYuvz7q4QW2Efafy
 0BJb95xpdOr0EDSWHE2QemwXKF4yXhThwGzzjSyRUSUFUiKOHRrL5XBVGBKIpS1vo7cD
 dpCTyLRD4lFePmf4OFOnz+WU6iZtb+xvFGMrTcB8ALt9L95ny+TP09EH/0yVlm7aSKfC
 XFF3F22DO80+tiEFw03MSmvszNNXRQpBcOSnNKIhMfW2BTYqFlXp0lA4Zpn3CvY7z8rn
 effg==
X-Gm-Message-State: APjAAAXujVyE/dSwdyFcT4L1EME7HArEKGdyffT8th/XJoztuVTclG+Y
 ZWRBonBwGQJRHPjTGDpDSiGJrw==
X-Google-Smtp-Source: APXvYqx8wMELgRKaVDfwPVaxFK4vskD26Isa8VG9p6kFK7Fr+X+pG18Z3YrxVjib5kmWx8LxnhwKbg==
X-Received: by 2002:a65:504c:: with SMTP id k12mr16046935pgo.252.1570427285224; 
 Sun, 06 Oct 2019 22:48:05 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id u7sm5730980pfn.61.2019.10.06.22.48.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 06 Oct 2019 22:48:04 -0700 (PDT)
Date: Sun, 6 Oct 2019 22:48:01 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Message-ID: <20191007054801.GH6390@tuxbook-pro>
References: <20191007014509.25180-1-masneyb@onstation.org>
 <20191007014509.25180-4-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191007014509.25180-4-masneyb@onstation.org>
User-Agent: Mutt/1.12.1 (2019-06-15)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=5tzoF5jEWBGYn2YEncgp+nUwEVI8tjzoOCexGDe1hVc=;
 b=iWm2gbrxXJtQbLIiHmiKtOzlK0kdACMqzvNyCI0Bvt31xz+eLXkAX3gfjASqtsyxd2
 pibAMwyUux/rIge9wN9ApuhvjHkiHSb6pKraakhzlhJbh8JgeyELWbZL3PIl53pLUXyM
 iC4fFVNWHchNI0Y9vRlKepoKrk43B7Q/GtfRWIqXe+L/euPWh53pNl7YkRPu2Px87Ijb
 ti4S14CzINDFcQoHtWJxeSosRNR3kd6DjPJfm/4b+LrhRudNDYrseCHJvA0sPBhBVIts
 zkUet9HlTvXp/wvmIvi/ZrzCOh/d/RQI2xYxO0LV3j4KYxlVl9xwzjWI37g1ahIIy/6B
 m2Gg==
Subject: Re: [Freedreno] [PATCH RFC v2 3/5] ARM: dts: qcom: pm8941: add 5vs2
 regulator node
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
Cc: freedreno@lists.freedesktop.org, jonathan@marek.ca, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 a.hajda@samsung.com, robdclark@gmail.com, Laurent.pinchart@ideasonboard.com,
 daniel@ffwll.ch, sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gU3VuIDA2IE9jdCAxODo0NSBQRFQgMjAxOSwgQnJpYW4gTWFzbmV5IHdyb3RlOgoKPiBwbTg5
NDEgaXMgbWlzc2luZyB0aGUgNXZzMiByZWd1bGF0b3Igbm9kZSBzbyBsZXQncyBhZGQgaXQgc2lu
Y2UgaXRzCj4gbmVlZGVkIHRvIGdldCB0aGUgZXh0ZXJuYWwgZGlzcGxheSB3b3JraW5nLiBUaGlz
IHJlZ3VsYXRvciB3YXMgYWxyZWFkeQo+IGNvbmZpZ3VyZWQgaW4gdGhlIGludGVycnVwdHMgcHJv
cGVydHkgb24gdGhlIHBhcmVudCBub2RlLgo+IAo+IE5vdGUgdGhhdCB0aGlzIHJlZ3VsYXRvciBp
cyByZWZlcnJlZCB0byBhcyBtdnMyIGluIHRoZSBkb3duc3RyZWFtIE1TTQo+IGtlcm5lbCBzb3Vy
Y2VzLgo+IAo+IFNpZ25lZC1vZmYtYnk6IEJyaWFuIE1hc25leSA8bWFzbmV5YkBvbnN0YXRpb24u
b3JnPgo+IFJldmlld2VkLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5v
cmc+CgpQaWNrZWQgdGhpcyBwYXRjaCBmb3Igbm93LCBvbmNlIHRoZSBkcml2ZXIgdXBkYXRlcyBh
cmUgbGFuZGVkIEkgd2lsbAp0YWtlIHRoZSBsYXN0IHR3byBkdHMgcGF0Y2hlcy4KClJlZ2FyZHMs
CkJqb3JuCgo+IC0tLQo+IENoYW5nZXMgc2luY2UgdjE6Cj4gLSBOb25lCj4gCj4gIGFyY2gvYXJt
L2Jvb3QvZHRzL3Fjb20tcG04OTQxLmR0c2kgfCAxMCArKysrKysrKysrCj4gIDEgZmlsZSBjaGFu
Z2VkLCAxMCBpbnNlcnRpb25zKCspCj4gCj4gZGlmZiAtLWdpdCBhL2FyY2gvYXJtL2Jvb3QvZHRz
L3Fjb20tcG04OTQxLmR0c2kgYi9hcmNoL2FybS9ib290L2R0cy9xY29tLXBtODk0MS5kdHNpCj4g
aW5kZXggZjE5ODQ4MGM4ZWY0Li5jMWYyMDEyZDFjOGIgMTAwNjQ0Cj4gLS0tIGEvYXJjaC9hcm0v
Ym9vdC9kdHMvcWNvbS1wbTg5NDEuZHRzaQo+ICsrKyBiL2FyY2gvYXJtL2Jvb3QvZHRzL3Fjb20t
cG04OTQxLmR0c2kKPiBAQCAtMTc4LDYgKzE3OCwxNiBAQAo+ICAJCQkJcWNvbSx2cy1zb2Z0LXN0
YXJ0LXN0cmVuZ3RoID0gPDA+Owo+ICAJCQkJcmVndWxhdG9yLWluaXRpYWwtbW9kZSA9IDwxPjsK
PiAgCQkJfTsKPiArCj4gKwkJCXBtODk0MV81dnMyOiA1dnMyIHsKPiArCQkJCXJlZ3VsYXRvci1l
bmFibGUtcmFtcC1kZWxheSA9IDwxMDAwPjsKPiArCQkJCXJlZ3VsYXRvci1wdWxsLWRvd247Cj4g
KwkJCQlyZWd1bGF0b3Itb3Zlci1jdXJyZW50LXByb3RlY3Rpb247Cj4gKwkJCQlxY29tLG9jcC1t
YXgtcmV0cmllcyA9IDwxMD47Cj4gKwkJCQlxY29tLG9jcC1yZXRyeS1kZWxheSA9IDwzMD47Cj4g
KwkJCQlxY29tLHZzLXNvZnQtc3RhcnQtc3RyZW5ndGggPSA8MD47Cj4gKwkJCQlyZWd1bGF0b3It
aW5pdGlhbC1tb2RlID0gPDE+Owo+ICsJCQl9Owo+ICAJCX07Cj4gIAl9Owo+ICB9Owo+IC0tIAo+
IDIuMjEuMAo+IApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
