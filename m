Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id CF2313D5C6A
	for <lists+freedreno@lfdr.de>; Mon, 26 Jul 2021 16:57:04 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7CA3C6FD5B;
	Mon, 26 Jul 2021 14:57:03 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2CDD6EA93;
 Mon, 26 Jul 2021 14:56:58 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id
 k4-20020a17090a5144b02901731c776526so20115625pjm.4; 
 Mon, 26 Jul 2021 07:56:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=2d8Oi66unu57TRBB1+7vLe4XfWK1Fq+Xj8a4TbgOWJ0=;
 b=Y29gHe+aiKGj0W2qApAfTlHWVBxpId/RC/OAxrGtwoZvcHCyxCfVyRi1JS6fEg2alZ
 m4FX5gWvfNPyaei/I7I9GSM50egr5Ub6Hh5AP8O9TatcjkFCV6KpJXLDtRGZYIsI41+A
 /4ipmyT/wF8iArdGCp/QEEEUNIFivPj9kKbXIM9qzWnVPd6vg5WlMbzB+zrbDKOd4dc7
 JBHiPsARy9hcHB41INS+kZyVvaQ4d0FjPdnEvjCNlzymgL7LrD65z5ahB95DZoFdBN+j
 me3c/TH3+ZwjWsgCqCHOIqKIQW7LnuEW562kx6mpzxDwS0i6+iLYKrrxzuNZJX9vB7xs
 JfLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=2d8Oi66unu57TRBB1+7vLe4XfWK1Fq+Xj8a4TbgOWJ0=;
 b=qbORKVD+1zEUp78IL3z3gEWj8ZvhgtKQuaB2Ri4QUMOLefj3ID2X/YAOGWdvaAZ1qi
 TxpnngX+P0tWJHW81d9jN0vJaCRdiQD9fuQbMZ9Gmtud8X2GBrJ9HatcddZO4kej0Lg8
 6Gezd3Kj1SG0WG79LaP7qr18lIaZiI60uW3oiKtOX1Ku6JF2GEZs4SRzbnWr51z+/+Sc
 BvFWVg9GDdsFWFcxy67joS81pLrrhEoSlesr4s77vcFJ48qE8dXljml65rQ9/BQv8A3h
 fhIildoHIbpI8jCD34Yxo0UkgFiO8GlTujxk7Ul953/igBDINIY1vvBqBB85xt1oTdkL
 GFzg==
X-Gm-Message-State: AOAM533IA4VH3miget7uatXxsaGogfAZyhlyLrZyh6RVMXY/phRXb9EF
 GAaq2ypsqahRbiH5Q1nRhzkRyqS9+0ua8A==
X-Google-Smtp-Source: ABdhPJzPr+m6yPmPszh4iugd10dO2+P3pRLaGUKfaDM9RSxm7qoPo3OzUGgmGaD4ra4XrRVQPUHefQ==
X-Received: by 2002:a62:e90b:0:b029:30e:4530:8dca with SMTP id
 j11-20020a62e90b0000b029030e45308dcamr18509085pfh.17.1627311417941; 
 Mon, 26 Jul 2021 07:56:57 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id s19sm5670862pju.21.2021.07.26.07.56.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:56:57 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Mon, 26 Jul 2021 08:00:24 -0700
Message-Id: <20210726150038.2187631-11-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150038.2187631-1-robdclark@gmail.com>
References: <20210726150038.2187631-1-robdclark@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 10/12] drm/msm: Drop struct_mutex in submit
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
YwppbmRleCAyYjE1ODQzM2E2ZTUuLmFmZmNlY2NmMTQ1ZCAxMDA2NDQKLS0tIGEvZHJpdmVycy9n
cHUvZHJtL21zbS9tc21fZ2VtX3N1Ym1pdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNt
X2dlbV9zdWJtaXQuYwpAQCAtNzExLDcgKzcxMSw3IEBAIGludCBtc21faW9jdGxfZ2VtX3N1Ym1p
dChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCXN0cnVjdCBtc21fZHJtX3By
aXZhdGUgKnByaXYgPSBkZXYtPmRldl9wcml2YXRlOwogCXN0cnVjdCBkcm1fbXNtX2dlbV9zdWJt
aXQgKmFyZ3MgPSBkYXRhOwogCXN0cnVjdCBtc21fZmlsZV9wcml2YXRlICpjdHggPSBmaWxlLT5k
cml2ZXJfcHJpdjsKLQlzdHJ1Y3QgbXNtX2dlbV9zdWJtaXQgKnN1Ym1pdDsKKwlzdHJ1Y3QgbXNt
X2dlbV9zdWJtaXQgKnN1Ym1pdCA9IE5VTEw7CiAJc3RydWN0IG1zbV9ncHUgKmdwdSA9IHByaXYt
PmdwdTsKIAlzdHJ1Y3QgbXNtX2dwdV9zdWJtaXRxdWV1ZSAqcXVldWU7CiAJc3RydWN0IG1zbV9y
aW5nYnVmZmVyICpyaW5nOwpAQCAtNzU1LDcgKzc1NSw3IEBAIGludCBtc21faW9jdGxfZ2VtX3N1
Ym1pdChzdHJ1Y3QgZHJtX2RldmljZSAqZGV2LCB2b2lkICpkYXRhLAogCXRyYWNlX21zbV9ncHVf
c3VibWl0KHBpZF9ucihwaWQpLCByaW5nLT5pZCwgc3VibWl0aWQsCiAJCWFyZ3MtPm5yX2Jvcywg
YXJncy0+bnJfY21kcyk7CiAKLQlyZXQgPSBtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJmRldi0+
c3RydWN0X211dGV4KTsKKwlyZXQgPSBtdXRleF9sb2NrX2ludGVycnVwdGlibGUoJnF1ZXVlLT5s
b2NrKTsKIAlpZiAocmV0KQogCQlnb3RvIG91dF9wb3N0X3VubG9jazsKIApAQCAtODc2LDEwICs4
NzYsOCBAQCBpbnQgbXNtX2lvY3RsX2dlbV9zdWJtaXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwg
dm9pZCAqZGF0YSwKIAkgKiBBbGxvY2F0ZSBhbiBpZCB3aGljaCBjYW4gYmUgdXNlZCBieSBXQUlU
X0ZFTkNFIGlvY3RsIHRvIG1hcCBiYWNrCiAJICogdG8gdGhlIHVuZGVybHlpbmcgZmVuY2UuCiAJ
ICovCi0JbXV0ZXhfbG9jaygmcXVldWUtPmxvY2spOwogCXN1Ym1pdC0+ZmVuY2VfaWQgPSBpZHJf
YWxsb2NfY3ljbGljKCZxdWV1ZS0+ZmVuY2VfaWRyLAogCQkJc3VibWl0LT51c2VyX2ZlbmNlLCAw
LCBJTlRfTUFYLCBHRlBfS0VSTkVMKTsKLQltdXRleF91bmxvY2soJnF1ZXVlLT5sb2NrKTsKIAlp
ZiAoc3VibWl0LT5mZW5jZV9pZCA8IDApIHsKIAkJcmV0ID0gc3VibWl0LT5mZW5jZV9pZCA9IDA7
CiAJCXN1Ym1pdC0+ZmVuY2VfaWQgPSAwOwpAQCAtOTE0LDEyICs5MTIsMTIgQEAgaW50IG1zbV9p
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
