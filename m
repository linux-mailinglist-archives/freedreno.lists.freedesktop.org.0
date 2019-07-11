Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 137C665DBE
	for <lists+freedreno@lfdr.de>; Thu, 11 Jul 2019 18:45:14 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BF5346E162;
	Thu, 11 Jul 2019 16:45:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x542.google.com (mail-pg1-x542.google.com
 [IPv6:2607:f8b0:4864:20::542])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 97CE56E162
 for <freedreno@lists.freedesktop.org>; Thu, 11 Jul 2019 16:45:11 +0000 (UTC)
Received: by mail-pg1-x542.google.com with SMTP id m4so3222086pgk.0
 for <freedreno@lists.freedesktop.org>; Thu, 11 Jul 2019 09:45:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=jwuRR8Q1l0rKbX4Ve134b1iXf6no8US/0ODaV1OtfJg=;
 b=GkTDGbykeS8T+b78AZ1isFH5HWCe+VuSVIkPDWofy3zULD9jnTnlfaWAVaGprE++oO
 iAojNnLcU8un5iTD8J0JDfDs9CSlUv+NCf10+lxucKsRWbhZAx2mMRxcOwSrOCqDiONC
 4S1EpI6ESuOzRLJzu1Pelb+2L6hzWWTnpF41J7A2xi7fR+rdvYf68hfjo2pe1IbqRbLr
 Edj5lOryMb7SO3i3TPHoQBUPltVArR5CAH6u1ZUTooo0/5q0XxmDpgnaeV0aExENziTJ
 XI61tAvlfLG9QKAuAmN9qPcdWwmWiAZdJC8D3p/SDNCve9PIjp2NOnv9yYd2Hm+Ax92H
 X+nQ==
X-Gm-Message-State: APjAAAWSqMHZrCAklxCU3Z9BQNdnbJIpywDKS22UFiBeDCdoGcGx7Psf
 fR4dp0qTPJiBI+yneqG61IT+NQ==
X-Google-Smtp-Source: APXvYqy1hl1yTY2tAfPT4CfLcn/3WL5Tytxe1BBNzeHmDCMgcsWevHevzfTkFxpehMNWKiRgxKFHTg==
X-Received: by 2002:a17:90a:2343:: with SMTP id
 f61mr6002098pje.130.1562863511049; 
 Thu, 11 Jul 2019 09:45:11 -0700 (PDT)
