Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A547B6BD670
	for <lists+freedreno@lfdr.de>; Thu, 16 Mar 2023 17:56:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1AA7410ED93;
	Thu, 16 Mar 2023 16:55:52 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 244DE10ED76
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 16:55:48 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id a32so2394924ljq.1
 for <freedreno@lists.freedesktop.org>; Thu, 16 Mar 2023 09:55:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1678985746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=xno9EDcJdCx0dzvy6MPkn9poprdciCTjrjdIL0N1NaA=;
 b=m9PotwrEOadS3epM1Soeka22K9YWW63xnkBHx8pfIaEygRHGiAnKitwQkZRTZDqFoJ
 LBYU0aRMH0Oswj/U88JZteaMR1lVFwemwbUS7CaQf9yx1Qn6Sxnbk3Q0unxcWktGhSNJ
 JfIavPfdLUc2O0v4u2+r9WcereFC5T/+zBFuVkq8jZRnXC+NRNChKZy5Ld4/niuKRaof
 hjyWH5uzcjWkwOcYUc1AJtpewk6rdA0xhdurQTV42Qd9MGqOsT7H/wd8Z/yC9XxvOuAW
 FoyT/sjcgvqvjm1ig6OjWGkubhyddaCdyWPbWOxaUSkewLT+PjuqFN6lX/bntDXiMULV
 oiTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1678985746;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=xno9EDcJdCx0dzvy6MPkn9poprdciCTjrjdIL0N1NaA=;
 b=bmyfU3QxfzbSFPHSw1ZuRffE5PHMqLjwPN9Kl3ZspphNJRj9TBOxl5SbIdMtUd/jiH
 VAkH12Sgw5sCNKOS7lXvgQbz0xERbxMT/1LmbnDvVugpH3J0WkT27yDq+D+XH2YGst2d
 ittQD1f/zewDIPINTUr7OrsXzle7Ls+u56Te4rD9jD8DmEznkN+12CbIle9du0Y4yYoF
 +jsa9CrsQZAtVokiA7h4sXUg+eIFfqVRLIYEAmWdXkKa8YioFZTlKQ5f90K/TrPQIpFH
 nV1BorW/RSF7tYcI8dDJP94lWVw5TOBibffsgDDfEuio+UwgUHrxJdv6Njg/9UD2shHI
 utPA==
X-Gm-Message-State: AO0yUKUII8ebxwPJ8vpKm6tYvX6g5o+jNKXVxsP8em2iIkV/dBORChyk
 qioA9WDj4wM7m2YxrF8SrzyQig==
X-Google-Smtp-Source: AK7set+8/6Ajx6JmjruUiwOYyR6ckqdPlYqW3z2eQxTHQeYuxvfcltKTmq5GUzlziKTr0w/qOlQ1OQ==
X-Received: by 2002:a2e:9982:0:b0:299:a7b2:273b with SMTP id
 w2-20020a2e9982000000b00299a7b2273bmr1029275lji.29.1678985746408; 
 Thu, 16 Mar 2023 09:55:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 t18-20020a2e9c52000000b002934b5d6a61sm2661ljj.121.2023.03.16.09.55.45
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 16 Mar 2023 09:55:45 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Date: Thu, 16 Mar 2023 19:55:33 +0300
Message-Id: <20230316165542.4109764-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
References: <20230316165542.4109764-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [RFC PATCH v1 03/12] drm/msm/dpu: remove unused fields
 from dpu_encoder_virt
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

Remove historical fields intfs_swapped and topology fields from struct
dpu_encoder_virt and also remove even more historical docs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c | 10 ----------
 1 file changed, 10 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 28729c77364f..4ee708264f3b 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -130,18 +130,12 @@ enum dpu_enc_rc_states {
  *			pingpong blocks can be different than num_phys_encs.
  * @hw_dsc:		Handle to the DSC blocks used for the display.
  * @dsc_mask:		Bitmask of used DSC blocks.
- * @intfs_swapped:	Whether or not the phys_enc interfaces have been swapped
- *			for partial update right-only cases, such as pingpong
- *			split where virtual pingpong does not generate IRQs
  * @crtc:		Pointer to the currently assigned crtc. Normally you
  *			would use crtc->state->encoder_mask to determine the
  *			link between encoder/crtc. However in this case we need
  *			to track crtc in the disable() hook which is called
  *			_after_ encoder_mask is cleared.
  * @connector:		If a mode is set, cached pointer to the active connector
- * @crtc_kickoff_cb:		Callback into CRTC that will flush & start
- *				all CTL paths
- * @crtc_kickoff_cb_data:	Opaque user data given to crtc_kickoff_cb
  * @enc_lock:			Lock around physical encoder
  *				create/destroy/enable/disable
  * @frame_busy_mask:		Bitmask tracking which phys_enc we are still
@@ -160,7 +154,6 @@ enum dpu_enc_rc_states {
  * @delayed_off_work:		delayed worker to schedule disabling of
  *				clks and resources after IDLE_TIMEOUT time.
  * @vsync_event_work:		worker to handle vsync event for autorefresh
- * @topology:                   topology of the display
  * @idle_timeout:		idle timeout duration in milliseconds
  * @wide_bus_en:		wide bus is enabled on this interface
  * @dsc:			drm_dsc_config pointer, for DSC-enabled encoders
@@ -180,8 +173,6 @@ struct dpu_encoder_virt {
 
 	unsigned int dsc_mask;
 
-	bool intfs_swapped;
-
 	struct drm_crtc *crtc;
 	struct drm_connector *connector;
 
@@ -201,7 +192,6 @@ struct dpu_encoder_virt {
 	enum dpu_enc_rc_states rc_state;
 	struct delayed_work delayed_off_work;
 	struct kthread_work vsync_event_work;
-	struct msm_display_topology topology;
 
 	u32 idle_timeout;
 
-- 
2.30.2

