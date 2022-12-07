Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CD3EB645C92
	for <lists+freedreno@lfdr.de>; Wed,  7 Dec 2022 15:29:01 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E5DFD10E3BD;
	Wed,  7 Dec 2022 14:28:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1C48C10E3BE
 for <freedreno@lists.freedesktop.org>; Wed,  7 Dec 2022 14:28:40 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id p8so28922864lfu.11
 for <freedreno@lists.freedesktop.org>; Wed, 07 Dec 2022 06:28:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jUFmlTkaTeb2gUSJldujrB4KJISeaHLq+47OfG+Sb0g=;
 b=Lpy+WJM+yODekgzWzTxmrM1ACtNvsx0v+grZNUAV+beM/Yrumue3bBOm2ONS6c2j0A
 iVqBdlPYC6wCOt6HeADL8fWlyyl0yX8iPtu6ssltQzn7Tc4Oug6BHy/rXBlJm8Dt13Ve
 1C6SCt803MKb81d39YyT49WiAlT/FbUKVuUN3APVvdMBF9xwc6Yoyo812NgcZIC0IWGo
 4luRJaAq8ejSDr+Yg/8aUZZYtOHlYiY0c+aMRWc48NB8p8CPb8qKF9DBoU9Spu+zKhE+
 ecznS8Mx7R2CSLwl9dAoJ3TYxbf1/PNxnuFoD++KAXvqD+EIcQNV1QMqWp9OIkPZ9S38
 K0vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jUFmlTkaTeb2gUSJldujrB4KJISeaHLq+47OfG+Sb0g=;
 b=mt2P+38XEMXZV5irngrWau2DACEv6PUKfid7UD4RSOMvJIRGgkGFTd0vNvHbGAD1ox
 U7mt6XyWbjrgZY/15qranP47/UpIUVtQcBZgbIoqStu2PXmBDy4qAyy+hP8n8gvy9S8d
 fpK8EsciWfIwaHNhi5nZtjmZwJNbzsvezAuMGRuPPKKWCvNYdv1BtVPC7qCIStFsQRbh
 4BvtrG5TsCoi+VKVYIbUawuDPDy/wuqwC0PWsBxhlmAagjaui3Rw4bK+QVgDX9KVVJoU
 cL7PlsF0yHWie+L5/T3COFukCtoPaz3RP7nhkM5vPvRgURpqsDj12nT4QQa4QpHeYzfN
 yFtg==
X-Gm-Message-State: ANoB5plfGeyKjWrccLdFfe0WpHlzlsDDTqelmaM1tZ9mt9xqOARV3K76
 2QEjW5RzmcDwmyDAsn64eeVYXw==
X-Google-Smtp-Source: AA0mqf7cx7c/YeG785Vs1vUOt+3SoFwzJpe6TmpmVlCrtroFemClCPNAStWvJf6GOBWjJ51n9GnCvQ==
X-Received: by 2002:ac2:5324:0:b0:4b5:6d83:1a87 with SMTP id
 f4-20020ac25324000000b004b56d831a87mr5831782lfh.375.1670423318034; 
 Wed, 07 Dec 2022 06:28:38 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 f27-20020a19381b000000b0049fff3f645esm2863430lfa.70.2022.12.07.06.28.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 07 Dec 2022 06:28:37 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Wed,  7 Dec 2022 16:28:33 +0200
Message-Id: <20221207142833.204193-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
References: <20221207142833.204193-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/3] drm/msm/dpu: add missing ubwc_swizzle
 setting to catalog
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

Use the values from the vendor DTs to set ubwc_swizzle in the catalog.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
index a1b52b9b16f1..b80cc11a9a83 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c
@@ -516,6 +516,7 @@ static const struct dpu_mdp_cfg sm6115_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.highest_bank_bit = 0x1,
+	.ubwc_swizzle = 0x7,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 		.reg_off = 0x2ac, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_DMA0] = {
@@ -529,6 +530,7 @@ static const struct dpu_mdp_cfg sm8250_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = 0,
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
@@ -558,6 +560,7 @@ static const struct dpu_mdp_cfg sm8450_mdp[] = {
 	.base = 0x0, .len = 0x494,
 	.features = BIT(DPU_MDP_PERIPH_0_REMOVED),
 	.highest_bank_bit = 0x3, /* TODO: 2 for LP_DDR4 */
+	.ubwc_swizzle = 0x6,
 	.clk_ctrls[DPU_CLK_CTRL_VIG0] = {
 			.reg_off = 0x2AC, .bit_off = 0},
 	.clk_ctrls[DPU_CLK_CTRL_VIG1] = {
-- 
2.35.1

