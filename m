Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 51A4F7A1F62
	for <lists+freedreno@lfdr.de>; Fri, 15 Sep 2023 14:59:48 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0C7A210E625;
	Fri, 15 Sep 2023 12:59:47 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x32c.google.com (mail-wm1-x32c.google.com
 [IPv6:2a00:1450:4864:20::32c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 61CC710E627
 for <freedreno@lists.freedesktop.org>; Fri, 15 Sep 2023 12:59:45 +0000 (UTC)
Received: by mail-wm1-x32c.google.com with SMTP id
 5b1f17b1804b1-400a087b0bfso22768725e9.2
 for <freedreno@lists.freedesktop.org>; Fri, 15 Sep 2023 05:59:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1694782784; x=1695387584; darn=lists.freedesktop.org;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ZBjLzWWXqag1yraVARE9n+lKqu6pTxol3i6MhDouFAw=;
 b=ZK8tMH/iT6PJqSnMgyZav5IJbTtfiI/WjWGWarHwfdtwYb5yEEWhLEe3LTDJg5/kdX
 jKx0XwYoZf9PuUaLru4/G5i8vDMHc+MA0hYc45BQSSEXHS4J08hNeDcHLiGVaRyEgz96
 lJuOknIKKcT4ja9ylejkIQKQxRtu80G6IK2nFYdckMbcZ6uvSZ0g03SYygzLsZZYT2+S
 qJmO3UUMbzGf1G8fuop2i6pxTsfYLPYyjtszfxhpCCBRQoS5DdZZqLGaUINxvXgcAB2z
 hFhAYqh2NnLO/YUeQI9tSc2GKQx6+6318rcaGBOdOoIbmJbZOp2cUOAqxG3S85cpgH0Z
 O7dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1694782784; x=1695387584;
 h=content-disposition:mime-version:message-id:subject:cc:to:from:date
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=ZBjLzWWXqag1yraVARE9n+lKqu6pTxol3i6MhDouFAw=;
 b=brDt36AXdjTn44JZFET8UiX4TKHO6tUqMzJXeuA/wpfFY4trFq43MoZXtmo2/AnCrA
 BSyQArV/zVhyCHNvhKUh7ylnOodVrxWl571RVg94zxU1RWGtQlRCA45VVqMoQoMTa/P7
 QHUWfhf4cy2LYhKCQufZTSx9Yuyy2ojGw3SCgPSjwEjWHr8mYxRtSFDI0fmJ2wnqN3lI
 lrHB5uY3xciroS2cT1IiQ0t+Nevg+XdLGYmhKaHR+kP2dSMOnOCSwoi5zMJ2cLDMwibl
 2HybqPJMVDFwBxPd5QR9MsvxnHQvhtrQAecR5QLF1iZOeIDte3QmEEL886gqDayUKNhv
 iPLg==
X-Gm-Message-State: AOJu0YxyLRgqI8+dZn1R0ji7W7I/5A9S4q6RgdSvNCq+a7M2t0nxfSZQ
 aPrrR8w6EfsmWO6DfgNXbCsOQQ==
X-Google-Smtp-Source: AGHT+IFc8Uw7ChZ541s7ZfDx5J0oDr/O+QkUoZ9jlAAj8nlQTtlVtdYU7vkKZ9OJ1800nSO6KAFtFQ==
X-Received: by 2002:a1c:7209:0:b0:401:bf62:9456 with SMTP id
 n9-20020a1c7209000000b00401bf629456mr1420706wmc.8.1694782783609; 
 Fri, 15 Sep 2023 05:59:43 -0700 (PDT)
Received: from localhost ([102.36.222.112]) by smtp.gmail.com with ESMTPSA id
 l20-20020a1c7914000000b003fe29dc0ff2sm4635302wme.21.2023.09.15.05.59.42
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 15 Sep 2023 05:59:43 -0700 (PDT)
Date: Fri, 15 Sep 2023 15:59:40 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Hai Li <hali@codeaurora.org>
Message-ID: <4f3c5c98-04f7-43f7-900f-5d7482c83eef@moroto.mountain>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding
Subject: [Freedreno] [PATCH] drm/msm/dsi: fix irq_of_parse_and_map() error
 checking
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
Cc: freedreno@lists.freedesktop.org, David Airlie <airlied@gmail.com>,
 kernel-janitors@vger.kernel.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The irq_of_parse_and_map() function returns zero on error.  It
never returns negative error codes.  Fix the check.

Fixes: a689554ba6ed ("drm/msm: Initial add DSI connector support")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 5d9ec27c89d3..13da53737a6a 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1894,10 +1894,9 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 	}
 
 	msm_host->irq = irq_of_parse_and_map(pdev->dev.of_node, 0);
-	if (msm_host->irq < 0) {
-		ret = msm_host->irq;
-		dev_err(&pdev->dev, "failed to get irq: %d\n", ret);
-		return ret;
+	if (!msm_host->irq) {
+		dev_err(&pdev->dev, "failed to get irq\n");
+		return -EINVAL;
 	}
 
 	/* do not autoenable, will be enabled later */
-- 
2.39.2

