Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C33047F12EA
	for <lists+freedreno@lfdr.de>; Mon, 20 Nov 2023 13:13:18 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8474E10E3B4;
	Mon, 20 Nov 2023 12:13:15 +0000 (UTC)
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mail-ed1-x532.google.com (mail-ed1-x532.google.com
 [IPv6:2a00:1450:4864:20::532])
 by gabe.freedesktop.org (Postfix) with ESMTPS id E7F0810E3AC
 for <freedreno@lists.freedesktop.org>; Mon, 20 Nov 2023 12:13:11 +0000 (UTC)
Received: by mail-ed1-x532.google.com with SMTP id
 4fb4d7f45d1cf-548a2c20f50so1682279a12.1
 for <freedreno@lists.freedesktop.org>; Mon, 20 Nov 2023 04:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=linaro.org; s=google; t=1700482390; x=1701087190; darn=lists.freedesktop.org;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=XQ0ypSe1N8mypAau3OPEaXjK2/eDjD7aM7p9a0KkeYY=;
 b=c/5CC20sh99F+OtkL8N7F1/1CcmByZhFugm7Vw+I8CxUD2s1ZXfxSWgNIiKhtbkCfs
 +ikt95BOz6K94LhsnueLn/gzTRuFcrdj3HaDJzt2yFcLY9gIw/vsWoS4e8gA++b/1HB3
 t26wErvHhGQPOcbPS4Im6Qds2DOXUR75zFEFMj5tUASv4lYGzYfpGSHmTnsEcXWob+AR
 jr1piaL72nJZp6xvASdHXPcFIrDIbbeHDS44SFdQWQ/wssvs1s2t9/2RO5GX0L9o/LbD
 1Fir97NIMkd093bJR8GlzdtnEYBEZxSA+/ZkH5G4lxfLp/IdmSUat82QGWttuNXWZUcK
 uSOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1700482390; x=1701087190;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=XQ0ypSe1N8mypAau3OPEaXjK2/eDjD7aM7p9a0KkeYY=;
 b=AVtt5EF2xkpuW3uxhFq8Qp7GBVbpgz3cMh+0Tm+ywAZcEVLsXwSAmC/epfNdEbl8Zm
 7Y7OVrBH1N+MJkf8CfBuIdou6L/gQpHk6lWA9QtBoZHV8zkU8BY5AIClQ/qqTMEmBuMV
 Ai0VcxVNwZH9IU1oiPQbtX74hwM/Bk+n/A5kWMV5Ko9Og64SVsoAkAY4JWQXxyfU5O+2
 9lKhJRBTaZkrPRa5YSzZFuft63otb8JdiLK5qvUXq/MZCDF/KNRHXj38Gmm4GZVCZPi0
 arF+UCwAv5kvlYldPRrSzt3uwce+y/wAJ5q3dq8QE3xWZw+KJH9Q4JUHWj34wrtbOXpb
 NZQw==
X-Gm-Message-State: AOJu0YxOkiMMjfxqpmMzjtPwi4Aq333+hlbfsZpmMNU0yX1ytkVkxKw8
 3GN82y3t0gLPY6hLTlg4bPmUoA==
X-Google-Smtp-Source: AGHT+IHgHEWqlDlsQXQAl07jhTuaRXFLhW6gDO2Rl+xkYrooOqkwo/D69PwFKDS16PgzgicY1iZj2Q==
X-Received: by 2002:aa7:d795:0:b0:53e:29c1:ae1f with SMTP id
 s21-20020aa7d795000000b0053e29c1ae1fmr6220141edq.19.1700482390140; 
 Mon, 20 Nov 2023 04:13:10 -0800 (PST)
Received: from [10.167.154.1]
 (178235187204.dynamic-4-waw-k-2-3-0.vectranet.pl. [178.235.187.204])
 by smtp.gmail.com with ESMTPSA id
 i22-20020aa7c716000000b00548ac80f90csm1324584edq.40.2023.11.20.04.13.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 20 Nov 2023 04:13:09 -0800 (PST)
From: Konrad Dybcio <konrad.dybcio@linaro.org>
Date: Mon, 20 Nov 2023 13:12:53 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20230926-topic-a643-v2-2-06fa3d899c0a@linaro.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1700482383; l=1308;
 i=konrad.dybcio@linaro.org; s=20230215; h=from:subject:message-id;
 bh=N2IVhDhpEh9zFeokJPv6QBy10GmMVdulaG7b6AuvP+g=;
 b=uG783dcu48EoyZtmTibdT6s18RnNyLq6HJ4ZSeg0kSXPAOezOy5rAXKriMyErZZssZNCUWxWR
 adKpfYAOfdWARCJg24F0tWOT8i81Lrg67x10qpdZ8oWQW/Nxp+Eihif
X-Developer-Key: i=konrad.dybcio@linaro.org; a=ed25519;
 pk=iclgkYvtl2w05SSXO5EjjSYlhFKsJ+5OSZBjOkQuEms=
Subject: [Freedreno] [PATCH v2 2/4] arm64: dts: qcom: sc7280: Fix up GPU SIDs
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

The current settings are functionally identical, *but* due to what is
likely hardcoded security policies, the secure firmware rejects them,
resulting in the board hanging. To avoid that, alter the settings such
that SID 0 and 1 are described separately.

Fixes: 96c471970b7b ("arm64: dts: qcom: sc7280: Add gpu support")
Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
 arch/arm64/boot/dts/qcom/sc7280.dtsi | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/arch/arm64/boot/dts/qcom/sc7280.dtsi b/arch/arm64/boot/dts/qcom/sc7280.dtsi
index 58563f8fdc16..db47af668232 100644
--- a/arch/arm64/boot/dts/qcom/sc7280.dtsi
+++ b/arch/arm64/boot/dts/qcom/sc7280.dtsi
@@ -2608,7 +2608,8 @@ gpu: gpu@3d00000 {
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
2.42.1

