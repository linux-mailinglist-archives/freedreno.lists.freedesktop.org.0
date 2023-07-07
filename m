Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id C5D8074B74A
	for <lists+freedreno@lfdr.de>; Fri,  7 Jul 2023 21:40:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 285EA10E5E9;
	Fri,  7 Jul 2023 19:39:50 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com
 [IPv6:2a00:1450:4864:20::12b])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CB0E10E5E5
 for <freedreno@lists.freedesktop.org>; Fri,  7 Jul 2023 19:39:48 +0000 (UTC)
Received: by mail-lf1-x12b.google.com with SMTP id
 2adb3069b0e04-4fa16c6a85cso3543856e87.3
 for <freedreno@lists.freedesktop.org>; Fri, 07 Jul 2023 12:39:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1688758786; x=1691350786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=jS4QBjRPTQXKPDD7wlMbL4lf3gZh4eLDOWteEpntJqI=;
 b=jQ+aH2OJquXlDHELj0Tga/BRfi7MuxLfq0CbtfTvY7o+udJ30AwllW+89IziYe4t2r
 xTrMNT6XExiJZE0LueKf/jRRVZvn7BLPcNFH7Kvum23+mn5mD63yx4/4NL+Efe55SmIk
 Zj7Jgxi4f8WzNDr42C+/xO5VSvn+JrEQ0by9xOjbw4ydNh4GzRZxagXMudAxv++BxrOG
 tUPuxKmC3ksvfSNGMWZF8uTBGYJsu73FEw8Vy5Rl/RHypb6CU1EssZgwQTZfp/IsCoGx
 3dDWX3Gha1Cie7g4ZV37ggJ8SJDVMX5A1Zk8CYB9O1OqIPfdfwyzNLBl4oDSlnBLhr/4
 23IQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1688758786; x=1691350786;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=jS4QBjRPTQXKPDD7wlMbL4lf3gZh4eLDOWteEpntJqI=;
 b=gqJBHFO3eUjCNKsh0fq4RPgR2XNSmw4O3/P0iFSKQRTsK4l9osjHNFSiOVwNYVYHa6
 vLxdcgGfhsQYOkPDt92GwsoGj3nbfaThSZGwKRr4e/QXxqFMEDQUeRMNZ8oHf4EaID14
 Z+R0Wi9/KvYvKDrkBVSdDxK9kN2dLw8b8EYbUEQWwlgckmmsYLejcybFfM0ZRN8YM0BL
 Zm3cfkRv2yqspxOfJ9hf0JAVSoqa0ckYsFmva11hoP5XnXiFkuDsZrt7EblYWCUy5a14
 LyctqIDK5A4Hy+x4+jISQMWI6qb3LzKzfxYQY9IXNDcimJnJh47wHz2YoWokOAVLJcKT
 YQEQ==
X-Gm-Message-State: ABy/qLb5vcZSq3gXbiSQTjaQoCX45lrwPuGbvG1et17rhSk/jjqsvgq/
 JNTyKyYhAHSEvP4AsESBi4+49w==
X-Google-Smtp-Source: APBJJlFy5KM/w4/k4Md3037veJ8vqKUoZJvmQr5DOrbOa1BC1Bssjuvqs5yL9M+xEcWFA3K2jbtW5Q==
X-Received: by 2002:a05:6512:2521:b0:4fb:c0b5:63d4 with SMTP id
 be33-20020a056512252100b004fbc0b563d4mr5257145lfb.43.1688758786799; 
 Fri, 07 Jul 2023 12:39:46 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 q16-20020a19a410000000b004fba759bf44sm778995lfc.277.2023.07.07.12.39.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 07 Jul 2023 12:39:46 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Fri,  7 Jul 2023 22:39:36 +0300
Message-Id: <20230707193942.3806526-6-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
References: <20230707193942.3806526-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 05/11] drm/msm/dpu: rework indentation in
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
index 348550ac7e51..87bf4e5cb8e7 100644
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

