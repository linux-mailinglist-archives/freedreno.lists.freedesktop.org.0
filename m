Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B91F746A24
	for <lists+freedreno@lfdr.de>; Fri, 14 Jun 2019 22:37:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8A70689533;
	Fri, 14 Jun 2019 20:36:51 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com
 [IPv6:2a00:1450:4864:20::543])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 31281894DD
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jun 2019 20:36:49 +0000 (UTC)
Received: by mail-ed1-x543.google.com with SMTP id a14so5199738edv.12
 for <freedreno@lists.freedesktop.org>; Fri, 14 Jun 2019 13:36:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=WUyS4oh7ne5G6guKuPCoJTFw8Ikiy+4dtCVWiWa5zOM=;
 b=Ek5hZpxJefn1K8vON8UiORWmeyunyZPC45URMz988iyvcFPxB/cIFOHKVK4Vk5vCBQ
 egWsd0WzgXJ5R48wA0kK0sj/Dzh//UYIyskhzDlZ35973mGPC2tUVpsiF+bQAM1sDtGR
 jayQqR6UCT9q3+OYcHL0KYp/79Pmnu0Scfh73jJ989QE+c54z14cw2JvC2Id+wxffL26
 Iu21dqbZtoUt2LxdkNHWEf5XtdZachnfVAK8YsvwcHfKv7JaTBTlfH+oZeN9ewxlyup8
 DWBSZinLq0H1C5J0QZSKZLSZqQ72LM/Atnm3bfr4tT9dsaWwA5UfgfzxMxjJn7RSJP/N
 9CFg==
X-Gm-Message-State: APjAAAXZRANthpxHTcSVHEFIG3p5axdqHI8BzlzuTI9yfyxOzj8KJIdu
 /mLsbO8kbLV16KLxBog7TTr1EA==
X-Google-Smtp-Source: APXvYqzfaPfBwhE/kF9nG/z+DPo2wrV/gVYsQLX/wbCHGWEoZ9Jv+BOD9Ia3qbcMAD9P5neyGwORFQ==
X-Received: by 2002:aa7:d297:: with SMTP id w23mr30363401edq.128.1560544606834; 
 Fri, 14 Jun 2019 13:36:46 -0700 (PDT)
Received: from phenom.ffwll.local ([2a02:168:569e:0:3106:d637:d723:e855])
 by smtp.gmail.com with ESMTPSA id n15sm1166672edd.49.2019.06.14.13.36.45
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Fri, 14 Jun 2019 13:36:46 -0700 (PDT)
From: Daniel Vetter <daniel.vetter@ffwll.ch>
To: DRI Development <dri-devel@lists.freedesktop.org>
Date: Fri, 14 Jun 2019 22:35:37 +0200
Message-Id: <20190614203615.12639-22-daniel.vetter@ffwll.ch>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
References: <20190614203615.12639-1-daniel.vetter@ffwll.ch>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=ffwll.ch; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=WUyS4oh7ne5G6guKuPCoJTFw8Ikiy+4dtCVWiWa5zOM=;
 b=HfaBpbziLn3BuwY5H6ZWUTIasJ+xUD/GK/Ox0TYfaYrMCqeTDXP8yaG0PKq3zPdTct
 t0BWDfruvSoOMjUI4DpjIyMDqAsJTD1v2VNzAuUjStwtL7kfJaWV1vRamk1ffA4Nsasj
 3GyqnJcO1iDWWvmxcBa6fuyxOQ2fEPdSB+myg=
Subject: [Freedreno] [PATCH 21/59] drm/msm: Drop drm_gem_prime_export/import
X-BeenThere: freedreno@lists.freedesktop.org
X-Mailman-Version: 2.1.23
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
Cc: freedreno@lists.freedesktop.org, Daniel Vetter <daniel.vetter@ffwll.ch>,
 Intel Graphics Development <intel-gfx@lists.freedesktop.org>,
 Rob Clark <robdclark@gmail.com>, linux-arm-msm@vger.kernel.org,
 Daniel Vetter <daniel.vetter@intel.com>, Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

VGhleSdyZSB0aGUgZGVmYXVsdC4KCkFzaWRlOiBXb3VsZCBiZSByZWFsbHkgbmljZSB0byBzd2l0
Y2ggdGhlIG90aGVycyBvdmVyIHRvCmRybV9nZW1fb2JqZWN0X2Z1bmNzLgoKU2lnbmVkLW9mZi1i
eTogRGFuaWVsIFZldHRlciA8ZGFuaWVsLnZldHRlckBpbnRlbC5jb20+CkNjOiBSb2IgQ2xhcmsg
PHJvYmRjbGFya0BnbWFpbC5jb20+CkNjOiBTZWFuIFBhdWwgPHNlYW5AcG9vcmx5LnJ1bj4KQ2M6
IGxpbnV4LWFybS1tc21Admdlci5rZXJuZWwub3JnCkNjOiBmcmVlZHJlbm9AbGlzdHMuZnJlZWRl
c2t0b3Aub3JnCi0tLQogZHJpdmVycy9ncHUvZHJtL21zbS9tc21fZHJ2LmMgfCAyIC0tCiAxIGZp
bGUgY2hhbmdlZCwgMiBkZWxldGlvbnMoLSkKCmRpZmYgLS1naXQgYS9kcml2ZXJzL2dwdS9kcm0v
bXNtL21zbV9kcnYuYyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vbXNtX2Rydi5jCmluZGV4IDg3Zjky
ZDM5MDZhYi4uZGE1YTg4NDEzOTY0IDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNtL21z
bV9kcnYuYworKysgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL21zbV9kcnYuYwpAQCAtMTAzNCw4ICsx
MDM0LDYgQEAgc3RhdGljIHN0cnVjdCBkcm1fZHJpdmVyIG1zbV9kcml2ZXIgPSB7CiAJLmR1bWJf
bWFwX29mZnNldCAgICA9IG1zbV9nZW1fZHVtYl9tYXBfb2Zmc2V0LAogCS5wcmltZV9oYW5kbGVf
dG9fZmQgPSBkcm1fZ2VtX3ByaW1lX2hhbmRsZV90b19mZCwKIAkucHJpbWVfZmRfdG9faGFuZGxl
ID0gZHJtX2dlbV9wcmltZV9mZF90b19oYW5kbGUsCi0JLmdlbV9wcmltZV9leHBvcnQgICA9IGRy
bV9nZW1fcHJpbWVfZXhwb3J0LAotCS5nZW1fcHJpbWVfaW1wb3J0ICAgPSBkcm1fZ2VtX3ByaW1l
X2ltcG9ydCwKIAkuZ2VtX3ByaW1lX3BpbiAgICAgID0gbXNtX2dlbV9wcmltZV9waW4sCiAJLmdl
bV9wcmltZV91bnBpbiAgICA9IG1zbV9nZW1fcHJpbWVfdW5waW4sCiAJLmdlbV9wcmltZV9nZXRf
c2dfdGFibGUgPSBtc21fZ2VtX3ByaW1lX2dldF9zZ190YWJsZSwKLS0gCjIuMjAuMQoKX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRyZW5vIG1haWxp
bmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8vbGlzdHMuZnJl
ZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
