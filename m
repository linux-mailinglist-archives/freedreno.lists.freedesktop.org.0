Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 358097507C8
	for <lists+freedreno@lfdr.de>; Wed, 12 Jul 2023 14:12:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8712010E51F;
	Wed, 12 Jul 2023 12:12:00 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com
 [IPv6:2a00:1450:4864:20::230])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CA62010E51B
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 12:11:54 +0000 (UTC)
Received: by mail-lj1-x230.google.com with SMTP id
 38308e7fff4ca-2b5c2433134so8939611fa.0
 for <freedreno@lists.freedesktop.org>; Wed, 12 Jul 2023 05:11:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1689163913; x=1691755913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=eBc4Z1Y1zebVUroJaOG/o6ErZXTZ6AcqVlSzVZrpB88=;
 b=nJNmpfEk8S76fbVGigNfGc0BvtLNFJdjd+r3VwE/1hrlLt8ZhhK4lyCxHqPtG8nQof
 u5/cfAMjKOyGcp5pMQbgsLb5kgU6j6rXVB2nN/0pOsqP5PQOODwedY9YX2kJ42er42K6
 Qnv+AImFdjLwwv6UVxuIKB5HlHs3ANZrqASyJnCxEK2pBXIzFdbLAe0wf34kbcxuOig/
 N+XyBSgFv1KwJfvK5Jlb0J1QVAz7qmIpuUQvgtZiKOWvK65pqTvbgrKs+AOXcPHFh2hN
 P93iEal7y+9G4Mche2pDWI3wdVIRu43pKpU3Rthbif5rpyJxZG8IRHVZPx5MChcji4G4
 NfVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20221208; t=1689163913; x=1691755913;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=eBc4Z1Y1zebVUroJaOG/o6ErZXTZ6AcqVlSzVZrpB88=;
 b=N/+EGnJ9gXN4cCrpaPmvG+FK1BufxQqbQC6f99+0LUTBtw2zEdLV5qWPdEndd7Kdz/
 +XET615uMJP/wXDuHz+kawDJrvANL44evlhY3vYY/17qKPpZJmxYB9knh8rPKFHcbeA7
 NKFn3pU1gJtBvq8y0052gvY8DNCh/e4CyRXxNV5qaCTD8k/eiVlYLDLX1gU4zUSsRU6p
 Pm3bEIVvwKVKPubPMeXy8tKIN6kgVOKMfew/sz+by9byVVi5EToESTpLkPohSS9l1ZC6
 CyPVam5ez92gzAeBMEx0emBZfVAOy/lK4r3wV8irRFGp/Y0HSnDFCO0nCsH+eae+zSGL
 s3Ow==
X-Gm-Message-State: ABy/qLa+TqAG+wGw7F1lbO/3X+KWDLrnOsEnzq7/D/WypBSuZbcqpBQp
 5uLKrdkgcRwDg/kD/H8O5/4r8g==
X-Google-Smtp-Source: APBJJlGtEozDIiwGo5Hr5stOPzTjNEVsokSgpKgX9YqK8Yt5hsuXek3dga4YrnOV3hAUl2bg67YYCQ==
X-Received: by 2002:a2e:a608:0:b0:2b6:9f95:8118 with SMTP id
 v8-20020a2ea608000000b002b69f958118mr789748ljp.7.1689163912826; 
 Wed, 12 Jul 2023 05:11:52 -0700 (PDT)
Received: from eriador.lan (dzdqv0yyyyyyyyyyybcwt-3.rev.dnainternet.fi.
 [2001:14ba:a0db:1f00::8a5]) by smtp.gmail.com with ESMTPSA id
 p14-20020a2ea40e000000b002b6c8cf48bfsm913135ljn.104.2023.07.12.05.11.52
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 12 Jul 2023 05:11:52 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@linaro.org>, Rob Clark <robdclark@gmail.com>,
 Sean Paul <sean@poorly.run>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>
Date: Wed, 12 Jul 2023 15:11:45 +0300
Message-Id: <20230712121145.1994830-9-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.40.1
In-Reply-To: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
References: <20230712121145.1994830-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v2 8/8] arm64: dts: qcom: sm8450: provide MDSS
 cfg interconnect
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

Add support for the MDSS cfg-cpu bus vote on the SM8450 platform.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 9 +++++++--
 1 file changed, 7 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index 595533aeafc4..0b01f3027ee3 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -13,6 +13,7 @@
 #include <dt-bindings/mailbox/qcom-ipcc.h>
 #include <dt-bindings/phy/phy-qcom-qmp.h>
 #include <dt-bindings/power/qcom-rpmpd.h>
+#include <dt-bindings/interconnect/qcom,icc.h>
 #include <dt-bindings/interconnect/qcom,sm8450.h>
 #include <dt-bindings/soc/qcom,gpr.h>
 #include <dt-bindings/soc/qcom,rpmh-rsc.h>
@@ -2672,8 +2673,12 @@ mdss: display-subsystem@ae00000 {
 
 			/* same path used twice */
 			interconnects = <&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>,
-					<&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>;
-			interconnect-names = "mdp0-mem", "mdp1-mem";
+					<&mmss_noc MASTER_MDP_DISP 0 &mc_virt SLAVE_EBI1_DISP 0>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ACTIVE_ONLY
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ACTIVE_ONLY>;
+			interconnect-names = "mdp0-mem",
+					     "mdp1-mem",
+					     "cpu-cfg";
 
 			resets = <&dispcc DISP_CC_MDSS_CORE_BCR>;
 
-- 
2.40.1

