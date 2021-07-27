Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2DDD53D7BC2
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 19:08:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CACDA6EBA4;
	Tue, 27 Jul 2021 17:08:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1034.google.com (mail-pj1-x1034.google.com
 [IPv6:2607:f8b0:4864:20::1034])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54F806EBA4;
 Tue, 27 Jul 2021 17:08:08 +0000 (UTC)
Received: by mail-pj1-x1034.google.com with SMTP id
 u9-20020a17090a1f09b029017554809f35so5256602pja.5; 
 Tue, 27 Jul 2021 10:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iQl1zklLaPv92Alba3eURiJZkQo+etEvUQ/Z9I1Qnlw=;
 b=aQmQKagbmnZ+BHethyxgK75k8Tv9Hm8vBues9pvulMioSMv8z4qG9zvXALbyG8a7vF
 /8P59Pd01G5S+JStEv4uqVUggPgkn3ejzJM/X3P7jISOqU/N84HupaSz7VjleB84bw+V
 GPgE6YL6CWSN0/RC+qn3L0+wD5M6aWE6YGxZyGjYcCNWWZiE3LVZ5pcsEVI67JB1KOrP
 0E+jPh5p4tPMfVxzEk2wpdx3oDtUDNeHp2si4k1uuXj32QHmzgWM8tdRFCIfrM71rsHd
 x7vTve1rBNqAwMmizhAQSOCx9V1WTUeBEm2cUn3mhtWcmnjNLesT79K7uEt3/UrMpl+s
 Zdtw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iQl1zklLaPv92Alba3eURiJZkQo+etEvUQ/Z9I1Qnlw=;
 b=AJiRWLqgdPTIousiM2gHN90hxgwA3spqCbVIiNS9vWU4XiCl9z1H+umJtro7EXpP3T
 +LwKbPLYo32F6oDrV5ZNgw2tEYQk/Cw5Tx02OoauQSOx/UPZ/Sr9ZBqk6Trw7of8OtRk
 nHy1d5ubnWwfcgrRrGlAeRuPC++H9B2DS2nIvUi4khYKg61WEALyppUntBTRRHY/TBcu
 /+e5erDSkQgAjvMU4ddVOUsQ+yh8QNera4W9kZV6tS0eWkg/PcYkULyUUC17j4kBbExg
 FvzMbCYD5e0mY0maZ12+Xjm/Nda2eu7GdH7z6JyUq9pKW8enuQ/p1PCWdrF8y4YKhc6U
 0SlA==
X-Gm-Message-State: AOAM532PK4qLzHjZ2q+WOPoxMrmmIFA4taW3VA5LaziLwbi0GgAIHCqA
 zDBQXnshaOjbFAwY3TaR3DDS5+KImvCmTg==
X-Google-Smtp-Source: ABdhPJy5R/8jkP0MbJEF2Oq7xrFn4gXezJ7NHToxQwoOC3cQr6uYgKiWLKQCRw6L8WJMbjv+NgTcCw==
X-Received: by 2002:a17:902:76cc:b029:12b:ecc5:c176 with SMTP id
 j12-20020a17090276ccb029012becc5c176mr15537321plt.42.1627405687324; 
 Tue, 27 Jul 2021 10:08:07 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id n14sm3334052pjv.34.2021.07.27.10.08.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:08:06 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Tue, 27 Jul 2021 10:11:27 -0700
Message-Id: <20210727171143.2549475-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 11/13] drm/msm: Drop struct_mutex in submit
 path
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.29
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
Cc: Rob Clark <robdclark@chromium.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU"
 <freedreno@lists.freedesktop.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 open list <linux-kernel@vger.kernel.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Sean Paul <sean@poorly.run>,
 =?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKSXQgaXMgc3VmZmljaWVu
