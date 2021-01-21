Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E22672FE892
	for <lists+freedreno@lfdr.de>; Thu, 21 Jan 2021 12:19:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 91A076E1D2;
	Thu, 21 Jan 2021 11:19:19 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com
 [IPv6:2607:f8b0:4864:20::52b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DBD076E419
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jan 2021 11:19:18 +0000 (UTC)
Received: by mail-pg1-x52b.google.com with SMTP id 15so1151375pgx.7
 for <freedreno@lists.freedesktop.org>; Thu, 21 Jan 2021 03:19:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=lxCu1KRXdVN3L+OkUbo1cLFCc74qHBWwsGsHoVvYmGQ=;
 b=a87cJbhAisItlTCiddZHPHEtszqt8a4bVO1biv2X4xyyxixy0vT9T72gtaa3iyj1/S
 0BYSnHb7hnb7XQ1rwlEu5cBS3rWsXlBuzJ4FCOmHrteZ986iw9RUbu7t7crDd55rb+q0
 KYQl0KVBN5AykV+JO3HcTaywDinFAvXk5RBBj+bYE7h3h/GJhlpuhndjXEI073NQmGYd
 F8sCiXjYnLCSEiHzao8Cj5NEiGNRRhnEQY8ln7F6+OXeYTrLLExrly2aWRCNqMuVgIyM
 o+ZW521aJNq2QMtttfOcvWZ9gEK/aMtc7HonSr2L7N/XYDiInAo5mzdEK+TIZbY9C/Xa
 SMRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=lxCu1KRXdVN3L+OkUbo1cLFCc74qHBWwsGsHoVvYmGQ=;
 b=clkhwLAIlVflqmqTZmC2xPz7ps0D42THySy3yUVd5wfOcLZONIlc+8id0/OUMxRNXW
 Qls61h+f2zwUi6uCI8GW4jk94jMzAVtVgPUM0SRcPNqwaZ62JMkbK1QdHLDNx1g11LCj
 liudOutWPUZpmY3Rh0JG4ncaMAppsrexl0DX04ia/BKOZ+ZmbhWisd1GDTHZI9jCxuRC
 HGHcdlTAXR+0pjQI3hKmF1i7QhpDcLnWHuJWyjh/ujaN+RrUuRn+440DavXKo1nmetX+
 SYawr8EsRF7tqfnKBVOo/P4vXNLCWDTb5segsXgM9WkJSNh4megAmueOZI6EenH0VvXe
 ByUQ==
X-Gm-Message-State: AOAM532NNP6qSZ0AXO6WMB025oIRG+p4yJbinFkubhTi14tXXuK62twC
 4rT/U/PcZrS2pmqQz4XDcRXcLA==
X-Google-Smtp-Source: ABdhPJxRoJPh+zCGLlNXEzcomeslehl5ItANfOXfCWt+o9vxW4dTT0mgqMj6QlfqpWP4MwpTT0cTAw==
X-Received: by 2002:a65:4083:: with SMTP id t3mr14089089pgp.150.1611227958549; 
 Thu, 21 Jan 2021 03:19:18 -0800 (PST)
Received: from localhost ([122.172.59.240])
 by smtp.gmail.com with ESMTPSA id f36sm6098298pjk.52.2021.01.21.03.19.17
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 21 Jan 2021 03:19:17 -0800 (PST)
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Dmitry Osipenko <digetx@gmail.com>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>
Date: Thu, 21 Jan 2021 16:47:52 +0530
Message-Id: <8d10f850eead0e91b1a0e20bd2ae449f4f4f8bb3.1611227342.git.viresh.kumar@linaro.org>
X-Mailer: git-send-email 2.25.0.rc1.19.g042ed3e048af
In-Reply-To: <cover.1611227342.git.viresh.kumar@linaro.org>
References: <cover.1611227342.git.viresh.kumar@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 12/13] drm: msm: Migrate to dev_pm_opp_set_opp()
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
Cc: Nishanth Menon <nm@ti.com>, Vincent Guittot <vincent.guittot@linaro.org>,
 linux-pm@vger.kernel.org, Stephen Boyd <sboyd@kernel.org>,
 Viresh Kumar <viresh.kumar@linaro.org>, Rafael Wysocki <rjw@rjwysocki.net>,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Sibi Sankar <sibis@codeaurora.org>, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

dev_pm_opp_set_bw() is getting removed and dev_pm_opp_set_opp() should
be used instead. Migrate to the new API.

Signed-off-by: Viresh Kumar <viresh.kumar@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gmu.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
index e6703ae98760..05e0ef58fe32 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gmu.c
@@ -134,7 +134,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 
 	if (!gmu->legacy) {
 		a6xx_hfi_set_freq(gmu, perf_index);
-		dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
+		dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
 		pm_runtime_put(gmu->dev);
 		return;
 	}
@@ -158,7 +158,7 @@ void a6xx_gmu_set_freq(struct msm_gpu *gpu, struct dev_pm_opp *opp)
 	if (ret)
 		dev_err(gmu->dev, "GMU set GPU frequency error: %d\n", ret);
 
-	dev_pm_opp_set_bw(&gpu->pdev->dev, opp);
+	dev_pm_opp_set_opp(&gpu->pdev->dev, opp);
 	pm_runtime_put(gmu->dev);
 }
 
@@ -866,7 +866,7 @@ static void a6xx_gmu_set_initial_bw(struct msm_gpu *gpu, struct a6xx_gmu *gmu)
 	if (IS_ERR_OR_NULL(gpu_opp))
 		return;
 
-	dev_pm_opp_set_bw(&gpu->pdev->dev, gpu_opp);
+	dev_pm_opp_set_opp(&gpu->pdev->dev, gpu_opp);
 	dev_pm_opp_put(gpu_opp);
 }
 
@@ -1072,7 +1072,7 @@ int a6xx_gmu_stop(struct a6xx_gpu *a6xx_gpu)
 		a6xx_gmu_shutdown(gmu);
 
 	/* Remove the bus vote */
-	dev_pm_opp_set_bw(&gpu->pdev->dev, NULL);
+	dev_pm_opp_set_opp(&gpu->pdev->dev, NULL);
 
 	/*
 	 * Make sure the GX domain is off before turning off the GMU (CX)
-- 
2.25.0.rc1.19.g042ed3e048af

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
