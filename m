Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 055FC768303
	for <lists+freedreno@lfdr.de>; Sun, 30 Jul 2023 03:01:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 909C410E196;
	Sun, 30 Jul 2023 01:01:11 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x229.google.com (mail-lj1-x229.google.com
 [IPv6:2a00:1450:4864:20::229])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 857B810E12F
 for <freedreno@lists.freedesktop.org>; Sun, 30 Jul 2023 01:01:08 +0000 (UTC)
Received: by mail-lj1-x229.google.com with SMTP id
 38308e7fff4ca-2b9c66e2e36so35828531fa.1
 for <freedreno@lists.freedesktop.org>; Sat, 29 Jul 2023 18:01:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1690678867; x=1691283667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=EZNp47+5mB8X0hcppySWiLzPp8uuJeeDzihUIEzaqAU=;
 b=d0aLnx44WreqBxfzVKUyHNRC/2znwkN7OM8Tji+REbbNyPGLBq/IH4t/qbJsm5oNLG
 Qf1hc7aknH3OfUZyp9RIcBdxOSm79q954WelFeI/roGpJyqZjdBBNcS7IJjuxUIhUcEu
 22EhGmlhhUv9eFcazbD/b5X9itTR6IXAyW2RFMo7DD8NzdVVguWs9ecyqDCIZF7yb75f
 skJjp5JGSy0QmdUCyxH4ABDCyojviAkYQmeqHpV/FKLXOLUVzn+oiqmf1E5UJDBlvFuC
 BCd61/qOYVvyrtePtiQ6e4MrV24FW+YIX4neCrv4Z865kTzKMX+vuWLaAmzh1XPGbnfD
 5BBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1690678867; x=1691283667;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=EZNp47+5mB8X0hcppySWiLzPp8uuJeeDzihUIEzaqAU=;
 b=D6t6RCCPbfJ6gZpsEUTdl3kaEshAvH+WTKZrRhZ7D/URGVL8LeNC+1zSyZIIJi2pFd
 lodLk2j5LY3pexyrmV0ySFCvkIIh+c7UXuRCcaR9KugnGKeAx9FkNtRuLpGvGmRslqvw
 0BSaavVxNNAQCfl9TVgWaOyA45LURMMAHHo+mNKTpyGSLcNREBj0rC18n1i1p7TTQPYE
 oI0QifPEIHjsnvwQsWdbKQVUAWnagfZ0uQBq6zwsDGMFV6JDcIuUVLtsAiicwYKtTNZO
 YUZXdh2gSd8HkNoA7pJcYXUhi0QVkwipJs6xFn1C+3J2p8/xgvrP5ZGxlH4b+BIJgKRM
 dskw==
X-Gm-Message-State: ABy/qLayINRaaPRehf2o+DaUy8A6wBZg+icKTJfbt1IrRo5HvWrbjHFw
 cZ/Edau8qbFwaAnVuTX8aMAhQA==
X-Google-Smtp-Source: APBJJlFqXEBAJVvdNEpnw4uL7J0jdLoGKMd2O45vURHylZnvimMbfKv+vUqEa42Drvky3tUeT5Xm6A==
X-Received: by 2002:a2e:b601:0:b0:2b4:50b8:5d3b with SMTP id
 r1-20020a2eb601000000b002b450b85d3bmr2202311ljn.0.1690678866934; 
 Sat, 29 Jul 2023 18:01:06 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 22-20020a05651c009600b002b9e501a6acsm169898ljq.3.2023.07.29.18.01.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 29 Jul 2023 18:01:06 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>
Date: Sun, 30 Jul 2023 04:00:56 +0300
Message-Id: <20230730010102.350713-5-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
References: <20230730010102.350713-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v5 04/10] drm/msm/dpu: rework indentation in
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
index 34f3d30ab7d6..6ddbedb83e66 100644
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
 
@@ -360,10 +360,8 @@ int dpu_core_perf_crtc_update(struct drm_crtc *crtc,
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

