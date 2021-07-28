Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D618A3D8512
	for <lists+freedreno@lfdr.de>; Wed, 28 Jul 2021 03:03:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7B8A16EBFB;
	Wed, 28 Jul 2021 01:03:02 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com
 [IPv6:2607:f8b0:4864:20::1031])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ABA586EC1D;
 Wed, 28 Jul 2021 01:03:01 +0000 (UTC)
Received: by mail-pj1-x1031.google.com with SMTP id m1so2661806pjv.2;
 Tue, 27 Jul 2021 18:03:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=iQl1zklLaPv92Alba3eURiJZkQo+etEvUQ/Z9I1Qnlw=;
 b=TOa8xdycxSbKrcHIPpwJmM/VJue65YpLU5HWDDroiFExlf7qWD/B+ryetsiUC4lw0/
 +xZWB0rPI/Rm1JukLT4nwIlS/NiEPNOS2SNfKql8kz/YmVQmPgN81ollvWstHA0wvB+n
 DGOJfm34611Vs53G4TcZSazo4LUZoqkNdM1p8v4Z7Qzt8UkWFHco7WaIU+LeeGz/ArDF
 lBAvmGyLBvbUvtY5U+LJRPIt1YMKw6AsY3pmhdFahN9maerXx8JhTUUQFHim5kxwvGAC
 /9TGrVoYzicjetMgsf5xziVWYwTvMAgQx45PmggEadz7wD/5FU7vsoq26Wjfqf2/fKwu
 WOHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=iQl1zklLaPv92Alba3eURiJZkQo+etEvUQ/Z9I1Qnlw=;
 b=sCqXKh2EaL91G0tcIJ54zzDehcLE4WvzFXdB/+0d2D3Am36aEkhQO+m+Nyu6JuWt//
 6rqvRorQ+vWFIIaaDvqFFaWmJiR2QaHXpx4d5f0TTBQIhCUqkLeNe+VvZv7lPBpulWc2
 JfF8L/Z2l5hoQnNl3tTYP7ZsvHBi1/w9h4jYCPEiNCiuQl7XD/F+Ut4/RA1+e3qRz9NN
 c+Lb6iRXlsRsqh3/vvf0KCA613FLX6OoTIg38NennVQht1HAjiHNIlyXOMrRj7785y+3
 3SUG9AE96BncIOHvpmGav8nBD4OxKR1IYaxUHdSlJo6qb7NyzBy2SX0jDYZsA/VlhHfX
 FiWg==
X-Gm-Message-State: AOAM532zB9xVCb0SCkGU0XxPW3511hjHsyTJM3YcjjtupkgpVhbgIvz3
 SJnpvFS0MLjt14A6acezGHeHRR5nZbNZFQ==
X-Google-Smtp-Source: ABdhPJwF3hR3QKAwcmVMbo036jhQ8GG7qs1y5GTVbs8PSTb98u4agfBa4d4PGT2WC8k6iHKMWMsKJQ==
X-Received: by 2002:a17:902:b188:b029:11b:1549:da31 with SMTP id
 s8-20020a170902b188b029011b1549da31mr20649863plr.7.1627434180712; 
 Tue, 27 Jul 2021 18:03:00 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 me1sm3749879pjb.38.2021.07.27.18.02.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 18:02:59 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Tue, 27 Jul 2021 18:06:16 -0700
Message-Id: <20210728010632.2633470-12-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 11/13] drm/msm: Drop struct_mutex in submit
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
Cc: Rob Clark <robdclark@chromium.org>, David Airlie <airlied@linux.ie>,
 freedreno@lists.freedesktop.org, open list <linux-kernel@vger.kernel.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sean Paul <sean@poorly.run>,
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
