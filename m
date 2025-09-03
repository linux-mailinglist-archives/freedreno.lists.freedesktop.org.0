Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 216FDB41DE1
	for <lists+freedreno@lfdr.de>; Wed,  3 Sep 2025 13:58:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id BDD0710E212;
	Wed,  3 Sep 2025 11:58:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dWTXlbqZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 25EDC10E7AC
 for <freedreno@lists.freedesktop.org>; Wed,  3 Sep 2025 11:58:23 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 583BEuJj013529
 for <freedreno@lists.freedesktop.org>; Wed, 3 Sep 2025 11:58:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=adL4EoeV2E7qkaOYZ7wEsJ
 r8JDiyLwLPPii5Tw/qlWI=; b=dWTXlbqZhxclpKFkQOhX309kJBm3xTtrNxMyen
 JWFI15QHX0hhFjrr2FLzgJ9v3Nc6N+4jR6hyQ/UtrtI1qfmMVUJWeD0FFUrxq87e
 cGo6+kX42FgYnlAzKH+ILFz0ZJv40fu656qDoWQ0fBj1Xf21vV4XrhLr1uuavn1o
 VUwVlRA0UXoYIUurMbfRCFm+DfhBwnzRFR4AOV5aVZJRtv5elRxOmLk9NRF5e48L
 01ul0e3nwx4QtirpmVFS1HHzpTg+oXoOdZByD9VrdqwYJaSUDUbhMMATEks43jqY
 Mw+kdbZwiDxDjLgjNxRSNdnrtOLXKkUXNytjPrcD2fqEYIBQ==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48uscv3nsy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 11:58:21 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-7131866cdceso82509776d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 03 Sep 2025 04:58:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756900701; x=1757505501;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=adL4EoeV2E7qkaOYZ7wEsJr8JDiyLwLPPii5Tw/qlWI=;
 b=hQyEEwxCIj7FfSDys7VBRGPAfGgmf3s0+Ltgznh3RmsOh78INj3Wffc+lLLvqNbsXM
 d6zjEWnujJMaSsx3W9tO5JKyVMsUR2fCSjWruKQNlh8+ot1xnEoI8EYcuBbSapMEQGLO
 9paR93fGrZ5vJ1QrB8eVhlVnvFFIKkR+u2kB9S/wGQIKNGX7jdhIdM1diEE4kqCS9PcO
 TqpuuGAgqFzyF9zr51+D57mDb5HG7EpJNfUpH8Og9QdbfWKAbZ7J5PM2fkXXmypd1yKn
 0Iw6eRgG8lawr8agh0I5lcXtkxjuUOidjxHmlw9OCUlTxhqrBs9FXBeEyTBU9RpyMmf4
 w9OQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXAQ2rd9sGi+vEgJlqHSZFE4RbkVHUfpvh1FkwG2jiPc5q1LucAo44g7VkiJ9SHwFNjsbuSHUbyvVY=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxw4kspDB6H6vp2LZl4Z2YDR8YEfcTTj9Q68SCByMzZ6exhVpjz
 cZlpjiLygpjop0zemWpNXFdMZaoCEl7JLo5a/4jNhnJQbG7w3ba+zk8hkjcwPRJHbiqjANSQqKY
 0pYdx05AL2/1CW9e+qqchrDX/X/x0b25Wn0qjp56fpkyM6J9pwbIyZzW3W+KpW7absbMwanA=
X-Gm-Gg: ASbGncukv1je0UGjdEzpFeUNmcW1A56J0ayIUYzjoVUERKpB1VVXV68LUgpWNuYFCrW
 h55uOnJekpKNbR66VZm37VEyLq3YtGdsOiHalT3+ibce3C/bx5bxykFIXx0QDwiqkcRh5C6Ax74
 xCaHv9pxa+OqwKbgSct87z2mOpX/c9cSZQbxnuPXR7bQDEkuwUUEkyPOOZ06ioRxqlrEhGeVhBT
 sEKLCV5ziJatsJqJobEaUim9ubB+wKQjFe2XA9y1ggC9rLCsrRUqlcAZ8r28TEhddWkPLuEK9Rm
 +eRxNh0e5bo6xOcgi08ZjOzb8jdzlZ38FfMGJ378Hl849XvJqv/4t9cFCIKAwv6IYivTIa+KBcX
 tBOfzfbNyUZlcMyIM31RorVDJoZErY1s/rMevzuSCqthtdasbE9Fw
X-Received: by 2002:a05:6214:2349:b0:70f:a1b0:2f6e with SMTP id
 6a1803df08f44-70fac8fa36dmr153972746d6.53.1756900700944; 
 Wed, 03 Sep 2025 04:58:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEkjNR8zJftYH2Wc07pKXPYfc0mFr7V0otUSeuc+zOAN4SWBaLaXJ/nivFkjHennbtsQ19wjQ==
