Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A4A867CFC8
	for <lists+freedreno@lfdr.de>; Thu, 26 Jan 2023 16:17:51 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1D6D310E934;
	Thu, 26 Jan 2023 15:17:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E4C3B10E932
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 15:17:47 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id u21so2158033edv.3
 for <freedreno@lists.freedesktop.org>; Thu, 26 Jan 2023 07:17:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=P78YOJNtNx1A2lMURy8WdPKbNTrzZSXLQJ7yOcKbEYY=;
 b=wq6GSpyeEMXTOBvJmDHBN5ji4ivXnfV6rihHo/Ne8y99h+jdCSSvCjP2ZeQ/W7x3lY
 UhHxv6S6ZKxZd8ZJ7O2rARZYrbut5lpyifR3+/AE1HH3Nmd7ZV1IfXoFEpNlmBmhaYQa
 pTf/SBVgjDTZ/zkzvheoLUoHrWZuIMQndXePLN6Pbc57n0FDAHR/UMhMkOgAVcxL3Uhp
 CoxBseBttdnGbudshUi7J1tEf2KttUVvNAKKUnHChSzYT0Z/NZJT+mAyMU8P1HicwXFB
 8ae8PVtNdXzrp1l2YwlRJ3NdQyktm5MAkHxP1yIrhWLh8/q1bf6XaXTmgBZCynaFuNME
 D8EQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=P78YOJNtNx1A2lMURy8WdPKbNTrzZSXLQJ7yOcKbEYY=;
 b=eWnobifkAWtdKYxoAzVktFCTGbRh1w3alkEEF1ANGsgws2ld7VcpTjQuOsUDuMijJY
 QSRf69dbxGkT5h/Z4El/XJifZggQ8suxbxNtVsM98O108NOvbdApuWIUGq8xxWoO02EO
 kuUr+v8NXiUP1688nAweXIBmW7cwoFmg4FJOBLo7G9J5jhDivflWWttBFHcY34Mahlz+
 qc+Ck41MrappFROy94y79bhvD3OhXY9/1z82nnWZDrlOBGnLa7Q8W7adwPfiSa7AB5yQ
 J/doVHDpnVMNzY03CWmdmsKrKAfiL3JgK/fclcJC5cYFqi4DPSiiaIJJ6g1nmDx5hYop
 Sn5g==
X-Gm-Message-State: AFqh2koZAxtsJ1pRnzUUZ2uU8BSmPLAJSeJMTjdkAsL3ZGAhDl7kt/JV
 JJlK1MFejccNUS3vLU0234TtxA==
X-Google-Smtp-Source: AMrXdXtxeY99s2JoW44yFytv4ncyFOE4J6oC7Lu7h/IKDvpmk89qOGy0wDEMAYv+E7HHc7+NFrIgDg==
X-Received: by 2002:a05:6402:230c:b0:48d:91a9:2cd0 with SMTP id
 l12-20020a056402230c00b0048d91a92cd0mr32222832eda.29.1674746267542; 
 Thu, 26 Jan 2023 07:17:47 -0800 (PST)
Received: from localhost.localdomain (abyk108.neoplus.adsl.tpnet.pl.
 [83.9.30.108]) by smtp.gmail.com with ESMTPSA id
 a16-20020aa7d910000000b00463bc1ddc76sm842808edr.28.2023.01.26.07.17.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 26 Jan 2023 07:17:47 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Thu, 26 Jan 2023 16:16:13 +0100
Message-Id: <20230126151618.225127-10-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230126151618.225127-1-konrad.dybcio@linaro.org>
References: <20230126151618.225127-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 09/14] drm/msm/a6xx: Fix some A619 tunables
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
Cc: freedreno@lists.freedesktop.org, Akhil P Oommen <quic_akhilpo@quicinc.com>,
 David Airlie <airlied@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Sean Paul <sean@poorly.run>, Chia-I Wu <olvaffe@gmail.com>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Adreno 619 expects some tunables to be set differently. Make up for it.

Fixes: b7616b5c69e6 ("drm/msm/adreno: Add A619 support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
index 7a480705f407..f34ab3f39f09 100644
--- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
+++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
@@ -1171,6 +1171,8 @@ static int hw_init(struct msm_gpu *gpu)
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00200200);
 	else if (adreno_is_a650(adreno_gpu) || adreno_is_a660(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00300200);
+	else if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00018000);
 	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_PC_DBG_ECO_CNTL, 0x00080000);
 	else
@@ -1188,7 +1190,9 @@ static int hw_init(struct msm_gpu *gpu)
 	a6xx_set_ubwc_config(gpu);
 
 	/* Enable fault detection */
-	if (adreno_is_a610(adreno_gpu))
+	if (adreno_is_a619(adreno_gpu))
+		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3fffff);
+	else if (adreno_is_a610(adreno_gpu))
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x3ffff);
 	else
 		gpu_write(gpu, REG_A6XX_RBBM_INTERFACE_HANG_INT_CNTL, (1 << 30) | 0x1fffff);
-- 
2.39.1

