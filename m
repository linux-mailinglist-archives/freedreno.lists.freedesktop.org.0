Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C2B137F080
	for <lists+freedreno@lfdr.de>; Thu, 13 May 2021 02:39:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 204716E7E2;
	Thu, 13 May 2021 00:39:08 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com
 [IPv6:2607:f8b0:4864:20::82f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5BEFA6E5CD
 for <freedreno@lists.freedesktop.org>; Thu, 13 May 2021 00:39:07 +0000 (UTC)
Received: by mail-qt1-x82f.google.com with SMTP id t20so14381535qtx.8
 for <freedreno@lists.freedesktop.org>; Wed, 12 May 2021 17:39:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=marek-ca.20150623.gappssmtp.com; s=20150623;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=/Suj7rUF8MJYpSENOVcgNKkIQ7HdP/cqmF4RJs83xUg=;
 b=Ok4b06fm240rt6q8SJwuDlWX3p0+7j3KUQCdoVM61MLZizJKrH3WzYjt2R8/VHvuHd
 nlwYxjoVLi7VSPzGhiBjj9Ha4Hzv6Uo+Pn62IGsq/M+YOZ+gKmWIsPSO7Aitg0gN3/Dx
 zOAcsoAv8bo8pcDo+Y6KUR43zefAjHUfQdHktVOHb+916Dxmo2JHKI8lUwEop6tI806V
 KHffv1x5FOG5QrIEeBdhKrq30VOi7LpDmA7oFXZRBDDZD3IqKueXGVVFto0nqfeurDM/
 kulCd2rG9bue1lCuX3n4+ow6bDIKfsBLLLnw0X0dScRtw074SOK18O4AlF3R6EOTrR61
 EQXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=/Suj7rUF8MJYpSENOVcgNKkIQ7HdP/cqmF4RJs83xUg=;
 b=GqXkNaG2xJ+Ee3mnbh7jYLyvhewy5UJ/KaRKjzu+vb2CZ//jXkzr4iLinAtcYVyvNs
 fX3LGmaiFMMCtALYLZZvNFtDqeeLmuSTzXQpSLHccHsbYkPNr/0OjdGRvLeTnpPEyGEy
 Fxh64TP6yMrrW7n0eYlGWO86fjTu64ATmhXIfIOczYRPMtgfkklF5tP5X14L4QMVwJ7w
 PpXBJzsUEbo9zNhFXOIZhKZqTsOeycsNXePb+DzeJW7mQzGl3214H4aug7cqKCvRa3+X
 CVnGffF5m4Cq9DkEVX+C4iw94sSNO5Lrtjs5HCY8Fiy08muA51XE90QI4V7vVV0ICmDb
 z/TQ==
X-Gm-Message-State: AOAM532Wg9nIF10qXtAFUgf7e+i0osh2QfkxHMaafgOuCm0jrPiv5jI+
 ZtimXEYno34i+YN6L+yy14IRvsVyryjtrQ2x
X-Google-Smtp-Source: ABdhPJxTw1P3oaoCV0WfoXRiB/+wKSwQTK+iAtqp6IJbfH0cUqEkpY2KsJRruijFgA1FamuFr24gBQ==
X-Received: by 2002:a05:622a:154:: with SMTP id
 v20mr4064234qtw.91.1620866346172; 
 Wed, 12 May 2021 17:39:06 -0700 (PDT)
Received: from localhost.localdomain
 (modemcable068.184-131-66.mc.videotron.ca. [66.131.184.68])
 by smtp.gmail.com with ESMTPSA id w16sm1204201qts.70.2021.05.12.17.39.04
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 May 2021 17:39:05 -0700 (PDT)
From: Jonathan Marek <jonathan@marek.ca>
To: freedreno@lists.freedesktop.org
Date: Wed, 12 May 2021 20:37:46 -0400
Message-Id: <20210513003811.29578-3-jonathan@marek.ca>
X-Mailer: git-send-email 2.26.1
In-Reply-To: <20210513003811.29578-1-jonathan@marek.ca>
References: <20210513003811.29578-1-jonathan@marek.ca>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH 2/5] drm/msm/a6xx: avoid shadow NULL reference
 in failure path
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
Cc: Sai Prakash Ranjan <saiprakash.ranjan@codeaurora.org>,
 Douglas Anderson <dianders@chromium.org>, David Airlie <airlied@linux.ie>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <linux-arm-msm@vger.kernel.org>,
 Sharat Masetty <smasetty@codeaurora.org>,
 Akhil P Oommen <akhilpo@codeaurora.org>,
 "open list:DRM DRIVER FOR MSM ADRENO GPU" <dri-devel@lists.freedesktop.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>, Eric Anholt <eric@anholt.net>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 Sean Paul <sean@poorly.run>, open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

If a6xx_hw_init() fails before creating the shadow_bo, the a6xx_pm_suspend
code referencing it will crash. Change the condition to one that avoids
this problem (note: creation of shadow_bo is behind this same condition)

Fixes: e8b0b994c3a5 ("drm/msm/a6xx: Clear shadow on suspend")
Signed-off-by: Jonathan Marek <jonathan@marek.ca>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 727d111a413f..01bd31b3c504 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1211,7 +1211,7 @@ static int a6xx_pm_suspend(struct msm_gpu *gpu)
 	if (ret)
 		return ret;
 
-	if (adreno_gpu->base.hw_apriv || a6xx_gpu->has_whereami)
+	if (a6xx_gpu->shadow_bo)
 		for (i = 0; i < gpu->nr_rings; i++)
 			a6xx_gpu->shadow[i] = 0;
 
-- 
2.26.1

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
