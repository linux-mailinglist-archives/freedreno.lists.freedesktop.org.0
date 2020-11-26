Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id B35592C5612
	for <lists+freedreno@lfdr.de>; Thu, 26 Nov 2020 14:43:11 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 690126E957;
	Thu, 26 Nov 2020 13:43:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x442.google.com (mail-wr1-x442.google.com
 [IPv6:2a00:1450:4864:20::442])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 129246E95A
 for <freedreno@lists.freedesktop.org>; Thu, 26 Nov 2020 13:43:09 +0000 (UTC)
Received: by mail-wr1-x442.google.com with SMTP id u12so2219417wrt.0
 for <freedreno@lists.freedesktop.org>; Thu, 26 Nov 2020 05:43:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=jh3Zn1ResYGUShWTof3m2Q8rRwpV0wK8w2BTM5dDuqo=;
 b=rk6rWnUC9jqDQyGdupgrLNKrRSul0EHQaNGK+50NcidJxDqAvVUj56R5RyfXPBaGcW
 bSBgt/Ie1likRXGMHTQK+17lYRwCLYfSq3BJCLm2XxwMb8WXepCS7ge8/eZVo7gr/XGq
 kCuJM1R00G7RuwWlRH578S74u+AFIcbgHv3NFW66QOirRez6hZequRYFtFmwdFbg4jMK
 863oGkc9U1L7MDiHaIB9G4cRf6dOoqblbB/lUyg/otJbW4APSRCqt0ohAP2dgt2kagdA
 XI8RlvPRmdMATCk3eqe/Xzypb6nIQ8pzFcx6S/gzizO08IQOCYIyaI3A+dQLX9ehNMoK
 2wyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=jh3Zn1ResYGUShWTof3m2Q8rRwpV0wK8w2BTM5dDuqo=;
 b=gFwIKS0ABG7rby3UNKbd7OOfbUNb6vKqeGYpctLFA2u9/9rm0rHTuxkPFsKSx9TJCz
 PNj5LWLuKfNfb6rseIdjqnxyv7JbbbpjMSt5VKKgKK8eyJITxa7WJinndSXiVvfZzeDd
 tFrGR2dMsnI3YIN0aj4904uFOfTE4IEt2sAezkEnlxFUUrMe4SlesPzYDtlMn1W/tLYh
 vcUU7Y9jGQ26gDfU0GNLmEFocEJglnKAE9GGy7s/GSxFtHZfRc39Q8JVL5zQvpF8wEbP
 y0k5yTrXUbONrZE1OnIgHGSs1rFC2oUaYlwcIYiaX1Ldxd8+AVAUm/VkXTd88zM1X7R/
 hSnA==
X-Gm-Message-State: AOAM533TbHWM3kPTm3uxHs2D2551gVMGFtutqNJfen1kX8rfP6q+ndxJ
 Nei6ymLqiIO15xxW8LDPX5Th1Q==
X-Google-Smtp-Source: ABdhPJyFeP+oHnYZ8ZhxN1ULaFwXRE6QX6gCCHEBKcQb558Ob57TmjG/rdCvrc4GTuL6sxomjXk/Zg==
X-Received: by 2002:adf:ee51:: with SMTP id w17mr3923479wro.373.1606398187789; 
 Thu, 26 Nov 2020 05:43:07 -0800 (PST)
Received: from dell.default ([91.110.221.235])
 by smtp.gmail.com with ESMTPSA id k205sm9275738wmk.4.2020.11.26.05.43.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Nov 2020 05:43:07 -0800 (PST)
From: Lee Jones <lee.jones@linaro.org>
To: lee.jones@linaro.org
Date: Thu, 26 Nov 2020 13:42:15 +0000
Message-Id: <20201126134240.3214176-16-lee.jones@linaro.org>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20201126134240.3214176-1-lee.jones@linaro.org>
References: <20201126134240.3214176-1-lee.jones@linaro.org>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 15/40] drm/msm/disp/dpu1/dpu_hw_interrupts:
 Demote kernel-doc formatting misuse
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
Cc: freedreno@lists.freedesktop.org, Shubhashree Dhar <dhar@codeaurora.org>,
 David Airlie <airlied@linux.ie>, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes the following W=1 kernel build warning(s):

 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:246: error: Cannot parse struct or union!
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c:756: error: Cannot parse struct or union!

Cc: Rob Clark <robdclark@gmail.com>
Cc: Sean Paul <sean@poorly.run>
Cc: David Airlie <airlied@linux.ie>
Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Shubhashree Dhar <dhar@codeaurora.org>
Cc: linux-arm-msm@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org
Signed-off-by: Lee Jones <lee.jones@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
index 38482b1047745..5c521de715670 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c
@@ -189,7 +189,7 @@ struct dpu_irq_type {
 	u32 reg_idx;
 };
 
-/**
+/*
  * struct dpu_intr_reg -  List of DPU interrupt registers
  */
 static const struct dpu_intr_reg dpu_intr_set[] = {
@@ -245,7 +245,7 @@ static const struct dpu_intr_reg dpu_intr_set[] = {
 	}
 };
 
-/**
+/*
  * struct dpu_irq_type - IRQ mapping table use for lookup an irq_idx in this
  *			 table that have a matching interface type and
  *			 instance index.
-- 
2.25.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
