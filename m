Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 582C7102DFC
	for <lists+freedreno@lfdr.de>; Tue, 19 Nov 2019 22:08:59 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 24A616E3F2;
	Tue, 19 Nov 2019 21:08:57 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x341.google.com (mail-wm1-x341.google.com
 [IPv6:2a00:1450:4864:20::341])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 321716E409
 for <freedreno@lists.freedesktop.org>; Tue, 19 Nov 2019 21:08:55 +0000 (UTC)
Received: by mail-wm1-x341.google.com with SMTP id 8so5502020wmo.0
 for <freedreno@lists.freedesktop.org>; Tue, 19 Nov 2019 13:08:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/J7G3D2ebt6Z0HB4QG8yK+4PVkYn3CZE5ldyfHzxSrE=;
 b=Hcvazfsa3t0C5dNbOmhSKxfzRYEy8PgxZ8swQjqqzupaQN/3rWTSz5fWDQjva+KmVk
 avC63bEwcw1CMJg9k6owulqW9pAp0sEQz66tuOxon77+gPgUmJGV8ZGurPbdW9AuMn26
 V+glA4nOXRC7T4zCgSjg/qtSTl9HdjwgIs2/lpZ3O1yd1FvRHO0dRV0jCfi8Bi0QFWAb
 SUDinsmOJpykNQqOUVvlqDcysnvchXiLE5FDjyZRi9/yajkcndE7LxWDic6eJE24BmTc
 swpHtyoCSq1zXwvYFijGtcZGSAGEux1CHhgzBVxb6MrXiEL1tdsBZ5a1EU1sWbogwPN+
 X3mQ==
X-Gm-Message-State: APjAAAULNUBAQZD9THWBTv/lPkQTJe97OwVhadHbMzQBJ5c36LLYN3pl
 bCnhDAqZNv7THp+eo9FVWyksWw==
X-Google-Smtp-Source: APXvYqweGr5lRb2H3jBAb7BO6vyXvuEU0Xn9y82lr1/l6PpO5IamxURKkygb4S/V5DyM3yZ+YUBQ7Q==
X-Received: by 2002:a1c:9a81:: with SMTP id c123mr8080941wme.118.1574197733780; 
 Tue, 19 Nov 2019 13:08:53 -0800 (PST)
Received: from phenom.ffwll.local (212-51-149-96.fiber7.init7.net.
 [212.51.149.96])
 by smtp.gmail.com with ESMTPSA id z14sm28005126wrl.60.2019.11.19.13.08.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Nov 2019 13:08:53 -0800 (PST)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 DRI Development <dri-devel@lists.freedesktop.org>
Date: Tue, 19 Nov 2019 22:08:44 +0100
Message-Id: <20191119210844.16947-4-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.24.0
In-Reply-To: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
References: <20191119210844.16947-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/J7G3D2ebt6Z0HB4QG8yK+4PVkYn3CZE5ldyfHzxSrE=;
 b=Y/D3zFMQVqiSBfqH6DZ+/jejFtdbuHL69Yvo58kYvUYGswh2OtzunEL51V44+jnRNa
 ri1kIAI1ZNJN/CtNFGIo+A400H2rA2nL/IEVUKaLYCYC1t/ulVTa46bNV8lnrM52+bJh
 1LyG44aDuM6YxyD6IdzCvZtz5DTf0tod3Ew+I=
