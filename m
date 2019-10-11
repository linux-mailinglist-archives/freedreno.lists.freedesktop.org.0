Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2EDE0D4733
	for <lists+freedreno@lfdr.de>; Fri, 11 Oct 2019 20:07:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C43936E425;
	Fri, 11 Oct 2019 18:07:25 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yb1-xb42.google.com (mail-yb1-xb42.google.com
 [IPv6:2607:f8b0:4864:20::b42])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2E0D36EC72
 for <freedreno@lists.freedesktop.org>; Fri, 11 Oct 2019 18:07:25 +0000 (UTC)
Received: by mail-yb1-xb42.google.com with SMTP id m1so3395549ybm.1
 for <freedreno@lists.freedesktop.org>; Fri, 11 Oct 2019 11:07:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=ae+CRQiYhqHuHpTU1rVoJFXnmT5FdFQC0MsNbt69cOk=;
 b=YlYBctuNSFfAKE9OPzQRtP1Ueoab0h0KeSk+gjf9aiLO1nTK/r8QRUDcLWWd6t4O/V
 wwDtuW75dQLP/tuy7J4XH2S3Nt4Zl76lVxsTeXgdJWmOpVKW5X5zegaLU0aejju4qdIt
 UKgW5YOQA4Luw/1ETeD1CRq3OmXvdlnTZ+Dt6BJq0ewD0CtYbNH+uYjIx+AiRO0cdwyI
 PjLMzEvveqPWphfQ6yhcnmZahXMJq02JQY468vxmWdNnmYYnkGL4Y2EwRkxVc6INErbJ
 xOBcisoX8+b8ydVLVzZ43mDLymds1ykzIgAFzjcH0Rfsxg12YhmT1EIbb/nlR34SpNRw
 9WOw==
X-Gm-Message-State: APjAAAXlvtaDsTc6Zt9jInRj84R7epeq+Fl3A5C7lc5y9QtRig42nBg/
 nrYoQj7k9PrTHUAl12fVFfW+/g==
X-Google-Smtp-Source: APXvYqyLFQRkBuuFsPRJRvEzimdiSeDDu7y4rtmiy717/O74e9n4vUvEF72u5cL+4a7xJET3hyXLEg==
X-Received: by 2002:a25:2313:: with SMTP id j19mr10529925ybj.400.1570817244160; 
 Fri, 11 Oct 2019 11:07:24 -0700 (PDT)
Received: from localhost ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id g128sm2293047ywb.13.2019.10.11.11.07.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Oct 2019 11:07:23 -0700 (PDT)
Date: Fri, 11 Oct 2019 14:07:22 -0400
From: Sean Paul <sean@poorly.run>
To: Jeffrey Hugo <jeffrey.l.hugo@gmail.com>
Message-ID: <20191011180722.GU85762@art_vandelay>
References: <20191011133939.16551-1-jeffrey.l.hugo@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20191011133939.16551-1-jeffrey.l.hugo@gmail.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=date:from:to:cc:subject:message-id:references:mime-version
 :content-disposition:in-reply-to:user-agent;
 bh=ae+CRQiYhqHuHpTU1rVoJFXnmT5FdFQC0MsNbt69cOk=;
 b=DtiL00gBcmYanmOmHkuFkkt3VtSEhqSZpbvoOK/nOgtBfawkdPlD/l6vqcb3QOhbwo
 gwJKpz3ZOl0/VeGVB2rK7f0iRxJ5D2PgFe7RQwCq9v2cZIED9opjcMvvw6doH7QaAKtc
 vuaqOUEGZgridO5wAwIxVfgsid/a/Va3CJWPHd54HjHQDIIK72ChQEXuadADhkyqYeZ4
 vJLYZwN+V1K1DK4m1uc71eSsRDkZThgN75mKpXBTQ4XHfGImxVhH7ZxiN9g3xyIe1xIx
 +hC3Aq1Mw3lztzwedCBnYvYC5npK59SBnSxUtBTi1khNAEFToTyo+DSo+LrhXAcrtWvH
 IemQ==
