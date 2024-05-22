Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 07F7F8CBF91
	for <lists+freedreno@lfdr.de>; Wed, 22 May 2024 12:51:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8C80510F4CA;
	Wed, 22 May 2024 10:51:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="NV2s1AOt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f43.google.com (mail-lf1-f43.google.com
 [209.85.167.43])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0A8F210F4BB
 for <freedreno@lists.freedesktop.org>; Wed, 22 May 2024 10:51:00 +0000 (UTC)
Received: by mail-lf1-f43.google.com with SMTP id
 2adb3069b0e04-52327368e59so7149724e87.1
 for <freedreno@lists.freedesktop.org>; Wed, 22 May 2024 03:51:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1716375059; x=1716979859; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=03lZtK/lY1XEVDdKgvI8NPNMNTf3HunLZingl7OzXps=;
 b=NV2s1AOtMVEIuV6Lr4jHYiUM/rKYxXH9Oj+PxgJCVQ6t4b+wM8S4Qs+FlkYNy5ZxG5
 J6WDH7yaqGY0rFXdhotSo6M3jLUwPXmAciSd28LRWKtncuVRpopTtNYUS0L5J3Yy85Kk
 xbyGMhxc50K39oP8Zr3Hd57NOZ74yzm99OGRbqh9B3GC6ETE1LzIxWI66scSEj4WuI0K
 uC9iSHTKj87zMivM+C5tnQOYriMI4tGyWmE2E8/HJ35MxJaqiTc8Yq7pZ1IWVjQigMkL
 x/NiS7b/d1uLhpo69bpcMFd+0u0SEDtUB5dO7JbnOloEpeSeOUPepgS78Bow2ikcnDxV
 /9mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1716375059; x=1716979859;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=03lZtK/lY1XEVDdKgvI8NPNMNTf3HunLZingl7OzXps=;
 b=Sg5ZgnwJobs9lT5886FRshEVwxfOn8zYC6d2zWzTKTA9lE27fVpqMg59HDvV69Eqsm
 Prbxg2ePGKOApveeZFzQAWancGe7ud63a4BceQ+JBPOpJ2G4cHi2IO3O4/26IC9Tx8OR
 82dCwjUtO02vOuw1QodgRColrOqH1udton9E4KReDp0c+T06XaqLlpmeMctmDNfuipXC
 osF06Qlr5hL8zHJbVyqgif7Y79bYOHoOsJdDJ4THtUuQNsWpcv8VmQ499jrw1vpfYRqu
 qIGElrB1NlfK+/wBAyBUNGx34HRaVOjwtmv0yz5iSdYxcRnv319ksQXr7QmvCxYPvlkD
 yxXQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCV89qKrqhyPKks33CPXVMv++/znuG3CBv4niX5Vb4LHmROc3qfJt1BZB34lL/HqMQ+VeVijumKUgLWHNu/58xv4ULrSiGUj8Gq/mJQkn55e
X-Gm-Message-State: AOJu0YzfUz5FSgCeu/BKPhZsj0oQvNeSm2s0eJmmVo+oZLXP4nH0z+Uh
 GXyOCDb3JnvDliUz60pVdmWkxuTN4ne5yfC//Vua1dhevhAYjMd1RogO3O87iSU=
X-Google-Smtp-Source: AGHT+IFjZBlFB63a+RCudEv/MwFQ9Q2bCole0thkPnhyzMY0Oy8BRRlACoKsAdrqd0TOgwhv6ucLQQ==
X-Received: by 2002:a19:ca05:0:b0:51d:8159:598 with SMTP id
 2adb3069b0e04-526bf35cb35mr855189e87.19.1716375058977; 
 Wed, 22 May 2024 03:50:58 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-52431778ec8sm1279126e87.194.2024.05.22.03.50.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 22 May 2024 03:50:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 22 May 2024 13:50:53 +0300
Subject: [PATCH v2 01/14] drm/msm/hdmi: move the alt_iface clock to the hpd
 list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240522-fd-hdmi-hpd-v2-1-c30bdb7c5c7e@linaro.org>
References: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
In-Reply-To: <20240522-fd-hdmi-hpd-v2-0-c30bdb7c5c7e@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 Marijn Suijten <marijn.suijten@somainline.org>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1311;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=GHqYh/OpnADzbIGNQTWljjAqbsvOTUqyL6NzDNpzFls=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmTc4P+BDWacbqmwW114/XMonajf8PabUyuJ9lv
 2ys/6u9ObSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZk3ODwAKCRCLPIo+Aiko
 1e3eB/9uYYVb14/WnhhBPj+AyebWjWRnP0iG8FjY7dT+zHqyaHXAWZqh22kKOrvTdAFImY8ih1Z
 Lgk5naB5PAau9KARHCmo4xvSVORJHkEmzse2OCD3YJpxoS/3fZb9pqaQabxdi6zrbj2t6rksnwi
 vtvaSz0tlomAzHIpdZIAxeU6XnxshDfgfnf+44edFQ29Tb658R4vIir+ysKkGeI1qTta+6HQUlB
 EUZc/mqgBdxzKfBc0YlF+Xz0SayBG8YJC0DtMpEDdBJ4uZjmR45AZ7ihrMm57eZ5P1bkEoS4Chs
 91rAubNr/uUXsHn4+bZ3HmPH4dnNKqIfyMAvTS3WyHxqrxzv
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 24abcb7254cc..108c86925780 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -235,9 +235,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char *pwr_clk_names_8x74[] = {"extp"};
+static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),

-- 
2.39.2