Received: from tuxbook-pro (104-188-17-28.lightspeed.sndgca.sbcglobal.net.
 [104.188.17.28])
 by smtp.gmail.com with ESMTPSA id l189sm7116203pfl.7.2019.07.11.09.45.09
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Thu, 11 Jul 2019 09:45:10 -0700 (PDT)
Date: Thu, 11 Jul 2019 09:46:19 -0700
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Brian Masney <masneyb@onstation.org>
Message-ID: <20190711164619.GT7234@tuxbook-pro>
References: <20190706111138.2238-1-masneyb@onstation.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20190706111138.2238-1-masneyb@onstation.org>
User-Agent: Mutt/1.11.4 (2019-03-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=jwuRR8Q1l0rKbX4Ve134b1iXf6no8US/0ODaV1OtfJg=;
 b=fXMfPXQFw+BMXHj5sB7D5SZbRLL4yLO7dCFEcqra0z5M/ZOltBbf3Zj/Aao1hET4GD
 3azphRfZ11zhgbXjs3N4nbnKMwUU7+4dw6YKKXllbd+DssNy3TxDGCgkmV1ikNcZxL7/
 2ICwcXgXIJkPJwzLWiM4/yASDDXjIQa7HjC9IImhuA+FU4yWlR8FfIzidpqktofkWi8v
 Va0bLm/egQy7D/+XBHgq+GtkBfu9c1Y6IPWhZN8mcQmY/Fa8JG1MM4eSiK3ha3usflxA
 5VzG7L1PfesBb/hDoETF7jtEOnM6ltMdpQbSzf5oDTXZHnTRFG58VhAlAl5/e8gh0nzi
 EL3g==
Subject: Re: [Freedreno] [PATCH] drm/msm/phy/dsi_phy: silence -EPROBE_DEFER
 warnings
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
Cc: freedreno@lists.freedesktop.org, airlied@linux.ie,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, robdclark@gmail.com, daniel@ffwll.ch,
 sean@poorly.run
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gU2F0IDA2IEp1bCAwNDoxMSBQRFQgMjAxOSwgQnJpYW4gTWFzbmV5IHdyb3RlOgoKPiBUaGUg
Zm9sbG93aW5nIGVycm9ycyBzaG93IHVwIHdoZW4gYm9vdGluZyB0aGUgTmV4dXMgNToKPiAKPiBt
c21fZHNpX3BoeSBmZDkyMmEwMC5kc2ktcGh5OiBbZHJtOmRzaV9waHlfZHJpdmVyX3Byb2JlXSAq
RVJST1IqCj4gIGRzaV9waHlfcmVndWxhdG9yX2luaXQ6IGZhaWxlZCB0byBpbml0IHJlZ3VsYXRv
ciwgcmV0PS01MTcKPiBtc21fZHNpX3BoeSBmZDkyMmEwMC5kc2ktcGh5OiBbZHJtOmRzaV9waHlf
ZHJpdmVyX3Byb2JlXSAqRVJST1IqCj4gIGRzaV9waHlfZHJpdmVyX3Byb2JlOiBmYWlsZWQgdG8g
aW5pdCByZWd1bGF0b3IKPiAKPiBkc2lfcGh5X3JlZ3VsYXRvcl9pbml0KCkgYWxyZWFkeSBsb2dz
IHRoZSBlcnJvciwgc28gbm8gbmVlZCB0byBsb2cKPiB0aGUgc2FtZSBlcnJvciBhIHNlY29uZCB0
aW1lIGluIGRzaV9waHlfZHJpdmVyX3Byb2JlKCkuIFRoaXMgcGF0Y2gKPiBhbHNvIGNoYW5nZXMg
ZHNpX3BoeV9yZWd1bGF0b3JfaW5pdCgpIHRvIG5vdCBsb2cgdGhlIGVycm9yIGlmIHRoZQo+IGVy
cm9yIGNvZGUgaXMgLUVQUk9CRV9ERUZFUiB0byByZWR1Y2Ugbm9pc2UgaW4gZG1lc2cuCj4gCj4g
U2lnbmVkLW9mZi1ieTogQnJpYW4gTWFzbmV5IDxtYXNuZXliQG9uc3RhdGlvbi5vcmc+Cj4gLS0t
Cj4gIGRyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9kc2lfcGh5LmMgfCAxMSArKysrKystLS0t
LQo+ICAxIGZpbGUgY2hhbmdlZCwgNiBpbnNlcnRpb25zKCspLCA1IGRlbGV0aW9ucygtKQo+IAo+
IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5jIGIvZHJp
dmVycy9ncHUvZHJtL21zbS9kc2kvcGh5L2RzaV9waHkuYwo+IGluZGV4IDQwOTdlY2ExYjNlZi4u
ZDBlMWNjNjcyOGRjIDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL3BoeS9k
c2lfcGh5LmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9waHkvZHNpX3BoeS5jCj4g
QEAgLTM5Niw4ICszOTYsMTEgQEAgc3RhdGljIGludCBkc2lfcGh5X3JlZ3VsYXRvcl9pbml0KHN0
cnVjdCBtc21fZHNpX3BoeSAqcGh5KQo+ICAKPiAgCXJldCA9IGRldm1fcmVndWxhdG9yX2J1bGtf
Z2V0KGRldiwgbnVtLCBzKTsKPiAgCWlmIChyZXQgPCAwKSB7Cj4gLQkJRFJNX0RFVl9FUlJPUihk
ZXYsICIlczogZmFpbGVkIHRvIGluaXQgcmVndWxhdG9yLCByZXQ9JWRcbiIsCj4gLQkJCQkJCV9f
ZnVuY19fLCByZXQpOwo+ICsJCWlmIChyZXQgIT0gLUVQUk9CRV9ERUZFUikKPiArCQkJRFJNX0RF
Vl9FUlJPUihkZXYsCj4gKwkJCQkgICAgICAiJXM6IGZhaWxlZCB0byBpbml0IHJlZ3VsYXRvciwg
cmV0PSVkXG4iLAo+ICsJCQkJICAgICAgX19mdW5jX18sIHJldCk7CgpTb21lIHt9IHdvdWxkbid0
IGh1cnQgaGVyZSwgYnV0IG5vdCBhIGJpZyBkZWFsLgoKUmV2aWV3ZWQtYnk6IEJqb3JuIEFuZGVy
c3NvbiA8Ympvcm4uYW5kZXJzc29uQGxpbmFyby5vcmc+Cgo+ICsKPiAgCQlyZXR1cm4gcmV0Owo+
ICAJfQo+ICAKPiBAQCAtNTg0LDEwICs1ODcsOCBAQCBzdGF0aWMgaW50IGRzaV9waHlfZHJpdmVy
X3Byb2JlKHN0cnVjdCBwbGF0Zm9ybV9kZXZpY2UgKnBkZXYpCj4gIAl9Cj4gIAo+ICAJcmV0ID0g
ZHNpX3BoeV9yZWd1bGF0b3JfaW5pdChwaHkpOwo+IC0JaWYgKHJldCkgewo+IC0JCURSTV9ERVZf
RVJST1IoZGV2LCAiJXM6IGZhaWxlZCB0byBpbml0IHJlZ3VsYXRvclxuIiwgX19mdW5jX18pOwo+
ICsJaWYgKHJldCkKPiAgCQlnb3RvIGZhaWw7Cj4gLQl9Cj4gIAo+ICAJcGh5LT5haGJfY2xrID0g
bXNtX2Nsa19nZXQocGRldiwgImlmYWNlIik7Cj4gIAlpZiAoSVNfRVJSKHBoeS0+YWhiX2Nsaykp
IHsKPiAtLSAKPiAyLjIwLjEKPiAKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8v
ZnJlZWRyZW5v