X-Received: by 2002:a05:6214:2349:b0:70f:a1b0:2f6e with SMTP id
 6a1803df08f44-70fac8fa36dmr153972436d6.53.1756900700282; 
 Wed, 03 Sep 2025 04:58:20 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-337f50d30b0sm9891421fa.67.2025.09.03.04.58.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 03 Sep 2025 04:58:19 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v8 0/9] dt-bindings: msm/dp: Add support for 4 pixel
 streams
Date: Wed, 03 Sep 2025 14:58:11 +0300
Message-Id: <20250903-dp_mst_bindings-v8-0-7526f0311eaa@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFMtuGgC/4XSX2vCMBAA8K8ieV5dcvlbn/weY0jSXlxgbbWpx
 SF+912VoVDL8hC4cPldwt2FZewTZrZZXViPY8qpaylwbytWffl2j0WqKWbAQQnaivqwa/KwC6m
 tU7vPhdXSxFiVHiEyunXoMabzTfz4pPgr5aHrf24FRjGdLlujKHhR+tIrGbgB5bfHU6pSW62rr
 mGTNsKfoLmWfC4ACbEErYyqJXi37XJeH0/+m4TmwcgHY4WdM5IYCxVyB05bLhcY9WAcL+eMIiY
 EKQwaSZJaYPQ/jJ4Y4XREbVWUS58yT4zQc8YQg1boQEtLZxYY+8TAi9dYYiCAcdSmUtjwgrneB
 6FH6l9Ow30aWPAZiykpDZtVi+fhvfF5wJ7yr79PVi4liQIAAA==
X-Change-ID: 20241202-dp_mst_bindings-7536ffc9ae2f
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Mahadevan <quic_mahap@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Krzysztof Kozlowski <krzk@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4867;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=ez3W78p0zTtxf088i7D4pbQ8b7ByUAjKoGhUjg8v0yM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBouC1WOlaFmFjIYTeG9HX6eI/ke20dxqwsfOOjm
 JJvTI6zj+KJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaLgtVgAKCRCLPIo+Aiko
 1e2RB/9l1GEJPABtTw7pbT4uzyjnWDx1YYY041Z0VdTx1lD+5xczNcAZrkygMlSwHeB4+sgPW0T
 Ej9Uev9JVkm7ynQSjSfwJwxPsJ9slhA9GI74CpXCZ7qtFprObVkMqJ5B4tUeUJCUKoVUJ+KJtMo
 idp1N4dDfEqk/KxJL7pz8az5x3qDW/xG2CbpphsiTSyVxX3yxPiMVmtDHxgfBDmr7uCO7TVEKYu
 kRd59fForDoiaFJ8MSCtGhIqtTY2jtzmV45Nl2GANpC8BJNx3gOaoFpDwVnzmMFJf24rt8D/spV
 OVL7AkwwuOjhp2RmUZPFv6QN6YrCp02TCIb1tVaShURjtBxv
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMSBTYWx0ZWRfX+SXadupXqGV3
 IsBZhlZZYdVIauNYgn5yS71eq630kfLSOqUbcVt6TEmDsDV4RsXmh5/vAWV3KeCEO8La9uUSVZ0
 Mf2+Eu99aI2xqCWFI73qpU8fU82OvTwuEjR/7JtcMXjdgedxx1xRBDIYE74zOr1OnFHsOcylEdM
 1cAjDtktHQ+swLrWDTpq4ijWQMZ7yvoUADuiMwYK6NQalzD7jC56VRYWeWPWdWkVFmhhK64nQlb
 ZrdzPtpYbWVNsNRh3Fa/CN6tmLW1r/+VFCUVf+JzBJ49g+ESeRW0rZjuX68YA0ZfQMZbgtpoAgO
 j6h/bSXeEPemYM0TkzSQt5DcIPoDsjarzn7ijcjcow5lH47UgwzYSW1IsK2FDo87YEUfT49hTCT
 UnCAwCgf
X-Authority-Analysis: v=2.4 cv=A8xsP7WG c=1 sm=1 tr=0 ts=68b82d5e cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=COk6AnOGAAAA:8
 a=rtwBFDCfVmBUUsGphOkA:9 a=QEXdDO2ut3YA:10 a=OIgjcC2v60KrkQgK7BGD:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: iqQVSSijbZ6-VznMKx-e01vYQTLijEDl
X-Proofpoint-GUID: iqQVSSijbZ6-VznMKx-e01vYQTLijEDl
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-03_06,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 impostorscore=0 bulkscore=0 clxscore=1015
 suspectscore=0 malwarescore=0 priorityscore=1501 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300031
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
up to 4 streams.

To drive these additional streams, the pixel clocks for the corresponding
stream needs to be enabled.

Fixup the documentation of some of the bindings to clarify exactly which
stream they correspond to, then add the new bindings and device tree
changes.

---
Changes in v8:
- Expanded commit messages in order to describe that SM6350-related
  change is not going to break platform support (Krzysztof).
