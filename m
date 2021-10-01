Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 0563D41F42C
	for <lists+freedreno@lfdr.de>; Fri,  1 Oct 2021 19:59:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CD8A96EEC1;
	Fri,  1 Oct 2021 17:59:18 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ot1-x334.google.com (mail-ot1-x334.google.com
 [IPv6:2607:f8b0:4864:20::334])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4B1F46EEAE
 for <freedreno@lists.freedesktop.org>; Fri,  1 Oct 2021 17:59:14 +0000 (UTC)
Received: by mail-ot1-x334.google.com with SMTP id
 l16-20020a9d6a90000000b0053b71f7dc83so12512403otq.7
 for <freedreno@lists.freedesktop.org>; Fri, 01 Oct 2021 10:59:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=from:to:cc:subject:date:message-id:in-reply-to:references
 :mime-version:content-transfer-encoding;
 bh=8jGVwsV27e5G+2lgCCsaslyi5w/V/6kg5N6xFIrsoZg=;
 b=EGIbdefGp4R9Z0HnjM6MGC0UpiG4tF1EKpC4OqzbWkcivAcehDVDzyiD6CwF8R7ILO
 wM6zuTB2newHK89Yjbyc6yfOAjvNPNFU1YXv+kg0ypGs7lP2MTac381HDm+Ik+DIwbus
 /IOdqC98zTAnHuvysnLXfmSSoTdoZ9/WnwmFgAQacECw+CSokldVnQPcP+uYDdzET+Wp
 2pBZLrfBZoiIghbt7m+gvS4oDmyseoProA4ZDqAl24xAh54Wdcvc5oorlFrGC0oOXs5s
 3Ff7xmOfbuU4fIStkRZctlnT6+CRpm1jlw+OcuZ1p1A4qIz/5izfb/OOMq2JQhigIZZX
 YG8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
 :references:mime-version:content-transfer-encoding;
 bh=8jGVwsV27e5G+2lgCCsaslyi5w/V/6kg5N6xFIrsoZg=;
 b=dPZwmlKixAqhCGHw5RssLSyDyNfH3Sb5MoFmiCI73SPVWKX0LwN6/omhQY7rfLa58r
 /C+J+3+baavvrAKegSOrghCPJxdIBJ7nSDBa56zeWvt2904XOAuauXTmYm8fiw3H4M8O
 Cf1ccpO/+hBQ7tVxN8DlVCIf7FgY3iUNqGyZ3mZhrzmedA2v0jD8W9fQPv215urT6wSI
 RY9zfkFJRA5nLYsa+mPO6KZoBtEYE6oepoR5B4r2vzZebogW/dIh5SP4FBlwY7C3Abru
 5hOpP35QvphlpOdk1LNyIEvBu5kg3NWEli6WhoId6oaKGgMsRMrn8elbx94pZ5Pp0G+z
 RR/g==
X-Gm-Message-State: AOAM532JODbP1uesbcEgvRnHA3vUyg7umAucGgCUVBEs3o3Xvg23dVVS
 Bzfu2L8174H8JTi4hpp1BLeG0ksPOYN+lg==
X-Google-Smtp-Source: ABdhPJzFLDtXpNhOdyCN+BcsBhFoZ2Q/WwgndGzptQ2ZP0lSpninR61hXgd/wzhiglLdgWevxfe2gA==
X-Received: by 2002:a9d:7f89:: with SMTP id t9mr11495008otp.143.1633111153600; 
 Fri, 01 Oct 2021 10:59:13 -0700 (PDT)
Received: from localhost.localdomain ([2600:1700:a0:3dc8:205:1bff:fec0:b9b3])
 by smtp.gmail.com with ESMTPSA id
 w2sm1284798oof.23.2021.10.01.10.59.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Oct 2021 10:59:13 -0700 (PDT)
From: Bjorn Andersson <bjorn.andersson@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 David Airlie <airlied@linux.ie>, Daniel Vetter <daniel@ffwll.ch>,
 Abhinav Kumar <abhinavk@codeaurora.org>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Kalyan Thota <kalyan_t@codeaurora.org>,
 Kuogee Hsieh <khsieh@codeaurora.org>
