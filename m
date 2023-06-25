Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A300F73D08E
	for <lists+freedreno@lfdr.de>; Sun, 25 Jun 2023 13:43:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 171F110E17E;
	Sun, 25 Jun 2023 11:42:37 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x130.google.com (mail-lf1-x130.google.com
 [IPv6:2a00:1450:4864:20::130])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 2307810E163
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jun 2023 11:42:32 +0000 (UTC)
Received: by mail-lf1-x130.google.com with SMTP id
 2adb3069b0e04-4f8735ac3e3so3006839e87.2
 for <freedreno@lists.freedesktop.org>; Sun, 25 Jun 2023 04:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1687693350; x=1690285350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=lwdtqkDXqK7iZxcIX1bEzs8baolumoX7/30733m/ZW8=;
 b=csRNaQVYcN5FlY1KPPmbQ3DhS2yDIluczA9prBJjlEis0hj9zyLOJ92+3vWSG3wDPH
 aJXwYnwBhB7nfZ4ZU/BkYzjQow5FL+ttw7WQzRVTWRsWovgYQMYPWJNsEFH1shm9DxEM
 MRw6m6BbZlxeDAAkVWzXRx1B7TtkNNicfCrLeAjQFowxLo1TM0o/L6IUFsH668ogcEcf
 aaKuM1FSW1r5X+W9WZNu7KY0FB/zb4yo/pEvgO00Rvrt/C0Ne7l4AjlelDBp7hA97/c7
 1/LSkEId65dBAiGKPtDbLGQZ3rVH/fWZDpYriqPbjBCZNoKJ1rwoB+GNFbMT4msiXzFo
 x9xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1687693350; x=1690285350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=lwdtqkDXqK7iZxcIX1bEzs8baolumoX7/30733m/ZW8=;
 b=ZSqn/imNSLxagv30Ng+RPjDrg1wzr00T0YAYTr2F/RSipPcAlA77Nng3yos0ZponJ8
 8AMcvLtOQSH+kjX8BSPdLCTek7DPQxNYAETkNNDUVN3G2bACO1c8UHOEHtJHfs1hAFNY
 3BGKixMaLzsOXQfEsVffAP1IoyJL4F+Ia7aXr0I6mlELOkqiLf/myDhRKfAhab+nBY5C
 CLiX3eQ+yisTe8YUIBi4PxzfmmJM+Oc8mK8JzCR2PBHl2qyLdpUGwT0QMm2SBMYNadbn
 5dXMIBYREvWEEzpcONFF9X4eL0q6oWW2sHikYCn1J/Kid75+u680Fk2EnKlzKI1q8WFD
 BUKw==
X-Gm-Message-State: AC+VfDxcntVvvoPYcmBMEv0Bxw2xIynaE45/IV4kAxQoqLfDqfLi16Hu
 /SzLb2Ul8lGd3zPktjnJD7Gv4Q==
X-Google-Smtp-Source: ACHHUZ6JBYjRhM3xUtGku0UohCxWUXppP0M1khuC54BjHXVyboGxygUTxDaw7zl/dBjjx5nQpMp90Q==
X-Received: by 2002:a19:e348:0:b0:4f8:48f3:f06 with SMTP id
 c8-20020a19e348000000b004f848f30f06mr14544063lfk.48.1687693350508; 
 Sun, 25 Jun 2023 04:42:30 -0700 (PDT)
Received: from umbar.unikie.fi ([192.130.178.91])
 by smtp.gmail.com with ESMTPSA id
 b23-20020ac25637000000b004f87893ce21sm637323lff.3.2023.06.25.04.42.29
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 25 Jun 2023 04:42:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Rob Clark <robdclark@gmail.com>, Sean Paul <sean@poorly.run>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Date: Sun, 25 Jun 2023 14:42:15 +0300
Message-Id: <20230625114222.96689-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.39.2
In-Reply-To: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
References: <20230625114222.96689-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 08/15] drm/msm/hdmi: move the alt_iface clock
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

