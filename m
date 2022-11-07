Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 5260B61F0E6
	for <lists+freedreno@lfdr.de>; Mon,  7 Nov 2022 11:37:58 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3693C10E2C9;
	Mon,  7 Nov 2022 10:37:56 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com
 [IPv6:2a00:1450:4864:20::234])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7A58110E2CD
 for <freedreno@lists.freedesktop.org>; Mon,  7 Nov 2022 10:37:52 +0000 (UTC)
Received: by mail-lj1-x234.google.com with SMTP id z24so15548156ljn.4
 for <freedreno@lists.freedesktop.org>; Mon, 07 Nov 2022 02:37:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=rZ789OFHN1lvkUIK4iYOi8r4E8Mj/5sPrWBtspHEEYc=;
 b=SUU5GZV7PxILUP+Mvtd2gP7xXAx6ujr9uOXhF0uRH18a/r9aUS17lPy8XCXLXzrYcn
 OpaiT/FZHxf4x/y8yR3DErFyw+neNuH72Y+DTt0CT0WLPTq/WJklySeLcUEg7gx5IRpe
 8y5BdR8D11K9jR2//LWrt7NHSkCT/LzI/hP+MN2nus/SNmy2YIzVgorK4g6UOwA17l8W
 fRFqDujR2f+GmM7agUH4AJZD8QmrM8R7W149HIysl4HkUNvOnnRo6jICyGkwd5L5ulrb
 j9lypNP+Fgjlb8+EMOa4YIPdPQ59nmfxuuMuIqNnwW9CuZiaOOEFUMWq2q17nX+ckBlC
 mAxA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=rZ789OFHN1lvkUIK4iYOi8r4E8Mj/5sPrWBtspHEEYc=;
 b=n6E1hj7e4jSVzqiBIDCto46M/YqPit6ow/u3BmhY6qcocU1p3yQymhXOr+hB5qLNHS
 /wyLB4swWG75inph+/T4N5k45xJtOlUHuZNMnBOGu9kXetebQnVistiz5sSeKhsf0dAy
 GkMrg4QufSNtekJ38NeNWqSFmTP11fnhRa2pByuPP3XjnX0L2cANqbj5XybdF2aC30oz
 4VlOUtURRC2P2YLB/syVmxaaWrDKpfSEFdab0Vh/P3LVPO+XE1ZNTK9xPHZZsep6xajb
 +fxRaNjnBPymVRPfP6hb73qWPeeOledhkKx6gSWff5JkjeSFj3wFfsUuWRIWU30tOp11
 SkOw==
X-Gm-Message-State: ACrzQf2UyAm9OpD6RPkbWFX0DaAUTpbDkelssScO0GCBJDHHAKawXafP
 VuMXSo2NA+LNrtxgS66We43y2w==
X-Google-Smtp-Source: AMsMyM4YYYeo3vxWbYCQB8vu+0ohY5wwmclDKz+L3YLGxETCqfM+qAO9cHNmUNcZAtCYoM5dtUPOkg==
X-Received: by 2002:a2e:9ca:0:b0:276:ac05:b821 with SMTP id
 193-20020a2e09ca000000b00276ac05b821mr5561542ljj.84.1667817470535; 
 Mon, 07 Nov 2022 02:37:50 -0800 (PST)
Received: from localhost.localdomain ([194.29.137.22])
 by smtp.gmail.com with ESMTPSA id
 a14-20020a056512200e00b004979ec19387sm1162599lfb.305.2022.11.07.02.37.48
 (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
 Mon, 07 Nov 2022 02:37:50 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org,
	andersson@kernel.org,
	agross@kernel.org
Date: Mon,  7 Nov 2022 11:37:36 +0100
Message-Id: <20221107103739.8993-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH] drm/msm/dpu1: Remove INTF4 IRQ from SDM845 IRQ
 mask
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
Cc: Kalyan Thota <quic_kalyant@quicinc.com>, freedreno@lists.freedesktop.org,
 Loic Poulain <loic.poulain@linaro.org>, patches@linaro.org,
 David Airlie <airlied@gmail.com>, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Daniel Vetter <daniel@ffwll.ch>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@somainline.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

From: Konrad Dybcio <konrad.dybcio@somainline.org>

SDM845 only has INTF0-3 and has no business caring about the INTF4 irq.

Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@somainline.org>
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index 27f029fdc682..06897a497eb7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -86,7 +86,6 @@
 			 BIT(MDP_INTF1_INTR) | \
 			 BIT(MDP_INTF2_INTR) | \
 			 BIT(MDP_INTF3_INTR) | \
-			 BIT(MDP_INTF4_INTR) | \
 			 BIT(MDP_AD4_0_INTR) | \
 			 BIT(MDP_AD4_1_INTR))
 
-- 
2.38.1

