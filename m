Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 773763D7BAE
	for <lists+freedreno@lfdr.de>; Tue, 27 Jul 2021 19:07:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 088A66EC04;
	Tue, 27 Jul 2021 17:07:55 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62f.google.com (mail-pl1-x62f.google.com
 [IPv6:2607:f8b0:4864:20::62f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 12BB06EC04;
 Tue, 27 Jul 2021 17:07:53 +0000 (UTC)
Received: by mail-pl1-x62f.google.com with SMTP id i10so13405259pla.3;
 Tue, 27 Jul 2021 10:07:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
 b=qM+kZpi9SzpMlfF5XdH/NMi6DyzaUdUHpl9sco5xUba+VFcS4KYci7YRRaOqcQN+h3
 uonT/YAn1exFX6ZjvUxuD6gmHNd7b+di0IFVmdCvqjIQI+9uSq2zZONFXwWUx7A2muOv
 CpHES18u/KTRchuAdinBBat33dh4PM6SuAveBlBv26fb5hvx2xkDn2iOX3TDFEu5Wkm9
 T0JwxlGCR9pMu3cRdSIhfA9DnzTeiW6ykCudJJ9wTAF0KSCGzw5QKf3Pv+ebTlp2B+v8
 UBvcpVzXJHuEEKxc42k8/K70NePsigKVJY3UkRN7WJ7xXpi4doAlOK3klM1k3aQc05IP
 S3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GibM4JunErmcwqpQUyn3ExW3S8fVKXUsAqTOBkrdaJc=;
 b=FiuNaNsT7UlwEIO2bi5eLJrotv/5hI9C+1LHNZqds42RRkIRnMh4RHFuJL9ieMk7MH
 uRqbjClAp7auLao0L/iWZOIdqsrqrLT/PdHZJJqyi+8XoG64a0mPwOuJuIYER0JTvkQa
 45bflU/NrvVx0V0A0273TkPlkq0NVO6Edehd0YQN3bTW0E/rHdFlYAGLCGyBNVl7yZVu
 6Ahje3oumNXPT2VVsxtjaLssp8Vn7lwKqKY+wYGsI2emRn93dIJvXIQuNw2McBVy/9Xe
 UhqGHRUndWT+54sd3ghjNzesNc0CVRMuw6ckHdIfYRhlDwiLxJeaGD/Ju01TAk8P62fq
 H6SQ==
X-Gm-Message-State: AOAM531Py6T0FCsC3mnlRTRns3VW3D50wo4Klglb3DwUkf5Kfa56QOW6
 N+2hmy6DUVLuNCQpkS4xZhacMTskEklSEQ==
X-Google-Smtp-Source: ABdhPJxNgDmPhZv3Hv7xiNtgu3We5vnTCWwGPRckpJYr1C26pBGwzER7vvYTjXDnRFWp5ihgMkcQGg==
X-Received: by 2002:a17:902:9a41:b029:12b:8e55:d2b1 with SMTP id
 x1-20020a1709029a41b029012b8e55d2b1mr19549699plv.78.1627405672080; 
 Tue, 27 Jul 2021 10:07:52 -0700 (PDT)
Received: from localhost ([2601:1c0:5200:a6:307:a401:7b76:c6e5])
 by smtp.gmail.com with ESMTPSA id a4sm4517227pfk.5.2021.07.27.10.07.50
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 27 Jul 2021 10:07:51 -0700 (PDT)
From: Rob Clark <robdclark@gmail.com>
To: dri-devel@lists.freedesktop.org
Date: Tue, 27 Jul 2021 10:11:21 -0700
Message-Id: <20210727171143.2549475-6-robdclark@gmail.com>
X-Mailer: git-send-email 2.31.1
In-Reply-To: <20210727171143.2549475-1-robdclark@gmail.com>
References: <20210727171143.2549475-1-robdclark@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v3 05/13] drm/msm/submit: Simplify out-fence-fd
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
