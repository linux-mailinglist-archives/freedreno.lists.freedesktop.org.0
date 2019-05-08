Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A35DD173EE
	for <lists+freedreno@lfdr.de>; Wed,  8 May 2019 10:35:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 32EB789864;
	Wed,  8 May 2019 08:35:26 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 64F4589864
 for <freedreno@lists.freedesktop.org>; Wed,  8 May 2019 08:35:24 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id p26so3439780edr.2
 for <freedreno@lists.freedesktop.org>; Wed, 08 May 2019 01:35:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
 :mail-followup-to:references:mime-version:content-disposition
 :in-reply-to:user-agent;
 bh=O82OgpfzeDh2UEeB/vmic+hMxc9DH+yp719HK/Iv7xI=;
 b=V9jMeFnWURE/zClYEHcX9FE+ZDlVxFglxnv/W5S95PaeU7HdrD7gL6hX+hoCO5Hw5o
 P7bUYAQs4W+ccKS50w7l0f58m0TMv+Uwp8icO0N2FwHHcIK6ihGhjyM+ialrNCXBz004
 DFe8sRAP0aKa0+oZiYVSSEfQWYRz568Jsn1mIDUJxvMq0axCvryezaGECSxMSxZx2nyv
 ewsCfhnlIulK7uR3RED+1M1B0LKJf9Iw3DIJ2q0WuQjEPUYfYZXd6XvVkgFQ3l50toTt
 VPvAot738IHoS5FzPAiNhpEs4I9VbbEmwvWeU1hLDzgPMnME4MxaeI5qsWwazvQHxvH6
 txhQ==
X-Gm-Message-State: APjAAAWTvJZZctTggBPXDaiWD65KKjuIG5JwONX58XYPZF0J5tJChxvl
 9wrSS2hcd1tY0ZzTtc4K7o5o+g==
