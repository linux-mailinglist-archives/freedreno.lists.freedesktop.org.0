Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D7F9A465987
	for <lists+freedreno@lfdr.de>; Wed,  1 Dec 2021 23:51:57 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A0B046E8DA;
	Wed,  1 Dec 2021 22:51:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AF5F16E8AE
 for <freedreno@lists.freedesktop.org>; Wed,  1 Dec 2021 22:51:48 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id f18so66804036lfv.6
 for <freedreno@lists.freedesktop.org>; Wed, 01 Dec 2021 14:51:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=GvsWfL7mbOVefyoKeCj6Q5Bk0eV0IEAIU/XkuhNVYgo=;
 b=o2KluvlhXKOWt4Xt6mrtsYmjh0cHuQobULvXY8yR8HgIZQZUCdXW+fDuoTdlXP7X34
 xfSUNrxKE6hAF5wDd5wUbrtHrSya3p6gPazNYn7IuAGnd3g2fpBRHdJitVIWBXx9Pt7B
 kw/Mj+RpOaNUvGlID3rCNmn2+GJrpVgqv3U53MzQjfMWbtcAXBgcm2N9rqgBntMgSpI2
 PU8uoT4rhCobjeMKCgppx/xCrb+iTQm0yzfcCJ9zTLVpD/VvcQpZ4JKcPaWvTG4D/0tU
 hAvQqEIGzcKZ4sdn6qsNUmZCTa2Xnm7WwPPnkxMlrxIQxdLlI7bNHlSaLx9Tdv84/aKC
 /JjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=GvsWfL7mbOVefyoKeCj6Q5Bk0eV0IEAIU/XkuhNVYgo=;
 b=opD2NveRvS4Yg66WDWgZeIhk6FsVvLxrROBUDlR5ycfxP5CS/heZBjUkgv+qOtojVA
 l6jUT7KpLIe/NjHoIztOwWPdBfVOOxiXlu33Ixi/Lg/eXSGlwbObd5sPP8UpoikToIIn
 GQPjR9970INvqjvaLyc3aBce5S/OY2XaJEPHg+HMOUuK/ez2lphHDNSMSM4OkLjcweNP
 GfFvtvl/SVf/C/mX4buH3GDD4B2J4PjZtKxg6G+0HrBKNpOx3YNMWtDP6hWRfZShk5dW
 bIqqiNIiQPWl91AIt5VgXvAQdQe9pOJfYUkzEUb2XTWTetHtZbLmckO6NVu2nSnfqkhu
 neBg==
X-Gm-Message-State: AOAM532iTb7gMmO4POaubnwiPh7I/JyPVM7dnooafg5SikLbYZvS3wON
 g6aOI4H+dXarF8ljOuWe1yDWqA==
X-Google-Smtp-Source: ABdhPJxKw4DW8KW9BUo+9cv0KwE3fv/w5lZ6sNOTwpDZaYGC1eWUr4PYL3bqqVhNkx+NHZFu0973eg==
X-Received: by 2002:a05:6512:150c:: with SMTP id
 bq12mr8569303lfb.687.1638399106986; 
 Wed, 01 Dec 2021 14:51:46 -0800 (PST)
Received: from eriador.lan ([37.153.55.125])
 by smtp.gmail.com with ESMTPSA id u7sm124819ljh.49.2021.12.01.14.51.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 01 Dec 2021 14:51:46 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Bjorn Andersson <bjorn.andersson@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <abhinavk@codeaurora.org>
Date: Thu,  2 Dec 2021 01:51:38 +0300
Message-Id: <20211201225140.2481577-3-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.33.0
In-Reply-To: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
References: <20211201225140.2481577-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 2/4] drm/msm/dpu: drop pe argument from
 _dpu_hw_sspp_setup_scaler3
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
Cc: Stephen Boyd <sboyd@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, David Airlie <airlied@linux.ie>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The _dpu_hw_sspp_setup_scaler3 (hw_sspp->setup_scaler) does not use pe
argument. Let's remove it while we are cleaning scaled configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h | 2 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c   | 2 +-
 3 files changed, 1 insertion(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
index d77eb7da5daf..7235605bfc9e 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c
@@ -413,13 +413,11 @@ static void dpu_hw_sspp_setup_pe_config(struct dpu_hw_pipe *ctx,
 
 static void _dpu_hw_sspp_setup_scaler3(struct dpu_hw_pipe *ctx,
 		struct dpu_hw_pipe_cfg *sspp,
-		struct dpu_hw_pixel_ext *pe,
 		void *scaler_cfg)
 {
 	u32 idx;
 	struct dpu_hw_scaler3_cfg *scaler3_cfg = scaler_cfg;
 
-	(void)pe;
 	if (_sspp_subblk_offset(ctx, DPU_SSPP_SCALER_QSEED3, &idx) || !sspp
 		|| !scaler3_cfg)
 		return;
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
index e8939d7387cb..ad2002d75739 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h
@@ -334,12 +334,10 @@ struct dpu_hw_sspp_ops {
 	 * setup_scaler - setup scaler
 	 * @ctx: Pointer to pipe context
 	 * @pipe_cfg: Pointer to pipe configuration
-	 * @pe_cfg: Pointer to pixel extension configuration
 	 * @scaler_cfg: Pointer to scaler configuration
 	 */
 	void (*setup_scaler)(struct dpu_hw_pipe *ctx,
 		struct dpu_hw_pipe_cfg *pipe_cfg,
-		struct dpu_hw_pixel_ext *pe_cfg,
 		void *scaler_cfg);
 
 	/**
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
index 4c373abbe89c..c7b065b14c5c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_plane.c
@@ -688,7 +688,7 @@ static void _dpu_plane_setup_scaler(struct dpu_plane *pdpu,
 	if (pdpu->pipe_hw->ops.setup_scaler &&
 			pstate->multirect_index != DPU_SSPP_RECT_1)
 		pdpu->pipe_hw->ops.setup_scaler(pdpu->pipe_hw,
-				pipe_cfg, &pixel_ext,
+				pipe_cfg,
 				&scaler3_cfg);
 }
 
-- 
2.33.0

