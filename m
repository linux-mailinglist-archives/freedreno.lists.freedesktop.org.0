Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7A3DA27B68E
	for <lists+freedreno@lfdr.de>; Mon, 28 Sep 2020 22:47:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 23BC389F38;
	Mon, 28 Sep 2020 20:47:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wm1-x344.google.com (mail-wm1-x344.google.com
 [IPv6:2a00:1450:4864:20::344])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 265A989F33
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 20:47:14 +0000 (UTC)
Received: by mail-wm1-x344.google.com with SMTP id x23so2438955wmi.3
 for <freedreno@lists.freedesktop.org>; Mon, 28 Sep 2020 13:47:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=AVg2siFSODBM8KrUjl/IWCFyPa/t9twpYMidcGJD0tw=;
 b=RNrMdmxsQtKunrZgNizedOFXQDLtQx4wUgn+Dt5NeZunqDjrYtKYxeVvhLJgj3biwC
 ZEFzzVc5FDM5Vb8PjDdPrzpK3GAuxO5m63JH8u5XUPA/f8oRT4t+wPfMmMasJFZWZTpX
 JbUaTe4ewU705ewL9cRPz41vBbAh0Ugb7pBb75lVHA2rS0ltWTH2Y2QGjH4Wz1UsVMw7
 Lgj2uvUI7LOhKW8t4iUEpJJ7lnuHpVe2sURDaUBv9H6fEZuzhlzm8y/ZviJi+GEe6D2K
 rd1FP22dxi9JMI6PSPCL3td9FxS7SnGhCa9UVGr3W8ylrG71kf1if1UsRLYFXz+VktFW
 mObQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=AVg2siFSODBM8KrUjl/IWCFyPa/t9twpYMidcGJD0tw=;
 b=RfUkC0fcAOkZtvz6FGlPmZqjb+aN/x6gOMa/WEy/BP4sg/D2K9Ugr29FB1Rf/TIKIf
 z9BWk1i8dI/Qr6/7NV08DqmhNBVCOTGqH/aSMIhhlgeuXyTF5kM4+nvEiy17EvHWzGWZ
 4VbMFloZor08K44t6pWfgA1aVEXZx7cpHFLRFFIVyTPoVslr0z1i1Y+vYhDog2z05LUX
 BUiLhlALfNz3kzNwzco4/g2GNS/MPjuuoCPHx3aEPiDe6fw6Uz1g2nfPPMeOy03QyVr8
 bDAM1cOcXB/r3k8zp9d8gRVW3+hcZGvk6tP19D+XvZ1I6Mz186ADi7B3XbpHs3aBk4Ha
 nm9g==
X-Gm-Message-State: AOAM5325IK4f7rpKQandyZiHydZYtl8jVzhumwmGNZ1Af0zHLPrf2AgW
 dIZGD2mc8fcz5Len1zwXrdY=
X-Google-Smtp-Source: ABdhPJxgcqsHAISZw/02HIspGIwANjmZ24ND6sAhCncfMEDQkXl6xlOKfCNa3KpS4eudQtRHZDJBSQ==
X-Received: by 2002:a1c:6a08:: with SMTP id f8mr948374wmc.151.1601326032682;
 Mon, 28 Sep 2020 13:47:12 -0700 (PDT)
Received: from IcarusMOD.eternityproject.eu ([2.237.20.237])
 by smtp.gmail.com with ESMTPSA id r206sm2677878wma.47.2020.09.28.13.47.11
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Sep 2020 13:47:12 -0700 (PDT)
From: kholk11@gmail.com
To: robdclark@gmail.com
Date: Mon, 28 Sep 2020 22:47:03 +0200
Message-Id: <20200928204709.45746-2-kholk11@gmail.com>
X-Mailer: git-send-email 2.28.0
In-Reply-To: <20200928204709.45746-1-kholk11@gmail.com>
References: <20200928204709.45746-1-kholk11@gmail.com>
MIME-Version: 1.0
Subject: [Freedreno] [PATCH v2 1/7] drm/msm/a5xx: Remove overwriting
 A5XX_PC_DBG_ECO_CNTL register
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
Cc: freedreno@lists.freedesktop.org, marijns95@gmail.com,
 phone-devel@vger.kernel.org, airlied@linux.ie, linux-arm-msm@vger.kernel.org,
 konradybcio@gmail.com, linux-kernel@vger.kernel.org, martin.botka1@gmail.com,
 jcrouse@codeaurora.org, daniel@ffwll.ch, kholk11@gmail.com, sean@poorly.run
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: AngeloGioacchino Del Regno <kholk11@gmail.com>

The PC_DBG_ECO_CNTL register on the Adreno A5xx family gets
programmed to some different values on a per-model basis.
At least, this is what we intend to do here;

Unfortunately, though, this register is being overwritten with a
static magic number, right after applying the GPU-specific
configuration (including the GPU-specific quirks) and that is
effectively nullifying the efforts.

Let's remove the redundant and wrong write to the PC_DBG_ECO_CNTL
register in order to retain the wanted configuration for the
target GPU.

Signed-off-by: AngeloGioacchino Del Regno <kholk11@gmail.com>
Reviewed-by: Jordan Crouse <jcrouse@codeaurora.org>
---
 drivers/gpu/drm/msm/adreno/a5xx_gpu.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
index 91726da82ed6..6262603e6e2e 100644
--- a/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a5xx_gpu.c
@@ -594,8 +594,6 @@ static int a5xx_hw_init(struct msm_gpu *gpu)
 	if (adreno_gpu->info->quirks & ADRENO_QUIRK_TWO_PASS_USE_WFI)
 		gpu_rmw(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0, (1 << 8));
 
-	gpu_write(gpu, REG_A5XX_PC_DBG_ECO_CNTL, 0xc0200100);
-
 	/* Enable USE_RETENTION_FLOPS */
 	gpu_write(gpu, REG_A5XX_CP_CHICKEN_DBG, 0x02000000);
 
-- 
2.28.0

_______________________________________________
Freedreno mailing list
Freedreno@lists.freedesktop.org
https://lists.freedesktop.org/mailman/listinfo/freedreno