X-Google-Smtp-Source: APXvYqxGx8OsiIdz2sy8/idKb8APDa8zpodaXm0vDZ+ekASTAgEhxUCZYEn7hnen6RqRvgXKmM2T6g==
X-Received: by 2002:a50:87ab:: with SMTP id a40mr36539324eda.188.1557304523070; 
 Wed, 08 May 2019 01:35:23 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id y13sm3739593edp.77.2019.05.08.01.35.21
 (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
 Wed, 08 May 2019 01:35:22 -0700 (PDT)
Date: Wed, 8 May 2019 10:35:19 +0200
From: Daniel Vetter <daniel@ffwll.ch>
To: Jordan Crouse <jcrouse@codeaurora.org>
Message-ID: <20190508083519.GS17751@phenom.ffwll.local>
Mail-Followup-To: Jordan Crouse <jcrouse@codeaurora.org>,
 freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Sean Paul <sean@poorly.run>, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>
References: <1557256451-24950-1-git-send-email-jcrouse@codeaurora.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1557256451-24950-1-git-send-email-jcrouse@codeaurora.org>
X-Operating-System: Linux phenom 4.14.0-3-amd64 
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=sender:date:from:to:cc:subject:message-id:mail-followup-to
 :references:mime-version:content-disposition:in-reply-to:user-agent;
 bh=O82OgpfzeDh2UEeB/vmic+hMxc9DH+yp719HK/Iv7xI=;
 b=bI+OTnFQBhAMy/Fosn0WFLRAjME86sn9+AY2pJSC/YisVJpsAi3ITxRhfc+MXIkAcO
 2xPP+zbqNdgib/BoAt3L0GfsYBQ5EAC4h+HB97Ud18Rm8WZSEl1Jala96sRo/86WW6BW
 NLiHu2roFj/eR4y3VgLe5lQ3BFFna8Yrm2nvI=
Subject: Re: [Freedreno] [PATCH] drm/atomic: Check that the config funcs
 exist drm_mode_alloc
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Maxime Ripard <maxime.ripard@bootlin.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T24gVHVlLCBNYXkgMDcsIDIwMTkgYXQgMDE6MTQ6MTFQTSAtMDYwMCwgSm9yZGFuIENyb3VzZSB3
cm90ZToKPiBBbiBlcnJvciB3aGlsZSBpbml0aWFsaXppbmcgdGhlIG1zbSBkcml2ZXIgZW5kcyB1
cCBjYWxsaW5nCj4gZHJtX2F0b21pY19oZWxwZXJfc2h1dGRvd24oKSB3aXRob3V0IGZpcnN0IGlu
aXRpYWxpemluZyB0aGUgZnVuY3MKPiBpbiBtb2RlX2NvbmZpZy4gV2hpbGUgSSdtIG5vdCAxMDAl
IHN1cmUgdGhpcyBpc24ndCBhIG9yZGVyaW5nCj4gcHJvYmxlbSBpbiBtc20gYWRkaW5nIGEgY2hl
Y2sgdG8gZHJtX21vZGVfYWxsb2Mgc2VlbXMgbGlrZQo+IGEgbmljZSBhbmQgc2FmZSBzb2x1dGlv
bi4KPiAKPiBTaWduZWQtb2ZmLWJ5OiBKb3JkYW4gQ3JvdXNlIDxqY3JvdXNlQGNvZGVhdXJvcmEu
b3JnPgoKSG0geWVhaCB0aGlzIGxvb2tzIGEgYml0IHRvbyBtdWNoIGxpa2UgZHVjdHRhcGUuIEkg
dGhpbmsgTm9yYWxmIHN0YXJ0ZWQKd29ya2luZyBvbiBzb21lIGlkZWFzIG9mIGRldm0tbGlrZSBh
dXRvbWF0aWMgY2xlYW51cCBmb3IgZHJtIHN0dWZmICh3ZQpjYW5ub3QgdXNlIGRldm0sIHRoYXQg
aGFzIHRoZSB3cm9uZyBsaWZldGltZXMsIGRlc3BpdGUgYWxsIHRoZSBkcml2ZXJzCnVzaW5nIGl0
KS4KClNpbXBsZSBmaXggd291bGQgYmUgdG8gbW92ZSB1cCB0aGUgYXNzaWdubWVudCBvZiBjb25m
aWcuZnVuY3MgdG8gYmUgbXVjaAplYXJsaWVyIGluIHlvdXIgZHJpdmVyIGxvYWQgSSBndWVzcy4K
LURhbmllbAoKPiAtLS0KPiAKPiAgZHJpdmVycy9ncHUvZHJtL2RybV9hdG9taWMuYyB8IDMgKysr
Cj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKykKPiAKPiBkaWZmIC0tZ2l0IGEvZHJp
dmVycy9ncHUvZHJtL2RybV9hdG9taWMuYyBiL2RyaXZlcnMvZ3B1L2RybS9kcm1fYXRvbWljLmMK
PiBpbmRleCA1ZWI0MDEzLi4xNzI5NDI4IDEwMDY0NAo+IC0tLSBhL2RyaXZlcnMvZ3B1L2RybS9k
cm1fYXRvbWljLmMKPiArKysgYi9kcml2ZXJzL2dwdS9kcm0vZHJtX2F0b21pYy5jCj4gQEAgLTEx
NCw2ICsxMTQsOSBAQCBkcm1fYXRvbWljX3N0YXRlX2FsbG9jKHN0cnVjdCBkcm1fZGV2aWNlICpk
ZXYpCj4gIHsKPiAgCXN0cnVjdCBkcm1fbW9kZV9jb25maWcgKmNvbmZpZyA9ICZkZXYtPm1vZGVf
Y29uZmlnOwo+ICAKPiArCWlmICghY29uZmlnLT5mdW5jcykKPiArCQlyZXR1cm4gTlVMTDsKPiAr
Cj4gIAlpZiAoIWNvbmZpZy0+ZnVuY3MtPmF0b21pY19zdGF0ZV9hbGxvYykgewo+ICAJCXN0cnVj
dCBkcm1fYXRvbWljX3N0YXRlICpzdGF0ZTsKPiAgCj4gLS0gCj4gMi43LjQKPiAKCi0tIApEYW5p
ZWwgVmV0dGVyClNvZnR3YXJlIEVuZ2luZWVyLCBJbnRlbCBDb3Jwb3JhdGlvbgpodHRwOi8vYmxv
Zy5mZndsbC5jaApfX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
XwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcK
aHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcvbWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8=
