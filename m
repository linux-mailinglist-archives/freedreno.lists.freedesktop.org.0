Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C48C9692D1C
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 03:11:54 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C34B310EE71;
	Sat, 11 Feb 2023 02:11:24 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x636.google.com (mail-ej1-x636.google.com
 [IPv6:2a00:1450:4864:20::636])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C6A1210EE65
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 02:11:21 +0000 (UTC)
Received: by mail-ej1-x636.google.com with SMTP id lu11so20240997ejb.3
 for <freedreno@lists.freedesktop.org>; Fri, 10 Feb 2023 18:11:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tC8smASMYq63xSpQbKtrSp+tdzlAe8iUGu+97bMfkfk=;
 b=N6NQiLcX29/R4SzvnAJ27syJ22wy2ddvxeta24GTTte31zSP/GL/IMpHleStWPWT78
 aSnTeVUx0H7hiLWmeI7OmhP/ecsduWr41IaC9I3aQDOMRc7syZl3BrigFnNHrv5/qwI/
 YPNUW5ofrVZqYfHjNhOTT9HHPd3Kbd5B8EqLTHwdBwGPhFw+ZEsBeie/DlKaUM1aftmT
 i1pusciXS7RNLhdkd7ywf5tH12cjU4GWoAPQg5eRi1KuvRVCLjVhJOl+Ucr+I2YKmhiZ
 bvRbrM5qIKsUr9Fn/foqXlPqCeiB54avo+PaFiZ6391spYa+BnMVTim/45xxzkjOcbD6
 y/tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=tC8smASMYq63xSpQbKtrSp+tdzlAe8iUGu+97bMfkfk=;
 b=Ad3JkmwOOkiib50XaYdkoyXpLNlhnwPVMquasWXOc2DdqjnX7SBmpwssj4lsp5pLHw
 yx0ukORecEiNS87NeDfql1gJHN86tYh4xqXIiscaIW0P4pROkXkenLyKXmiEPZvKQUE4
 qlx2nQmh/+RUHF74wUNSL6UrG0bAScvNdCambm0G6IQO+rEtDhdVbOgeH/E/zC0Pkwf2
 U38cloEbX0GQ9d8t7H/zukjOGinoNk+KDIlacRtYIou1tqjfk5VtLJdNhXTAfgXUm/Tn
 qEy2ibSExyXRx9ggOqBUiS9gzbHjaa9byNKXsmTRAb/QiaVH4iHAD8/r++cz63pGlNDf
 Lufw==
X-Gm-Message-State: AO0yUKX18GfQgtqf4+WQPmbEp1Ektiw4Z3NFrZuDKXIgTKd1tX/YxoW5
 0c5oNbGc56Lft5512Vqly3XKZA==
X-Google-Smtp-Source: AK7set8n2sVpsBzcvgTanvr6FdAaLyJCVdqNc9WJgor1dNZQSyLtWUYfIQIgWlXBaYr20TR9uROPEw==
X-Received: by 2002:a17:907:6e17:b0:8af:2af5:1191 with SMTP id
 sd23-20020a1709076e1700b008af2af51191mr11684529ejc.18.1676081481418; 
 Fri, 10 Feb 2023 18:11:21 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 e20-20020a170906c01400b008ae3324c8adsm3180831ejz.214.2023.02.10.18.11.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 10 Feb 2023 18:11:21 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Sat, 11 Feb 2023 04:10:35 +0200
Message-Id: <20230211021053.1078648-26-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
References: <20230211021053.1078648-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 25/43] drm/msm/dpu: fix typo in in sm8550's
 dma_sblk_5
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

Fix typo if the name of the sblk structure for the sm8550's dma_sblk_5.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c         | 2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
index f8495cd723e9..2103ccfc22f0 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h
@@ -103,7 +103,7 @@ static const struct dpu_sspp_cfg sm8550_sspp[] = {
 	SSPP_BLK("sspp_12", SSPP_DMA4, 0x2c000, DMA_CURSOR_SDM845_MASK,
 		sm8550_dma_sblk_4, 14, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA4),
 	SSPP_BLK("sspp_13", SSPP_DMA5, 0x2e000, DMA_CURSOR_SDM845_MASK,
-		sd8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
+		sm8550_dma_sblk_5, 15, SSPP_TYPE_DMA, DPU_CLK_CTRL_DMA5),
 };
 
 static const struct dpu_lm_cfg sm8550_lm[] = {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index b979d06f8180..ff507acc6ff6 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -432,7 +432,7 @@ static const struct dpu_sspp_sub_blks sm8550_vig_sblk_2 =
 static const struct dpu_sspp_sub_blks sm8550_vig_sblk_3 =
 				_VIG_SBLK("3", 10, DPU_SSPP_SCALER_QSEED3LITE);
 static const struct dpu_sspp_sub_blks sm8550_dma_sblk_4 = _DMA_SBLK("12", 5);
-static const struct dpu_sspp_sub_blks sd8550_dma_sblk_5 = _DMA_SBLK("13", 6);
+static const struct dpu_sspp_sub_blks sm8550_dma_sblk_5 = _DMA_SBLK("13", 6);
 
 static const struct dpu_sspp_sub_blks sc8280xp_vig_sblk_0 =
 				_VIG_SBLK("0", 5, DPU_SSPP_SCALER_QSEED3LITE);
-- 
2.39.1

