Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 05EEFA1A477
	for <lists+freedreno@lfdr.de>; Thu, 23 Jan 2025 13:45:05 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF40F10E800;
	Thu, 23 Jan 2025 12:45:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=linaro.org header.i=@linaro.org header.b="A24sduoZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-f52.google.com (mail-lf1-f52.google.com
 [209.85.167.52])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 823DC10E7FF
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 12:45:02 +0000 (UTC)
Received: by mail-lf1-f52.google.com with SMTP id
 2adb3069b0e04-540215984f0so942608e87.1
 for <freedreno@lists.freedesktop.org>; Thu, 23 Jan 2025 04:45:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1737636301; x=1738241101; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=dGG1s1S8D3eBzGHQyK9YTyucSj2Qt8yK2qJGvoIIk2c=;
 b=A24sduoZSdP+FnujIXK0h2SKD8Qq0qI6vX7Ozq1juu8IRsdYY2sJ4mLOvgvUnkMTqU
 volPHT9dgGnUTy9GznNn7GKDiNXGPmjOtyIEiQBViPMXxPjqV5YYwPS5+/fmKSKMd443
 WIdaaA0UHJhERCz1xtdvz0SR5m9lQ93vmhBbvX+UwUmDnw9wfg1UrHxsuS4RAu8zfVkq
 /RxjsqaaH/bcsXjjCIZi07OeljjDPM10uo8f5GBEXnjl5leGqHecpbTY+dlgcazOZyZb
 ttX1Eouvv+LxabSDfTTahQsrE4s+PpThrKKuTKV0iEVuhhoBm5vmI22H/1qjs+MGOR61
 JelQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1737636301; x=1738241101;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=dGG1s1S8D3eBzGHQyK9YTyucSj2Qt8yK2qJGvoIIk2c=;
 b=jvGA4+lGPeF46GzYSEyamS9+2BMlFveRKqgkDKohaXzRpWe4qJkZ1yRtb10nDkBVlM
 9qi21XnrDutHlCjRY5tJMlFd1moeWaOAn3ZyrKnZmneu8JBwT6GdYIOheWKQzq6sjj1N
 +pqzT8LOpUfrapO3UFwqVNEg2YFa5q7A90pYkisHYNLqxprEGhvMxkZpYteSnQDqisbB
 t+UJuGdaEQdmkFqpS0QCW+5UiXmivP1M0v/BxSBWXidPAQiOc+J8Er5IGdlnl3kxk1l8
 Bb59VTEqsFwu20llKd365nt2laauVi48U0RltedyV4omEC2RYbRjJUiTR3NuqWH5vYhx
 cpKQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCURpLWSbZs7zTKvZxQsISNSMAtyuihpUUs7d6XcTA5WgZPu6V8NPy4G9VkdmMPuQwwZR63c4iBZdIk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxx2SwrV5ogKb1vf7DSnr3FqA8hYnxwdlNGrPAoizTf6woDCnWN
 T+lZxhOJDEicQMcFwRR1slaewZ7F2drfmLDU/PaLkqi1QiyC29pGbN8RfRMmJOw=
X-Gm-Gg: ASbGncsfW+0H4hPPqDhETM6shw7RUNDJkPqCdVtxeM+BnQPQiVFajsF3TWRa216UfH1
 QoToxwHTuiu44nk8MM2LYhaeThsekby10YGPIj269INJWz+co7yKJnVhzYclCGRWH+7kioTCjeG
 7YdCfNQdSSA+1k1zojvmQfURMCZFgPKXVY2JTCiaFr5VZGoDC80SLRSI5SKi3QdaWFTqUSHTnhR
 3MiUaV7fiSLEs7yE6DbxKjNi4ZBkWU5OyUqChfkocCjrwluQU12PkxF1R3+Ga36sYJJvub5ZpOr
 xONb2R90Ik+S
X-Google-Smtp-Source: AGHT+IEc3fFogjnD5/4R2Bf8a7GwLgIkwuzc+D1oUKDeQls5NYh149P1sZOUsIA8lUqhtjnEtev08Q==
X-Received: by 2002:ac2:4570:0:b0:540:2542:d89a with SMTP id
 2adb3069b0e04-5439c288152mr7747160e87.52.1737636300767; 
 Thu, 23 Jan 2025 04:45:00 -0800 (PST)
Received: from umbar.lan ([192.130.178.90]) by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-3072a4ed6f3sm30351661fa.86.2025.01.23.04.44.59
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 23 Jan 2025 04:45:00 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu, 23 Jan 2025 14:43:34 +0200
Subject: [PATCH v2 2/4] drm/msm/dpu: move needs_cdm setting to
 dpu_encoder_get_topology()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250123-drm-dirty-modeset-v2-2-bbfd3a6cd1a4@linaro.org>
