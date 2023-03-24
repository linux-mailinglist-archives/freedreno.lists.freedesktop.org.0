Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 568E86C7B5A
	for <lists+freedreno@lfdr.de>; Fri, 24 Mar 2023 10:29:07 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16E3710EBBA;
	Fri, 24 Mar 2023 09:29:01 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com
 [IPv6:2a00:1450:4864:20::434])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9713510EBA5
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 09:28:54 +0000 (UTC)
Received: by mail-wr1-x434.google.com with SMTP id e18so1043746wra.9
 for <freedreno@lists.freedesktop.org>; Fri, 24 Mar 2023 02:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1679650133;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=la//61tmt1JcHM3ugdeN6VnhDtVEZYhOaulQ5DfrvTk=;
 b=Sb6+xZo54omB6soda+f0C+zM3HVRC8Sy5SrF+pvYfdroivYt2p7mjmIHNxxCgRzulF
 /fQJnFwQcN12UMOg5qlrvttaKkj46Yh9ef3CUAGxOCVX/Yaw/l2+zgsicrSyfQMh08bB
 sL/WHdUdE+H2MC/fZmN09TE1F+LmZLAxxqr5tSzbdWhhvYQ5Q4G9LN8VYC9muharWc8d
 hcnbOlmvycwCT+hvr1TVyPrqb8/v3xn7K2RVAodsg4a9wdoN9gZ4MWQUFsVC+0c9pWc5
 PgkL/lJ+zYylW9lXrvLikPItQZnPnv9dpPMBN+TIp5A6c0n2KmPnpothgOm4yVd60xSh
 fkgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112; t=1679650133;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=la//61tmt1JcHM3ugdeN6VnhDtVEZYhOaulQ5DfrvTk=;
 b=rbV1apR3dUzzsIuRQ2te9oKCd8H19T4Bv67RpSLvJsvsgQ/8Ho5fssRWfVoDtRqorB
 SN/6FPH7+Kq2gGQp9HFAiEHcxH3Cj7PvYWC/Ykxx1cA7gHUjUCEHzZ9e8tiwcYYbpUuS
 TyMNcRo6r0A15IqJTT/QJYerW11SyhXTYQgVoMOQj/Z4YgCiIRtVs8+m6OD0v4po4ps+
 ab1meqsKE4FgEy/22qdmLGAOrsF8PmXgix+xGy5w174nhIQARQnH80IieUJDAb9YGs3e
 vH0fk3jfsuUvNFCNw13cPWTEJ6OulvVtfL8Qyr9WYtEew+pbT52eipZEAs2ILrXtCeeU
 H1EQ==
X-Gm-Message-State: AAQBX9f35HcdEWXFJXXH5fgszZG2UXKiP/qd+hRssIPIhzX3iSg38pv0
 a8Ji9u5oFs9azvWuHDTlFXA3yA==
X-Google-Smtp-Source: AKy350YgMPjfXwGTXE1iW69hMKX4XP6SaWX/WffDq3iU5AqJk/AmwqDuqeQazzIsxTnXts4iWN82Mw==
X-Received: by 2002:a5d:51cc:0:b0:2d2:5396:ad98 with SMTP id
 n12-20020a5d51cc000000b002d25396ad98mr1400212wrv.21.1679650132831; 
 Fri, 24 Mar 2023 02:28:52 -0700 (PDT)
Received: from arrakeen.starnux.net ([2a01:e0a:982:cbb0:52eb:f6ff:feb3:451a])
 by smtp.gmail.com with ESMTPSA id
 v14-20020adfe28e000000b002c5a790e959sm18029980wri.19.2023.03.24.02.28.51
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 24 Mar 2023 02:28:52 -0700 (PDT)
From: Neil Armstrong <neil.armstrong@linaro.org>
Date: Fri, 24 Mar 2023 10:28:48 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-3-0ca1bea1a843@linaro.org>
References: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
In-Reply-To: <20230323-topic-sm8450-upstream-dt-bindings-fixes-v2-0-0ca1bea1a843@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>
X-Mailer: b4 0.12.1
Subject: [Freedreno] [PATCH v2 3/4] arm64: dts: qcom: sm8450: remove invalid
 power-domain-names in pcie nodes
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
Cc: devicetree@vger.kernel.org, Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Fixes the following DT bindings check error:
pci@1c00000: Unevaluated properties are not allowed ('power-domain-names' were unexpected)

Signed-off-by: Neil Armstrong <neil.armstrong@linaro.org>
---
 arch/arm64/boot/dts/qcom/sm8450.dtsi | 2 --
 1 file changed, 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sm8450.dtsi b/arch/arm64/boot/dts/qcom/sm8450.dtsi
index ff55fcfdd676..bcb51e612261 100644
--- a/arch/arm64/boot/dts/qcom/sm8450.dtsi
+++ b/arch/arm64/boot/dts/qcom/sm8450.dtsi
@@ -1792,7 +1792,6 @@ pcie0: pci@1c00000 {
 			reset-names = "pci";
 
 			power-domains = <&gcc PCIE_0_GDSC>;
-			power-domain-names = "gdsc";
 
 			phys = <&pcie0_lane>;
 			phy-names = "pciephy";
@@ -1905,7 +1904,6 @@ pcie1: pci@1c08000 {
 			reset-names = "pci";
 
 			power-domains = <&gcc PCIE_1_GDSC>;
-			power-domain-names = "gdsc";
 
 			phys = <&pcie1_lane>;
 			phy-names = "pciephy";

-- 
2.34.1

