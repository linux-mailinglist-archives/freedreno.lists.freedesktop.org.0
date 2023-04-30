Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D1E376F2BB7
	for <lists+freedreno@lfdr.de>; Mon,  1 May 2023 01:57:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AB53B10E194;
	Sun, 30 Apr 2023 23:57:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6F5E910E0EF
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 23:57:39 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-4f00d3f98deso20080270e87.0
 for <freedreno@lists.freedesktop.org>; Sun, 30 Apr 2023 16:57:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1682899057; x=1685491057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=VGmFxFh/X4UXJV1G/EJTcl28FnvhXByAtzs1tNbxevg=;
 b=ZEkbahwH2+Z8EYsp20gQL5OuS8WNNFwalIwk0PjfdSe4ytIIAZ3mmkBxUKunibziSB
 sQnxBNrF+2vW/nAprTUeqnHEEq8285sZLlesdVgqtmtC4cIl2jzIIfmSnR3HwjQOP87U
 bpHdp55Vk7VxOe20eHIXU9frcNsNyQ2/H7XY667xbaPIwUire2WFohTw8McJbt3JNx8A
 nOti9/svJfcgVcWmU4oVZ++N4flSIsJQabpHG8QiQGBiZ3EGr7zM4dhAiQPtxK0tVaej
 Kim6OCn7UiDTz9xwhi8FzkzLcuCgssGSnqgYewKziP+hheidYZyzM4BXyQQhowWPpd44
 uFog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1682899057; x=1685491057;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=VGmFxFh/X4UXJV1G/EJTcl28FnvhXByAtzs1tNbxevg=;
 b=EQL+1O+l/7n8aVdZoUUo3blnkXmmHuGFiWYS9SmLVO6/dgjdabDIwstXHV+VwNZu4o
 /V233+YlST/63Zq+GDJbd/W4D80+6LNezqDMobn86DvtwO0aTU/AXL50NgrmkfzW4iUR
 Er0JG4LZ+f2AbxiMd2uorq1H5ITKaI1vIcf51LFeI15eKButH9rTAZoRmWsIEY+Z58lF
 A6MCaZJ5oMiwtLi7ePrHWTmy4O1aUToF65w6RmZt5lTmuuNh0HHDn5+LwTZpxFXQ5+ie
 IrUk1mlLCWOhhy0vqaoc5v04CaD5+AuFGOSA3dTO7yxa1fIyb8F+sig6R5MQlGcY2EZf
 +g7g==
X-Gm-Message-State: AC+VfDx+n36ma0NakQ2JnvLm9i6EjotwwKOw47XIk3iFdx5bCxvNS7q3
 FFxUSK0HeYrmbdkvz73RbjzrvQ==
X-Google-Smtp-Source: ACHHUZ5q43gHQT9vO8NS2QC1Evk16o03p2SzASt2VZDvV5BtajmsgOBqvYIdO/fZyvWW519Aw/JoZQ==
X-Received: by 2002:a05:6512:ea7:b0:4ec:8cc6:55d9 with SMTP id
 bi39-20020a0565120ea700b004ec8cc655d9mr4589920lfb.9.1682899057039; 
 Sun, 30 Apr 2023 16:57:37 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p19-20020a2e9a93000000b002a9f022e8bcsm4292099lji.65.2023.04.30.16.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 30 Apr 2023 16:57:36 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Mon,  1 May 2023 02:57:30 +0300
Message-Id: <20230430235732.3341119-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
References: <20230430235732.3341119-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 5/7] drm/msm/dpu: inline dpu_encoder_get_wb()
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 24 ++-------------------
 1 file changed, 2 insertions(+), 22 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 4c85cbb030e4..507ff3f88c67 100644
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
@@ -2261,7 +2245,6 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
 		 */
 		u32 controller_id = disp_info->h_tile_instance[i];
 		enum dpu_intf intf_idx;
-		enum dpu_wb wb_idx;
 
 		if (disp_info->num_of_h_tiles > 1) {
 			if (i == 0)
@@ -2279,14 +2262,11 @@ static int dpu_encoder_setup_display(struct dpu_encoder_virt *dpu_enc,
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

