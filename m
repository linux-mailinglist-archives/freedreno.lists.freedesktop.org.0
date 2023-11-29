Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id D53F17FD9FE
	for <lists+freedreno@lfdr.de>; Wed, 29 Nov 2023 15:44:32 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A84C610E600;
	Wed, 29 Nov 2023 14:44:31 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com
 [IPv6:2a00:1450:4864:20::62c])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CFB2E10E601
 for <freedreno@lists.freedesktop.org>; Wed, 29 Nov 2023 14:44:29 +0000 (UTC)
Received: by mail-ej1-x62c.google.com with SMTP id
 a640c23a62f3a-a178e82a445so80288566b.2
 for <freedreno@lists.freedesktop.org>; Wed, 29 Nov 2023 06:44:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1701269068; x=1701873868; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=3WME6ubitd3vxaAOMdHVezdwhed8qbighnDEBO169Ec=;
 b=BgToPNetsx8KF1G9GYHezR+jtgDPRPaZA3is+tg9Z15T/rHSwQuL6iV8LEYwkk7cxG
 /6wUD27LlE7hdwHd2uxhvPhQ2ddxM9DSot2mk5IMI1vamaEeiAoU6WWULilNKmglJSPz
 HrV4jBmTuwe6gI6bypU8ALjUExEusoTmoz7rzHdLjNTH/3vh0Xl0wowVPydYInbtiH/e
 bRcSW1Mugn93O92SqmgAAIZL6cdaJy7+kaTlAGSILNcYI0aypQUEw/Jp0AozNMNBNHTG
 2QwBGs1SO+SCUG+2GPtwQDDyeTNFkflKyg0JnBKA6ebKNsC3xIQBXx7rUsmoc6Fl5phd
 tE2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1701269068; x=1701873868;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=3WME6ubitd3vxaAOMdHVezdwhed8qbighnDEBO169Ec=;
 b=Lq6yEjLQwGJVTfglcNk5LVhmVAyxYuR2pHjmDhhW/epn5rmror/Sa7My0f8RQV/nQJ
 ydnNhlUzEpf+A1dSzRVQw5BFbA7idQmz31r9sgVBT+ggbpT1RtwQQn86HKbOOKnFchAn
 sRvpBN0M6xoL1Tc3qMUK5R7c+9ma3Yi54F5RIlb8Nq5eXJU6GejnSJbVklC9AmYpwg8J
 nGWwvKeRoLOiZ8VMxj8EoaQkFTLlMHRi9rR2i5awZGr52jSvllOwudPZkVAGcLK3nv7U
 lOgfcKSMAVrXYVHf2MDI81BRG6orbA0pVYTOg1cO3k181Zo4a9bGIsCumJmRJuGmdsL6
 43NA==
X-Gm-Message-State: AOJu0Yw2F8w47rPQeFeJ2CwNQAtO72/XOBIdhiwA6kNkt1Q0/qea0apT
 9TA4UZLwQGh8vuZNo4hQnBsn7Q==
X-Google-Smtp-Source: AGHT+IH+RwsuXNKo7mRRSs5QfH4RQDMAsxgT6mJOUDi04ruodSJZaS3PyYqxW9aAR+nUNX0ZJcUxXA==
X-Received: by 2002:a17:906:fcce:b0:9f8:2b44:7b7f with SMTP id
 qx14-20020a170906fcce00b009f82b447b7fmr13038742ejb.70.1701269068288; 
 Wed, 29 Nov 2023 06:44:28 -0800 (PST)
Received: from [10.167.154.1]
 (178235187166.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.166])
 by smtp.gmail.com with ESMTPSA id
 e27-20020a1709062c1b00b009fda627abd9sm7913738ejh.79.2023.11.29.06.44.24
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 29 Nov 2023 06:44:27 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Wed, 29 Nov 2023 15:44:03 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20231125-topic-rb1_feat-v3-6-4cbb567743bb@linaro.org>
References: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
In-Reply-To: <20231125-topic-rb1_feat-v3-0-4cbb567743bb@linaro.org>
To: Rob Clark <robdclark@gmail.com>, 
 Abhinav Kumar <quic_abhinavk@quicinc.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Sean Paul <sean@poorly.run>, 
 David Airlie <airlied@gmail.com>, Daniel Vetter <daniel@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Rob Herring <robh+dt@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, 
 Conor Dooley <conor+dt@kernel.org>, Loic Poulain <loic.poulain@linaro.org>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Andy Gross <agross@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>, 
 Georgi Djakov <djakov@kernel.org>, Will Deacon <will@kernel.org>, 
 Robin Murphy <robin.murphy@arm.com>, Joerg Roedel <joro@8bytes.org>, 
 Krishna Manikandan <quic_mkrishn@quicinc.com>, 
 Robert Marko <robimarko@gmail.com>, Das Srinagesh <quic_gurus@quicinc.com>, 
 cros-qcom-dts-watchers@chromium.org
X-Mailer: b4 0.12.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1701269042; l=1145;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=QxbVxThi6gj4JqQP8V9LpJsjR/myuVOnIJbwHX7amYU=;
 b=sYPUfm+T2CO9HyMoVEn+/8/AzljQnlW0jC9XeZnrz01woxrBDGuDswi+m+bEgPSkuiCtZLp8N
 BR3hZTS03LmDYMTViL/cCS/WJooBooB/al2zibrNvM1dONg09omgSvQ
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v3 06/12] arm64: dts: qcom: sc7180: Add the
 missing MDSS icc path
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
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 linux-arm-msm@vger.kernel.org, linux-pm@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 Konrad Dybcio <konrad.dybcio@linaro.org>, iommu@lists.linux.dev,
 Marijn Suijten <marijn.suijten@somainline.org>,
 freedreno@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

MDSS, aside from the MDP-MEM path, also requires the CPU-DISP_CFG one.
Failing to provide it may result in register accesses failing and that's
never good.

Add the missing path.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7180.dtsi | 8 ++++++--
 1 file changed, 6 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7180.dtsi b/arch/arm64/boot/dts/qcom/sc7180.dtsi
index 11f353d416b4..9664e42faeb1 100644
--- a/arch/arm64/boot/dts/qcom/sc7180.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7180.dtsi
@@ -3100,8 +3100,12 @@ mdss: display-subsystem@ae00000 {
 			interrupt-controller;
 			#interrupt-cells = <1>;
 
-			interconnects = <&mmss_noc MASTER_MDP0 0 &mc_virt SLAVE_EBI1 0>;
-			interconnect-names = "mdp0-mem";
+			interconnects = <&mmss_noc MASTER_MDP0 QCOM_ICC_TAG_ALWAYS
+					 &mc_virt SLAVE_EBI1 QCOM_ICC_TAG_ALWAYS>,
+					<&gem_noc MASTER_APPSS_PROC QCOM_ICC_TAG_ALWAYS
+					 &config_noc SLAVE_DISPLAY_CFG QCOM_ICC_TAG_ALWAYS>;
+			interconnect-names = "mdp0-mem",
+					     "cpu-cfg";
 
 			iommus = <&apps_smmu 0x800 0x2>;
 

-- 
2.43.0

