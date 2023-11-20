Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [IPv6:2610:10:20:722:a800:ff:fe36:1795])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E0147F12E8
	for <lists+freedreno@lfdr.de>; Mon, 20 Nov 2023 13:13:17 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B7A2710E3AB;
	Mon, 20 Nov 2023 12:13:12 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x534.google.com (mail-ed1-x534.google.com
 [IPv6:2a00:1450:4864:20::534])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3FCFE10E3AB
 for <freedreno@lists.freedesktop.org>; Mon, 20 Nov 2023 12:13:10 +0000 (UTC)
Received: by mail-ed1-x534.google.com with SMTP id
 4fb4d7f45d1cf-53e08e439c7so6196631a12.0
 for <freedreno@lists.freedesktop.org>; Mon, 20 Nov 2023 04:13:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700482388; x=1701087188; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=y4obJbFuX32a51CPgRwasEGqIWFeGs2SFetYjrfd9IY=;
 b=lxbAjQfw6UgfmOhqcK56Fql1vlSg9Ygz1ld6Nzo8GeIAIsLcMVlXqQDYl6VeDP8FA/
 qvwE1q74oSeL8o3TxEpbbVT1S5m0UaYHunH/+nu9+Zvq4OHkL1Ma+nFYTe+lID240066
 gpJ4mm2f12GuPboqZ+1yCH1Gx4mIO7IGai0OvlnNw3F93pe+IGQZve70kuxbxe+umyyI
 clVWDvP+mja82twubt/TWWBUF9Y6LV9rL9q+aQW/VY6UTyVhFmvBLg33W7WpjtM7snXh
 t+5YbbFDMCyeI6XmngVx+hboDIzARb8FxHK9GCt6mTLiEVBAV+FmcNtj1AS1Rt5UKXlZ
 ilqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700482388; x=1701087188;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=y4obJbFuX32a51CPgRwasEGqIWFeGs2SFetYjrfd9IY=;
 b=unD1tcLq19UEXva2CPO6s8vFiaTCQPqfedi6TjP5p3AzRKiXhVW3bj8GJYwjjIBpoO
 oAcApmj91B/L29zy+MizLj4+5B6gEgogF885kvz/fEB4yVO/LOl4RNVSiOMsMVBlNeod
 Lk+z6KlX6ssye48vOjL79n4R85ggzSvvrvOifkrfFQ1ZF6l9z8CwnsJeA2x6Afeqxg34
 jUhQUdGHljUsBtPLVY/1EYW8vuiklOcqBrTSol5Mo8X6sBGsl18Ql3B/X8EayXc8cPXD
 SBdzaYuzsJi6Z9RfvPBUE5byYNbWcepcNrjSSQeqm4coHzl75HqX0HJ05b60WuIJn3bG
 xNGg==
X-Gm-Message-State: AOJu0YzYce2hb7WbBEJS5Vz7DhRVqMc8BKY67YxG9ZHWr3wL3mGK7bJw
 qmTBhAlx/Cbx4CoP7fhcNxWfdg==
X-Google-Smtp-Source: AGHT+IHvqKMeMD59wsOARYBHIOOtmh9DOb0vYqoILiQ4tuG247ufeLMp7wMGy+ZaKH140knr325lBg==
X-Received: by 2002:a50:d7d4:0:b0:53f:2128:ff4f with SMTP id
 m20-20020a50d7d4000000b0053f2128ff4fmr4619581edj.17.1700482388356; 
 Mon, 20 Nov 2023 04:13:08 -0800 (PST)
Received: from [10.167.154.1]
 (178235187204.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.204])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa7c716000000b00548ac80f90csm1324584edq.40.2023.11.20.04.13.05
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 04:13:08 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 20 Nov 2023 13:12:52 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v2-1-06fa3d899c0a@linaro.org>
References: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
In-Reply-To: <20230926-topic-a643-v2-0-06fa3d899c0a@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700482383; l=1670;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=FO3D/4Lb+LmHq1IGkCnu/dhJPyd8/ht4WBGb18ODAj4=;
 b=GDIoeoFFvlB60e66DCtoCtdYcFDJbtJgGMbZGN5KrIZ1iWjzao4lxLmmp21pEUKM97CcEFTle
 lF26xtdb/VUC4IGtZsC0gvQrUiKc+np3MWMmV6N9bzHMdNmiX96otsu
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 1/4] arm64: dts: qcom: sc7280: Add ZAP shader
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
 arch/arm64/boot/dts/qcom/sc7280-chrome-common.dtsi | 2 ++
 arch/arm64/boot/dts/qcom/sc7280.dtsi               | 9 +++++++++
 2 files changed, 11 insertions(+)

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
index 04bf85b0399a..58563f8fdc16 100644
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
@@ -2613,6 +2618,10 @@ gpu: gpu@3d00000 {
 			nvmem-cells = <&gpu_speed_bin>;
 			nvmem-cell-names = "speed_bin";
 
+			gpu_zap_shader: zap-shader {
+				memory-region = <&gpu_zap_mem>;
+			};
+
 			gpu_opp_table: opp-table {
 				compatible = "operating-points-v2";
 

-- 
2.42.1

