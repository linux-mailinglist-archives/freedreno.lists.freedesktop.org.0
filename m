Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 14BA77AF2AA
	for <lists+freedreno@lfdr.de>; Tue, 26 Sep 2023 20:25:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8ADFE10E421;
	Tue, 26 Sep 2023 18:24:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12f.google.com (mail-lf1-x12f.google.com
 [IPv6:2a00:1450:4864:20::12f])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9D0AE10E41E
 for <freedreno@lists.freedesktop.org>; Tue, 26 Sep 2023 18:24:52 +0000 (UTC)
Received: by mail-lf1-x12f.google.com with SMTP id
 2adb3069b0e04-50437c618b4so12900491e87.2
 for <freedreno@lists.freedesktop.org>; Tue, 26 Sep 2023 11:24:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695752691; x=1696357491; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=JSsmJJyHe36J6r6QQN8EBPervMH/lsHyGZmLHEQGT3w=;
 b=pEyzPCvRAPqliQtW6Ad3uTVqRSK9xNDSECAqhfqN4NMOlXSN9qLLBML/x8YC4MH9uB
 bUMHF+EoLKP4MKiTqAu+lNU623VeBYKN4OtU6vfIAHYcTevZganB0W8T0tCUFmPb5r98
 NwcUlkt94HQziRIjCjcR2ALIX9StgXDN3o/W8l4iCsnKXOh1lkgGE0Q1VA5IQXCTvE05
 5VA6Uupolseda5LCXU0o1pQ/6o41KvOBzgdn00Wcf8MTkNq3i8mywSw0qzGVkvfgXpNc
 uX8bW4Nn3+OGW3AFk6nee1n1vIwGotSd/q3IsoQvx0XhrF19Zdi7YBTJKf06HTd/z1oi
 X7+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695752691; x=1696357491;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=JSsmJJyHe36J6r6QQN8EBPervMH/lsHyGZmLHEQGT3w=;
 b=IzKt9l1CH5S9p6nG262hO4hYhN76FKMcWG2E4ORmCNhT1I/0J6glU7ybdsTY9FGacb
 BID6W/KzTQ6qwimWSaiD384N3NM6jpGsJfUGZL8d+0Gb5lS93UEXo5z2Gg7VguF80QJA
 SFafqX+l0vLoJ0P0f7db/k8HGHjuOGbncNVwAKDTISi2kVrZxsFNPtXXwFLZPOxBVlHp
 x+4ADCQkS/XOrlTsRHtDOGSK68EGs66GNWudJoZ98AoAQBT4vBj53fCMnkKvzNEHu+/K
 rYXgobL0o1HyU4skiH6klUshkwCELNdLyhl4HDy2fGLvf3cpcgp5vn9AVkbrC6lt0Bu8
 Y2Tw==
X-Gm-Message-State: AOJu0YwgS6maWvulgC/Rr5VJQos9v91Kg3v5H97oi3AiopeZ31anu+gW
 FTKB7cthFLK9WfhEXTT/MLqYmw==
X-Google-Smtp-Source: AGHT+IFxdFFgpcBTFxSLcZfqdtgfPTF/TNGZldeq7ysgqWnx8RGOLQ5gHMDX+UzFDSjdg3j002TJ9A==
X-Received: by 2002:ac2:53ac:0:b0:503:2877:67e3 with SMTP id
 j12-20020ac253ac000000b00503287767e3mr8396426lfh.6.1695752690659; 
 Tue, 26 Sep 2023 11:24:50 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056402151300b0053090e2afafsm7020643edw.22.2023.09.26.11.24.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 11:24:50 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 26 Sep 2023 20:24:40 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v1-5-7af6937ac0a3@linaro.org>
References: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
In-Reply-To: <20230926-topic-a643-v1-0-7af6937ac0a3@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 cros-qcom-dts-watchers@chromium.org, Andy Gross <agross@kernel.org>, 
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <swboyd@chromium.org>, 
 Akhil P Oommen <quic_akhilpo@quicinc.com>
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695752677; l=1149;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=OKCYVjhQ/19k9GeBxxh+l0sjJaWU5GkjdhxKB9u2/vs=;
 b=9SVEap5bj9/9iIFUrp99rqRpCkF1yJSJnavWYyJzILyjurm26Pij46Bw+/KnOwd6frqVCvagj
 hxwquK7i3gkByj7w1dl5dnEr24gj8ym5NJr5mweF32LNem2LLWjiRad
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 5/7] arm64: dts: qcom: sc7280: Fix up GPU SIDs
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
Cc: Rob Clark <robdclark@chromium.org>, devicetree@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, Luca Weiss <luca.weiss@fairphone.com>,
 Konrad Dybcio <konrad.dybcio@linaro.org>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

GPU_SMMU SID 1 is meant for Adreno LPAC (Low Priority Async Compute).
On platforms that support it (in firmware), it is necessary to
describe that link, or Adreno register access will hang the board.

Add that and fix up the SMR mask of SID 0, which seems to have been
copypasted from another SoC.

Fixes: 96c471970b7b ("arm64: dts: qcom: sc7280: Add gpu support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index c38ddf267ef5..0d96d1454c49 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2603,7 +2603,8 @@ gpu: gpu@3d00000 {
 				    "cx_mem",
 				    "cx_dbgc";
 			interrupts = <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>;
-			iommus = <&adreno_smmu 0 0x401>;
+			iommus = <&adreno_smmu 0 0x400>,
+				 <&adreno_smmu 1 0x400>;
 			operating-points-v2 = <&gpu_opp_table>;
 			qcom,gmu = <&gmu>;
 			interconnects = <&gem_noc MASTER_GFX3D 0 &mc_virt SLAVE_EBI1 0>;

-- 
2.42.0