Cc: Rob Herring <robh+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Date: Fri,  1 Oct 2021 11:00:55 -0700
Message-Id: <20211001180058.1021913-3-bjorn.andersson@linaro.org>
X-Mailer: git-send-email 2.29.2
In-Reply-To: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
References: <20211001180058.1021913-1-bjorn.andersson@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 2/5] drm/msm/dp: Modify prototype of encoder
 based API
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

Functions in the DisplayPort code that relates to individual instances
(encoders) are passed both the struct msm_dp and the struct drm_encoder. But
in a situation where multiple DP instances would exist this means that
the caller need to resolve which struct msm_dp relates to the struct
drm_encoder at hand.

Store a reference to the struct msm_dp associated with each
dpu_encoder_virt to allow the particular instance to be associate with
the encoder in the following patch.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Signed-off-by: Bjorn Andersson <bjorn.andersson@linaro.org>
---

Changes since v2:
- None

 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 23 ++++++++++++---------
 1 file changed, 13 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 0e9d3fa1544b..b7f33da2799c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -168,6 +168,7 @@ enum dpu_enc_rc_states {
  * @vsync_event_work:		worker to handle vsync event for autorefresh
  * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
+ * @dp:				msm_dp pointer, for DP encoders
  */
 struct dpu_encoder_virt {
 	struct drm_encoder base;
@@ -206,6 +207,8 @@ struct dpu_encoder_virt {
 	struct msm_display_topology topology;
 
 	u32 idle_timeout;
+
+	struct msm_dp *dp;
 };
 
 #define to_dpu_encoder_virt(x) container_of(x, struct dpu_encoder_virt, base)
@@ -1000,8 +1003,8 @@ static void dpu_encoder_virt_mode_set(struct drm_encoder *drm_enc,
 
 	trace_dpu_enc_mode_set(DRMID(drm_enc));
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp)
-		msm_dp_display_mode_set(priv->dp, drm_enc, mode, adj_mode);
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS)
+		msm_dp_display_mode_set(dpu_enc->dp, drm_enc, mode, adj_mode);
 
 	list_for_each_entry(conn_iter, connector_list, head)
 		if (conn_iter->encoder == drm_enc)
@@ -1182,9 +1185,8 @@ static void dpu_encoder_virt_enable(struct drm_encoder *drm_enc)
 
 	_dpu_encoder_virt_enable_helper(drm_enc);
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
-		ret = msm_dp_display_enable(priv->dp,
-						drm_enc);
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
+		ret = msm_dp_display_enable(dpu_enc->dp, drm_enc);
 		if (ret) {
 			DPU_ERROR_ENC(dpu_enc, "dp display enable failed: %d\n",
 				ret);
@@ -1224,8 +1226,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 	/* wait for idle */
 	dpu_encoder_wait_for_event(drm_enc, MSM_ENC_TX_COMPLETE);
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
-		if (msm_dp_display_pre_disable(priv->dp, drm_enc))
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
+		if (msm_dp_display_pre_disable(dpu_enc->dp, drm_enc))
 			DPU_ERROR_ENC(dpu_enc, "dp display push idle failed\n");
 	}
 
@@ -1253,8 +1255,8 @@ static void dpu_encoder_virt_disable(struct drm_encoder *drm_enc)
 
 	DPU_DEBUG_ENC(dpu_enc, "encoder disabled\n");
 
-	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS && priv->dp) {
-		if (msm_dp_display_disable(priv->dp, drm_enc))
+	if (drm_enc->encoder_type == DRM_MODE_ENCODER_TMDS) {
+		if (msm_dp_display_disable(dpu_enc->dp, drm_enc))
 			DPU_ERROR_ENC(dpu_enc, "dp display disable failed\n");
 	}
 
@@ -2170,7 +2172,8 @@ int dpu_encoder_setup(struct drm_device *dev, struct drm_encoder *enc,
 		timer_setup(&dpu_enc->vsync_event_timer,
 				dpu_encoder_vsync_event_handler,
 				0);
-
+	else if (disp_info->intf_type == DRM_MODE_ENCODER_TMDS)
+		dpu_enc->dp = priv->dp;
 
 	INIT_DELAYED_WORK(&dpu_enc->delayed_off_work,
 			dpu_encoder_off_work);
-- 
2.29.2

