Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 712167B1A53
	for <lists+freedreno@lfdr.de>; Thu, 28 Sep 2023 13:16:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DEB7B10E610;
	Thu, 28 Sep 2023 11:16:40 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com
 [IPv6:2a00:1450:4864:20::133])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6992410E60A
 for <freedreno@lists.freedesktop.org>; Thu, 28 Sep 2023 11:16:39 +0000 (UTC)
Received: by mail-lf1-x133.google.com with SMTP id
 2adb3069b0e04-50308217223so20338336e87.3
 for <freedreno@lists.freedesktop.org>; Thu, 28 Sep 2023 04:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695899797; x=1696504597; darn=lists.freedesktop.org;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=ZUcCOVu6ZaxzHiAf2no1lacr8/uO1deQMwqsfTD0Nwk=;
 b=PpP1Tu/myYDh/HTDqO0vSCtUWv2ieC6xZR7863yBkXmGJShDizJiJ+oaeM8ifB2gTh
 OxOFJdq4CO9jK+5SkR+xY3eXppB0OZriW7xCmv+TLb1UzP6FFFleZM9wf2S9mKyrA/zs
 UyptO1HOlbZy6fBZqQS8cO01tkLClGZueO4Zsp84QrIX2At/r2jWG+QVEXDUjI6MG6MO
 QMfyYuJw6tQzOceGfRs7j3dKY/OxbVbMm0ivMFZ/kbbkn32CYgeHHSgw0aSMXBAhHIdU
 iRr+yTaOo+YF3/c/iLIxAH/BQ2jZ7FwVx3KGucfgZ2GPMvS6qtoXmggJ5bbJG8goRT4l
 4y4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695899797; x=1696504597;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=ZUcCOVu6ZaxzHiAf2no1lacr8/uO1deQMwqsfTD0Nwk=;
 b=QGMkhZfc5OvA3LCAD+FbGSsYzhhYdEr8FmHvGdMyrdfKviAriPyDfLmBrPG9rCF/4w
 tGTuzVitmg25cayppwxBvRM4iu1fO7+rSh9LCRAyisjtp8RrLNuck6rlsJ3tq7w8rltr
 xWUfnonzE039oFDucDsy4p/JFG21Hf8RCJdnQBIWh9wf74SjhKJkQyqUawpzmvTHLIvn
 NE2DOEQaKh/Bxli4yx5YC3GgB+WCsdmsV8kyqEx+8rFqvWbJeSgtxhTb26CVoUc4X0X9
 HJYmJGX7V24M1X2jNQDMFdiwg9h8kblIhknWnBp3Mnhtg4dUu7Y2LzjZ/UzRJEQs0xE1
 bikw==
X-Gm-Message-State: AOJu0YyyvuZtrGiPk4g/jUGL4B6iQKj9mbt1VAXtieCgeugmmN55m+2w
 T02nc8jUaxQpEyBtDp2Ju+XL6Q==
X-Google-Smtp-Source: AGHT+IGayXiNU18owRcbSjsnuEvUZI+a5/Tg0pK7lvyHa0cMWTUPF+pJZOcVu6K1HD5AKpwp7dZ+ww==
X-Received: by 2002:a05:6512:447:b0:503:9a4:26f7 with SMTP id
 y7-20020a056512044700b0050309a426f7mr844038lfk.40.1695899797684; 
 Thu, 28 Sep 2023 04:16:37 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 j18-20020ac253b2000000b004fb738796casm3086623lfh.40.2023.09.28.04.16.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 28 Sep 2023 04:16:37 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Date: Thu, 28 Sep 2023 14:16:22 +0300
Message-Id: <20230928111630.1217419-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
References: <20230928111630.1217419-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v3 08/15] drm/msm/hdmi: move the alt_iface clock
 to the hpd list
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
Cc: freedreno@lists.freedesktop.org, Philipp Zabel <p.zabel@pengutronix.de>,
 linux-arm-msm@vger.kernel.org, Bjorn Andersson <andersson@kernel.org>,
 dri-devel@lists.freedesktop.org, Stephen Boyd <swboyd@chromium.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Daniel Vetter <daniel@ffwll.ch>,
 linux-phy@lists.infradead.org, David Airlie <airlied@gmail.com>
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index b6bcb9f675fe..75644efe23cb 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -250,9 +250,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char *pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char *pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char *pwr_clk_names_8x74[] = {"extp"};
+static const char *hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),
-- 
2.39.2

