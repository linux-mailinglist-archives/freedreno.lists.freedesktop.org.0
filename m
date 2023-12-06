Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0ECC1806F5C
	for <lists+freedreno@lfdr.de>; Wed,  6 Dec 2023 13:02:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 21DAC10E6E8;
	Wed,  6 Dec 2023 12:02:13 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x430.google.com (mail-wr1-x430.google.com
 [IPv6:2a00:1450:4864:20::430])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BA8A10E6E8
 for <freedreno@lists.freedesktop.org>; Wed,  6 Dec 2023 12:02:11 +0000 (UTC)
Received: by mail-wr1-x430.google.com with SMTP id
 ffacd0b85a97d-3335397607dso780875f8f.1
 for <freedreno@lists.freedesktop.org>; Wed, 06 Dec 2023 04:02:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701864130; x=1702468930; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=C9luEiqd3rNZRXjehlbFdnQ2e1wzzmxPWamwzOSoC4I=;
 b=OCcU1J3kEJyX/GvHG4Fr/ZvPxhJYVqSxR+jwyu/L7mbxZNroOVE/AB8W1ahiqTlinr
 ZSgl/dqyGyBmaNLK2OCZekxJq6rWAY12lbA7Iee+aNgQ8X1+dhDR2lA2PhxYQFfsQ05i
 7ZBwn0BR5s7+yxosMKb4SwSdGQUtb3h+plB/WDtRnN8UyTGpjISoW6P7pUX6Qhd7MrG1
 fwzevHCsri7znYxI/bHz1BMKV4GJFy/DVUECe0mFP8Nktbod3o2KaeeC0aEf8E5qQKVm
 rC1bJzmbRkMJ4ZXTVrN9jgIQHVvIqlGFSfLfDzq2GUHgljYAP9Q/EDttihne6j4yIo9g
 aukg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701864130; x=1702468930;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=C9luEiqd3rNZRXjehlbFdnQ2e1wzzmxPWamwzOSoC4I=;
 b=VABEz/tqfTt6aSjDVUDJ3UOZ/IbUfVC7GDdLCHZk7SaL5PlPXxsT+XWo/I/QCBpF2Z
 mB1tHO7fw77xYdosvt25O73DdZBIP+bmfO+JAGheaYSnpWFSdMIq/+nk2Ma11hKigGat
 ienDwAFADF3jXJKHxe43Hpb2ecgxPAykZm9fIyIFmkUP8T9wdvEHgeKbvCWJA856t1vp
 ln8E8vxTb9oVGqSDVNvfYF/FZcz8VZEhQrjJ0qycSIvfNxnosOpDTt8d/R1ELM4gfL5/
 JvSZCDMBTS50AC8FZp8yRO/ARv9y3J0Bc61Lw7cCYs9EoTQqM5QV+JZ1OOlY0K0eq1tu
 h0RA==
X-Gm-Message-State: AOJu0YxsU7QIqbHwklf7cpnbv7wHwOov3NuHlNnkP8jNRlbehWgn5GUY
 sVqk+7CTgKkWX6dEEGUc0d1WHlasDd0YL+Gj6M4=
X-Google-Smtp-Source: AGHT+IFJokEpInd+DiAKxLDKJAGHst4aJ50KC/hLVyMjr37BE7LjVcnWh8PkujsMGpwy/wk3eMm1WA==
X-Received: by 2002:a7b:cd0d:0:b0:40b:5e4a:4072 with SMTP id
 f13-20020a7bcd0d000000b0040b5e4a4072mr523452wmj.146.1701864129773; 
 Wed, 06 Dec 2023 04:02:09 -0800 (PST)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 w17-20020a05600c475100b0040b45356b72sm25543935wmo.33.2023.12.06.04.02.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 06 Dec 2023 04:02:09 -0800 (PST)
Date: Wed, 6 Dec 2023 15:02:05 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Kuogee Hsieh <quic_khsieh@quicinc.com>
Message-ID: <c12bb69b-d676-4345-9712-48aab48f2b48@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Subject: [Freedreno] [PATCH] drm/msm/dp: Fix platform_get_irq() check
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
Cc: freedreno@lists.freedesktop.org,
 Bjorn Andersson <quic_bjorande@quicinc.com>, David Airlie <airlied@gmail.com>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Vinod Polimera <quic_vpolimer@quicinc.com>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The platform_get_irq() function returns negative error codes.  It never
returns zero.  Fix the check accordingly.

Fixes: 82c2a5751227 ("drm/msm/dp: tie dp_display_irq_handler() with dp driver")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 61b7103498a7..d80cb3d14c6b 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1166,9 +1166,9 @@ static int dp_display_request_irq(struct dp_display_private *dp)
 	struct platform_device *pdev = dp->dp_display.pdev;
 
 	dp->irq = platform_get_irq(pdev, 0);
-	if (!dp->irq) {
+	if (dp->irq < 0) {
 		DRM_ERROR("failed to get irq\n");
-		return -EINVAL;
+		return dp->irq;
 	}
 
 	rc = devm_request_irq(&pdev->dev, dp->irq, dp_display_irq_handler,
-- 
2.42.0

