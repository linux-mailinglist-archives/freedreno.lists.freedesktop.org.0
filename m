Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E993D5C48
	for <lists+freedreno@lfdr.de>; Mon, 26 Jul 2021 16:56:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 601086EA93;
	Mon, 26 Jul 2021 14:56:32 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1035.google.com (mail-pj1-x1035.google.com
 [IPv6:2607:f8b0:4864:20::1035])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 34FEF6EA93;
 Mon, 26 Jul 2021 14:56:31 +0000 (UTC)
Received: by mail-pj1-x1035.google.com with SMTP id
 m10-20020a17090a34cab0290176b52c60ddso355078pjf.4; 
 Mon, 26 Jul 2021 07:56:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
 b=JiIaaMCMbRm9mnJqUkFsfhJqfx6YQtWOcgTgsY7B0MQSf2dCUJ6fDDh2OdEKoM29XW
 QE+0jeQMIxKphuKIDCJEOqXn4g1B53buWNFtI5BkjhpBXV6OQP+gMbAR8C2ryOJYkoze
 y97CGRS3CFKLf7T/6IXO/NPSLPSlDBGTDhKQxHUMtAbvZaPl0j0EXA/38rjqUGvVGMeu
 NU2HHPINv2C8My3S0ihjsrW7uxgV62D6Zn650OWpTcTsZNzlWkO/6Kal3lx8L/k1dnTL
 wUCZqmMfk+FiY/cdwpOOnAR2WD2UcH5H2/pexZt3DsNJSOgV6bOtXc4Iw5mprG/7zPtv
 FsIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=Js4SVN2QJpsuQ3B87ULYILXZZSJ6LhH5VH51TEc9C1M=;
 b=ckS/NTNwZJJi8pGxrSL1ZQiFri+OgjaQ2LwDRuGz+DbZpDN9YliGDeuvFX3xgiGkr2
 T65vGolwWguLS6hNXdz6if+nkjxCz01hv5aKk4CgbLkWo9ZC9bgiGtq77J3htSug+HOu
 ZjZUK9Fg0hhpsTjQdAp0QPkUw4oxiO8w3KUyaH5qxtuTEang13xY4Fztl0jEGKluFQAT
 bCUBj6cDubbADr+FpTvvz2xan0AUFvJ0L0IrBcQB7F2bJ9wDuqP4ClK6xSk85vIS3HZw
 nKv9anDBrKJN/rmtYkESzeUrEDqGCgJxEy+V4GLQBCt1yYvskb97np18hX+EbL9VNNFS
 obUQ==
X-Gm-Message-State: AOAM532zLuasKn/8IayCDj+6267F+vNtmcB2/40QUgj/ieAOqMDPnY3V
 d1zCV3xBRh9LcUqUApXZB8rnlqys9Ivf9Q==
X-Google-Smtp-Source: ABdhPJz86h6PCUyD51DoJndCL8qycP19c2HgrDfDXD+QrXL7gt+CAfAJRBeyCjnSVSAo7Xas4LT+qw==
X-Received: by 2002:a05:6a00:1503:b029:395:f05c:e073 with SMTP id
 q3-20020a056a001503b0290395f05ce073mr6929303pfu.80.1627311390171; 
 Mon, 26 Jul 2021 07:56:30 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id h30sm242101pfr.191.2021.07.26.07.56.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:56:29 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Mon, 26 Jul 2021 08:00:16 -0700