References: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
In-Reply-To: <20250123-drm-dirty-modeset-v2-0-bbfd3a6cd1a4@linaro.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Sean Paul <sean@poorly.run>, Marijn Suijten <marijn.suijten@somainline.org>, 
 Chandan Uddaraju <chandanu@codeaurora.org>, 
 Jeykumar Sankaran <jsanka@codeaurora.org>, 
 Jordan Crouse <jordan@cosmicpenguin.net>, 
 Sravanthi Kollukuduru <skolluku@codeaurora.org>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 Archit Taneja <architt@codeaurora.org>, 
 Rajesh Yadav <ryadav@codeaurora.org>, linux-arm-msm@vger.kernel.org, 
 freedreno@lists.freedesktop.org, Simona Vetter <simona.vetter@ffwll.ch>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3658;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=9zVeq6fbBs87RymcRg/e2kjiz2Fyvfkzu2Dc7p8G1oo=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBnkjnGQQwX2/92m28UDkxPgHsjijqmj3l0C61CP
 AJaqUsuPNuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZ5I5xgAKCRCLPIo+Aiko
 1aPUB/wJz/4RT6wQtzDjjYlvwIs+lCHplpQm8SAQzmtOd0QvhldFakRolrA8jhX141F8kesTbWU
 69JPnlE8fSAql+i/0C+bUlttsx1rLhdm+Gfh9igYykbkhvNBzYjS3tiqZNKTjLJwTmcUcKtQ82d
 EVc8iyVdH6bxVVBjBK9ANniX+kooBCheFePAUIWpE7UMmO/zHDD7s/tjbhFKI9aVJqy0x6XsR+0
 dLFer5EfYXrvXHg43BqhnYcEqXg+pZ9I3OYk+NLLN8caFgz9MfnGc4cLFXXkt8TpNCsxsu5jleD
 Npo53pNQFkPsDdZVxsw/YlmzDSlbpUtiYT0Bjm0U+iHtWgwt
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

As a preparation for calling dpu_encoder_get_topology() from different
places, move the code setting topology->needs_cdm to that function
(instead of patching topology separately).

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 41 ++++++++++++++++-------------
 1 file changed, 22 insertions(+), 19 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 9aacd3b5bcf808c5712bf797a48484e297386c1c..5dc2e0585de1337601a0426795d2c8f2806ccd10 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -652,8 +652,11 @@ static struct msm_display_topology dpu_encoder_get_topology(
 			struct dpu_kms *dpu_kms,
 			struct drm_display_mode *mode,
 			struct drm_crtc_state *crtc_state,
+			struct drm_connector_state *conn_state,
 			struct drm_dsc_config *dsc)
 {
+	struct msm_drm_private *priv = dpu_enc->base.dev->dev_private;
+	struct msm_display_info *disp_info = &dpu_enc->disp_info;
 	struct msm_display_topology topology = {0};
 	int i, intf_count = 0;
 
@@ -696,6 +699,23 @@ static struct msm_display_topology dpu_encoder_get_topology(
 		topology.num_intf = 1;
 	}
 
+	/*
+	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
+	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
+	 * earlier.
+	 */
+	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
+		struct drm_framebuffer *fb;
+
+		fb = conn_state->writeback_job->fb;
+
+		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
+			topology.needs_cdm = true;
+	} else if (disp_info->intf_type == INTF_DP) {
+		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], mode))
+			topology.needs_cdm = true;
+	}
+
 	return topology;
 }
 
@@ -743,9 +763,7 @@ static int dpu_encoder_virt_atomic_check(
 	struct dpu_kms *dpu_kms;
 	struct drm_display_mode *adj_mode;
 	struct msm_display_topology topology;
-	struct msm_display_info *disp_info;
 	struct dpu_global_state *global_state;
-	struct drm_framebuffer *fb;
 	struct drm_dsc_config *dsc;
 	int ret = 0;
 
@@ -759,7 +777,6 @@ static int dpu_encoder_virt_atomic_check(
 	DPU_DEBUG_ENC(dpu_enc, "\n");
 
 	priv = drm_enc->dev->dev_private;
-	disp_info = &dpu_enc->disp_info;
 	dpu_kms = to_dpu_kms(priv->kms);
 	adj_mode = &crtc_state->adjusted_mode;
 	global_state = dpu_kms_get_global_state(crtc_state->state);
@@ -770,22 +787,8 @@ static int dpu_encoder_virt_atomic_check(
 
 	dsc = dpu_encoder_get_dsc_config(drm_enc);
 
-	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, dsc);
-
-	/*
-	 * Use CDM only for writeback or DP at the moment as other interfaces cannot handle it.
-	 * If writeback itself cannot handle cdm for some reason it will fail in its atomic_check()
-	 * earlier.
-	 */
-	if (disp_info->intf_type == INTF_WB && conn_state->writeback_job) {
-		fb = conn_state->writeback_job->fb;
-
-		if (fb && MSM_FORMAT_IS_YUV(msm_framebuffer_format(fb)))
-			topology.needs_cdm = true;
-	} else if (disp_info->intf_type == INTF_DP) {
-		if (msm_dp_is_yuv_420_enabled(priv->dp[disp_info->h_tile_instance[0]], adj_mode))
-			topology.needs_cdm = true;
-	}
+	topology = dpu_encoder_get_topology(dpu_enc, dpu_kms, adj_mode, crtc_state, conn_state,
+					    dsc);
 
 	if (topology.needs_cdm && !dpu_enc->cur_master->hw_cdm)
 		crtc_state->mode_changed = true;

-- 
2.39.5

