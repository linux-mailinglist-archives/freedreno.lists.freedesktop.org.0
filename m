Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 20FB85A92E6
	for <lists+freedreno@lfdr.de>; Thu,  1 Sep 2022 11:15:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5754810E669;
	Thu,  1 Sep 2022 09:15:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com
 [IPv6:2a00:1450:4864:20::132])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 838FD10E666
 for <freedreno@lists.freedesktop.org>; Thu,  1 Sep 2022 09:15:31 +0000 (UTC)
Received: by mail-lf1-x132.google.com with SMTP id q7so23475136lfu.5
 for <freedreno@lists.freedesktop.org>; Thu, 01 Sep 2022 02:15:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date;
 bh=jNM+5myziriC40IcLi6KZeIacAr+ajJ9scGcT8bKpzo=;
 b=TPU5kkYcJ/bgeVpCEiOlPxfeLqUaaCPDobVW8KvP0t4ccjSpwx+gYAwldV7QaklzxM
 YUPO6qjo6OEi/7l1GhfjVE7Cr1igB6CdWJgTTi9HpjS4QT84noyhAXEd9QLaJl5h4M1/
 GoAueKnl0gIsq6AjZPXF1rO/kQX6sRaTq4B6jeCkc4fuIVWEcEu1NF6Vg/kn2PQ9V3Dn
 hyPSkDhVH3aLmX1e1Hk0ApD8P3TFuIT/lJwxfF16QivYZfYsrD9sXF8WjNQb8fxmuDOy
 yOYvEnlvZEWp+LVI7Cw+6XmzXhhB2Rphl6NsmERJvi7sgabkLedAVqAa8hbJjEIlur9w
 oQ/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date;
 bh=jNM+5myziriC40IcLi6KZeIacAr+ajJ9scGcT8bKpzo=;
 b=jKwXeOw89QSVCWgAhzdea6xW5JYJJdLuHoHU/zJNIOtx4Fd2uKqgkuu1/65Srov0K3
 JXb0UvZmWNspvMSulugPp/soBxB9LPqM/ki8sYPJegQpGbPJMwX8fmOD7eK0MAUYVqKU
 ZFcApQWovpk3oPfHlCSgKgV3BWcYpZdG1TNSPs4Ed+AWWJCnyNZdJ1ZA0GdSpEUKHyDL
 gVRuDo/bRvU1ix4UVY0iQrVn5kJbsIIud8Hu0cFYSF9cxc9z36S3vyX/nCh/gEf/a9A/
 6BFp0+fktTUazJkJahbHZz5HeGZh/M26miPKS3m3pWzwrdmjCDIF6MmxlGLxE15/Bji7
 Vf7g==
X-Gm-Message-State: ACgBeo0v0gYXTbR1iVi7H9i7+g/NxMy681GcYDVJCm0g4ZYis6XZo0fO
 kRVyFAPJ+SOkGm9+IAEhcZfu8w==
X-Google-Smtp-Source: AA6agR5LX8WMcaeVD4ENclbBhkqZGs2/l0DYGO4bc0F6WTraZHk3TbrLnXaw4WnOMwev2kp1gk7JMQ==
X-Received: by 2002:a05:6512:2350:b0:494:9925:f734 with SMTP id
 p16-20020a056512235000b004949925f734mr965847lfu.97.1662023729618; 
 Thu, 01 Sep 2022 02:15:29 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 t17-20020a2e2d11000000b00261b4df9ec4sm2422349ljt.138.2022.09.01.02.15.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 01 Sep 2022 02:15:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu,  1 Sep 2022 12:15:25 +0300
Message-Id: <20220901091527.1992208-2-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
References: <20220901091527.1992208-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH 1/3] drm/msm/dp: fold disable_irq into
 devm_request_irq
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
Cc: David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, Johan Hovold <johan@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Calling disable_irq() right after devm_request_irq() is a bad practice.
it leaves a small window when the driver doesn't expect the IRQ, but the
hardware still can trigger it. Use the IRQF_NO_AUTOEN flag to prevent
the request_irq from enabling the IRQ line.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index bfd0aeff3f0d..3173e6962a78 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -1251,13 +1251,12 @@ int dp_display_request_irq(struct msm_dp *dp_display)
 
 	rc = devm_request_irq(&dp->pdev->dev, dp->irq,
 			dp_display_irq_handler,
-			IRQF_TRIGGER_HIGH, "dp_display_isr", dp);
+			IRQF_TRIGGER_HIGH | IRQF_NO_AUTOEN, "dp_display_isr", dp);
 	if (rc < 0) {
 		DRM_ERROR("failed to request IRQ%u: %d\n",
 				dp->irq, rc);
 		return rc;
 	}
-	disable_irq(dp->irq);
 
 	return 0;
 }
-- 
2.35.1

