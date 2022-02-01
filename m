Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35F8C4A62DA
	for <lists+freedreno@lfdr.de>; Tue,  1 Feb 2022 18:47:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A08AE10E1B7;
	Tue,  1 Feb 2022 17:47:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x429.google.com (mail-wr1-x429.google.com
 [IPv6:2a00:1450:4864:20::429])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 228EC10E4E0
 for <freedreno@lists.freedesktop.org>; Tue,  1 Feb 2022 17:47:49 +0000 (UTC)
Received: by mail-wr1-x429.google.com with SMTP id a13so33526847wrh.9
 for <freedreno@lists.freedesktop.org>; Tue, 01 Feb 2022 09:47:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=R75JAp3M1abKRfmniOJ5Fuzudqh5/VKktmnzYEpT+SA=;
 b=oc9p+IVnBHLB7LZf1r+Ni3OD5gI1bzBxGsS5LT4cHBQaWFBb8jmm09tcie0gM8UUXm
 ibm81fKzJqBSY+FMLvG73EWI84K2BM1YX13xch+ZfGy/lkyDQmUlKPdd5ATMe4tP2qAY
 q2LLC47PesQHEdn+4fhjytGJiJ8lZaxKwWYKNVKC7mTuna62YxR4MvheG0z2k8wcTm5P
 y4irdy/vhh7Ze/iNid4lRN7TC6PRVv/3sRnZvxcMK59xmIrHUgLW9gCH7CvxL5r6bJsZ
 846qFCxExqndxRykCeG3S3C3H6tO3V8aBmYYve9TYbeFxWYiQ4I32VVGSXqXVIdVuoOC
 Tc3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=R75JAp3M1abKRfmniOJ5Fuzudqh5/VKktmnzYEpT+SA=;
 b=bZhhhxRTdAkAF0eZnuRSgqgvSR2+OpmXxwKz0ArMAws+Adyjj9GGKrU6Fqs7jN67WM
 ei3UZAHLcOkKlGOKpPf+mcMuAOwaJb4U41TV7zBx0kiAsHiSNfvTGL0pBm7NtO1PaIC8
 sRGJWXZaQtd1e20G+FHSP69OQWsvzkoZ8ikK7Ia7VlYV45lrYYKASGZBhElj0phXk2lM
 OzjS0HedJnEtB3aB2gBsShBda4agUbdIntTJMBI3Hp7kiaYPNN7+ZxFT/lCtk3Iqf5+R
 Vh6YeMaXYcB4N+qJ1TRoCgTBbh3nGNjqsssaGN/xuZXbwZBE3CBhOhFO5VbI/Gpzzwy1
 LB1A==
X-Gm-Message-State: AOAM531+LTBcYTGCqLkeoJ5SSpwSahpq7/JllBP238UVXft94Zgt7gow
 PCukhmIiBtolXO3SKU5ih3dbyw==
X-Google-Smtp-Source: ABdhPJz+0uF1t9U/iG6eoJW1NBuaJp+mrqnVdnHAzVxmlbZS8+iIV8r1hEW+Y3SrEIxDg2ACIbSF1Q==
X-Received: by 2002:adf:f141:: with SMTP id y1mr22073899wro.104.1643737667624; 
 Tue, 01 Feb 2022 09:47:47 -0800 (PST)
Received: from maple.lan (cpc141216-aztw34-2-0-cust174.18-1.cable.virginm.net.
 [80.7.220.175])
 by smtp.gmail.com with ESMTPSA id r2sm3392332wmq.24.2022.02.01.09.47.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 01 Feb 2022 09:47:47 -0800 (PST)
From: Daniel Thompson <daniel.thompson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Tue,  1 Feb 2022 17:47:32 +0000
Message-Id: <20220201174734.196718-2-daniel.thompson@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20220201174734.196718-1-daniel.thompson@linaro.org>
References: <20220201174734.196718-1-daniel.thompson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 1/2] drm/msm/dsi: Remove spurious
 IRQF_ONESHOT flag
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
Cc: Daniel Thompson <daniel.thompson@linaro.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Quoting the header comments, IRQF_ONESHOT is "Used by threaded interrupts
which need to keep the irq line disabled until the threaded handler has
been run.". When applied to an interrupt that doesn't request a threaded
irq then IRQF_ONESHOT has a lesser known (undocumented?) side effect,
which it to disable the forced threading of irqs (and for "normal" kernels
it is a nop). In this case I can find no evidence that suppressing forced
threading is intentional. Had it been intentional then a driver must adopt
the raw_spinlock API in order to avoid deadlocks on PREEMPT_RT kernels
(and avoid calling any kernel API that uses regular spinlocks).

Fix this by removing the spurious additional flag.

This change is required for my Snapdragon 7cx Gen2 tablet to boot-to-GUI
with PREEMPT_RT enabled.

Signed-off-by: Daniel Thompson <daniel.thompson@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_host.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_host.c b/drivers/gpu/drm/msm/dsi/dsi_host.c
index 6b3ced4aaaf5d..3a3f53f0c8ae1 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_host.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_host.c
@@ -1877,7 +1877,7 @@ int msm_dsi_host_init(struct msm_dsi *msm_dsi)
 
 	/* do not autoenable, will be enabled later */
 	ret = devm_request_irq(&pdev->dev, msm_host->irq, dsi_host_irq,
-			IRQF_TRIGGER_HIGH | IRQF_ONESHOT | IRQF_NO_AUTOEN,
+			IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN,
 			"dsi_isr", msm_host);
 	if (ret < 0) {
 		dev_err(&pdev->dev, "failed to request IRQ%u: %d\n",
-- 
2.34.1

