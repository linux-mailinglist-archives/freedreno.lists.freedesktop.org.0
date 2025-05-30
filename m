Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2E480AC94FF
	for <lists+freedreno@lfdr.de>; Fri, 30 May 2025 19:47:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 084F010E815;
	Fri, 30 May 2025 17:47:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="mpWsG+t3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 242E610E815
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 17:47:44 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UADShU013816
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 17:47:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=B+2KkEfWLodMGyIjftnj/+
 LVncTbtgVzzVqk00GViSE=; b=mpWsG+t3plv5e6+19mI7H1/k9Xc2PbY3Srvl80
 D5zBneLrIWg0mnVpuUI8G4tf0+fyNEHsnMfY7WCElXGVHSQa1nG4/d+g7nqbI1ox
 CjUb4JN8+XQHmKJqVYNTSXFcmFnwBHOmLh3vvDEZmffrsbUR9M0VUtt2axHK9FK9
 mti9+nRt3jDtJXxXgwueMG8obGlA91fe/dpbrqram7qw9Hf7C5lRVSn99cKAjR8Z
 68WrbUQYL7ZFIPEd8dcdRU5WZtwAZ66pGDRdyZMNajqdsDddAo7dcgghHMnqwyJP
 tR58ycXdv0YICv8dfMgLyRrmO7RZSDjhrQAjoc1y899xcv3g==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46wavm3y02-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 17:47:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-312436c2224so1635354a91.0
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 10:47:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748627263; x=1749232063;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=B+2KkEfWLodMGyIjftnj/+LVncTbtgVzzVqk00GViSE=;
 b=k5e9urRixRikCN8r4Nky7r9oZr374qHd0SrhHNPYBqseortxMfzrsKWfdO5+2Z+cc8
 ghqG8QoRD1Nzu+w2jAZKNApyYDtv4gz62asuMNLmainED7kYm8wCYELNJj75Ve6nNXs5
 K/FHkZgNoulfqCjHnv58+KqXbi1E6Xe1SIPi3bLzX6itPhxM7+QeYfv2FrTFrLFOvG7t
 woKOjlfwBcgzPBUS16EO76aB8kBsn21y/KoBGb1+WyNmT7XwV4GtH600U2mecaA5hJrz
 jd+IXXC8At+F56IN6M4MfjEFOGgQeTwIuKgEUpYgCr9c9DY8uR8e+Eyw8vA36OfGO46M
 XKMg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXOnVfhbFooWje3hgtxN2N7lKBQRP85ssXIhEqgnAScEupeCObEyKdeCrzybZKd734yhsyk91J7a7U=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQAjMBp+sAL20mCq52QRmBmGYKI/u+MLwL9wsg99x6EfV6zSLm
 bvb1P7CyJFe65E/GZ+PFCk49rd1xPuQHpENGx6pbq6mDZ5siEa6Sfr4HH2fYiif9wJfOQWrRrXI
 5ijdfPtSPvc/DzoxvYxR3r3cvllpN6SMUsjqbkXk3Yo2fB0mbmx3sCXPifvYVRVYEfbSoX00=
X-Gm-Gg: ASbGncu/Z8kKtRVKMMUMq4hs4zL38FpMnplvlc4uqxQRF6091GCzFkZnv9nxZQv44/W
 +SCAHBjFjPlaydg6RbpptKcOBn1XlmFYkoQGi6vDit5G7flDFyxyORkPobx/nwVQfwsewAzOFbA
 D4eIMLpAXlErVoEat7+3YFmkPQhtRZAyb16/+VtlhwDrToSsQrF3U9AqKpIRzzq2NnOWc9qTL2c
 Lv0ntop4EGEfUSpAj248p/BsLNrKxlarrtKfZBMjRroHOfn5vegqY46Hq/lvpw1k/25frE+kQ67
 FW3CaGIfaNMJ5bvFehM0SkwKg936ACLPUtoPJa1g/MAE32D494hKQG7WccdNLp4YozR5ELgF
X-Received: by 2002:a17:90b:4a08:b0:312:db8:dbdc with SMTP id
 98e67ed59e1d1-31241528e77mr6199233a91.20.1748627262840; 
 Fri, 30 May 2025 10:47:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGIPUUx78SralXxw5BzFba2DK55mhWLzeD99fXJp8xlfnHba499BNeIUSlq76/cXvpfZXgfQg==
X-Received: by 2002:a17:90b:4a08:b0:312:db8:dbdc with SMTP id
 98e67ed59e1d1-31241528e77mr6199174a91.20.1748627262304; 
 Fri, 30 May 2025 10:47:42 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e399b0fsm1615381a91.30.2025.05.30.10.47.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 10:47:41 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH v2 0/5] dt-bindings: msm/dp: add support for pixel clock to
 driver another stream
