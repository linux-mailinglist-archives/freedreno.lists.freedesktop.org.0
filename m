Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87EF03D5C53
	for <lists+freedreno@lfdr.de>; Mon, 26 Jul 2021 16:56:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2B73D6E81F;
	Mon, 26 Jul 2021 14:56:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pj1-x1029.google.com (mail-pj1-x1029.google.com
 [IPv6:2607:f8b0:4864:20::1029])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 043B16E81F;
 Mon, 26 Jul 2021 14:56:47 +0000 (UTC)
Received: by mail-pj1-x1029.google.com with SMTP id
 a4-20020a17090aa504b0290176a0d2b67aso11682194pjq.2; 
 Mon, 26 Jul 2021 07:56:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
 b=U7csDx7myT7ZEpfOQWHAX021iKmpEkjKFYRgPfZgvKRBYy8LewJELViR3KSW8aeSq3
 S/5wnut7LOrYdI+sIC09WfQ/gPdSbi+7Xv2bziM63HyhVuv36dcqSmFEcng/xuGG8Scx
 6b/PBSEDgRON5lc+pMtOeGcRpamcn+uJ71pQYdZtyiB98EByuDMfnvr1RCfrQQBDe3yH
 pjtLbqQgjNDWgSgMMNUK+b2Px275M8XnQIZCHPcJXNK3akAhID3lg3R5N2O+GXozPD+P
 tpnuNpM6Cg5VdGPAadmE2wUEMHFv1wmJVuUXF1VdmUGpyEVeNxtGJkeWJxqB7Qly6RuS
 +4fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
 b=XcpqVTnzKfwExqVE7uFX11hUAc2FfZ0a15xNjI2SdjeQcg2y3yjmz5CDcYy7swD59s
 +X5+r8ylcBke6xXlDGQVxXOPKolK11i2Ml2bqyORUX//BEdN10p6QpY0zM9RBP2rRtpH
 otnVg+TdNrUAiqt6zfyhTA2rVXx4byu1uJPNnLsKWVNwNv2TEDowrVUdAQ1Ck/f8KZLF
 b2uN7jswP9oLsIQF6jf89dPz854Q+/gA2L1Ikv0Al4ATwJAShc9W5r8aCHJEDdS86OWV
 6Mf4TpND5vG9LIp0zRAYelbCJQVycYW9e2h7RDI24Y2Jzov+QV8vYFlN5TZ3KcAC6tEe
 /cMw==
X-Gm-Message-State: AOAM532c4/U17v+0jFDErqhQMDOQCg70oe5Sy3hjpLmh7Gl3C69eLBuO
 eeI5n7mH9cRzEWAOjIRmR8Xr7GWD2pFDOQ==
X-Google-Smtp-Source: ABdhPJwdeAVDE6ImTV58soarxRWvWOKUps/Kw+CEPEV7+viSnP4dluE7gXh3J6JGkb9liNBgRGiCog==
X-Received: by 2002:a17:90b:4d0b:: with SMTP id
 mw11mr9162113pjb.122.1627311405833; 
 Mon, 26 Jul 2021 07:56:45 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id w23sm9425588pjn.16.2021.07.26.07.56.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 26 Jul 2021 07:56:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Mon, 26 Jul 2021 08:00:19 -0700
Message-Id: <20210726150038.2187631-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210726150038.2187631-1-robdclark@gmail.com>
References: <20210726150038.2187631-1-robdclark@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 05/12] drm/msm/submit: Simplify out-fence-fd
 handling
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