Subject: Re: [Freedreno] [PATCH v2] drm/msm/dsi: Implement reset correctly
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

T24gRnJpLCBPY3QgMTEsIDIwMTkgYXQgMDY6Mzk6MzlBTSAtMDcwMCwgSmVmZnJleSBIdWdvIHdy
b3RlOgo+IE9uIG1zbTg5OTgsIHZibGFuayB0aW1lb3V0cyBhcmUgb2JzZXJ2ZWQgYmVjYXVzZSB0
aGUgRFNJIGNvbnRyb2xsZXIgaXMgbm90Cj4gcmVzZXQgcHJvcGVybHksIHdoaWNoIGVuZHMgdXAg
c3RhbGxpbmcgdGhlIE1EUC4gIFRoaXMgaXMgYmVjYXVzZSB0aGUgcmVzZXQKPiBsb2dpYyBpcyBu
b3QgY29ycmVjdCBwZXIgdGhlIGhhcmR3YXJlIGRvY3VtZW50YXRpb24uCj4gCj4gVGhlIGRvY3Vt
ZW50YXRpb24gc3RhdGVzIHRoYXQgYWZ0ZXIgYXNzZXJ0aW5nIHJlc2V0LCBzb2Z0d2FyZSBzaG91
bGQgd2FpdAo+IHNvbWUgdGltZSAobm8gaW5kaWNhdGlvbiBvZiBob3cgbG9uZyksIG9yIHBvbGwg
dGhlIHN0YXR1cyByZWdpc3RlciB1bnRpbCBpdAo+IHJldHVybnMgMCBiZWZvcmUgZGVhc3NlcnRp
bmcgcmVzZXQuCj4gCj4gd21iKCkgaXMgaW5zdWZmaWNpZW50IGZvciB0aGlzIHB1cnBvc2Ugc2lu
Y2UgaXQganVzdCBlbnN1cmVzIG9yZGVyaW5nLCBub3QKPiB0aW1pbmcgYmV0d2VlbiB3cml0ZXMu
ICBTaW5jZSBhc3NlcnRpbmcgYW5kIGRlYXNzZXJ0aW5nIHJlc2V0IG9jY3VycyBvbiB0aGUKPiBz
YW1lIHJlZ2lzdGVyLCBvcmRlcmluZyBpcyBhbHJlYWR5IGd1YXJhbnRlZWQgYnkgdGhlIGFyY2hp
dGVjdHVyZSwgbWFraW5nCj4gdGhlIHdtYiBleHRyYW5lb3VzLgo+IAo+IFNpbmNlIHdlIHdvdWxk
IGRlZmluZSBhIHRpbWVvdXQgZm9yIHBvbGxpbmcgdGhlIHN0YXR1cyByZWdpc3RlciB0byBhdm9p
ZCBhCj4gcG9zc2libGUgaW5maW5pdGUgbG9vcCwgbGV0cyBqdXN0IHVzZSBhIHN0YXRpYyBkZWxh
eSBvZiAyMCBtcywgc2luY2UgMTYuNjY2Cj4gbXMgaXMgdGhlIHRpbWUgYXZhaWxhYmxlIHRvIHBy
b2Nlc3Mgb25lIGZyYW1lIGF0IDYwIGZwcy4KPiAKPiBGaXhlczogYTY4OTU1NGJhNmVkIChkcm0v
bXNtOiBJbml0aWFsIGFkZCBEU0kgY29ubmVjdG9yIHN1cHBvcnQpCj4gU2lnbmVkLW9mZi1ieTog
SmVmZnJleSBIdWdvIDxqZWZmcmV5LmwuaHVnb0BnbWFpbC5jb20+CgpQdXNoZWQgdG8gZHJtLW1p
c2MtZml4ZXMgZm9yIDUuNAoKVGhhbmtzIQoKU2VhbgoKPiBSZXZpZXdlZC1ieTogU2VhbiBQYXVs
IDxzZWFuQHBvb3JseS5ydW4+Cj4gLS0tCj4gCj4gdjI6Cj4gLW1ha2UgYSBERUZJTkUgZm9yIHRo
ZSBkZWxheQo+IAo+ICBkcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jIHwgNiArKysr
LS0KPiAgMSBmaWxlIGNoYW5nZWQsIDQgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkKPiAK
PiBkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMKPiBpbmRleCA2NjNmZjlmNGZhYzkuLjlhODE3
MDUzMDFjNiAxMDA2NDQKPiAtLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5j
Cj4gKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYwo+IEBAIC0yNiw2ICsy
Niw4IEBACj4gICNpbmNsdWRlICJkc2lfY2ZnLmgiCj4gICNpbmNsdWRlICJtc21fa21zLmgiCj4g
IAo+ICsjZGVmaW5lIFJFU0VUX0RFTEFZIDIwCj4gKwo+ICBzdGF0aWMgaW50IGRzaV9nZXRfdmVy
c2lvbihjb25zdCB2b2lkIF9faW9tZW0gKmJhc2UsIHUzMiAqbWFqb3IsIHUzMiAqbWlub3IpCj4g
IHsKPiAgCXUzMiB2ZXI7Cj4gQEAgLTk4Niw3ICs5ODgsNyBAQCBzdGF0aWMgdm9pZCBkc2lfc3df
cmVzZXQoc3RydWN0IG1zbV9kc2lfaG9zdCAqbXNtX2hvc3QpCj4gIAl3bWIoKTsgLyogY2xvY2tz
IG5lZWQgdG8gYmUgZW5hYmxlZCBiZWZvcmUgcmVzZXQgKi8KPiAgCj4gIAlkc2lfd3JpdGUobXNt
X2hvc3QsIFJFR19EU0lfUkVTRVQsIDEpOwo+IC0Jd21iKCk7IC8qIG1ha2Ugc3VyZSByZXNldCBo
YXBwZW4gKi8KPiArCW1zbGVlcChSRVNFVF9ERUxBWSk7IC8qIG1ha2Ugc3VyZSByZXNldCBoYXBw
ZW4gKi8KPiAgCWRzaV93cml0ZShtc21faG9zdCwgUkVHX0RTSV9SRVNFVCwgMCk7Cj4gIH0KPiAg
Cj4gQEAgLTEzOTYsNyArMTM5OCw3IEBAIHN0YXRpYyB2b2lkIGRzaV9zd19yZXNldF9yZXN0b3Jl
KHN0cnVjdCBtc21fZHNpX2hvc3QgKm1zbV9ob3N0KQo+ICAKPiAgCS8qIGRzaSBjb250cm9sbGVy
IGNhbiBvbmx5IGJlIHJlc2V0IHdoaWxlIGNsb2NrcyBhcmUgcnVubmluZyAqLwo+ICAJZHNpX3dy
aXRlKG1zbV9ob3N0LCBSRUdfRFNJX1JFU0VULCAxKTsKPiAtCXdtYigpOwkvKiBtYWtlIHN1cmUg
cmVzZXQgaGFwcGVuICovCj4gKwltc2xlZXAoUkVTRVRfREVMQVkpOwkvKiBtYWtlIHN1cmUgcmVz
ZXQgaGFwcGVuICovCj4gIAlkc2lfd3JpdGUobXNtX2hvc3QsIFJFR19EU0lfUkVTRVQsIDApOwo+
ICAJd21iKCk7CS8qIGNvbnRyb2xsZXIgb3V0IG9mIHJlc2V0ICovCj4gIAlkc2lfd3JpdGUobXNt
X2hvc3QsIFJFR19EU0lfQ1RSTCwgZGF0YTApOwo+IC0tIAo+IDIuMTcuMQo+IAoKLS0gClNlYW4g
UGF1bCwgU29mdHdhcmUgRW5naW5lZXIsIEdvb2dsZSAvIENocm9taXVtIE9TCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxp
c3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubw==