Date: Fri, 30 May 2025 10:47:23 -0700
Message-Id: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIACvvOWgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyjHQUlJIzE
 vPSU3UzU4B8JSMDIxNDIKGbUhCfW1wSn5SZl5KZl16sa25qbJaWlmyZmGqUpgTUVVCUmpZZATY
 xOra2FgDlnKS/YQAAAA==
X-Change-ID: 20241202-dp_mst_bindings-7536ffc9ae2f
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748627260; l=2624;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=6uc2UGeYDKojb28VLnUtXsaqjBTpOdr4JI5m+IvoZFs=;
 b=B4JARvTLryhXsb9dR+6G59wuZvScg2Y7mSDEApXdzmOtc2rUFkH0me1aDfAEfkCSfEPjF2sfe
 TCooErK5xB4Bc/Yi3hAq/l+BrCIKAkTYbHRNCwluTVfQot2e0Z9hwj7
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: iPMWM4SVImhgttPesoc8XfF8vrLbmqOt
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NiBTYWx0ZWRfXw3MGpmTHH9rD
 WLTgGLN1Jxz7/Ke2v6dmWtHi7RX+Ir0i0rYg/fuJ0zP1EadZnqaAEtTNaxmB/hcwWdnwYUyymjn
 QdxzwXTek4p+/9EqB30ZRG00YdWFYWa4nsHwEfZlTfy1igZ8rU4a01vRQFPyZOMSt1sGWRw7MiP
 3fyywxtle0f4bT+d27RjIs7S73nbrbHrUJRCWwL9lqFT+ZFQgWKDFvNUy7Cp1vGJFYu449zTg4a
 3dMvkD7ooiBXHD8l6AFlpqe6VTVEdGc+mc66REWb6JyH0kto8jsJTELPjhP7tQ1vFBkI4Ql4pI2
 xXBW6LOQqi3/fXWA2hy/igaVVJQw+THfUXK0IS+8XU0BQWTkOXZwggIejNrgH2oHfJvjKM8sy1H
 Qg+Jduc3OxBb/Mwkq9b9xPwRDc8bCz4OpUFxP1Qk9ym509kat8DFEok0QckAdMOCn9ytPmUO
X-Authority-Analysis: v=2.4 cv=fMk53Yae c=1 sm=1 tr=0 ts=6839ef3f cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=BHNpFwMvo4D9IzoZi8gA:9
 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
X-Proofpoint-ORIG-GUID: iPMWM4SVImhgttPesoc8XfF8vrLbmqOt
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 impostorscore=0 phishscore=0 suspectscore=0
 spamscore=0 priorityscore=1501 lowpriorityscore=0 clxscore=1015 mlxscore=0
 mlxlogscore=911 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300156
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
Errors-To: freedreno-bounces@lists.freedesktop.org
Sender: "Freedreno" <freedreno-bounces@lists.freedesktop.org>

On some MSM chipsets, the display port controller is capable of supporting
two streams. To drive the second stream, the pixel clock for the
corresponding stream needs to be enabled. In order to add the bindings for
the pixel clock for the second stream, fixup the documentation of some of
the bindings to clarify exactly which stream they correspond to, then add
the new bindings and make corresponding changes to the relevant device
trees.

---
Changes in v2:
- Rebased on top of next-20250523
- Dropped merged maintainer patch
- Remove assigned-clock-parents from sm7150-mdss.yaml
- Added a patch to make the corresponding dts change to add pixel 1
  stream
- Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
- Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
- Updated dp-controller.yaml to include all chipsets that support stream
  1 pixel clock (Krzysztof)
- Added missing minItems and if statement (Krzysztof)

---
Abhinav Kumar (4):
      dt-bindings: Fixup x1e80100 to add DP MST support
      dt-bindings: clock: Add SC7280 DISPCC DP pixel 1 clock binding
      dt-bindings: display/msm: drop assigned-clock-parents for dp controller
      dt-bindings: display/msm: add stream 1 pixel clock binding

Jessica Zhang (1):
      arm64: dts: qcom: Add pixel 1 stream for displayport

 .../bindings/display/msm/dp-controller.yaml        | 45 +++++++++++---
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    | 10 +--
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   | 11 ++--
 .../bindings/display/msm/qcom,sc7180-mdss.yaml     |  1 -
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     | 11 ++--
 .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  2 -
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   | 18 +++---
 arch/arm64/boot/dts/qcom/sa8775p.dtsi              | 26 +++++---
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              | 20 ++++--
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             | 72 +++++++++++++++-------
 arch/arm64/boot/dts/qcom/sm8150.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               | 10 ++-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             | 31 +++++++---
 include/dt-bindings/clock/qcom,dispcc-sc7280.h     |  2 +
 16 files changed, 197 insertions(+), 92 deletions(-)
---
base-commit: daf70030586cf0279a57b58a94c32cfe901df23d
change-id: 20241202-dp_mst_bindings-7536ffc9ae2f

Best regards,
-- 
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

