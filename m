Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2B4877682DF
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 02:35:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8497E10E12F;
	Sun, 30 Jul 2023 00:35:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com
 [IPv6:2a00:1450:4864:20::236])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C82E210E240
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 00:35:28 +0000 (UTC)
Received: by mail-lj1-x236.google.com with SMTP id
 38308e7fff4ca-2b9ba3d6157so49564891fa.3
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 17:35:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690677327; x=1691282127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=SmjGd6hQg5+KzT5ujuzMh2o3ciL+YNI2GkvXWKUqqAs=;
 b=ZgJVLnAfJAQUM4bSILyTLf+Im47B/dyNmIyjpw4oLc7ObYAql/7HIJvFcc5f5ihTYT
 i9Ln4Mx04ujT9NUQWmmTbnq2NPgsbno7+kUVJWslgHnU0kk+YrAXB2n6PnOZuPK3iu2q
 ZM1fOzodAF9BzogVBY/7FuouLzzYKpeMyBwCtX5hVxKNpG+FsQa5igVuW1CPKj96xrSq
 nZkom/2QU0nJ5vgVrMr3kiQjoD98jU6Gd8i7H2EimBllj+MmF3AKfI1A2lywH24Um7m/
 NOsb38b5TXSVTAjkLyiqQxZOIR6rMROneXCiKZLru4YgDJWKPp3cK99x1iyGtdx5BAOl
 Ifag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690677327; x=1691282127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=SmjGd6hQg5+KzT5ujuzMh2o3ciL+YNI2GkvXWKUqqAs=;
 b=cDCE+CXG2TJub2Mg7PkIRk9VBR+mxsLuVryOSQW9/8JJFreKCY7gcL3U0rB+bpvaCS
 TNBehQ34+Vqr52dk/aD035N8JGanGFzjRwRovxcFk3RDHWFK2SwAaan97UFpmRJbRzMM
 qRXDenLaVa5NAfrpixuUbJoujHBZEsbmx1krExTic63EQz6NHq55OCk97ZMxXpvn3eUk
 qb7cJPHNe7wMGmJLSAcz2pXylO/ohlWJSgeTYvI+XT4JEDJZ3HcmxC4XvuspITtHcjSI
 dSiN13VHtZYLZLpKh60wVWERn68nM9+2c+YNOs+E7LTqCDINLA0ZaDstY3zHuVYYO0xg
 RKlw==
X-Gm-Message-State: ABy/qLac1OOb/iuKQKZjP5rpPv1X1FJmy+OXSJAZr8vfb2LMZn0xCLTt
 K+gbVg1nVay55EX5qoQWbSwP5w==
X-Google-Smtp-Source: APBJJlE/Masgcy12zxqKZTm46aarOd7BSDmEN/SL2Jz+5EdmLFdorC+H60FSJfrmlnBy05dFeOevtg==
X-Received: by 2002:a2e:c51:0:b0:2b9:e053:7a01 with SMTP id
 o17-20020a2e0c51000000b002b9e0537a01mr925423ljd.43.1690677327182; 
 Sat, 29 Jul 2023 17:35:27 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j22-20020a2e8016000000b002b6ffa50896sm1780482ljg.128.2023.07.29.17.35.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 17:35:26 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Jul 2023 03:35:18 +0300
Message-Id: <20230730003518.349197-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
References: <20230730003518.349197-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 8/8] drm/msm/dpu: move INTF tearing checks to
 dpu_encoder_phys_cmd_init
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

As the INTF is fixed at the encoder creation time, we can move the
check whether INTF supports tearchck to dpu_encoder_phys_cmd_init().
This function can return an error if INTF doesn't have required feature.
Performing this check in dpu_encoder_phys_cmd_tearcheck_config() is less
useful, as this function returns void.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 .../drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c  | 41 +++++++++++--------
 1 file changed, 25 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
index 012986cff38c..adbd559a5290 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c
@@ -325,24 +325,21 @@ static void dpu_encoder_phys_cmd_tearcheck_config(
 	unsigned long vsync_hz;
 	struct dpu_kms *dpu_kms;
 
-	if (phys_enc->has_intf_te) {
-		if (!phys_enc->hw_intf ||
-		    !phys_enc->hw_intf->ops.enable_tearcheck) {
-			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
-			return;
-		}
-
-		DPU_DEBUG_CMDENC(cmd_enc, "");
-	} else {
-		if (!phys_enc->hw_pp ||
-		    !phys_enc->hw_pp->ops.enable_tearcheck) {
-			DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
-			return;
-		}
-
-		DPU_DEBUG_CMDENC(cmd_enc, "pp %d\n", phys_enc->hw_pp->idx - PINGPONG_0);
+	/*
+	 * TODO: if/when resource allocation is refactored, move this to a
+	 * place where the driver can actually return an error.
+	 */
+	if (!phys_enc->has_intf_te &&
+	    (!phys_enc->hw_pp ||
+	     !phys_enc->hw_pp->ops.enable_tearcheck)) {
+		DPU_DEBUG_CMDENC(cmd_enc, "tearcheck not supported\n");
+		return;
 	}
 
+	DPU_DEBUG_CMDENC(cmd_enc, "intf %d pp %d\n",
+			 phys_enc->hw_intf->idx - INTF_0,
+			 phys_enc->hw_pp->idx - PINGPONG_0);
+
 	mode = &phys_enc->cached_mode;
 
 	dpu_kms = phys_enc->dpu_kms;
@@ -768,10 +765,22 @@ struct dpu_encoder_phys *dpu_encoder_phys_cmd_init(
 	phys_enc->intf_mode = INTF_MODE_CMD;
 	cmd_enc->stream_sel = 0;
 
+	if (!phys_enc->hw_intf) {
+		DPU_ERROR_CMDENC(cmd_enc, "no INTF provided\n");
+
+		return ERR_PTR(-EINVAL);
+	}
+
 	/* DPU before 5.0 use PINGPONG for TE handling */
 	if (phys_enc->dpu_kms->catalog->mdss_ver->core_major_ver >= 5)
 		phys_enc->has_intf_te = true;
 
+	if (phys_enc->has_intf_te && !phys_enc->hw_intf->ops.enable_tearcheck) {
+		DPU_ERROR_CMDENC(cmd_enc, "tearcheck not supported\n");
+
+		return ERR_PTR(-EINVAL);
+	}
+
 	atomic_set(&cmd_enc->pending_vblank_cnt, 0);
 	init_waitqueue_head(&cmd_enc->pending_vblank_wq);
 
-- 
2.39.2

