Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BFF39341748
	for <lists+freedreno@lfdr.de>; Fri, 19 Mar 2021 09:24:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 097B36E99E;
	Fri, 19 Mar 2021 08:24:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com
 [IPv6:2a00:1450:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 520CA6E99C
 for <freedreno@lists.freedesktop.org>; Fri, 19 Mar 2021 08:24:36 +0000 (UTC)
Received: by mail-ej1-x62d.google.com with SMTP id b9so8284758ejc.11
 for <freedreno@lists.freedesktop.org>; Fri, 19 Mar 2021 01:24:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/33rrW6tAmVtxRYoiv0PK1lc5LAomei+z6FwtqsCisM=;
 b=T7L8hIGs4NLk/w7APaYDVvRcg3YuQAFMJ6VNnBtnkcgSafK23nyyVPEa6rAZ67DJa6
 pie6iammssw0VfjfNCtarEdfEjG4/U/n5u9AndJt0nPoS1aaj14s4oeZ4Mm8nVAPYNhF
 LWenRGRbEwS6ghyOL9m7rQnbW+Z6j9A4nqz2CMJYsHK7Uko4usWy0g03vRKHG8x2kKaF
 gVQA8ZliD3ZV5sE0fA9ypKCbfpjp2zKol0C01DZbjSGXr608SKX5AnAtdQz09PXvWxTD
 vzEUkxtsjdLRYM5gkzSBJ//Vd39nmkCvOJV8bUkQAlBGVLVXdJ443a6A4mX2jpRRD1da
 LFnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/33rrW6tAmVtxRYoiv0PK1lc5LAomei+z6FwtqsCisM=;
 b=B1qL+zpVGqg+JS0oow3oUjc8liBPggMRK09uv4KgzAAa5WWxcv3ZlH58/F2onhtYCQ
 n1Sbv+xdoTS7zfu/ghik10vBI9HQFGh3nNMtAUnDK6S1zcQ24tqh9nhIXBu/PzN+2LyD
 4DhMjzK56odzVgrD/DjKZ+SDHZ4G9zzQgRmPmrJCNS8ovq24bsFgF+qf/eKLJkAiICFI
 vy/q8Bi0V6OPJpnrnb/DU6OvjHRbpLheBcAG2iGjXO6DoRENz4/vKPpmBnMO9F67RESX
 4xcPjmh+spC3EJFKnwyFeBtoVcX0k5JwCjLBjC0FFEqGrNfQoo+mqlZLwdsf8Yftih8y
 9/3A==
X-Gm-Message-State: AOAM530/pwOwQgYp1APtd/k8wud0if9AtSOuLTP70HbObhl+A5BC8Pav
 aaP5YLfT5DVz21xdJOloGDiFOQ==
X-Google-Smtp-Source: ABdhPJz4KtR18bMDuxRNEmf8p/BopcQ1r7GqooWJY89cgdQHi6TZvOcC58gMxtYYchvEDHkZqRUIDQ==
X-Received: by 2002:a17:906:71c3:: with SMTP id
 i3mr2938932ejk.391.1616142274996; 
 Fri, 19 Mar 2021 01:24:34 -0700 (PDT)
Received: from dell.default ([91.110.221.194])
 by smtp.gmail.com with ESMTPSA id b18sm3273727ejb.77.2021.03.19.01.24.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 19 Mar 2021 01:24:34 -0700 (PDT)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Fri, 19 Mar 2021 08:24:12 +0000
Message-Id: <20210319082428.3294591-4-lee.jones@linaro.org>
X-Mailer: git-send-email 2.27.0
In-Reply-To: <20210319082428.3294591-1-lee.jones@linaro.org>
References: <20210319082428.3294591-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 03/19] drm/msm/dp/dp_display: Remove unused
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
