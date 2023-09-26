Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2A82E7AF2A7
	for <lists+freedreno@lfdr.de>; Tue, 26 Sep 2023 20:24:58 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3C58710E048;
	Tue, 26 Sep 2023 18:24:54 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-lf1-x12e.google.com (mail-lf1-x12e.google.com
 [IPv6:2a00:1450:4864:20::12e])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8346910E41D
 for <freedreno@lists.freedesktop.org>; Tue, 26 Sep 2023 18:24:50 +0000 (UTC)
Received: by mail-lf1-x12e.google.com with SMTP id
 2adb3069b0e04-5044dd5b561so10005531e87.1
 for <freedreno@lists.freedesktop.org>; Tue, 26 Sep 2023 11:24:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1695752688; x=1696357488; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=Hv259dlxpBQTllwsNOUgVjMH2doZt+8ko67T2DfMJJY=;
 b=Un/IR7gR7QUM5/uxdNENhXJZwI6UWqiWohue2+F13MQIN95hDuXc2ndQz2vA8SYJlW
 NFTRIdvn0iPrRYHiocWkkZgADIGqNC+VACzcqufyfpmJrdnDOCDozrinNiENywVeZ5P1
 PLfjIPhybBuM4yA5PAoBIdBidqkqLEu/Gm+DTqrvkiFHzZyPik8VPUgBZkqCDk5zIcyA
 IYE7Q8kYT8L8HnwvZwSiEnUt49p30RWs8R/SqgFbLOIsf2AzAVa4u8UdXEDnl9oQA+1K
 Ijp9NbS0mN6xTl3iaAfxER+wZwGPwVjZrXOFTdh6tft4V5uX/f8RZ66Xf2WuwGdICe6D
 FxLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1695752688; x=1696357488;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=Hv259dlxpBQTllwsNOUgVjMH2doZt+8ko67T2DfMJJY=;
 b=hbsDNOxmxTeCnUkQZ/5jvspAHcq6Kn7LrDzdB3l+OIF9Z7jYB1hMQAi3Ky4RbssPY7
 FnfZLwuRemW+IJBEYaQamUK0on7Q5th4FGOsuzROgXAZoIGNIiXkJpw6m2zCIrTUQSQE
 K/bvmchvl7/lDAVWT5gdf6dlyxmBiJFsitrJDC4jENxvakGwUTx0wrgQU9A5K9lCYmlr
 h1HQuC8SoVMCQ5EXS8kYrlPdicDYsbor4lk4V+hj+IHfwR6futeGfI1deD/po3KWg6F+
 PLq995t6ajTp70EliGh1g1yv6884kP0kjyEHuKrh4CpLFlGFcHIVRnqN48swxNc3m66L
 16tQ==
X-Gm-Message-State: AOJu0YxTE9FIiQvNnN1wsDDy8NuHKjjU8ROY6M0lJq9ITCCjguZgqrNE
 tHatv/oBkWryaI5vnlQU2DPz6Q==
X-Google-Smtp-Source: AGHT+IE9ZA2Nur1n92NY0RcBoLiL+/hKUSUFtLkVB3x4JPU/I5ukFpS3TU2XD2rmTj/1KM/Es0EFmw==
X-Received: by 2002:ac2:5990:0:b0:4fe:7e7f:1328 with SMTP id
 w16-20020ac25990000000b004fe7e7f1328mr8327434lfn.16.1695752688279; 
 Tue, 26 Sep 2023 11:24:48 -0700 (PDT)
Received: from [10.167.154.1]
 (178235177023.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.23])
 by smtp.gmail.com with ESMTPSA id
 f19-20020a056402151300b0053090e2afafsm7020643edw.22.2023.09.26.11.24.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 26 Sep 2023 11:24:48 -0700 (PDT)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Tue, 26 Sep 2023 20:24:39 +0200
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v1-4-7af6937ac0a3@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1695752677; l=1716;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=KPLzI8JFAgOM8lipaf6IRavq4f0Qs8pGOQ9Xz036QH0=;
 b=PDlPugMO+iF59ClerI17jCYJbl64YHQKAQ2PSltxjIudAdlihLWSc6nsLkhRsORmNGP+5xoQK
 f6Hn3X2fOEGDA22Z+Akv8Movy+kal6fJjl/lAjkYrwFQELNg6ZJ4gyA
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH 4/7] arm64: dts: qcom: sc7280: Add ZAP shader
 support
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

Non-Chrome SC7280-family platforms ship a ZAP shader with the Adreno GPU.
Describe that and make sure it doesn't interfere with Chrome devices.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi |  2 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 10 ++++++++++
 2 files changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
index 5d462ae14ba1..88fc67c3646e 100644
--- a/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi
@@ -17,6 +17,8 @@
  * required by the setup for Chrome boards.
  */
 
+/delete-node/ &gpu_zap_mem;
+/delete-node/ &gpu_zap_shader;
 /delete-node/ &hyp_mem;
 /delete-node/ &xbl_mem;
 /delete-node/ &reserved_xbl_uefi_log;
diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 66f1eb83cca7..c38ddf267ef5 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -152,6 +152,11 @@ ipa_fw_mem: memory@8b700000 {
 			no-map;
 		};
 
+		gpu_zap_mem: zap@8b71a000 {
+			reg = <0 0x8b71a000 0 0x2000>;
+			no-map;
+		};
+
 		rmtfs_mem: memory@9c900000 {
 			compatible = "qcom,rmtfs-mem";
 			reg = <0x0 0x9c900000 0x0 0x280000>;
@@ -2608,6 +2613,11 @@ gpu: gpu@3d00000 {
 			nvmem-cells = <&gpu_speed_bin>;
 			nvmem-cell-names = "speed_bin";
 
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_zap_mem>;
+				firmware-name = "qcom/a660_zap.mdt";
+			};
+
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.42.0

