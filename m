Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 6AC3A693097
	for <lists+freedreno@lfdr.de>; Sat, 11 Feb 2023 12:52:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 337B110E161;
	Sat, 11 Feb 2023 11:52:05 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x52a.google.com (mail-ed1-x52a.google.com
 [IPv6:2a00:1450:4864:20::52a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3B36E10E175
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 11:52:03 +0000 (UTC)
Received: by mail-ed1-x52a.google.com with SMTP id r3so7257108edq.13
 for <freedreno@lists.freedesktop.org>; Sat, 11 Feb 2023 03:52:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Xu29OnoYbs7XlgjQ7eQ5Uic7usShH1dqxj/7r0Nr9hA=;
 b=Azhb35xQfIkRkppUDbGElCHDXkOGIHdkj1Wv+qJ9Ee16d9Isac9HTm6yCOEXSMRLCI
 xtpA8d+cpYU/ZIYscQwv9uDWxWMpLgT1wl/6JirdYNKfZ/Jz9Tx7N22uGIBi/qZLhsed
 RTNgmdvFI/iWwkiySU9bWbkOtdvmIl/64w3c8qECr+fV/bkKxIoyjqvH6qofhw2pV+/B
 d/ul1NoifWxFv0E7kVA46uZOfWZLjGr8VHGUPlZFSY/h4XAnI7beO+Yw9V/3U5p/AP+q
 cF4JXHsznSlH+gNl632wsRfoqbsJu6QflbMJrhF8itMclgsZYKxRQ1sa1ht4EPSJccRM
 KL+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Xu29OnoYbs7XlgjQ7eQ5Uic7usShH1dqxj/7r0Nr9hA=;
 b=u4xvYYVRAltT1icrfhkszSfWNuoFBX03bhmwa+CS+VCisSah7j+UsgSVffKpO8pErn
 ARCDLqpsPOgZhU+L1ye1q0HNgIAPLk7QxuhkFaFl+M0LK8Po2FtY1HvOqescy8vjqCzP
 EUAgarlUQ4BDHUSx9tkEQ8+ws/9WO0mmdLIN4o8urBA/4mb0UN0uq/ALRmWAbuEVrKJC
 kAVScjEigF/Bte+3Do31WAJb2UkJ6C4xM0wrQdrklFESXkOSZaX1Wx/9yk8jafeDkzJA
 OLh/Z8MzMqTPOtr2SvQu2BULVHBxNGzvjzJRUUkdlKXnZYm5iDzuOV1GtVWApCEbRIhJ
 4Kgg==
X-Gm-Message-State: AO0yUKVSP4kdnN65kX3RO5/zFTeIK54UegTMYrRM1mh7qOvyZVHbBy12
 2MyMvgjHmMdTbYWq09fr2dzLrQ==
X-Google-Smtp-Source: AK7set+zlTzVfecZAmxXHXbYPcxJi6BLvT4chUPZUZHzMJWd+/2Pm9Csni4qi7rylweFb3x30/UkDg==
X-Received: by 2002:a50:9f28:0:b0:4ab:b0d5:6bb0 with SMTP id
 b37-20020a509f28000000b004abb0d56bb0mr4200948edf.18.1676116322880; 
 Sat, 11 Feb 2023 03:52:02 -0800 (PST)
Received: from localhost.localdomain (abxh117.neoplus.adsl.tpnet.pl.
 [83.9.1.117]) by smtp.gmail.com with ESMTPSA id
 r10-20020a50d68a000000b004aabb714230sm3636070edi.35.2023.02.11.03.52.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 11 Feb 2023 03:52:02 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Sat, 11 Feb 2023 12:51:06 +0100
Message-Id: <20230211115110.1462920-7-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
In-Reply-To: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
References: <20230211115110.1462920-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 06/10] drm/msm/dsi: dsi_cfg: Merge SC7180 config
 into SDM845
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
Cc: Neil Armstrong <neil.armstrong@linaro.org>,
 Loic Poulain <loic.poulain@linaro.org>,
 Harigovindan P <harigovi@codeaurora.org>, David Airlie <airlied@gmail.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>, dri-devel@lists.freedesktop.org,
 Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 freedreno@lists.freedesktop.org, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

The configs are identical, other than the number of *maximum* DSI
hosts allowed. This isn't an issue, unless somebody deliberately
tries to access the inexistent host by adding a dt node for it.

Remove the SC7180 struct and point the hw revision match to the
SDM845's one. On a note, this could have been done back when
7180 support was introduced.

Fixes: 6125bd327e16 ("drm/msm: add DSI support for sc7180")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 15 ++-------------
 1 file changed, 2 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 860681bfc084..142a0f1e2576 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -169,7 +169,7 @@ static const struct msm_dsi_config sdm845_dsi_cfg = {
 	.bus_clk_names = dsi_v2_4_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
 	.io_start = {
-		{ 0xae94000, 0xae96000, 0 },
+		{ 0xae94000, 0xae96000, 0 }, /* SDM845 / SDM670 / SC7180 */
 	},
 };
 
@@ -188,17 +188,6 @@ static const struct msm_dsi_config sm8550_dsi_cfg = {
 	},
 };
 
-static const struct msm_dsi_config sc7180_dsi_cfg = {
-	.io_offset = DSI_6G_REG_SHIFT,
-	.regulator_data = dsi_v2_4_regulators,
-	.num_regulators = ARRAY_SIZE(dsi_v2_4_regulators),
-	.bus_clk_names = dsi_v2_4_clk_names,
-	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
-	.io_start = {
-		{ 0xae94000, 0 },
-	},
-};
-
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 };
@@ -299,7 +288,7 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_0,
 		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_4_1,
-		&sc7180_dsi_cfg, &msm_dsi_6g_v2_host_ops},
+		&sdm845_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_5_0,
 		&sc7280_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_6_0,
-- 
2.39.1

