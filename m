Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46E6A7682E5
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 02:35:42 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CFAE410E248;
	Sun, 30 Jul 2023 00:35:36 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6DC3310E23C
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 00:35:26 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-4fe21e7f3d1so2691360e87.3
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 17:35:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690677324; x=1691282124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCn7+1TWey1NAyg48VCJdA+g41kuesm/Pl4ROBz08nY=;
 b=AG74JGa1Hf05ips8f6FiPJavqxbXWTFcbX+eBdceIb03bMHnItj2AA5qpBweuW+JVN
 R92P+H7Wc8NPO2i18d3YXHiV6HjZ/CsupR3YCOAbETCynLw9g7MPWfUt6poyZQCvLqaQ
 alllCtYiICmUyaLQJxd6zprn06ioA37fJx65cwFRb4c42Iir/gvL2rv+KhUIuwCzDYMu
 jBb/BMdtnCleddjyauRnkRFJrl/GyiET3tNq76itMuH0KeLkw8ARGAnSC94Xt0luYIUB
 mr38k8cz6SemIV1bwQmeHerIV7vw3LEQbm9t2neMbYijHZU3uZdsyenv7+DuABhb/Q3N
 ZxFw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690677324; x=1691282124;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CCn7+1TWey1NAyg48VCJdA+g41kuesm/Pl4ROBz08nY=;
 b=Za6RdcXGsZaatnMqfLBHxl6HDcJf5hZ2AR6Do8U9pnFel4sSApYEl0uzi43ZmkBtSq
 FgMPWUyvGuPs6xI3QfFLZxOUGz1WIbzV+XHNfgslWxcAZFSgkRTQA9J4SUisD2pjeRFW
 ZGNgopYQV4QIuMAf9xOsm9PPJ4K6KCl+wz79iVBo7N6LwCv7qk80kU6/WooeQ62hSqbN
 BGj5zo+1ttVVWUDaYWy8kMoV/1ZrE+BhW42UoVB0zJTlJsJHevfy8SrUB5dBHKgJ7CNO
 T7eGb0L21UMT02lgH1/dGAD0TOqYJTk7R/BLpwql5JKG+sf9ndJ0b+zknhCeYiL9uLvT
 08Fw==
X-Gm-Message-State: ABy/qLZckuXSIyrJSvmcDrIRbnFTrOk7+h3MOzLNyr6rX4fPfT2M1m0M
 ikJYUsmmMAs9kUiUDBdlbL2hvA==
X-Google-Smtp-Source: APBJJlGfSzPEpPTzgkD+gzw1wRLxGX1ZDd3yQBOyYergZIMZZz/yi1L/H7ecKkwN15yUH/hkjlZa2g==
X-Received: by 2002:a2e:6e14:0:b0:2b9:dfd1:3808 with SMTP id
 j20-20020a2e6e14000000b002b9dfd13808mr1014231ljc.25.1690677324737; 
 Sat, 29 Jul 2023 17:35:24 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 17:35:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Jul 2023 03:35:15 +0300
Message-Id: <20230730003518.349197-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 5/8] drm/msm/dpu: enable INTF TE operations
 only when supported by HW
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

The DPU_INTF_TE bit is set for all INTF blocks on DPU >= 5.0, however
only INTF_1 and INTF_2 actually support tearing control (both are
INTF_DSI). Rather than trying to limit the DPU_INTF_TE feature bit to
those two INTF instances, check for the major && INTF type.

Reviewed-by: Marijn Suijten <marijn.suijten@somainline.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 5 ++++-
 1 file changed, 4 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index dd67686f5403..95ff2f5ebbaa 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -558,7 +558,10 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
 	if (cfg->features & BIT(DPU_INTF_INPUT_CTRL))
 		c->ops.bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
 
-	if (cfg->features & BIT(DPU_INTF_TE)) {
+	/* INTF TE is only for DSI interfaces */
+	if (mdss_rev->core_major_ver >= 5 && cfg->type == INTF_DSI) {
+		WARN_ON(!cfg->intr_tear_rd_ptr);
+
 		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
 		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
 		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
-- 
2.39.2