- Also added restrictions to clock-names properties (Krzysztof).
- Link to v7: https://lore.kernel.org/r/20250829-dp_mst_bindings-v7-0-2b268a43917b@oss.qualcomm.com

Changes in v7:
- Changed fallback compatible for SM6350, it doesn't have MST
- Reworked MST schema in order to remove nested ifs (Krzysztof)
- Didn't pick up Rob's R-B tag since the patch was heavily reworked
- Added P2 / P3 / MST2LINK / MST3LINK regions
- Link to v6: https://lore.kernel.org/r/20250815-dp_mst_bindings-v6-0-e715bbbb5386@oss.qualcomm.com

Changes in v6:
- Switched platforms with different MST configrations to use single
  properties entry instead of using oneOf (Rob)
- Link to v5: https://lore.kernel.org/r/20250809-dp_mst_bindings-v5-0-b185fe574f38@oss.qualcomm.com

Changes in v5:
- Removed SC7280-related comments, it has no DP MST support
- Link to v4: https://lore.kernel.org/r/20250809-dp_mst_bindings-v4-0-bb316e638284@oss.qualcomm.com

Changes in v4:
- Picked up series from Jessica by the mutual agreement
- Corrected Rob's tags (Krzysztof)
- Split X1E80100 DP patch (Dmitry)
- Removed SC7280 changes
- Enabled the MST clock on SDM845
- Link to v3: https://lore.kernel.org/r/20250717-dp_mst_bindings-v3-0-72ce08285703@oss.qualcomm.com

Changes in v3:
- Fixed dtschema errors (Rob Herring)
- Documented all pixel stream clocks (Dmitry)
- Ordered compatibility list alphabetically (Dmitry)
- Dropped assigned-clocks too (Dmitry)
- Link to v2: https://lore.kernel.org/r/20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com

Changes in v2:
- Rebased on top of next-20250523
- Dropped merged maintainer patch
- Added a patch to make the corresponding dts change to add pixel 1
  stream
- Squashed pixel 0 and pixel 1 stream binding patches (Krzysztof)
- Drop assigned-clock-parents bindings for dp-controller (Krzysztof)
- Updated dp-controller.yaml to include all chipsets that support stream
  1 pixel clock (Krzysztof)
- Added missing minItems and if statement (Krzysztof)
- Link to v1: https://lore.kernel.org/r/20241202-dp_mst_bindings-v1-0-9a9a43b0624a@quicinc.com

---
Abhinav Kumar (4):
      dt-bindings: display/msm: qcom,x1e80100-mdss: correct DP addresses
      dt-bindings: display/msm: dp-controller: add X1E80100
      dt-bindings: display/msm: drop assigned-clock-parents for dp controller
      dt-bindings: display/msm: expand to support MST

Dmitry Baryshkov (4):
      dt-bindings: display/msm: dp-controller: allow eDP for SA8775P
      dt-bindings: display/msm: dp-controller: fix fallback for SM6350
      dt-bindings: display/msm: dp-controller: document DP on SM7150
      arm64: dts: qcom: sm6350: correct DP compatibility strings

Jessica Zhang (1):
      arm64: dts: qcom: Add MST pixel streams for displayport

 .../bindings/display/msm/dp-controller.yaml        | 146 ++++++++++++++++++---
 .../bindings/display/msm/qcom,sa8775p-mdss.yaml    |  26 +++-
 .../bindings/display/msm/qcom,sar2130p-mdss.yaml   |  10 +-
 .../bindings/display/msm/qcom,sc7280-mdss.yaml     |   3 +-
 .../bindings/display/msm/qcom,sm7150-mdss.yaml     |  16 ++-
 .../bindings/display/msm/qcom,sm8750-mdss.yaml     |  10 +-
 .../bindings/display/msm/qcom,x1e80100-mdss.yaml   |  20 +--
 arch/arm64/boot/dts/qcom/lemans.dtsi               |  46 +++++--
 arch/arm64/boot/dts/qcom/sar2130p.dtsi             |  10 +-
 arch/arm64/boot/dts/qcom/sc7280.dtsi               |   3 +-
 arch/arm64/boot/dts/qcom/sc8180x.dtsi              |  23 +++-
 arch/arm64/boot/dts/qcom/sc8280xp.dtsi             |  72 ++++++----
 arch/arm64/boot/dts/qcom/sdm845.dtsi               |  15 ++-
 arch/arm64/boot/dts/qcom/sm6350.dtsi               |   2 +-
 arch/arm64/boot/dts/qcom/sm8150.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8250.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8350.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8450.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8550.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/sm8650.dtsi               |  10 +-
 arch/arm64/boot/dts/qcom/x1e80100.dtsi             |  30 +++--
 21 files changed, 376 insertions(+), 116 deletions(-)
---
base-commit: 8cd53fb40a304576fa86ba985f3045d5c55b0ae3
change-id: 20241202-dp_mst_bindings-7536ffc9ae2f

Best regards,
-- 
With best wishes
Dmitry