dCB0byBzZXJpYWxpemUgb24gdGhlIHN1Ym1pdCBxdWV1ZSBub3cuCgpTaWduZWQtb2ZmLWJ5OiBS
b2IgQ2xhcmsgPHJvYmRjbGFya0BjaHJvbWl1bS5vcmc+CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2
bmlnIDxjaHJpc3RpYW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9t
c21fZ2VtX3N1Ym1pdC5jIHwgMTIgKysrKystLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgNSBpbnNl
cnRpb25zKCspLCA3IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9t
c20vbXNtX2dlbV9zdWJtaXQuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2dlbV9zdWJtaXQu
YwppbmRleCBlMTFlNGJiNjM2OTUuLjQ1MGVmZTU5YWJiNSAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21zbS9tc21fZ2VtX3N1Ym1pdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNt
X2dlbV9zdWJtaXQuYwpAQCAtNzA5LDcgKzcwOSw3IEBAIGludCBtc21faW9jdGxfZ2VtX3N1Ym1p
dChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCXN0cnVjdCBtc21fZHJtX3By
aXZhdGUgKnByaXYgPSBkZXYtPmRldl9wcml2YXRlOwogCXN0cnVjdCBkcm1fbXNtX2dlbV9zdWJt
aXQgKmFyZ3MgPSBkYXRhOwogCXN0cnVjdCBtc21fZmlsZV9wcml2YXRlICpjdHggPSBmaWxlLT5k
cml2ZXJfcHJpdjsKLQlzdHJ1Y3QgbXNtX2dlbV9zdWJtaXQgKnN1Ym1pdDsKKwlzdHJ1Y3QgbXNt
X2dlbV9zdWJtaXQgKnN1Ym1pdCA9IE5VTEw7CiAJc3RydWN0IG1zbV9ncHUgKmdwdSA9IHByaXYt
PmdwdTsKIAlzdHJ1Y3QgbXNtX2dwdV9zdWJtaXRxdWV1ZSAqcXVldWU7CiAJc3RydWN0IG1zbV9y
aW5nYnVmZmVyICpyaW5nOwpAQCAtNzUzLDcgKzc1Myw3IEBAIGludCBtc21faW9jdGxfZ2VtX3N1
Ym1pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCXRyYWNlX21zbV9ncHVf
c3VibWl0KHBpZF9ucihwaWQpLCByaW5nLT5pZCwgc3VibWl0aWQsCiAJCWFyZ3MtPm5yX2Jvcywg
YXJncy0+bnJfY21kcyk7CiAKLQlyZXQgPSBtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJmRldi0+
c3RydWN0X211dGV4KTsKKwlyZXQgPSBtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJnF1ZXVlLT5s
b2NrKTsKIAlpZiAocmV0KQogCQlnb3RvIG91dF9wb3N0X3VubG9jazsKIApAQCAtODc0LDEwICs4
NzQsOCBAQCBpbnQgbXNtX2lvY3RsX2dlbV9zdWJtaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dm9pZCAqZGF0YSwKIAkgKiBBbGxvY2F0ZSBhbiBpZCB3aGljaCBjYW4gYmUgdXNlZCBieSBXQUlU
X0ZFTkNFIGlvY3RsIHRvIG1hcCBiYWNrCiAJICogdG8gdGhlIHVuZGVybHlpbmcgZmVuY2UuCiAJ
ICovCi0JbXV0ZXhfbG9jaygmcXVldWUtPmxvY2spOwogCXN1Ym1pdC0+ZmVuY2VfaWQgPSBpZHJf
YWxsb2NfY3ljbGljKCZxdWV1ZS0+ZmVuY2VfaWRyLAogCQkJc3VibWl0LT51c2VyX2ZlbmNlLCAw
LCBJTlRfTUFYLCBHRlBfS0VSTkVMKTsKLQltdXRleF91bmxvY2soJnF1ZXVlLT5sb2NrKTsKIAlp
ZiAoc3VibWl0LT5mZW5jZV9pZCA8IDApIHsKIAkJcmV0ID0gc3VibWl0LT5mZW5jZV9pZCA9IDA7
CiAJCXN1Ym1pdC0+ZmVuY2VfaWQgPSAwOwpAQCAtOTEyLDEyICs5MTAsMTIgQEAgaW50IG1zbV9p
b2N0bF9nZW1fc3VibWl0KHN0cnVjdCBkcm1fZGV2aWNlICpkZXYsIHZvaWQgKmRhdGEsCiAJc3Vi
bWl0X2NsZWFudXAoc3VibWl0LCAhIXJldCk7CiAJaWYgKGhhc193d190aWNrZXQpCiAJCXd3X2Fj
cXVpcmVfZmluaSgmc3VibWl0LT50aWNrZXQpOwotCW1zbV9nZW1fc3VibWl0X3B1dChzdWJtaXQp
Owogb3V0X3VubG9jazoKIAlpZiAocmV0ICYmIChvdXRfZmVuY2VfZmQgPj0gMCkpCiAJCXB1dF91
bnVzZWRfZmQob3V0X2ZlbmNlX2ZkKTsKLQltdXRleF91bmxvY2soJmRldi0+c3RydWN0X211dGV4
KTsKLQorCW11dGV4X3VubG9jaygmcXVldWUtPmxvY2spOworCWlmIChzdWJtaXQpCisJCW1zbV9n
ZW1fc3VibWl0X3B1dChzdWJtaXQpOwogb3V0X3Bvc3RfdW5sb2NrOgogCWlmICghSVNfRVJSX09S
X05VTEwocG9zdF9kZXBzKSkgewogCQlmb3IgKGkgPSAwOyBpIDwgYXJncy0+bnJfb3V0X3N5bmNv
YmpzOyArK2kpIHsKLS0gCjIuMzEuMQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGlu
Zm8vZnJlZWRyZW5vCg==
