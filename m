Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 60A4F32B817
	for <lists+freedreno@lfdr.de>; Wed,  3 Mar 2021 14:43:40 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9DCB16E8E5;
	Wed,  3 Mar 2021 13:43:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x331.google.com (mail-wm1-x331.google.com
 [IPv6:2a00:1450:4864:20::331])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B54C66E8D5
 for <freedreno@lists.freedesktop.org>; Wed,  3 Mar 2021 13:43:33 +0000 (UTC)
Received: by mail-wm1-x331.google.com with SMTP id n4so6385248wmq.3
 for <freedreno@lists.freedesktop.org>; Wed, 03 Mar 2021 05:43:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/33rrW6tAmVtxRYoiv0PK1lc5LAomei+z6FwtqsCisM=;
 b=dhSUUgmE7ZX33ei022sF4B/eNLt7eRn6jyC6OPLLge7KLxxCOeCa28VOHm8A2NqkOz
 rC5HtpmrZfFZTpr1oxG4X536z+qSdFWpmImIvI0zypVu71zTpz2EWNslYDCj5a+ibt09
 TKB3YH++0UGqcXv4EqTw863+Sup2Nio3mTY788B7rDNCTnhq8t7oYkaqgvC9Oi9Ns5U8
 PEDhLB0l5/UlEsh2yZkvIGxEOwr2hdNd1JAEm3lzqNhrZ/F78oTmE/S2AGHFnm+F3W41
 wAL/9MqBdbhvvMpKruwntRhuemSAEs9b4568GTwFsUW57U544g+jjXC8m4uaD4PGB/sh
 niIg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/33rrW6tAmVtxRYoiv0PK1lc5LAomei+z6FwtqsCisM=;
 b=nCOcHLhe3yhWPqqq4PstErcjZDy1DWdM+kBkYzDdn2ynUz4qgE59vA3FkAulTa2ZXC
 lHy3FfM7F8P2cy7pEfrasG3ItlvJF/0PY1Mhrbf/+oi5tm5N/0KLwv0F2/5o4oW33jdD
 py9apHJ7NS0r7VOBSBpdjW69Y5zibfn45LPIZyDtJN+FjDj4zD8XUvOAATgjLLSmZazw
 i02UMRi9ULOMyDo2H3j7aSiK2uagOWxclTE13jdm4yU4XcNoI4Jh26TmcsFfj8kRxQXv
 09dPIFJPoplhVzaol0SSGbTYOAPnTPqiOAszj7x5Lik7Ns5t1cAmwxnrs2T5a8nud5x0
 /hJg==
X-Gm-Message-State: AOAM533OyuVSEM4AMvve4tW+AR/d6AvXEVipUzrW1PEoJH3Ddxc0HbWE
 Hs8AcY+taZFDv0fIYMamF9m9Gg==
X-Google-Smtp-Source: ABdhPJx6MantSUmHLqZL3Rdo8nhUHc4SqNiVIbqa5aYBg6L1cry77BtTByahiAyHKLttAj1nH+JoMw==
X-Received: by 2002:a1c:f30a:: with SMTP id q10mr9539427wmq.159.1614779012467; 
 Wed, 03 Mar 2021 05:43:32 -0800 (PST)
Received: from dell.default ([91.110.221.155])
 by smtp.gmail.com with ESMTPSA id w18sm6109524wrr.7.2021.03.03.05.43.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Mar 2021 05:43:31 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Wed,  3 Mar 2021 13:42:29 +0000
