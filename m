Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 26411790FD9
	for <lists+freedreno@lfdr.de>; Mon,  4 Sep 2023 04:06:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4B54F10E273;
	Mon,  4 Sep 2023 02:06:04 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x22b.google.com (mail-lj1-x22b.google.com
 [IPv6:2a00:1450:4864:20::22b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 465B610E281
 for <freedreno@lists.freedesktop.org>; Mon,  4 Sep 2023 02:05:00 +0000 (UTC)
Received: by mail-lj1-x22b.google.com with SMTP id
 38308e7fff4ca-2bbbda48904so14971051fa.2
 for <freedreno@lists.freedesktop.org>; Sun, 03 Sep 2023 19:05:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1693793099; x=1694397899; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CCn7+1TWey1NAyg48VCJdA+g41kuesm/Pl4ROBz08nY=;
 b=sUeH70mqnL4fYGAihVHFkaPkhu1Ui/tppRnEbCI65EVoYH+gIb60HCY6udD3Ey1p4H
 AuOWwDkQ7rvWec0pKOe2zcdfq6/K2ObDgLHZNvfkA+W7MvqJ4s0d6PualeqTWUjjIVKz
 HxgalKpwpyXcqlBgyFBcdvxJ6auLeok0DgcoK32dMQEYM6/bRyDtV6SaThA9W8LfyU1O
 v6vf7BwoaHFXHnRRj860zUZ8UdGqGJHs044/9ruHe86wNgWqddjzFtAaA2nwsj416qiy
 vydpZ2bXyvkM8/qvFmgQZ3YFpLf4rm739WZB3Oqy4B6ElcjHhL9dbvxGDQaFk+DIIpFh
 pl6g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1693793099; x=1694397899;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=CCn7+1TWey1NAyg48VCJdA+g41kuesm/Pl4ROBz08nY=;
 b=JB/pU9uQ4OWXaqnlPpsXdbBDD5Kh6zZtZb5MdjAzulqM+Wb5KD940XIE3nXDTlXrQ4
 dypIXiLVar2Sy1UaNEslMwlL9NibH7ABylioEKeaa28REIHlGcCxFJ5tCgLkTdM23ysy
 LCBda11Nu8dFYykTp9bWCXL49cjteeVhLWHUzUljZDYqUWmOIIP3p9p9FdUAZ89eln73
 a9BXZyHrVt5r3u+Gd+U0jwkFN5JeIlZ4Lgl027VaeuGIqSxsIhZaJC7IZ8kfUSFGVsfL
 6xdcUgklfhcLjV5hNSA3Wbl4pywV98GCwGgclWspWufj3RZGz4DoF23NBbyHAhK+cRB+
 IFdA==
X-Gm-Message-State: AOJu0YxDhrzJ9CcDFUZw1b4Rm+jkukiXmc4nFQ5x4Cfuq8noyVcDGnVK
 gIwCgp8Bu+YpGBQEm6+pGsNuSQ==
X-Google-Smtp-Source: AGHT+IF36i9EswZo4RNOjRcQk+JyB3dMeWEVFibQ53tNc3oIsE2tmIGKKysdXisyKNbLEyJDlchwQQ==
X-Received: by 2002:a2e:9890:0:b0:2bc:b6ce:eab with SMTP id
 b16-20020a2e9890000000b002bcb6ce0eabmr5348791ljj.51.1693793098906; 
 Sun, 03 Sep 2023 19:04:58 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t13-20020a2e9c4d000000b002bce0e9385asm1818237ljj.9.2023.09.03.19.04.58
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 03 Sep 2023 19:04:58 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  4 Sep 2023 05:04:51 +0300
Message-Id: <20230904020454.2945667-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
References: <20230904020454.2945667-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 5/8] drm/msm/dpu: enable INTF TE operations
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

