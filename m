Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6596C58846C
	for <lists+freedreno@lfdr.de>; Wed,  3 Aug 2022 00:38:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7B7C98798;
	Tue,  2 Aug 2022 22:38:10 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-pl1-x62d.google.com (mail-pl1-x62d.google.com
 [IPv6:2607:f8b0:4864:20::62d])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8163211AF8A
 for <freedreno@lists.freedesktop.org>; Tue,  2 Aug 2022 22:37:50 +0000 (UTC)
Received: by mail-pl1-x62d.google.com with SMTP id x23so6092531pll.7
 for <freedreno@lists.freedesktop.org>; Tue, 02 Aug 2022 15:37:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=chromium.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc;
 bh=2z9VWF3hK7//dTsr3ET+yhlA0EUoj1I28bGbEnp5rNA=;
 b=DzfA8xUlGBHuYnAia4vD5rj+fXD1Re7St+u9/2ucmBIM0lCtoNKupWZ4tPkHKMBsvY
 OADjkVUYHRdAj/Z0rYGKqx2a/NcYmiVqNb3iP08kmZ6tcz4z+lXGd7FTYGPj1742wa0S
 P1/GSUMDp+tt+Is3076zFZB3jnd2itjWeLWYk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc;
 bh=2z9VWF3hK7//dTsr3ET+yhlA0EUoj1I28bGbEnp5rNA=;
 b=JXp+x+ggUioQuzoSamYGAWL3fjv4cFgWZ/DtuijeO9heTyyv4AyqvwwZlmxb/eIYRi
 hzm3EgG7t97fOsUQUMsMzbVRUiC/KOu72cxx/YoZzFEpXeQaIDQOODlKf/LV19VW2baJ
 iY2Kc7eYhzlrQwCtoceQvFyGP2i6x4Hdw0ZEVCwbvV5srsHfIbrGSltrucIJt58CRtk8
 ZGceOwyAOgMOBJIa4Xtw3IbXSHecNdUYjoCgvZoVcVxZp55PfxOITdKjYzv4YZ0qHpG+
 4urtX4OAKmIPp5CVAu2Szep5WLMwzWaK/Sfv/IX7vHyIJZ0Q10KkRgspYRCym5CmjHbM
 IxcQ==
X-Gm-Message-State: ACgBeo2FfHTyvaDFt5yymOlSuaIfbob+o81sfDSPsQgxuEAmTxLEe+rk
 gFodM3+7Z7hjIgtDaknDMV84mw==
X-Google-Smtp-Source: AA6agR7M6AxyAEjgTDhbxQMLH7upd96AsxWNvKLSMCEEt5qLO0zW8YPaTG5Y95obmNomqZGuYa4gbg==
X-Received: by 2002:a17:902:6bc2:b0:16d:d2c2:7ff with SMTP id
 m2-20020a1709026bc200b0016dd2c207ffmr22353739plt.87.1659479869857; 
 Tue, 02 Aug 2022 15:37:49 -0700 (PDT)
Received: from tictac2.mtv.corp.google.com
 ([2620:15c:202:201:31c9:9937:c6bb:62f5])
 by smtp.gmail.com with ESMTPSA id
 x185-20020a6263c2000000b00528c066678csm11353030pfb.72.2022.08.02.15.37.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Aug 2022 15:37:49 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Tue,  2 Aug 2022 15:37:33 -0700
Message-Id: <20220802153434.v3.1.I1056ee3f77f71287f333279efe4c85f88d403f65@changeid>
X-Mailer: git-send-email 2.37.1.455.g008518b4e5-goog
In-Reply-To: <20220802223738.898592-1-dianders@chromium.org>
References: <20220802223738.898592-1-dianders@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 1/6] drm/msm/dsi: Fix number of regulators
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
 Stephen Boyd <swboyd@chromium.org>, Mark Brown <broonie@kernel.org>,
 Daniel Vetter <daniel@ffwll.ch>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

3 regulators are specified listed but the number 2 is specified. Fix
it.

Fixes: 3a3ff88a0fc1 ("drm/msm/dsi: Add 8x96 info in dsi_cfg")
Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

(no changes since v2)

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

