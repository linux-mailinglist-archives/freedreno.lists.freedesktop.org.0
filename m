Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A237A3D8505
	for <lists+freedreno@lfdr.de>; Wed, 28 Jul 2021 03:02:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0EB3D6EBAA;
	Wed, 28 Jul 2021 01:02:48 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com
 [IPv6:2607:f8b0:4864:20::62e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B2DF6EC04;
 Wed, 28 Jul 2021 01:02:46 +0000 (UTC)
Received: by mail-pl1-x62e.google.com with SMTP id c16so655677plh.7;
 Tue, 27 Jul 2021 18:02:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
 b=b9NxSnxk1VxZqiDCi1AAks8K5iBqV1c1t7XZVCJ9vakTpEjvZaK8BBRIcUg/BRnqJk
 aCT9lROfSKWsz7nPb/wSb64Q8AnsR0uxxILmf1mCsR4FcSBfPy+Pu+TlDTLGtgribXLc
 u7E8al/VyNXx5XPBjZh/EO852CfSDoxB6KxMVgFqdBL6u+hYOtVX6hPDYOOl3t8G8say
 9iEeywnaDwDPHaqpssKef1fYt9uDWBGU9jM6OJJawWCeBlNJRSGpUFEXxV9vTavGONrk
 FpmeT9bS2WPE0yBx6sEPD6fFPipfs8n+Pnk4fpRXZ2LBeXpU0rIOAH0Rqam3iCn1cok5
 f6tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
 b=I0mBTMNkpjMIRex4oTxjt2+qT6qHxeoF+EenohVh0LgSXbGgXuXPMVAOnugNgWe7AN
 U4oAyfcamsB1VNAO88bj4iV+M6bG89e/wnbSIx1FcZ1aNzIF2UDDv8jW8HT+Nk10BqN1
 7H5Gwvnb5HC9jLTHxGtEjUMMftgd/nQKV3eXpa0QTtge+51Gm0l0HYBvdo8jqqjvS0Pk
 s6GbuFU9L8aGB+tXxKmYUv6FwNZddha5L66Hz7uPISy/rtNgXUytTCcueNaTBrXW++y2
 9vWNPrbeiXt8Q4drWnLlwsYXZovBf1shl8SoAJxGluQBzE4/S3yK+07lcjy4BrA1dq5B
 ab2g==
X-Gm-Message-State: AOAM5315krMtwgbkLT7TO/PYOi6GFZD7i2pGfoQWc35V9JLiyRw4EUxi
 gsJVxpVPz117CB5HzjYK3yZNF4Eaj896+w==
X-Google-Smtp-Source: ABdhPJxf4kY3lxTv4tUsiUdlIXHzAi46C6zsptRacAUprOM2gYJZ21r1BHXZK3QxacjqN/ze/FqE3g==
X-Received: by 2002:a62:4e0e:0:b029:39a:56d1:6d47 with SMTP id
 c14-20020a624e0e0000b029039a56d16d47mr11775335pfb.1.1627434165297; 
 Tue, 27 Jul 2021 18:02:45 -0700 (PDT)
Received: from localhost (c-73-25-156-94.hsd1.or.comcast.net. [73.25.156.94])
 by smtp.gmail.com with ESMTPSA id
 b3sm5081459pfi.179.2021.07.27.18.02.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 18:02:44 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Tue, 27 Jul 2021 18:06:10 -0700
Message-Id: <20210728010632.2633470-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210728010632.2633470-1-robdclark@gmail.com>
References: <20210728010632.2633470-1-robdclark@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v4 05/13] drm/msm/submit: Simplify out-fence-fd
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
