Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA1CC68A1C2
	for <lists+freedreno@lfdr.de>; Fri,  3 Feb 2023 19:22:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1F71710E877;
	Fri,  3 Feb 2023 18:21:59 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x531.google.com (mail-ed1-x531.google.com
 [IPv6:2a00:1450:4864:20::531])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69CC110E871
 for <freedreno@lists.freedesktop.org>; Fri,  3 Feb 2023 18:21:55 +0000 (UTC)
Received: by mail-ed1-x531.google.com with SMTP id z11so6033592ede.1
 for <freedreno@lists.freedesktop.org>; Fri, 03 Feb 2023 10:21:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=E9fcb729egx1Qvwf4/qTQgTQT5IezUR50YUrxIc9/QM=;
 b=htIiQkp9QisQYYb7iQinhBUhcZCYWJ1LcKZzJqWB5qelK4fayabZWSqKoMkeTlMPpM
 Mi0e2Vh5jAaJpJgTG8k+exf4JJ0jgIlM7R1QIemEFyyLFQ7aUykQ/Kk36i8mF1lkuHzD
 uVoRmQBAF76DHq9kpAPsw6hzIKkhQZIWkrYJbbRb2Lbww6AFUnEB5UwsZHxBYEzZYIwb
 40mbxO4CUfE8Kx7f3+54vsZmJpjkK8iKW7e9ZT0JYnywEI9QtvGQ9lAn9ji4HDIkyF+t
 OmqTIMNVymha80h2LB/S+v0Xxymht77S0ZR8rtu6DnUPNJKmt6pKI7/l4NMJgXWq5Oih
 aByw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=E9fcb729egx1Qvwf4/qTQgTQT5IezUR50YUrxIc9/QM=;
 b=2yCSxWWRtsGVLBo1aOYmDA0M5YMwnjiRqbr5PN0+H4/VTSdwLcwbBdbb/BAt0XLQXe
 Qkl5GX10aSgBkcXgS8FYBQZT9m5dTdQ2i9szlaVOhmpa/iH7SP+krmpaE2l1sDg1QI1Q
 JUR0oO4s9OrL8xrOyPIGc7MOJ3gC8EWXu6OIsRaVOa+Kue30cnZJyTNqnvHjBFsthviV
 9JfdQuPFctGufmtDlv5tSVZsn7tAcNFO3iBdrt4HxtRxhi1/agbjKUu2e6R3yQmFA7yY
 2xRgd47H2NioQlGsP7Abr0YS5HnfRVHwnJ08mswB5+Kup/fZHYyyFoKj1hW3d7z2Ckag
 ZXEw==
X-Gm-Message-State: AO0yUKXS/BbEunfQ9/Fo6dOO40oGveyOXDDNBm3wMymWElzUrqICt8At
 U4JYnvizgrmaLzJVdQFshdACeg==
X-Google-Smtp-Source: AK7set8ETiI2pbj/xTmtWwqTv8Sj6FYZJ+mYV5Ik9Y/zuNgOurIAr5DpEleXSf5T2gBkhNgKtJHwKQ==
X-Received: by 2002:a05:6402:b59:b0:4a0:8b2c:2055 with SMTP id
 bx25-20020a0564020b5900b004a08b2c2055mr4670443edb.8.1675448515062; 
 Fri, 03 Feb 2023 10:21:55 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 w16-20020a05640234d000b0046267f8150csm1487523edc.19.2023.02.03.10.21.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Feb 2023 10:21:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri,  3 Feb 2023 20:21:23 +0200
Message-Id: <20230203182132.1307834-19-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
References: <20230203182132.1307834-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 18/27] drm/msm/dpu: populate SmartDMA
 features in hw catalog
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
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Bjorn Andersson <andersson@kernel.org>, dri-devel@lists.freedesktop.org,
 Stephen Boyd <swboyd@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Downstream driver uses dpu->caps->smart_dma_rev to update
sspp->cap->features with the bit corresponding to the supported SmartDMA
version. Upstream driver does not do this, resulting in SSPP subdriver
not enbaling setup_multirect callback. Add corresponding SmartDMA SSPP
feature bits to dpu hw catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 10 +++++++---
 1 file changed, 7 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index cf053e8f081e..fc818b0273e7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -21,13 +21,16 @@
 	(VIG_MASK | BIT(DPU_SSPP_SCALER_QSEED3))
 
 #define VIG_SDM845_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SC7180_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED4) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_SM8250_MASK \
-	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE))
+	(VIG_MASK | BIT(DPU_SSPP_QOS_8LVL) | BIT(DPU_SSPP_SCALER_QSEED3LITE) |\
+	BIT(DPU_SSPP_SMART_DMA_V2))
 
 #define VIG_QCM2290_MASK (VIG_MASK | BIT(DPU_SSPP_QOS_8LVL))
 
@@ -42,6 +45,7 @@
 #define DMA_SDM845_MASK \
 	(BIT(DPU_SSPP_SRC) | BIT(DPU_SSPP_QOS) | BIT(DPU_SSPP_QOS_8LVL) |\
 	BIT(DPU_SSPP_TS_PREFILL) | BIT(DPU_SSPP_TS_PREFILL_REC1) |\
+	BIT(DPU_SSPP_SMART_DMA_V2) |\
 	BIT(DPU_SSPP_CDP) | BIT(DPU_SSPP_EXCL_RECT))
 
 #define DMA_CURSOR_SDM845_MASK \
-- 
2.39.1

