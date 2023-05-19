Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BE624708DEA
	for <lists+freedreno@lfdr.de>; Fri, 19 May 2023 04:39:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3CF6710E5A6;
	Fri, 19 May 2023 02:39:06 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com
 [IPv6:2a00:1450:4864:20::233])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9751910E5A9
 for <freedreno@lists.freedesktop.org>; Fri, 19 May 2023 02:39:01 +0000 (UTC)
Received: by mail-lj1-x233.google.com with SMTP id
 38308e7fff4ca-2ac836f4447so29398751fa.2
 for <freedreno@lists.freedesktop.org>; Thu, 18 May 2023 19:39:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684463939; x=1687055939;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EwIfWRi7SH5tpmvEt1N0yTEC4B47WJkD1VKzReCn4Dk=;
 b=kYlrMjbZX0Ra1vw3Q0VEvgRyKstJUWj3YWTtvA8wXomUyQ3Er8ov3mEoj1J0MlQXuT
 Cf+EZ/9qpRz2A2eiaPd575CChmMBD5Mj15XFlkEsDhYjQEyLLic4RCIBvO1zPMIzZd3Q
 18nznA6Z82/hpIzH0ZRoMP3HCaWt0+AsdVJab/olFg91YQ4vDImW4DFUFXJrFP4UhVW5
 EB4RA+hriKgOAIRIkutBuU993GvWZnqdNfJZVPDPC72AIVDs1a0B6agEhiSTvrR4bpoO
 14cpDKy2HNPpamYPHwFDnzdtL++55SNIn3hvi8mCJdPbZ+R428zXdkWTeVCwZkjNe0op
 5l7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684463940; x=1687055940;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EwIfWRi7SH5tpmvEt1N0yTEC4B47WJkD1VKzReCn4Dk=;
 b=eYVcSNIFe7HdBKdGFrBS6sIkyJtpR4E/UJj5hCqjleCNiqJM072sLGZ6yDYNkjDbe4
 MWd23S65WMV0ByTNoSUpNIl7hCtWSfXsyv/bpp911LIlZAkDhIAxAMUetIDxgN0RDWs4
 DMK51+2ovvtJ9NGBzdbkLh/3vUEkRTk9giGrGb6ix1OPZF/rikS3/W5drxBY5eHMUBRe
 l2xNAIBYZ4WGo6aYHsEbC0MiFV+UyWIKghXeHdMrcJHwAE9ozVZgxacyzPxVXUzGB7Px
 7yCU/osUTUpHlgG6pEKytIamcCRe+dbMf8ZGajXVVM5v05kLZPSn8uUAuvD8sKk3TdwS
 OLqw==
X-Gm-Message-State: AC+VfDzn4BvpgfJ4ig9y1aqE0DLEUui1HqF1sGlwrRXO6TprjccaK4gA
 /prkj4rvaMNnhW7Y0e/kPUyM6g==
X-Google-Smtp-Source: ACHHUZ72Ju7xg1QN3KtXzwVox4HtRjoATsB2ZY3SHcihi+os+2MdpthJ0YX+TRIJ+jxWEkN5biXS6w==
X-Received: by 2002:a2e:88d8:0:b0:2a8:c333:ebee with SMTP id
 a24-20020a2e88d8000000b002a8c333ebeemr101125ljk.49.1684463939821; 
 Thu, 18 May 2023 19:38:59 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 s15-20020a2e2c0f000000b002af25598ef9sm25906ljs.0.2023.05.18.19.38.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 18 May 2023 19:38:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Fri, 19 May 2023 05:38:52 +0300
Message-Id: <20230519023855.3840907-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
References: <20230519023855.3840907-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 4/7] drm/msm/dpu: inline dpu_encoder_get_wb()
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

The function dpu_encoder_get_wb() returns controller_id if the
corresponding WB is present in the catalog. We can inline this function
and rely on dpu_rm_get_wb() returning NULL for indices for which the
WB is not present on the device.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++-------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 267626245a74..92e915bcf88a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -1277,22 +1277,6 @@ static enum dpu_intf dpu_encoder_get_intf(const struct dpu_mdss_cfg *catalog,
 	return INTF_MAX;
 }
 
-static enum dpu_wb dpu_encoder_get_wb(const struct dpu_mdss_cfg *catalog,
-		enum dpu_intf_type type, u32 controller_id)
-{
-	int i = 0;
-
-	if (type != INTF_WB)
-		return WB_MAX;
-
-	for (i = 0; i < catalog->wb_count; i++) {
-		if (catalog->wb[i].id == controller_id)
-			return catalog->wb[i].id;
-	}
-
-	return WB_MAX;
-}
-
 void dpu_encoder_vblank_callback(struct drm_encoder *drm_enc,
 		struct dpu_encoder_phys *phy_enc)
 {
@@ -2268,7 +2252,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		 */
 		u32 controller_id = disp_info->h_tile_instance[i];
 		enum dpu_intf intf_idx;
-		enum dpu_wb wb_idx;
 
 		if (disp_info->num_of_h_tiles > 1) {
 			if (i == 0)
@@ -2286,14 +2269,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 							    disp_info->intf_type,
 							    controller_id);
 
-		wb_idx = dpu_encoder_get_wb(dpu_kms->catalog,
-				disp_info->intf_type, controller_id);
-
 		if (intf_idx >= INTF_0 && intf_idx < INTF_MAX)
 			phys_params.hw_intf = dpu_rm_get_intf(&dpu_kms->rm, intf_idx);
 
-		if (wb_idx >= WB_0 && wb_idx < WB_MAX)
-			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, wb_idx);
+		if (disp_info->intf_type == INTF_WB && controller_id < WB_MAX)
+			phys_params.hw_wb = dpu_rm_get_wb(&dpu_kms->rm, controller_id);
 
 		if (!phys_params.hw_intf && !phys_params.hw_wb) {
 			DPU_ERROR_ENC(dpu_enc, "no intf or wb block assigned at idx: %d\n", i);
-- 
2.39.2