RnJvbTogUm9iIENsYXJrIDxyb2JkY2xhcmtAY2hyb21pdW0ub3JnPgoKTm8gbmVlZCBmb3IgdGhp
cyB0byBiZSBzcGxpdCBpbiB0d28gcGFydHMuCgpTaWduZWQtb2ZmLWJ5OiBSb2IgQ2xhcmsgPHJv
YmRjbGFya0BjaHJvbWl1bS5vcmc+CkFja2VkLWJ5OiBDaHJpc3RpYW4gS8O2bmlnIDxjaHJpc3Rp
YW4ua29lbmlnQGFtZC5jb20+Ci0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZ2VtX3N1Ym1p
dC5jIHwgMTAgKysrLS0tLS0tLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgNyBk
ZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3Vi
bWl0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMKaW5kZXggZTc4OWY2
OGQ1YmUxLi44YWJkNzQzYWRmYjAgMTAwNjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNt
X2dlbV9zdWJtaXQuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9nZW1fc3VibWl0LmMK
QEAgLTY0NSw3ICs2NDUsNiBAQCBpbnQgbXNtX2lvY3RsX2dlbV9zdWJtaXQoc3RydWN0IGRybV9k
ZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAlzdHJ1Y3QgbXNtX2ZpbGVfcHJpdmF0ZSAqY3R4ID0g
ZmlsZS0+ZHJpdmVyX3ByaXY7CiAJc3RydWN0IG1zbV9nZW1fc3VibWl0ICpzdWJtaXQ7CiAJc3Ry
dWN0IG1zbV9ncHUgKmdwdSA9IHByaXYtPmdwdTsKLQlzdHJ1Y3Qgc3luY19maWxlICpzeW5jX2Zp
bGUgPSBOVUxMOwogCXN0cnVjdCBtc21fZ3B1X3N1Ym1pdHF1ZXVlICpxdWV1ZTsKIAlzdHJ1Y3Qg
bXNtX3JpbmdidWZmZXIgKnJpbmc7CiAJc3RydWN0IG1zbV9zdWJtaXRfcG9zdF9kZXAgKnBvc3Rf
ZGVwcyA9IE5VTEw7CkBAIC04MjQsMjIgKzgyMywxOSBAQCBpbnQgbXNtX2lvY3RsX2dlbV9zdWJt
aXQoc3RydWN0IGRybV9kZXZpY2UgKmRldiwgdm9pZCAqZGF0YSwKIAl9CiAKIAlpZiAoYXJncy0+
ZmxhZ3MgJiBNU01fU1VCTUlUX0ZFTkNFX0ZEX09VVCkgewotCQlzeW5jX2ZpbGUgPSBzeW5jX2Zp
bGVfY3JlYXRlKHN1Ym1pdC0+ZmVuY2UpOworCQlzdHJ1Y3Qgc3luY19maWxlICpzeW5jX2ZpbGUg
PSBzeW5jX2ZpbGVfY3JlYXRlKHN1Ym1pdC0+ZmVuY2UpOwogCQlpZiAoIXN5bmNfZmlsZSkgewog
CQkJcmV0ID0gLUVOT01FTTsKIAkJCWdvdG8gb3V0OwogCQl9CisJCWZkX2luc3RhbGwob3V0X2Zl
bmNlX2ZkLCBzeW5jX2ZpbGUtPmZpbGUpOworCQlhcmdzLT5mZW5jZV9mZCA9IG91dF9mZW5jZV9m
ZDsKIAl9CiAKIAltc21fZ3B1X3N1Ym1pdChncHUsIHN1Ym1pdCk7CiAKIAlhcmdzLT5mZW5jZSA9
IHN1Ym1pdC0+ZmVuY2UtPnNlcW5vOwogCi0JaWYgKGFyZ3MtPmZsYWdzICYgTVNNX1NVQk1JVF9G
RU5DRV9GRF9PVVQpIHsKLQkJZmRfaW5zdGFsbChvdXRfZmVuY2VfZmQsIHN5bmNfZmlsZS0+Zmls
ZSk7Ci0JCWFyZ3MtPmZlbmNlX2ZkID0gb3V0X2ZlbmNlX2ZkOwotCX0KLQogCW1zbV9yZXNldF9z
eW5jb2JqcyhzeW5jb2Jqc190b19yZXNldCwgYXJncy0+bnJfaW5fc3luY29ianMpOwogCW1zbV9w
cm9jZXNzX3Bvc3RfZGVwcyhwb3N0X2RlcHMsIGFyZ3MtPm5yX291dF9zeW5jb2JqcywKIAkgICAg
ICAgICAgICAgICAgICAgICAgc3VibWl0LT5mZW5jZSk7Ci0tIAoyLjMxLjEKCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCkZyZWVkcmVubyBtYWlsaW5nIGxp
c3QKRnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpodHRwczovL2xpc3RzLmZyZWVkZXNr
dG9wLm9yZy9tYWlsbWFuL2xpc3RpbmZvL2ZyZWVkcmVubwo=
