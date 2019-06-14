Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 053BF46AAD
	for <lists+freedreno@lfdr.de>; Fri, 14 Jun 2019 22:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8962989824;
	Fri, 14 Jun 2019 20:37:23 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com
 [IPv6:2a00:1450:4864:20::544])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7C3D88961D
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jun 2019 20:37:15 +0000 (UTC)
Received: by mail-ed1-x544.google.com with SMTP id m10so5243388edv.6
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jun 2019 13:37:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=zVH7XHQ8Vodmfu+Eco8dq0pOjj0+eXdvJUJLOoKsml8=;
 b=fwmyw/BjD22gFvMBKlqJ8m0X4cgtMZk/kLZASDvSWHv1/g4vg003vgGAwMmTMEp1tq
 IXY5P4/QQa4uuAHK2Ng5UQ3ay1ieLlJ8FvlBMZj6CL4SdcInC1JpvVrgeGdini848uTa
 kSbYGeZawzujtSXNeJaP59Ip6JJDQlnsfGxClpdpS2TQT5r3fOy5MPWjQ2H7FiuKxWDR
 ptC25eW1dGtO+DP+BvlG6UBU/COeRCHn6hc9HKAS8eZT8KdTo5TLwnjJ7MfOEqhalX67
 NlPLUzUU/C1fEdW8oVZEMe7w+LgcsBYBzA4UEhkJD9r+gf+CQa+7Gqk0yQvSLOa9PIZB
 /d9A==
X-Gm-Message-State: APjAAAV26+Q8gz/vf2IJ01VhClqsUBVyqvq3wz3lOWjQBxXl2nOl1zyC
 xVGBU2fErKwye7nY7THxa2i4vQ==
X-Google-Smtp-Source: APXvYqzWRT/tdgTN1qrlvzH9uhWZ8qgzCNOYU/CZOPFjPZVUnKmjz6flOflss0hoCQIpwlp1/8IX6Q==
X-Received: by 2002:a17:906:31c8:: with SMTP id
 f8mr78455436ejf.131.1560544633618; 
 Fri, 14 Jun 2019 13:37:13 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.37.12
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:37:13 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Fri, 14 Jun 2019 22:36:01 +0200
Message-Id: <20190614203615.12639-46-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=zVH7XHQ8Vodmfu+Eco8dq0pOjj0+eXdvJUJLOoKsml8=;
 b=N1jH3Kvy0RZEAGCS+7KCoptKdbFR5zlJnpnezAw0MXLyzqJJ6wvq3X0rtHTz6IEMnv
 ih9r3S9gV/t9un6IES5ZDL8OJkoReezm3l5+65YMYkigl2mCKg0eRorjTcsriljh0UuB
 R73kz2AHoHiDRXKzy+P4do4c16+5gEGPn6Ucs=
Subject: [Freedreno] [PATCH 45/59] drm/msm: Drop robj from msm_gem_new_impl
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

T25seSB1c2VyIHdhcyB0aGUgcHJpbWUgaW1wb3J0LCBhbmQgZHJtX3ByaW1lLmMgdGFrZXMgY2Fy
ZSBvZiB0aGF0Cm5vdy4KClNpZ25lZC1vZmYtYnk6IERhbmllbCBWZXR0ZXIgPGRhbmllbC52ZXR0
ZXJAaW50ZWwuY29tPgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtAZ21haWwuY29tPgpDYzogU2Vh
biBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0tbXNtQHZnZXIua2VybmVsLm9y
ZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwotLS0KIGRyaXZlcnMvZ3B1L2Ry
bS9tc20vbXNtX2dlbS5jIHwgOCArKy0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDIgaW5zZXJ0aW9u
cygrKSwgNiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21z
bV9nZW0uYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbS5jCmluZGV4IDM1ZjU1ZGQyNTk5
NC4uNDA0YjZmZWE5ZTM1IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0u
YworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW0uYwpAQCAtOTQ3LDcgKzk0Nyw2IEBA
IGludCBtc21fZ2VtX25ld19oYW5kbGUoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgc3RydWN0IGRy
bV9maWxlICpmaWxlLAogCiBzdGF0aWMgaW50IG1zbV9nZW1fbmV3X2ltcGwoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwKIAkJdWludDMyX3Qgc2l6ZSwgdWludDMyX3QgZmxhZ3MsCi0JCXN0cnVjdCBy
ZXNlcnZhdGlvbl9vYmplY3QgKnJlc3YsCiAJCXN0cnVjdCBkcm1fZ2VtX29iamVjdCAqKm9iaiwK
IAkJYm9vbCBzdHJ1Y3RfbXV0ZXhfbG9ja2VkKQogewpAQCAtOTc0LDkgKzk3Myw2IEBAIHN0YXRp
YyBpbnQgbXNtX2dlbV9uZXdfaW1wbChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCW1zbV9vYmot
PmZsYWdzID0gZmxhZ3M7CiAJbXNtX29iai0+bWFkdiA9IE1TTV9NQURWX1dJTExORUVEOwogCi0J
aWYgKHJlc3YpCi0JCW1zbV9vYmotPmJhc2UucmVzdiA9IHJlc3Y7Ci0KIAlJTklUX0xJU1RfSEVB
RCgmbXNtX29iai0+c3VibWl0X2VudHJ5KTsKIAlJTklUX0xJU1RfSEVBRCgmbXNtX29iai0+dm1h
cyk7CiAKQEAgLTEwMTgsNyArMTAxNCw3IEBAIHN0YXRpYyBzdHJ1Y3QgZHJtX2dlbV9vYmplY3Qg
Kl9tc21fZ2VtX25ldyhzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LAogCWlmIChzaXplID09IDApCiAJ
CXJldHVybiBFUlJfUFRSKC1FSU5WQUwpOwogCi0JcmV0ID0gbXNtX2dlbV9uZXdfaW1wbChkZXYs
IHNpemUsIGZsYWdzLCBOVUxMLCAmb2JqLCBzdHJ1Y3RfbXV0ZXhfbG9ja2VkKTsKKwlyZXQgPSBt
c21fZ2VtX25ld19pbXBsKGRldiwgc2l6ZSwgZmxhZ3MsICZvYmosIHN0cnVjdF9tdXRleF9sb2Nr
ZWQpOwogCWlmIChyZXQpCiAJCWdvdG8gZmFpbDsKIApAQCAtMTA5NSw3ICsxMDkxLDcgQEAgc3Ry
dWN0IGRybV9nZW1fb2JqZWN0ICptc21fZ2VtX2ltcG9ydChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2
LAogCiAJc2l6ZSA9IFBBR0VfQUxJR04oZG1hYnVmLT5zaXplKTsKIAotCXJldCA9IG1zbV9nZW1f
bmV3X2ltcGwoZGV2LCBzaXplLCBNU01fQk9fV0MsIGRtYWJ1Zi0+cmVzdiwgJm9iaiwgZmFsc2Up
OworCXJldCA9IG1zbV9nZW1fbmV3X2ltcGwoZGV2LCBzaXplLCBNU01fQk9fV0MsICZvYmosIGZh
bHNlKTsKIAlpZiAocmV0KQogCQlnb3RvIGZhaWw7CiAKLS0gCjIuMjAuMQoKX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlz
dApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0
b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
