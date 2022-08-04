Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 362D2589DB4
	for <lists+freedreno@lfdr.de>; Thu,  4 Aug 2022 16:40:02 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1508C97B23;
	Thu,  4 Aug 2022 14:39:34 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com
 [IPv6:2607:f8b0:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 677DA96231
 for <freedreno@lists.freedesktop.org>; Thu,  4 Aug 2022 14:39:20 +0000 (UTC)
Received: by mail-pl1-x633.google.com with SMTP id iw1so48388plb.6
 for <freedreno@lists.freedesktop.org>; Thu, 04 Aug 2022 07:39:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=PA3kdzp0DUZo8PrDClSQDuXZX1yQ9lusrHWUmYvCDMo=;
 b=BVptfQRoOHu6FZ8rsi1NQavzLV2IA20Fpnh7YJzNgLMxtoBPLuXS6Hp0RpP+DecnB4
 R8fj7DslXRB34nLZ6/cLsyL3amdpi1jAXvEciouLXg5tqIdfjCETM81pz+Wl0heT66Ji
 K+wgZV2S+g9Mcn6/94IJhRCDVx+QFqlc4+m9E=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=PA3kdzp0DUZo8PrDClSQDuXZX1yQ9lusrHWUmYvCDMo=;
 b=f3hRI8T6pBvkFif54LT6l5PqtGCdG3Vuy/dIL6nq/fgg3MuTqtwcNnGgGzTmvmUIc/
 irGCYpHgLRdDkpehQS4jPNGLMSyl5hKZQBGrXni6ncgTh6I7JXrmIjsNG8sBRI2nuYMU
 4wOlemt4YSHsq2St33HqaaZMAJ4ka3cKDZ6vdqwVzQYpvxORlkfBBseSuW8K7qwIv1ES
 10CMx/8/C83t+9gQW8fhD9XHvDJTa/5eiuq0Y0bf9np/5zL2Vey3y5nQRZMdrNTpNznK
 ml4oVk1739joctrnoKf2L1ngFo3ZcrJu08TaREVn5vjcacD7mStPHU6x4v+3zgGntxAf
 EvOw==
X-Gm-Message-State: ACgBeo2NPdPdNXw5Lc4ddT6b2d3sSnNwkK+o76bDdRy4SRZK/JDRnPZK
 KWD/r814yf6EHPUmvah7X6zDoA==
X-Google-Smtp-Source: AA6agR63hMOHGikhLbXTYYdvm4LNQSHi34vIoHbXnpbRhGi/VAt/tgAf4ZFBeu0xQWLLoZj5RldzdA==
X-Received: by 2002:a17:90b:350a:b0:1f5:6a5e:5d12 with SMTP id
 ls10-20020a17090b350a00b001f56a5e5d12mr2899279pjb.46.1659623960338; 
 Thu, 04 Aug 2022 07:39:20 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:aa71:2553:6f54:5cb1])
 by smtp.gmail.com with ESMTPSA id
 h7-20020a170902680700b0016a111c83cdsm1075071plk.119.2022.08.04.07.39.18
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Aug 2022 07:39:19 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Thu,  4 Aug 2022 07:38:48 -0700
Message-Id: <20220804073608.v4.1.I1056ee3f77f71287f333279efe4c85f88d403f65@changeid>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
In-Reply-To: <20220804143854.1544395-1-dianders@chromium.org>
References: <20220804143854.1544395-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v4 1/6] drm/msm/dsi: Fix number of regulators
 for msm8996_dsi_cfg
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
Cc: Sean Paul <sean@poorly.run>, Archit Taneja <architt@codeaurora.org>,
 Loic Poulain <loic.poulain@linaro.org>, David Airlie <airlied@linux.ie>,
 linux-arm-msm@vger.kernel.org, Konrad Dybcio <konrad.dybcio@somainline.org>,
 Douglas Anderson <dianders@chromium.org>, dri-devel@lists.freedesktop.org,
 Bjorn Andersson <bjorn.andersson@linaro.org>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

3 regulators are listed but the number 2 is specified. Fix it.

Fixes: 3a3ff88a0fc1 ("drm/msm/dsi: Add 8x96 info in dsi_cfg")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Reviewed-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
---

Changes in v4:
- Use more gooder English in the commit description.

Changes in v2:
- ("Fix number of regulators for msm8996_dsi_cfg") new for v2.

 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 2c23324a2296..02000a7b7a18 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -109,7 +109,7 @@ static const char * const dsi_8996_bus_clk_names[] = {
 static const struct msm_dsi_config msm8996_dsi_cfg = {
 	.io_offset = DSI_6G_REG_SHIFT,
 	.reg_cfg = {
-		.num = 2,
+		.num = 3,
 		.regs = {
 			{"vdda", 18160, 1 },	/* 1.25 V */
 			{"vcca", 17000, 32 },	/* 0.925 V */
-- 
2.37.1.455.g008518b4e5-goog