Message-Id: <20210303134319.3160762-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210303134319.3160762-1-lee.jones@linaro.org>
References: <20210303134319.3160762-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 03/53] drm/msm/dp/dp_display: Remove unused
 variable 'hpd'
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Kuogee Hsieh <khsieh@codeaurora.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Rml4ZXMgdGhlIGZvbGxvd2luZyBXPTEga2VybmVsIGJ1aWxkIHdhcm5pbmcocyk6CgogZHJpdmVy
cy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5LmM6IEluIGZ1bmN0aW9uIOKAmGRwX2Rpc3BsYXlf
dXNicGRfYXR0ZW50aW9uX2Ni4oCZOgogZHJpdmVycy9ncHUvZHJtL21zbS9kcC9kcF9kaXNwbGF5
LmM6NDk2OjE5OiB3YXJuaW5nOiB2YXJpYWJsZSDigJhocGTigJkgc2V0IGJ1dCBub3QgdXNlZCBb
LVd1bnVzZWQtYnV0LXNldC12YXJpYWJsZV0KCkNjOiBSb2IgQ2xhcmsgPHJvYmRjbGFya0BnbWFp
bC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6IERhdmlkIEFpcmxpZSA8
YWlybGllZEBsaW51eC5pZT4KQ2M6IERhbmllbCBWZXR0ZXIgPGRhbmllbEBmZndsbC5jaD4KQ2M6
IEt1b2dlZSBIc2llaCA8a2hzaWVoQGNvZGVhdXJvcmEub3JnPgpDYzogbGludXgtYXJtLW1zbUB2
Z2VyLmtlcm5lbC5vcmcKQ2M6IGRyaS1kZXZlbEBsaXN0cy5mcmVlZGVza3RvcC5vcmcKQ2M6IGZy
ZWVkcmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKU2lnbmVkLW9mZi1ieTogTGVlIEpvbmVzIDxs
ZWUuam9uZXNAbGluYXJvLm9yZz4KLS0tCiBkcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3Bs
YXkuYyB8IDMgLS0tCiAxIGZpbGUgY2hhbmdlZCwgMyBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQg
YS9kcml2ZXJzL2dwdS9kcm0vbXNtL2RwL2RwX2Rpc3BsYXkuYyBiL2RyaXZlcnMvZ3B1L2RybS9t
c20vZHAvZHBfZGlzcGxheS5jCmluZGV4IDVhMzlkYTZlMWVhZjIuLjMxYmYyYTQwYTllYjIgMTAw
NjQ0Ci0tLSBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jCisrKyBiL2RyaXZl
cnMvZ3B1L2RybS9tc20vZHAvZHBfZGlzcGxheS5jCkBAIC00OTMsNyArNDkzLDYgQEAgc3RhdGlj
IGludCBkcF9kaXNwbGF5X3VzYnBkX2F0dGVudGlvbl9jYihzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJ
aW50IHJjID0gMDsKIAl1MzIgc2lua19yZXF1ZXN0OwogCXN0cnVjdCBkcF9kaXNwbGF5X3ByaXZh
dGUgKmRwOwotCXN0cnVjdCBkcF91c2JwZCAqaHBkOwogCiAJaWYgKCFkZXYpIHsKIAkJRFJNX0VS
Uk9SKCJpbnZhbGlkIGRldlxuIik7CkBAIC01MDcsOCArNTA2LDYgQEAgc3RhdGljIGludCBkcF9k
aXNwbGF5X3VzYnBkX2F0dGVudGlvbl9jYihzdHJ1Y3QgZGV2aWNlICpkZXYpCiAJCXJldHVybiAt
RU5PREVWOwogCX0KIAotCWhwZCA9IGRwLT51c2JwZDsKLQogCS8qIGNoZWNrIGZvciBhbnkgdGVz
dCByZXF1ZXN0IGlzc3VlZCBieSBzaW5rICovCiAJcmMgPSBkcF9saW5rX3Byb2Nlc3NfcmVxdWVz
dChkcC0+bGluayk7CiAJaWYgKCFyYykgewotLSAKMi4yNy4wCgpfX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fXwpGcmVlZHJlbm8gbWFpbGluZyBsaXN0CkZyZWVk
cmVub0BsaXN0cy5mcmVlZGVza3RvcC5vcmcKaHR0cHM6Ly9saXN0cy5mcmVlZGVza3RvcC5vcmcv
bWFpbG1hbi9saXN0aW5mby9mcmVlZHJlbm8K
