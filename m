Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 80C396A97D4
	for <lists+freedreno@lfdr.de>; Fri,  3 Mar 2023 13:57:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0FFF310E045;
	Fri,  3 Mar 2023 12:57:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com
 [IPv6:2a00:1450:4864:20::129])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3942C10E5E4
 for <freedreno@lists.freedesktop.org>; Fri,  3 Mar 2023 12:57:33 +0000 (UTC)
Received: by mail-lf1-x129.google.com with SMTP id t11so3487910lfr.1
 for <freedreno@lists.freedesktop.org>; Fri, 03 Mar 2023 04:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jTl3rGGyj4+0LMugsZTfV6hj8IYJr190rpFDv6Lf1bY=;
 b=dQ3kq2F7RnY3i897+kT4TuTTExsNuUx95xfa6b+Z+A1IqNlmhtfRxE4LMqP6D2RPrU
 SCFy2oItL/Q5QZxLdtTHvXdcyACJdJ8NXX7JQJttR5SitOKre2woe10tw4eymRsKhxeM
 /Ou58GzyDT48QzxuL01Il3h2m9cyDyCL1QCxZVKBVuy122L+mpUHaacs3anbeoV2iTgM
 kAFaxQRXLyv2JoppUjf0pB9LszovTP2SspCPjxFdA62AxolAVihVN9/1JVuOs51Isw98
 VItYoYYHY6cUN51BVUfesb3CZvYXUn18OQqs7wRIAAiMN8oBc540wzkICNMNjr7gAYc4
 m49A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jTl3rGGyj4+0LMugsZTfV6hj8IYJr190rpFDv6Lf1bY=;
 b=btmc6E8YiwSoPaHIbcDHQ9ykB2/mAEb3ml/8yd0MsT/G1VjgwrwXsV6wtErYQNdgKR
 xtavl0y39OgXD2VaIgoaxCy6+1F/kl8INMWj0HxLBKX5dUbFQBo6WsepUR3fzUY8M9K2
 YcBpW/U+w6QhoqXg7JCBESmTqc+9CuTucKhgJUpAZhfaeQhdCMtfv66nc/x9HVSEmEdh
 QjvIHzq4pqFitgVsDkC4bE06vq7HPYs2Fn2eypCumCC8DFxnvjzJBxlsNoQe7UXowuUm
 l7XM9kC8UY7Sq+0kEtftL7vKVTGZF5Dk1cPxMACCLFuqJVsmzsC51kfiwtqRwN/Zxgnc
 mKIw==
X-Gm-Message-State: AO0yUKUumq7ARdd5PPQ4VScrJ4zfL1XA61+/lLfUPj7cZmd+vDZt76e8
 r/0s1fP4dQCjLV2heRRFfz4+9Q==
X-Google-Smtp-Source: AK7set8Lj99QXeAeIb1sW51QtD/bk7y1+w/X6ua6qtkuHRMTIQXtZz8NW4gDQ6Y0nVlGq/EYykTGFA==
X-Received: by 2002:a19:5519:0:b0:4db:3847:12f0 with SMTP id
 n25-20020a195519000000b004db384712f0mr598153lfe.50.1677848252790; 
 Fri, 03 Mar 2023 04:57:32 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 c5-20020ac25305000000b004cf07a0051csm379266lfh.228.2023.03.03.04.57.32
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 03 Mar 2023 04:57:32 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri,  3 Mar 2023 14:57:05 +0200
Message-Id: <20230303125725.3695011-11-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
References: <20230303125725.3695011-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 10/30] drm/msm/dpu: clean up SRC addresses
 when setting up SSPP for solid fill
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

Set SSPP_SRCn_ADDR registers to 0 while setting up solid fill, as we can
not be sure that the previous address is still valid.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index 3030cd3b253a..0a43c5682b2b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -563,11 +563,16 @@ static void dpu_hw_sspp_setup_csc(struct dpu_hw_sspp *ctx,
 static void dpu_hw_sspp_setup_solidfill(struct dpu_sw_pipe *pipe, u32 color)
 {
 	struct dpu_hw_sspp *ctx = pipe->sspp;
+	struct dpu_hw_sspp_cfg cfg;
 	u32 idx;
 
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SRC, &idx))
 		return;
 
+	/* cleanup source addresses */
+	memset(&cfg, 0, sizeof(cfg));
+	ctx->ops.setup_sourceaddress(pipe, &cfg);
+
 	if (pipe->multirect_index == DPU_SSPP_RECT_SOLO ||
 	    pipe->multirect_index == DPU_SSPP_RECT_0)
 		DPU_REG_WRITE(&ctx->hw, SSPP_SRC_CONSTANT_COLOR + idx, color);
-- 
2.39.2

