Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id A28C3628694
	for <lists+freedreno@lfdr.de>; Mon, 14 Nov 2022 18:06:52 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF77A10E2FB;
	Mon, 14 Nov 2022 17:06:46 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com
 [IPv6:2a00:1450:4864:20::12a])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A73A810E210
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 17:06:40 +0000 (UTC)
Received: by mail-lf1-x12a.google.com with SMTP id j16so20278232lfe.12
 for <freedreno@lists.freedesktop.org>; Mon, 14 Nov 2022 09:06:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linaro.org; s=google;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=M86vyazE9Kflr9n552n2x/ESkf8Js4Xoz0IPa0raNpo=;
 b=fgqOwllverskI61dHhNZtF3+xSvrcivld3PuPj3bkEYBDO3Jbv50ZHOMblFGOSBHSm
 +si76klJ+5ctBfWH6fCJMz6WhtAxw1dN3FbKN6oJk1im2Y0ChpqDXHXVHxpA26178iyl
 tbEU4VsLcvALLKY3egWPEjOdPCzmNdguj9NoUVfouoPfXq2xlma9mDlczpQUU+RQnOhg
 XT8LW+vpBmGYDs/LlJF/jNuOGepJuH4ZFIKmb3f6JSVC6SUda4VpfJ3r6uhoI8MAD4Lb
 37uyOyiyOLzhm/yU8KDnoJEVpCL8qGSNNLyB/dW038cuSZ9hwNg1xc7sxJFDOez3l/Fv
 f0yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20210112;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=M86vyazE9Kflr9n552n2x/ESkf8Js4Xoz0IPa0raNpo=;
 b=nVKw3aHeXNKjNCIaEhl0vZ0KKsLrK0UX4pnVEQSJ8s1tBBCdUSE2blEbnLOEEvYLVP
 Mq36VBBR1Aq/nm1q/cMTbcCDB8/RnZhF4zVSksI5jYxhwJG8O8xOj/6/dhdoYWuDx0Uq
 FxukQVlfvarX3cUxaDSIqdPY9wZv1m6OEuUXj9eW9GUOPIqfia3zHWny+fjXBu6Uruw2
 CkSjOurtdxiYwtEBi/Hm3lCbL78JJTT0Kba9B1Z9YOD4P3iX9Rx+oUpa5l+5eUTzFIBT
 HLrx64ho22i5GYicmTEIz25iRZaLllbiVTxQqOF/xgOR5bMWLlPEy3QYPDGdFKOJYzdJ
 zwVg==
X-Gm-Message-State: ANoB5plxygg08VdYrvcmJoZSptrlmP6fdIlLi2n0CPgUXcc+6A6fT47T
 I1XkdtupBMU3kGd0hSENpnYDNg==
X-Google-Smtp-Source: AA0mqf54HDkotHA1FucjW2uec3Ub8+MjnMSJp6XZF6+mS6lVAK+bcof5fa6YOgzHa27BsQPhfyrL8g==
X-Received: by 2002:a05:6512:32c1:b0:49a:75ee:d5c8 with SMTP id
 f1-20020a05651232c100b0049a75eed5c8mr5089951lfg.152.1668445598742; 
 Mon, 14 Nov 2022 09:06:38 -0800 (PST)
Received: from eriador.lan ([37.153.55.125]) by smtp.gmail.com with ESMTPSA id
 q7-20020a056512210700b004a2ae643b99sm1896344lfr.170.2022.11.14.09.06.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Nov 2022 09:06:38 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To: Will Deacon <will@kernel.org>, Robin Murphy <robin.murphy@arm.com>,
 Joerg Roedel <joro@8bytes.org>, Rob Herring <robh+dt@kernel.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konrad.dybcio@somainline.org>,
 Rob Clark <robdclark@gmail.com>
Date: Mon, 14 Nov 2022 20:06:28 +0300
Message-Id: <20221114170635.1406534-4-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
In-Reply-To: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
References: <20221114170635.1406534-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [Freedreno] [PATCH v1 03/10] dt-bindings: arm-smmu: add special
 case for Google Cheza platform
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
Cc: devicetree@vger.kernel.org, Sai Prakash Ranjan <quic_saipraka@quicinc.com>,
 linux-arm-msm@vger.kernel.org, iommu@lists.linux.dev,
 Vinod Koul <vkoul@kernel.org>, freedreno@lists.freedesktop.org,
 linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

Cheza fw does not properly program the GPU aperture to allow the
GPU to update the SMMU pagetables for context switches. The board file
works around this by dropping the "qcom,adreno-smmu" compat string.
Add this usecase to arm,smmu.yaml schema.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 Documentation/devicetree/bindings/iommu/arm,smmu.yaml | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
index 99f34a40cfe2..29a8b3ff8fa0 100644
--- a/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
+++ b/Documentation/devicetree/bindings/iommu/arm,smmu.yaml
@@ -69,6 +69,10 @@ properties:
               - qcom,sdm845-smmu-v2
           - const: qcom,adreno-smmu
           - const: qcom,smmu-v2
+      - description: Qcom Adreno GPUs on Google Cheza platform
+        items:
+          - const: qcom,sdm845-smmu-v2
+          - const: qcom,smmu-v2
       - description: Marvell SoCs implementing "arm,mmu-500"
         items:
           - const: marvell,ap806-smmu-500
-- 
2.35.1

