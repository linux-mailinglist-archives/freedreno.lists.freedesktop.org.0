Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BF8B775135A
	for <lists+freedreno@lfdr.de>; Thu, 13 Jul 2023 00:12:06 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 54F0B10E5DE;
	Wed, 12 Jul 2023 22:12:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x131.google.com (mail-lf1-x131.google.com
 [IPv6:2a00:1450:4864:20::131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2AD6110E5DD
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 22:11:46 +0000 (UTC)
Received: by mail-lf1-x131.google.com with SMTP id
 2adb3069b0e04-4fbf09a9139so77829e87.2
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 15:11:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689199904; x=1689804704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M10VgP9//AsaJyB3rDz2tLQzN4SdFxlisowXmDtHg2k=;
 b=rVuupT85qWdSAbnUF3rDBecpUJzSwFPoZDWDdmyJ7XQ4KRb9vuiiOQU2WseFdV6glE
 Yv6SiAOeoW9Dyn88J3dbXayLGmVwVMRWi/zQVYMuScrI8+S3bM5RiFhRuskt2wEaiens
 0g8Y52AoIQzeG5vz01diRLIkSKdfqMG3xy6AHC9COGSq+WGU2+KARqu6EG0RFt5T7+LO
 fgjO1tyzS/N7jocbp7S5W+S9+4EV14YxMrb3uGGTbACky6EcdCvS5ANKk0skxpd/wiFR
 7MBpiSeBiztIz/egBUcWqj9Aw2a5BSO1e/SWCAU2Ggnf6M4jlMMXSpExC976Y4lBu4Nr
 dBIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689199904; x=1689804704;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M10VgP9//AsaJyB3rDz2tLQzN4SdFxlisowXmDtHg2k=;
 b=IBaC+K2+ZIcP04uE7TF6x4mMUqsZF1KQ348kpXEvUh69GmrncDVALnAIaMXPNtrMkM
 id19GGlfl+757DusGv566W/L2s5fyAdo28KRfnY3RknX0e/3difXhpvez/C88fXIjkk+
 +Pj38z7Au5y2wYrz1Jrbyow/+K20CI+ftTM7fJxSTAHRchbqGIhQUFmePeuYNFIq1k2/
 iC5PNEgnZ4qbg2AfEV7wIBvwFKo1iQxIeD491QUedbpgC9gPyWrmo6EpTda0qZdAV1sl
 X8oPs8/eXeNuumrmBzl+ndxvn7I8mv3aeOk7SLc+O0TmLozSdVNcTNuCLaKYK+IFJBzY
 64/Q==
X-Gm-Message-State: ABy/qLbhctkWH8AmXg/PF09uQVXjLOSb1KJbWL2Xwy5g8Blmjn25Jl9y
 fojy400DYKEmh6pUYonBOJd19g==
X-Google-Smtp-Source: APBJJlGQNS1YTzCBpsZUchsi6L/GVRPzj9zzQdd8jYukqlbz5CtMlEj14dRIljkdXqQ+0+paMHFqfQ==
X-Received: by 2002:a05:6512:3b3:b0:4f9:571d:c50e with SMTP id
 v19-20020a05651203b300b004f9571dc50emr15810889lfp.36.1689199904391; 
 Wed, 12 Jul 2023 15:11:44 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020ac25290000000b004f62fdf61fdsm856193lfm.204.2023.07.12.15.11.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 15:11:43 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Thu, 13 Jul 2023 01:11:33 +0300
Message-Id: <20230712221139.313729-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
References: <20230712221139.313729-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 05/11] drm/msm/dpu: rework indentation in
 dpu_core_perf
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
 Stephen Boyd <swboyd@chromium.org>, Konrad Dybcio <konrad.dybcio@linaro.org>,
 Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

dpu_core_perf.c contains several multi-line conditions which are hard to
comprehent because of the indentation. Rework the identation of these
conditions to make it easier to understand them.

Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Acked-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c | 10 ++++------
 1 file changed, 4 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
index f9f44cfcfbf2..841e1fc0c6a7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_core_perf.c
@@ -173,8 +173,8 @@ int dpu_core_perf_crtc_check(struct drm_crtc *crtc,
 
 	drm_for_each_crtc(tmp_crtc, crtc->dev) {
 		if (tmp_crtc->enabled &&
-		    (dpu_crtc_get_client_type(tmp_crtc) ==
-				curr_client_type) && (tmp_crtc != crtc)) {
+		    dpu_crtc_get_client_type(tmp_crtc) == curr_client_type &&
+		    tmp_crtc != crtc) {
 			struct dpu_crtc_state *tmp_cstate =
 				to_dpu_crtc_state(tmp_crtc->state);
 
@@ -365,10 +365,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
 			update_bus = true;
 		}
 
-		if ((params_changed &&
-			(new->core_clk_rate > old->core_clk_rate)) ||
-			(!params_changed &&
-			(new->core_clk_rate < old->core_clk_rate))) {
+		if ((params_changed && new->core_clk_rate > old->core_clk_rate) ||
+		    (!params_changed && new->core_clk_rate < old->core_clk_rate)) {
 			old->core_clk_rate = new->core_clk_rate;
 			update_clk = true;
 		}
-- 
2.39.2

