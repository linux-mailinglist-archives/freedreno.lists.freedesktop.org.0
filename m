Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D47A2675F3A
	for <lists+freedreno@lfdr.de>; Fri, 20 Jan 2023 22:01:16 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9941610E3A8;
	Fri, 20 Jan 2023 21:01:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x633.google.com (mail-ej1-x633.google.com
 [IPv6:2a00:1450:4864:20::633])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 57B0E10E3A5
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 21:01:14 +0000 (UTC)
Received: by mail-ej1-x633.google.com with SMTP id mp20so16955828ejc.7
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jan 2023 13:01:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=9zrT9/RXPPXhnEVoW0aJsCVkHusFjlZ161d+oX04STE=;
 b=VhpZPNA/QWJFVRprlhHEdvq+/+4H7v3FVGVD04GyVD/EUEJFdD8RyMe84kgUEPUhWd
 CSPM+LH1fCURhYgTQa64yUSi3WnWL6zjKgNrnJwZnLqsAmscVxGSMUxPpNSJBAWPLAR6
 lUsuDtnasVrrYyhkGq9VB/ZHvxzTw2o3nc/q6OBvDQRT+WN28CE+7zlbdJTO/DrtdM9P
 kAx4wx9IGN1sWaBT2h3CHNexWt7VBNhIZ3a/7+uxHYWSNjz8Z+AJSA1c4l4/oVMG9q+R
 ZHPNZRWukpuWZCcns72TNlvqN2y/UGD3CjG94LU1GCQloe+M1+8iPwj7GTWVCD3mPjBg
 2frA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=9zrT9/RXPPXhnEVoW0aJsCVkHusFjlZ161d+oX04STE=;
 b=vUdioxi81ydwQuSmitbMIcZGYMk2kAlZzliShKh/a3w9KbuliAOXKeGSKJE7k3UbQG
 JxFpXqr1/hxDD9ZYMILdUYtuWtyp5vUtYLMp0hOKb0L8wraixEPd1HQoNFApe0l+vjmZ
 i9CKyOqcD0u7mPaK3lEPuri52D6vc5h05wxpious2i2VGuvyQUef40uZt7jHu/Z7CAb4
 B/dZFiFPA4rrBDn017dH7udG1CqDIW33gO1rMZHbsXl8i2B9SjBz8mGC+j5VRVD3ByEy
 qY3q7jkvTSdzPnvu4pKXiTrmpZ8bV2kkH4UjF1Jn5lNhEDzOFVZpY0MTRfyxDMGVFaPh
 vbtA==
X-Gm-Message-State: AFqh2ko5OS1HfFHO17QOgsE4VowpL+NKw0LfPEFoElMZUFvN2HmWZFma
 qIGF+01k7B/W+LsMdywmpboXmA==
X-Google-Smtp-Source: AMrXdXuKJBPk9bfYe2DX44R2Ihfk454JoHlIi3euiHm+P/rLKqXOFKfrzF2JNOubZZ/RoJp5TRlvPg==
X-Received: by 2002:a17:906:3741:b0:861:eb6e:8019 with SMTP id
 e1-20020a170906374100b00861eb6e8019mr14749113ejc.69.1674248472796; 
 Fri, 20 Jan 2023 13:01:12 -0800 (PST)
Received: from localhost.localdomain (abyk37.neoplus.adsl.tpnet.pl.
 [83.9.30.37]) by smtp.gmail.com with ESMTPSA id
 g22-20020a170906595600b0087221268e49sm6581229ejr.186.2023.01.20.13.01.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jan 2023 13:01:12 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
To: linux-arm-msm@vger.kernel.org, andersson@kernel.org, agross@kernel.org,
 krzysztof.kozlowski@linaro.org
Date: Fri, 20 Jan 2023 22:00:53 +0100
Message-Id: <20230120210101.2146852-1-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 1/8] drm/msm/dsi: Allow 2 CTRLs on v2.5.0
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
 Loic Poulain <loic.poulain@linaro.org>, David Airlie <airlied@gmail.com>,
 freedreno@lists.freedesktop.org, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 dri-devel@lists.freedesktop.org, Douglas Anderson <dianders@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Daniel Vetter <daniel@ffwll.ch>, Rajeev Nandan <quic_rajeevny@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, marijn.suijten@somainline.org,
 Stephen Boyd <swboyd@chromium.org>, Sean Paul <sean@poorly.run>,
 linux-kernel@vger.kernel.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

v2.5.0 support was originally added for SC7280, but this hw is also
present on SM8350, which has one more DSI host. Bump up the dsi count
and fill in the register of the secondary host to allow it to probe.

This should not have any adverse effects on SC7280, as the secondary
CTRL will only be touched if it's defined, anyway.

Fixes: 65c391b31994 ("drm/msm/dsi: Add DSI support for SC7280")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index 33884ebd2f86..6d21f0b33411 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -223,8 +223,8 @@ static const struct msm_dsi_config sc7280_dsi_cfg = {
 	.num_regulators = ARRAY_SIZE(sc7280_dsi_regulators),
 	.bus_clk_names = dsi_sc7280_bus_clk_names,
 	.num_bus_clks = ARRAY_SIZE(dsi_sc7280_bus_clk_names),
-	.io_start = { 0xae94000 },
-	.num_dsi = 1,
+	.io_start = { 0xae94000, 0xae96000 },
+	.num_dsi = 2,
 };
 
 static const char * const dsi_qcm2290_bus_clk_names[] = {
-- 
2.39.1