Subject: [Freedreno] [PATCH 3/3] drm/msm: Don't init ww_mutec acquire ctx
 before needed
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
Cc: Sean Paul <sean@poorly.run>, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, freedreno@lists.freedesktop.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rm9yIGxvY2tpbmcgc2VtYW50aWNzIGl0IHJlYWxseSBkb2Vzbid0IG1hdHRlciB3aGVuIHdlIGdy
YWIgdGhlCnRpY2tldC4gQnV0IGZvciBsb2NrZGVwIHZhbGlkYXRpb24gaXQgZG9lczogdGhlIGFj
cXVpcmUgY3R4IGlzIGEgZmFrZQpsb2NrZGVwLiBTaW5jZSBvdGhlciBkcml2ZXJzIG1pZ2h0IHdh
bnQgdG8gZG8gYSBmdWxsIG11bHRpLWxvY2sgZGFuY2UKaW4gdGhlaXIgZmF1bHQtaGFuZGxlciwg
bm90IGp1c3QgbG9jayBhIHNpbmdsZSBkbWFfcmVzdi4gVGhlcmVmb3JlIHdlCm11c3QgaW5pdCB0
aGUgYWNxdWlyZV9jdHggb25seSBhZnRlciB3ZSd2ZSBkb25lIGFsbCB0aGUgY29weV8qX3VzZXIg
b3IKYW55dGhpbmcgZWxzZSB0aGF0IG1pZ2h0IHRyaWdnZXIgYSBwYWdlZmF1bHQuIEZvciBtc20g
dGhpcyBtZWFucyB3ZQpuZWVkIHRvIG1vdmUgaXQgcGFzdCBzdWJtaXRfbG9va3VwX29iamVjdHMu
CgpBc2lkZTogV2h5IGlzIG1zbSBzdGlsbCB1c2luZyBzdHJ1Y3RfbXV0ZXgsIGl0IHNlZW1zIHRv
IGJlIHVzaW5nCmRtYV9yZXN2X2xvY2sgZm9yIGdlbmVyYWwgYnVmZmVyIHN0YXRlIHByb3RlY3Rp
b24/CgpTaWduZWQtb2ZmLWJ5OiBEYW5pZWwgVmV0dGVyIDxkYW5pZWwudmV0dGVyQGludGVsLmNv
bT4KQ2M6IFJvYiBDbGFyayA8cm9iZGNsYXJrQGdtYWlsLmNvbT4KQ2M6IFNlYW4gUGF1bCA8c2Vh
bkBwb29ybHkucnVuPgpDYzogbGludXgtYXJtLW1zbUB2Z2VyLmtlcm5lbC5vcmcKQ2M6IGZyZWVk
cmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9n
ZW1fc3VibWl0LmMgfCAyICstCiAxIGZpbGUgY2hhbmdlZCwgMSBpbnNlcnRpb24oKyksIDEgZGVs
ZXRpb24oLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0
LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMKaW5kZXggZmIxZmRkN2Zh
M2VmLi4xMjZiMmY2MmJmZTcgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dl
bV9zdWJtaXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMKQEAg
LTU0LDcgKzU0LDYgQEAgc3RhdGljIHN0cnVjdCBtc21fZ2VtX3N1Ym1pdCAqc3VibWl0X2NyZWF0
ZShzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCiAJSU5JVF9MSVNUX0hFQUQoJnN1Ym1pdC0+bm9k
ZSk7CiAJSU5JVF9MSVNUX0hFQUQoJnN1Ym1pdC0+Ym9fbGlzdCk7Ci0Jd3dfYWNxdWlyZV9pbml0
KCZzdWJtaXQtPnRpY2tldCwgJnJlc2VydmF0aW9uX3d3X2NsYXNzKTsKIAogCXJldHVybiBzdWJt
aXQ7CiB9CkBAIC00ODksNiArNDg4LDcgQEAgaW50IG1zbV9pb2N0bF9nZW1fc3VibWl0KHN0cnVj
dCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJaWYgKHJldCkKIAkJZ290byBvdXQ7CiAK
Kwl3d19hY3F1aXJlX2luaXQoJnN1Ym1pdC0+dGlja2V0LCAmcmVzZXJ2YXRpb25fd3dfY2xhc3Mp
OwogCXJldCA9IHN1Ym1pdF9sb2NrX29iamVjdHMoc3VibWl0KTsKIAlpZiAocmV0KQogCQlnb3Rv
IG91dDsKLS0gCjIuMjQuMAoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0
b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJl
ZWRyZW5v
