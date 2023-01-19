Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 68E7E6739F2
	for <lists+freedreno@lfdr.de>; Thu, 19 Jan 2023 14:22:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0695710E930;
	Thu, 19 Jan 2023 13:22:29 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x533.google.com (mail-ed1-x533.google.com
 [IPv6:2a00:1450:4864:20::533])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1920E10E92C
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 13:22:26 +0000 (UTC)
Received: by mail-ed1-x533.google.com with SMTP id y11so2738963edd.6
 for <freedreno@lists.freedesktop.org>; Thu, 19 Jan 2023 05:22:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OGxFAGv/07YIfPGHHdquQmb9WeqGOqNYWCXT4na3f/M=;
 b=xCl8vy+D2bQ7n/pQhR0uYMQBILxBJqowxKZPgDmsqtmlitPp3r0hSlGpq1w9A4Eplr
 vpDiQkNL8vkwVgmIc1Zx8+xUDsoU2YzODoWti/y4w/aMkT54KezRF2w4+8OsIJ9TtcEK
 KuSj3dtE2p9lCSDi1PRdWv/lbE1K54SnIq9xwbTe19ffvSySI52z9ikXz2UWPF7uqlJj
 ggVELVDHbjLCPy3hKTZOjdjdaptk9xHNkB0s5ggfYkAVkt6EEqLDfkX3QnogOF8Km5XY
 7daHZWmbPxelPc55txvgENaaaroxIGQINIF2djVvvf4r0+idEa/BH2yLmYRs8UrlrF54
 TjqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=OGxFAGv/07YIfPGHHdquQmb9WeqGOqNYWCXT4na3f/M=;
 b=uBu1whGMLJ8c3WF76q3BHtvAs/PI/5fFcSf0EKcHcAdtaha5VjCt/AwSP0Xgceojzl
 4dyel0YwWT+PG5kyavUenhxaRm0Nn+uD+mCUPKAaKKu+pExYQfsYiTlBKbZ5PAi5wQ7G
 phK5v1stsyE+lpJh+IDgm+QhbLJpMmqbHDS/Inb1KmYRl01ieA8GkK3y5tzV0jqlBjxJ
 JMQbX0tXfe9mLq9dkSW1gRIpmfLQ37nA7fHJesE6T3L/K6wl6ovWoeAhg0zkwSSNUfZu
 OB6BHWwzayLJCZeyNQMAIZxNp0+tyi3PlpoMjGaFYYLFyczZuHyEzYu8l5g0Ay3fF5Wa
 tt/g==
X-Gm-Message-State: AFqh2koTg0M3V4oSH4Zn1l5itI+Ga6GGwDGTwNhUbdjq0g42AMhjZkF2
 pmHkESFC5e6eux7jfP5wyeMY1g==
X-Google-Smtp-Source: AMrXdXtL3wJz4wPrnyZk6uF5UZB8Y8QbSjZzVNuPBDVxYs92vHfDl0bSwv+Tf3lCHKol/KPFBewAeg==
X-Received: by 2002:a05:6402:1f14:b0:49e:36d6:dead with SMTP id
 b20-20020a0564021f1400b0049e36d6deadmr8840448edb.6.1674134544613; 
 Thu, 19 Jan 2023 05:22:24 -0800 (PST)
Received: from eriador.lan (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a085:4d00::8a5]) by smtp.gmail.com with ESMTPSA id
 bt16-20020a0564020a5000b00482e0c55e2bsm15532646edb.93.2023.01.19.05.22.23
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 19 Jan 2023 05:22:24 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Thu, 19 Jan 2023 15:22:16 +0200
Message-Id: <20230119132219.2479775-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
References: <20230119132219.2479775-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 3/6] drm/msm/hdmi: switch hdmi_pll_8960 to use
 parent_data
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
Cc: devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Daniel Vetter <daniel@ffwll.ch>, freedreno@lists.freedesktop.org,
 David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Replace parent_names usage with parent_data. Note, that this makes the
PLL default to board's `pxo_board' clock rather than just `pxo' clock,
as we are on a way to deprecate the global cxo/pxo clocks.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
index be4b0b67e797..c3e7ff45e52a 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c
@@ -406,14 +406,14 @@ static const struct clk_ops hdmi_pll_ops = {
 	.set_rate = hdmi_pll_set_rate,
 };
 
-static const char * const hdmi_pll_parents[] = {
-	"pxo",
+static const struct clk_parent_data hdmi_pll_parents[] = {
+	{ .fw_name = "pxo", .name = "pxo_board" },
 };
 
 static struct clk_init_data pll_init = {
 	.name = "hdmi_pll",
 	.ops = &hdmi_pll_ops,
-	.parent_names = hdmi_pll_parents,
+	.parent_data = hdmi_pll_parents,
 	.num_parents = ARRAY_SIZE(hdmi_pll_parents),
 	.flags = CLK_IGNORE_UNUSED,
 };
-- 
2.39.0

