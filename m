Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A97B362271
	for <lists+freedreno@lfdr.de>; Fri, 16 Apr 2021 16:37:38 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9B1026EBAC;
	Fri, 16 Apr 2021 14:37:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D17D06EBB7
 for <freedreno@lists.freedesktop.org>; Fri, 16 Apr 2021 14:37:34 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id r9so42482298ejj.3
 for <freedreno@lists.freedesktop.org>; Fri, 16 Apr 2021 07:37:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/33rrW6tAmVtxRYoiv0PK1lc5LAomei+z6FwtqsCisM=;
 b=mr7mcxDCkJ8MhFaVouTHt6dvkAGmS8HK4Hsecj8ryEDXuyrg6L3br6ohFHv7uAsu9T
 w3j+TgQ6YNNQrtMauk4qHrptT7OQWrR9oytM5dUgU4dwD2kElP4WYvTD4HnV0c9LphsH
 B6njwvTRZyxuf0MLnd4gH/1NsT4Wy6couYfoPQBqYkHmqav6uTU/hKc1uCV/j8eu7X7U
 38LacZ+Zq/pHDs3pKO/MRnv5uhxP8Ncrrq68OkHgpX3t3MFaPm2LuytYSbP8ep7k12KJ
 6bFJinfIbvCy2mmXSDrIp5dC/a3aenEyXyO7KTo82kBVW5SBZC/xKczOCAIKXRZNkq/1
 Wl9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/33rrW6tAmVtxRYoiv0PK1lc5LAomei+z6FwtqsCisM=;
 b=ik7AF3Dr//9Yg/VyFFlnI4rhmi6tdp5PAdWdIHuM1k4g6gHxA2G6EwDd3EBxKFmXZ+
 1KsjBBCycCINk6gDE1eYVWQsJGKDNSBHCFWVD2Qr7t2v2Xhx9agz8QJqAe0s1N/RS/lb
 7YbVmLtDmHttJHEzJ/OFkUHNUAsA/rN6JzQ9fza7pC3SxXAb3MtVIY7MgH/DolGIgd2x
 DjtqyBq0K7qoT4rajXDpUOmaLRNMuB7l/lcMUSx1pzJWwkv2/4Bzm0v1qQhuh/uRt7Rf
 ztP1/hVqa5hcULUoOVQWRFJww3jMef571IiLCnV3qizVW9JDPudza+UmVFwJTGi42zVo
 L6vw==
X-Gm-Message-State: AOAM533iUqA4IAPbNimqQ0Q+TyySiWNZzfEILl6t8CSbst2n44o9dRX0
 yls0pu3syozHY3xDmi2QQJPPoQ==
X-Google-Smtp-Source: ABdhPJwwfH4O9ibDHVnq4+L1No/DlqAhAj3OnYY5JG+/HseoSx+4QpnBSUWZrA55lAFlFlfoaQn0Hw==
X-Received: by 2002:a17:906:7842:: with SMTP id
 p2mr9043139ejm.87.1618583853536; 
 Fri, 16 Apr 2021 07:37:33 -0700 (PDT)
Received: from dell.default ([91.110.221.215])
 by smtp.gmail.com with ESMTPSA id j10sm1326523ejk.93.2021.04.16.07.37.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 16 Apr 2021 07:37:33 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 16 Apr 2021 15:36:48 +0100
Message-Id: <20210416143725.2769053-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210416143725.2769053-1-lee.jones@linaro.org>
References: <20210416143725.2769053-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 03/40] drm/msm/dp/dp_display: Remove unused
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
