Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0038829FE2
	for <lists+freedreno@lfdr.de>; Fri, 24 May 2019 22:29:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1FB736E0E5;
	Fri, 24 May 2019 20:29:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-yw1-xc43.google.com (mail-yw1-xc43.google.com
 [IPv6:2607:f8b0:4864:20::c43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1145F6E0D8
 for <freedreno@lists.freedesktop.org>; Fri, 24 May 2019 20:29:22 +0000 (UTC)
Received: by mail-yw1-xc43.google.com with SMTP id t5so4109539ywf.10
 for <freedreno@lists.freedesktop.org>; Fri, 24 May 2019 13:29:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c2ELsUk5RigKbXs7v0mo3vG/aBHd4zdn0FsdaHEKk18=;
 b=SCrIEZJw7HeK1fA/SAt8W1L71rLqBNxdzTJMYnfTnvhzap0OAufDKgCGtFlwIuqYDn
 KxKMFjH00+pPPPemM9wnF8aHSe5J0PKXwGaNwpiHTGR8+P0S4XZc74EbSC5q9cXMRb8S
 QYVoWNoJNTYL857YDxtVDn1fkm+IgyQGR8EoNlhoMjjjT/XCfFgJh1Cgqa0mQUDL1k/C
 /OLEpgAKGqq7Yh2X3Ar8t6G9qnsgN9usR1GAI+YGCgmtRP/39MiaEx1y9sYO0ywbxU8r
 M8DVROcZdB5EqNYuh17ncj1DdxEYdhEoXaWWDens9gxJNKEF7CX6Jtk+zOB2O1PVe0fO
 NdOg==
X-Gm-Message-State: APjAAAUwXPT7epbMbeV2AkuLEjuYmwSxn/QZDG5QurKB89js9IFudKFN
 65NCfQnvywH3vU8wT7c00/QXow==
X-Google-Smtp-Source: APXvYqxjH+mJbEbFJxzZxGrWUHPRyOR+Ke2+ux9+XDNzM37Gpre/xYmMibmp0/Ave/On3ss5xe+/Bw==
X-Received: by 2002:a81:2245:: with SMTP id i66mr47857690ywi.307.1558729761162; 
 Fri, 24 May 2019 13:29:21 -0700 (PDT)
Received: from rosewood.cam.corp.google.com
 ([2620:0:1013:11:89c6:2139:5435:371d])
 by smtp.gmail.com with ESMTPSA id m185sm891987ywf.38.2019.05.24.13.29.20
 (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
 Fri, 24 May 2019 13:29:20 -0700 (PDT)
From: Sean Paul <sean@poorly.run>
To: dri-devel@lists.freedesktop.org,
	freedreno@lists.freedesktop.org
Date: Fri, 24 May 2019 16:29:13 -0400
Message-Id: <20190524202919.179289-1-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc1.257.g3120a18244-goog
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=poorly.run; s=google;
 h=from:to:cc:subject:date:message-id:mime-version
 :content-transfer-encoding;
 bh=c2ELsUk5RigKbXs7v0mo3vG/aBHd4zdn0FsdaHEKk18=;
 b=VrBGa884upuPpxxrR3rFCWPSDyhTYoDYb39LqTQLOjjfaHJTglKZ3WwVJOGsSjQeXh
 tE7HKZp+uvxd9CMKk3J0Ix6anvhbV6Xz0PkKnuYM96+7KBb1eG7I0pqSlAm1l+MPN7Xf
 qbM1vVk5WAtxR37M+9pHvolO4k06NJn3zyprLDgNf2GE0hn5yDqx3ojAVDgmFpdp4bQw
 gXfVRaJAn2Pf9PNpU55FVq9gUhquejhXY78Y0os+b2YSFLRu33F0xD7BM6kX3Pk0ANP2
 P5jcM+HcFF2iZ9WNL/ruQsZBfSxyHqU7yN7cZDgIkexXoAqE+XcR/GBUV6nNf4/pPp2z
 mLnw==
Subject: [Freedreno] [PATCH] drm/msm: Re-order uninit function to work
 during probe defer
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
Cc: Sean Paul <sean@poorly.run>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <seanpaul@chromium.org>, linux-arm-msm@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogU2VhbiBQYXVsIDxzZWFucGF1bEBjaHJvbWl1bS5vcmc+CgpJZiBiaW5kIGZhaWxzLCB3
ZSBjYW4gY2FsbCBtc21fZHJtX3VuaW5pdCBiZWZvcmUga21zIGVsZW1lbnRzIGhhdmUgYmVlbgpj
cmVhdGVkLiBJbiB0aGlzIGNhc2UsIGRybV9hdG9taWNfaGVscGVyX3NodXRkb3duIHdpbGwgZmFp
bCBzaW5jZSB0aGVyZQphcmUgbm8gZHJtIG9iamVjdHMuIE9ubHkgY2FsbCBkcm0gdW5yZWdpc3Ry
YXRpb24gYW5kIHNodXRkb3duIGlmIGRybSBpcwpyZWdpc3RlcmVkLgoKQWxzbyB3aGlsZSB3ZSdy
ZSBpbiBoZXJlIG1vdmUgdGhlIHdvcmtxdWV1ZSBkZXN0cnVjdGlvbiB0byBiZWxvdwpjb21wb25l
bnRfdW5iaW5kIHNpbmNlIGNvbXBvbmVudHMgY291bGQgYmUgYWN0aXZlbHkgdXNpbmcgdGhlIHdx
IGR1cmluZwp1bmluaXQgb3IgaW4gdGhlaXIgdW5iaW5kIHJvdXRpbmUuCgpTaWduZWQtb2ZmLWJ5
OiBTZWFuIFBhdWwgPHNlYW5wYXVsQGNocm9taXVtLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9kcnYuYyB8IDE4ICsrKysrKysrKysrKysrLS0tLQogMSBmaWxlIGNoYW5nZWQsIDE0
IGluc2VydGlvbnMoKyksIDQgZGVsZXRpb25zKC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUv
ZHJtL21zbS9tc21fZHJ2LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYwppbmRleCAz
MWRlYjg3YWJmYzYuLjlmMTZhOTk1ZWQ0MiAxMDA2NDQKLS0tIGEvZHJpdmVycy9ncHUvZHJtL21z
bS9tc21fZHJ2LmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMKQEAgLTI1OSwx
MyArMjU5LDI0IEBAIHN0YXRpYyBpbnQgbXNtX2RybV91bmluaXQoc3RydWN0IGRldmljZSAqZGV2
KQogCXN0cnVjdCBtc21fbWRzcyAqbWRzcyA9IHByaXYtPm1kc3M7CiAJaW50IGk7CiAKKwkvKgor
CSAqIFNodXRkb3duIHRoZSBodyBpZiB3ZSdyZSBmYXIgZW5vdWdoIGFsb25nIHdoZXJlIHRoaW5n
cyBtaWdodCBiZSBvbi4KKwkgKiBJZiB3ZSBydW4gdGhpcyB0b28gZWFybHksIHdlJ2xsIGVuZCB1
cCBwYW5pY2tpbmcgaW4gYW55IHZhcmlldHkgb2YKKwkgKiBwbGFjZXMuIFNpbmNlIHdlIGRvbid0
IHJlZ2lzdGVyIHRoZSBkcm0gZGV2aWNlIHVudGlsIGxhdGUgaW4KKwkgKiBtc21fZHJtX2luaXQs
IGRybV9kZXYtPnJlZ2lzdGVyZWQgaXMgdXNlZCBhcyBhbiBpbmRpY2F0b3IgdGhhdCB0aGUKKwkg
KiBzaHV0ZG93biB3aWxsIGJlIHN1Y2Nlc3NmdWwuCisJICovCisJaWYgKGRkZXYtPnJlZ2lzdGVy
ZWQpIHsKKwkJZHJtX2Rldl91bnJlZ2lzdGVyKGRkZXYpOworCQlkcm1fYXRvbWljX2hlbHBlcl9z
aHV0ZG93bihkZGV2KTsKKwl9CisKIAkvKiBXZSBtdXN0IGNhbmNlbCBhbmQgY2xlYW51cCBhbnkg
cGVuZGluZyB2YmxhbmsgZW5hYmxlL2Rpc2FibGUKIAkgKiB3b3JrIGJlZm9yZSBkcm1faXJxX3Vu
aW5zdGFsbCgpIHRvIGF2b2lkIHdvcmsgcmUtZW5hYmxpbmcgYW4KIAkgKiBpcnEgYWZ0ZXIgdW5p
bnN0YWxsIGhhcyBkaXNhYmxlZCBpdC4KIAkgKi8KIAogCWZsdXNoX3dvcmtxdWV1ZShwcml2LT53
cSk7Ci0JZGVzdHJveV93b3JrcXVldWUocHJpdi0+d3EpOwogCiAJLyogY2xlYW4gdXAgZXZlbnQg
d29ya2VyIHRocmVhZHMgKi8KIAlmb3IgKGkgPSAwOyBpIDwgcHJpdi0+bnVtX2NydGNzOyBpKysp
IHsKQEAgLTI3OSw4ICsyOTAsNiBAQCBzdGF0aWMgaW50IG1zbV9kcm1fdW5pbml0KHN0cnVjdCBk
ZXZpY2UgKmRldikKIAogCWRybV9rbXNfaGVscGVyX3BvbGxfZmluaShkZGV2KTsKIAotCWRybV9k
ZXZfdW5yZWdpc3RlcihkZGV2KTsKLQogCW1zbV9wZXJmX2RlYnVnZnNfY2xlYW51cChwcml2KTsK
IAltc21fcmRfZGVidWdmc19jbGVhbnVwKHByaXYpOwogCkBAIC0yODgsNyArMjk3LDcgQEAgc3Rh
dGljIGludCBtc21fZHJtX3VuaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJaWYgKGZiZGV2ICYm
IHByaXYtPmZiZGV2KQogCQltc21fZmJkZXZfZnJlZShkZGV2KTsKICNlbmRpZgotCWRybV9hdG9t
aWNfaGVscGVyX3NodXRkb3duKGRkZXYpOworCiAJZHJtX21vZGVfY29uZmlnX2NsZWFudXAoZGRl
dik7CiAKIAlwbV9ydW50aW1lX2dldF9zeW5jKGRldik7CkBAIC0zMTMsNiArMzIyLDcgQEAgc3Rh
dGljIGludCBtc21fZHJtX3VuaW5pdChzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJZGRldi0+ZGV2X3By
aXZhdGUgPSBOVUxMOwogCWRybV9kZXZfcHV0KGRkZXYpOwogCisJZGVzdHJveV93b3JrcXVldWUo
cHJpdi0+d3EpOwogCWtmcmVlKHByaXYpOwogCiAJcmV0dXJuIDA7Ci0tIApTZWFuIFBhdWwsIFNv
ZnR3YXJlIEVuZ2luZWVyLCBHb29nbGUgLyBDaHJvbWl1bSBPUwoKX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVl
ZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3Jn
L21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
