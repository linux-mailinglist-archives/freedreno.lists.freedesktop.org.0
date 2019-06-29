Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C24295AB2E
	for <lists+freedreno@lfdr.de>; Sat, 29 Jun 2019 15:02:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6F2216E9A2;
	Sat, 29 Jun 2019 13:01:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x144.google.com (mail-lf1-x144.google.com
 [IPv6:2a00:1450:4864:20::144])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AFF246E9A3
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jun 2019 13:01:57 +0000 (UTC)
Received: by mail-lf1-x144.google.com with SMTP id y198so5772345lfa.1
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jun 2019 06:01:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AJIo1pqQ+aFujHuHdql1oLAKsZ6dcOAKCD+S+KrStQg=;
 b=oIhYHOfHDEq0Ldl7ajbaN7WMNPOXscUJXlAkpfYa65cocW3quTfi+wiK3EIrXh2Vfx
 82J1zWxgTJ36AeOnHBR5dTQSKFDdF05RCjI5BJy3SrEYucYrc4rB7vsv41H6dnXy0sGK
 PVFCGVrpWaFIM+4/6F4OX1QITsytf6nnNM6+CQHjwFAS053M83PsNq73nje3gwau4ars
 l8CDl1wvB8z121tuWSmyJhIZtSs7SHB6rYguY3VdglUxDA+PRQgc+YN+XS9EzCGJJvfr
 ZZAxufJseONLmvh0YjNzjSPVdoYRPgRnJO/AgeBBiHsQMSS7l8i2znGl2gpKHsGAFz9b
 lKFg==
X-Gm-Message-State: APjAAAUVpXfXZpluiEPCdm1+wXmNjjE6ZK6FLLSxHbF2EgdZ0WxUa8Xr
 IYlAQw4oDMGmQn/RiXemAot9NQ==
X-Google-Smtp-Source: APXvYqxvXt6L2Ml1QCW1/zH7Sv4F1tQcoxTHgqupuETmPxNbTlWyt0OHygO+Xy9Hh1ch7/orM4lZPw==
X-Received: by 2002:ac2:4c29:: with SMTP id u9mr7457510lfq.100.1561813316205; 
 Sat, 29 Jun 2019 06:01:56 -0700 (PDT)
Received: from localhost.localdomain
 (c-22cd225c.014-348-6c756e10.bbcust.telenor.se. [92.34.205.34])
 by smtp.gmail.com with ESMTPSA id v2sm1354500lfi.52.2019.06.29.06.01.54
 (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
 Sat, 29 Jun 2019 06:01:55 -0700 (PDT)
From: Linus Walleij <linus.walleij@linaro.org>
To: dri-devel@lists.freedesktop.org,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <maxime.ripard@bootlin.com>, Sean Paul <sean@poorly.run>
Date: Sat, 29 Jun 2019 14:59:28 +0200
Message-Id: <20190629125933.679-2-linus.walleij@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20190629125933.679-1-linus.walleij@linaro.org>
References: <20190629125933.679-1-linus.walleij@linaro.org>
MIME-Version: 1.0
X-Mailman-Original-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AJIo1pqQ+aFujHuHdql1oLAKsZ6dcOAKCD+S+KrStQg=;
 b=zQR54iAbGadX7yH6kb/W+A9Ev+FFwoc/g484x0VCE13ChTt4OVnLxuK03gAMFIhnUl
 a2s9RA8N93ziUXqxC4ZQbtiqRFq5+YrhUohrwTtL4UjNSSpUwjpJVTsnP5ztF+7mGcoD
 MaLZSwY/+wrc+Mrx1HIJcScmiCGvWqe6rIh6byJLfnq4HXzuuJHQwbH2tIrOgDiQcz99
 WHgvK5QzlgPMcFkkbQyB3iRjkDA2stc0/LSp4lugHsNtNHuQ4txm7SxP3GBg7pAGpzfw
 p4YL7ENLxHbwJB3rq3EQNAMUYHxs7zQQYNqFGvNcxySTPkzYoXSaECdplNiqhLg377rK
 dzeg==
Subject: [Freedreno] [PATCH 2/7] drm/msm/dsi: Drop unused GPIO includes
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
Cc: linux-arm-msm@vger.kernel.org, Linus Walleij <linus.walleij@linaro.org>,
 freedreno@lists.freedesktop.org, Rob Clark <robdclark@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

VGhpcyBEU0kgZHJpdmVyIHVzZXMgdGhlIG5ldyBkZXNjcmlwdG9yIEFQSSBzbyB0aGVzZSBvbGQK
R1BJTyBBUEkgaW5jbHVkZXMgYXJlIHN1cnBsdXMuCgpDYzogUm9iIENsYXJrIDxyb2JkY2xhcmtA
Z21haWwuY29tPgpDYzogU2VhbiBQYXVsIDxzZWFuQHBvb3JseS5ydW4+CkNjOiBsaW51eC1hcm0t
bXNtQHZnZXIua2VybmVsLm9yZwpDYzogZnJlZWRyZW5vQGxpc3RzLmZyZWVkZXNrdG9wLm9yZwpT
aWduZWQtb2ZmLWJ5OiBMaW51cyBXYWxsZWlqIDxsaW51cy53YWxsZWlqQGxpbmFyby5vcmc+Ci0t
LQogZHJpdmVycy9ncHUvZHJtL21zbS9kc2kvZHNpX2hvc3QuYyB8IDIgLS0KIDEgZmlsZSBjaGFu
Z2VkLCAyIGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNp
L2RzaV9ob3N0LmMgYi9kcml2ZXJzL2dwdS9kcm0vbXNtL2RzaS9kc2lfaG9zdC5jCmluZGV4IDYx
MDE4M2RiMWRhZi4uZDQ0YmFkMTNjYmFmIDEwMDY0NAotLS0gYS9kcml2ZXJzL2dwdS9kcm0vbXNt
L2RzaS9kc2lfaG9zdC5jCisrKyBiL2RyaXZlcnMvZ3B1L2RybS9tc20vZHNpL2RzaV9ob3N0LmMK
QEAgLTE0LDExICsxNCw5IEBACiAjaW5jbHVkZSA8bGludXgvY2xrLmg+CiAjaW5jbHVkZSA8bGlu
dXgvZGVsYXkuaD4KICNpbmNsdWRlIDxsaW51eC9lcnIuaD4KLSNpbmNsdWRlIDxsaW51eC9ncGlv
Lmg+CiAjaW5jbHVkZSA8bGludXgvZ3Bpby9jb25zdW1lci5oPgogI2luY2x1ZGUgPGxpbnV4L2lu
dGVycnVwdC5oPgogI2luY2x1ZGUgPGxpbnV4L29mX2RldmljZS5oPgotI2luY2x1ZGUgPGxpbnV4
L29mX2dwaW8uaD4KICNpbmNsdWRlIDxsaW51eC9vZl9pcnEuaD4KICNpbmNsdWRlIDxsaW51eC9w
aW5jdHJsL2NvbnN1bWVyLmg+CiAjaW5jbHVkZSA8bGludXgvb2ZfZ3JhcGguaD4KLS0gCjIuMjAu
MQoKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KRnJlZWRy
ZW5vIG1haWxpbmcgbGlzdApGcmVlZHJlbm9AbGlzdHMuZnJlZWRlc2t0b3Aub3JnCmh0dHBzOi8v
bGlzdHMuZnJlZWRlc2t0b3Aub3JnL21haWxtYW4vbGlzdGluZm8vZnJlZWRyZW5v
