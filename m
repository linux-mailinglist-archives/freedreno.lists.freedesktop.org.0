Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AF22576587D
	for <lists+freedreno@lfdr.de>; Thu, 27 Jul 2023 18:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0465210E5C3;
	Thu, 27 Jul 2023 16:21:14 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7003310E5C5
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 16:21:11 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-5223fbd54c6so1520455a12.3
 for <freedreno@lists.freedesktop.org>; Thu, 27 Jul 2023 09:21:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690474870; x=1691079670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=7dDzr4EibIQelWUacLRHd+gbaDXj1VWIhcj6TMBH2nE=;
 b=ajRVz7OEcj2NGzZ7mxvOqhI87qwgcHSmESy50L3rKtEBke4v+0r0GgC1Yhmg980mEY
 zFRnd9eIkdO+Oj8li0K79krs4DyQ9ckvZAjQQGO4Aj2K/zfpdCfGMFkDbo/pehUazv7K
 AGjXLQfrxL63FaFnJ6lPztfiNCuC7Tzo8Lt5h2gSXWjGQ9Xs2gpKcCaLjCymxd7WxVtX
 4E7rUwORekFNUAHDz37C3DC3O0wzTctNN8GaYMeDn0eJIwhxud5teqZAJagTAqL+uhBo
 qZYBoH6w+DCrIToR0KHk65Y1z8QihusMl7rZzCc5c9NOXoi9bdK7dqmMlyUmSxb/vAMB
 RKpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690474870; x=1691079670;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=7dDzr4EibIQelWUacLRHd+gbaDXj1VWIhcj6TMBH2nE=;
 b=E/AI0jh707HJzCi4JQ4UklO0VXkX8hcJuBYavnwnVWJur5bEJqMs1E/In/oFoUsAoY
 AVCoAmIZLdvRrOU46w0mFnj9xfY0CXMKP+keBeIQRbxfU4A+etAEeLyNC1jPvvLYYaPo
 HhN+DnKFDzMPz89ojoAHIK6Xtp414Bm68RrZbZlvNLVK8ozWyQuhE1ZU8d/2X493ws9f
 L+ggziCbDR4LRXN9ua1YD1ALyHyP/NfCXqrjjlNEaqL/ABGCJj1Xdg2LT830TYP21xLf
 LetJzeQW9yEqOxxAhcjZZH8qF7J3B3Gueun8EVlfZ0upkPhMtdSVGBqoGesGXmlzBnfA
 iVTA==
X-Gm-Message-State: ABy/qLbvk2QQl94D5hZv5LSJOhDB+4Mb8qF7E+RjbXDFi9+rNQZ9Dzwp
 0bLYFx0ah5oNbekUmGePL5K46A==
X-Google-Smtp-Source: APBJJlFIcwyCe5RB5If1+oTRlhX0HVC4nca4z++G670HADj1oDMFNo4ELHW/Za8WwVIxpwuj4KNPgg==
X-Received: by 2002:aa7:c0da:0:b0:522:2c36:4c59 with SMTP id
 j26-20020aa7c0da000000b005222c364c59mr2268231edp.4.1690474869745; 
 Thu, 27 Jul 2023 09:21:09 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 a15-20020aa7d90f000000b00521953ce6e0sm808027edr.93.2023.07.27.09.21.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 27 Jul 2023 09:21:09 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 27 Jul 2023 19:21:00 +0300
Message-Id: <20230727162104.1497483-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
References: <20230727162104.1497483-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/7] drm/msm/dpu: inline _setup_intf_ops()
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

Inline the _setup_intf_ops() function, it makes it easier to handle
different conditions involving INTF configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 47 +++++++++------------
 1 file changed, 21 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index 8ec6505d9e78..7ca772791a73 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -524,31 +524,6 @@ static void dpu_hw_intf_program_intf_cmd_cfg(struct dpu_hw_intf *ctx,
 	DPU_REG_WRITE(&ctx->hw, INTF_CONFIG2, intf_cfg2);
 }
 
-static void _setup_intf_ops(struct dpu_hw_intf_ops *ops,
-		unsigned long cap, const struct dpu_mdss_version *mdss_rev)
-{
-	ops->setup_timing_gen = dpu_hw_intf_setup_timing_engine;
-	ops->setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
-	ops->get_status = dpu_hw_intf_get_status;
-	ops->enable_timing = dpu_hw_intf_enable_timing_engine;
-	ops->get_line_count = dpu_hw_intf_get_line_count;
-	if (cap & BIT(DPU_INTF_INPUT_CTRL))
-		ops->bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
-	ops->setup_misr = dpu_hw_intf_setup_misr;
-	ops->collect_misr = dpu_hw_intf_collect_misr;
-
-	if (cap & BIT(DPU_INTF_TE)) {
-		ops->enable_tearcheck = dpu_hw_intf_enable_te;
-		ops->disable_tearcheck = dpu_hw_intf_disable_te;
-		ops->connect_external_te = dpu_hw_intf_connect_external_te;
-		ops->vsync_sel = dpu_hw_intf_vsync_sel;
-		ops->disable_autorefresh = dpu_hw_intf_disable_autorefresh;
-	}
-
-	if (mdss_rev->core_major_ver >= 7)
-		ops->program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
-}
-
 struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
 		void __iomem *addr, const struct dpu_mdss_version *mdss_rev)
 {
@@ -571,7 +546,27 @@ struct dpu_hw_intf *dpu_hw_intf_init(const struct dpu_intf_cfg *cfg,
 	 */
 	c->idx = cfg->id;
 	c->cap = cfg;
-	_setup_intf_ops(&c->ops, c->cap->features, mdss_rev);
+
+	c->ops.setup_timing_gen = dpu_hw_intf_setup_timing_engine;
+	c->ops.setup_prg_fetch  = dpu_hw_intf_setup_prg_fetch;
+	c->ops.get_status = dpu_hw_intf_get_status;
+	c->ops.enable_timing = dpu_hw_intf_enable_timing_engine;
+	c->ops.get_line_count = dpu_hw_intf_get_line_count;
+	if (cfg->features & BIT(DPU_INTF_INPUT_CTRL))
+		c->ops.bind_pingpong_blk = dpu_hw_intf_bind_pingpong_blk;
+	c->ops.setup_misr = dpu_hw_intf_setup_misr;
+	c->ops.collect_misr = dpu_hw_intf_collect_misr;
+
+	if (cfg->features & BIT(DPU_INTF_TE)) {
+		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
+		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
+		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
+		c->ops.vsync_sel = dpu_hw_intf_vsync_sel;
+		c->ops.disable_autorefresh = dpu_hw_intf_disable_autorefresh;
+	}
+
+	if (mdss_rev->core_major_ver >= 7)
+		c->ops.program_intf_cmd_cfg = dpu_hw_intf_program_intf_cmd_cfg;
 
 	return c;
 }
-- 
2.39.2