Message-Id: <20210726150038.2187631-3-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150038.2187631-1-robdclark@gmail.com>
References: <20210726150038.2187631-1-robdclark@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 02/12] drm/msm: Small submitqueue creation
 cleanup
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

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKSWYgd2UgZG9uJ3QgaGF2
ZSBhIGdwdSwgdGhlcmUgaXMgbm8gbmVlZCB0byBjcmVhdGUgYSBzdWJtaXRxdWV1ZSwgd2hpY2gK
bGV0cyB1cyBzaW1wbGlmeSB0aGUgZXJyb3IgaGFuZGxpbmcgYW5kIHN1Ym1pdHF1ZXVlIGNyZWF0
aW9uLgoKU2lnbmVkLW9mZi1ieTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgpB
Y2tlZC1ieTogQ2hyaXN0aWFuIEvDtm5pZyA8Y2hyaXN0aWFuLmtvZW5pZ0BhbWQuY29tPgotLS0K
IGRyaXZlcnMvZ3B1L2RybS9tc20vbXNtX3N1Ym1pdHF1ZXVlLmMgfCAyMiArKysrKysrKysrKy0t
LS0tLS0tLS0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMTEgZGVsZXRpb25z
KC0pCgpkaWZmIC0tZ2l0IGEvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fc3VibWl0cXVldWUuYyBi
L2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX3N1Ym1pdHF1ZXVlLmMKaW5kZXggZTVlZWYxMWVkMDE0
Li45ZTlmZWM2MWQ2MjkgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX3N1Ym1p
dHF1ZXVlLmMKKysrIGIvZHJpdmVycy9ncHUvZHJtL21zbS9tc21fc3VibWl0cXVldWUuYwpAQCAt
NjYsNiArNjYsMTIgQEAgaW50IG1zbV9zdWJtaXRxdWV1ZV9jcmVhdGUoc3RydWN0IGRybV9kZXZp
Y2UgKmRybSwgc3RydWN0IG1zbV9maWxlX3ByaXZhdGUgKmN0eCwKIAlpZiAoIWN0eCkKIAkJcmV0
dXJuIC1FTk9ERVY7CiAKKwlpZiAoIXByaXYtPmdwdSkKKwkJcmV0dXJuIC1FTk9ERVY7CisKKwlp
ZiAocHJpbyA+PSBwcml2LT5ncHUtPm5yX3JpbmdzKQorCQlyZXR1cm4gLUVJTlZBTDsKKwogCXF1
ZXVlID0ga3phbGxvYyhzaXplb2YoKnF1ZXVlKSwgR0ZQX0tFUk5FTCk7CiAKIAlpZiAoIXF1ZXVl
KQpAQCAtNzMsMTUgKzc5LDcgQEAgaW50IG1zbV9zdWJtaXRxdWV1ZV9jcmVhdGUoc3RydWN0IGRy
bV9kZXZpY2UgKmRybSwgc3RydWN0IG1zbV9maWxlX3ByaXZhdGUgKmN0eCwKIAogCWtyZWZfaW5p
dCgmcXVldWUtPnJlZik7CiAJcXVldWUtPmZsYWdzID0gZmxhZ3M7Ci0KLQlpZiAocHJpdi0+Z3B1
KSB7Ci0JCWlmIChwcmlvID49IHByaXYtPmdwdS0+bnJfcmluZ3MpIHsKLQkJCWtmcmVlKHF1ZXVl
KTsKLQkJCXJldHVybiAtRUlOVkFMOwotCQl9Ci0KLQkJcXVldWUtPnByaW8gPSBwcmlvOwotCX0K
KwlxdWV1ZS0+cHJpbyA9IHByaW87CiAKIAl3cml0ZV9sb2NrKCZjdHgtPnF1ZXVlbG9jayk7CiAK
QEAgLTEwNywxMiArMTA1LDE0IEBAIGludCBtc21fc3VibWl0cXVldWVfaW5pdChzdHJ1Y3QgZHJt
X2RldmljZSAqZHJtLCBzdHJ1Y3QgbXNtX2ZpbGVfcHJpdmF0ZSAqY3R4KQogCXN0cnVjdCBtc21f
ZHJtX3ByaXZhdGUgKnByaXYgPSBkcm0tPmRldl9wcml2YXRlOwogCWludCBkZWZhdWx0X3ByaW87
CiAKKwlpZiAoIXByaXYtPmdwdSkKKwkJcmV0dXJuIC1FTk9ERVY7CisKIAkvKgogCSAqIFNlbGVj
dCBwcmlvcml0eSAyIGFzIHRoZSAiZGVmYXVsdCBwcmlvcml0eSIgdW5sZXNzIG5yX3JpbmdzIGlz
IGxlc3MKIAkgKiB0aGFuIDIgYW5kIHRoZW4gcGljayB0aGUgbG93ZXN0IHByaW9yaXR5CiAJICov
Ci0JZGVmYXVsdF9wcmlvID0gcHJpdi0+Z3B1ID8KLQkJY2xhbXBfdCh1aW50MzJfdCwgMiwgMCwg
cHJpdi0+Z3B1LT5ucl9yaW5ncyAtIDEpIDogMDsKKwlkZWZhdWx0X3ByaW8gPSBjbGFtcF90KHVp
bnQzMl90LCAyLCAwLCBwcml2LT5ncHUtPm5yX3JpbmdzIC0gMSk7CiAKIAlJTklUX0xJU1RfSEVB
RCgmY3R4LT5zdWJtaXRxdWV1ZXMpOwogCi0tIAoyLjMxLjEKCl9fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxpc3QKRnJlZWRy
ZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNrdG9wLm9yZy9t
YWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
