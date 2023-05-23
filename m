Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id BBC9270DC18
	for <lists+freedreno@lfdr.de>; Tue, 23 May 2023 14:15:25 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6FDBA10E438;
	Tue, 23 May 2023 12:15:09 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B364E10E42A
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 12:15:05 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-4f1411e8111so8023295e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 23 May 2023 05:15:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1684844103; x=1687436103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwdtqkDXqK7iZxcIX1bEzs8baolumoX7/30733m/ZW8=;
 b=xovt4aEyTZfHLuBgY7Lj6XlCpNIET84LYBDk+/oVzP755lUBkUTXz+H6yWz2r2Cw2U
 IB+r1bJB7dhEFU49rbl4eAsdZr98efw8Tfpn6MGdjG/QIcKYEViZoQL8G2YfISYdPR1S
 Pwxw+0/cK9OIcRrEA1vKeANcP8A+BaNRoTwJtIB+F5Ez8S26oOYFLFZOJJojsY88BbeM
 GNS5nvvM6ccaALPTO6+4ZuCu7UkWC0G3TDPFiXp6UMGrw/mXkJMa8rxWmKnR2xYYsTv3
 uYQqAGNkgWno9cyaOslg7BQvNJK/cVw83NRJd59NVf7QGygEkyoXuI719WVBPTwyIptU
 Kd8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1684844103; x=1687436103;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lwdtqkDXqK7iZxcIX1bEzs8baolumoX7/30733m/ZW8=;
 b=JACN/bvl/9QiXa2cJK9LfF31cJ9V13cs4k/91THhj+1V/4nuiJR6Kwc8MM+yiet4HK
 muoPiHD4gYIKc9xsrzrerfoHmHPXqo2nZ0InmDn2IWqulmuZj6sM7lJXVRv3uBbEV1DY
 7Rrjd7jaUdVd0Zw5es6T4TsY4IuzxvaZzBqCxRR7PW/6cSQVEXhwf7GYr9LnxaZZIgwJ
 v8lHXsD644rKpuzaXKOTY2CquxMOyxqaL/lPKDPtoHILVAxvvwuudkN2vL1qNRvQEmDh
 Sh18F7U5gkUO2WJxSbhvLTn3FuHpdhJJBzGlS+N1DlPFP3QcyLQt88SR4Xn8L/T4fjOc
 kMUA==
X-Gm-Message-State: AC+VfDzw5qwXsnizzBt6lSMF/UQU6El7GAUjJwQdtIROTlwvuXV/fwHY
 cw+nKwFG1cGExupGJulMKKZhaw==
X-Google-Smtp-Source: ACHHUZ50IH3a8pjiP+UBa8g9txbuBk/wEdojWdQ3Zvz9henvUls4QHCr5OhPT8MEUkJo4Z565Npxlw==
X-Received: by 2002:ac2:46fc:0:b0:4f3:9a2c:589e with SMTP id
 q28-20020ac246fc000000b004f39a2c589emr4109700lfo.24.1684844103714; 
 Tue, 23 May 2023 05:15:03 -0700 (PDT)
Received: from eriador.lan ([192.130.178.91]) by smtp.gmail.com with ESMTPSA id
 c26-20020ac2531a000000b004f160559d4asm1319616lfh.183.2023.05.23.05.15.03
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 May 2023 05:15:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Date: Tue, 23 May 2023 15:14:47 +0300
Message-Id: <20230523121454.3460634-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
References: <20230523121454.3460634-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH 08/15] drm/msm/hdmi: move the alt_iface clock to
 the hpd list
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

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 3132105a2a43..0fc3df43aa70 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -248,9 +248,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
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

