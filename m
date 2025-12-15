Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 475DDCBCF88
	for <lists+freedreno@lfdr.de>; Mon, 15 Dec 2025 09:40:08 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 936AC10E24E;
	Mon, 15 Dec 2025 08:39:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EBRiIVkz";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="fRzvm1Vd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C959410E24E
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:39:49 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BEMe1W63001640
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:39:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=CC+4BFqt1YkGtgs5ir/xbhC6q4kVA/nflLU
 4A6y5ywk=; b=EBRiIVkzPuaggIMgkifTIMbjOhhq3XJHntqmyjhvxv8Eprnu2nB
 /UEN9qe/Kp0QJobig5cfhDHvY0ObVXZiJzNSO9jNtalPZkez3sKvLq6xCRnT+ZXu
 oQ7VamhuAvHdqg1NsltbxZZlDc6+ZOcBVay1VSw1MSgloO4/U+MgmAvxzUsT14xS
 bohuAcrEmCrG6S1BXJCyGP+cu4ZPrqjJ/RqS+LNyKB8vxhf4cOd5CrX+IQwmrXy+
 VsB3M5MF8Yn4KugLbDSB0NX/xidkjdYgQ3+dXSHBsJKCdkWB+C7WgtX2qi5jSxWO
 n73jVE5NR2o1ERbZo/E4/BXZvcf3UAsmBfQ==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119akrhf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:39:49 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8b24383b680so1232910485a.0
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 00:39:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765787988; x=1766392788;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=CC+4BFqt1YkGtgs5ir/xbhC6q4kVA/nflLU4A6y5ywk=;
 b=fRzvm1VdwkXrI+v0MiBH1p7FUoE/3B0gChZa4Vx1u9Jvyx3lXhXsEHJqekWNyZir2c
 QZP2y+TSZpx4ruelncZccClaLfOTcxfvTJTmmxdvCrFhaQZ3HqyM/+3KKvyUmLPcHCKO
 XS2hW4Tfq/mZHbjx3XHS1hDoN7XD85qMgaMRde5hGyA3HmWUmWSRpc2NkJxDsLeigDaw
 5gDevYa3uYzvSaqqty0hN9GwI7Ily/xjnpt4mWSjCiG3zRYPurEIuvZXXumpSOqXBNnk
 9MUCxWuxwoSgMGOevXDvC0dA6xROL64h8uMy3XZsVs0vDkJX1l5Io3upu5vAAEIAa+eT
 3yoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765787988; x=1766392788;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=CC+4BFqt1YkGtgs5ir/xbhC6q4kVA/nflLU4A6y5ywk=;
 b=PXSMJdHB/GEN8BOZCQPUmWcCjggDUhR9PtFRjt6n0UM1y6uu0ofg0U7d6h3/MGEYpb
 URuS3EEsg/Z4gnRlh7GloJNhVuCcrCo2H/Vnyb0n4cko8eVwZFLCICbw1S0Dv3wc0V5H
 4whNjoI0IHfICZURLVwOpjAU7X2TbxFZXyUuxswlP4kC3eJuIoWtLZXmihhRx2DrO46K
 1LtoWLyw72R+oe9qvoU1G061urrCF2Z7Z7hX5QJv6pHhK0kRro641saaHghZvAHGVZhR
 xreTKmt3N5Bv0u2DgpcF7pB7Gm4vgauzv/Q5Sk/P4lnaPVzZVn0FeIiQ2RUvEUjbyDKQ
 yi1Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCUr+6sCE7FQEIzblGIYxSxE5UuMNuFgBKXGD8hRWS6Rbr+DEZoqR61iPYtryHqTH0UnrnXlr7Wq/j0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwqaLGfx0pSK3nSbRdlVSA6km9rLPSf5VSHaUDHDp+vMRsMmFpJ
 Mlowj4W5IQIfMU6Y+eJsTNnUJXI8g/HAZ+S9na5yj6IT1v6+2hy8X0RQlDqeIJpStvNsvbSEhwd
 8OdXjoCPfcxQ6mFrCArmSK/xO/QqL81REf5HqCFfcwxUhB7G3e4EnDCACaPKWGJMrPxxkPzI=
X-Gm-Gg: AY/fxX7SWpDQBsf/rOJraX/bzoyMJem6nA07gyWjFy7dN6dTTmUOP1ifIE1O+BNXF3A
 Fr/r+YlWJeOIhjjWEzYgcsSglIppQnvKer+cY/G1BuxUvnmzuW71S9yRZzwGju/NLhU1YXD/oHz
 lJR7tLtv29chNTxPsXuvgobo+JPtWfiRUaF7g3i4HifDglbtOHvuJWcFxJK2CJXHgtppwIEKL1X
 lp1NO3NvuQJyGVvKaR8huYob8Z8mqgZMMmItoowAJ0eWZ730J4PORm6QxP1qC3S+tKs812s6Yuo
 2vh7wJc7XdEnUJdZ0TUazR0sUNXCMyYQq2iFvoIgZN3CtUjWYFptTk2ES6hH4bLkJ9ksTnptaLG
 PKONwyUGotvFV4LBhZAwOlgY1vDAIClK1LtNFB/9XP+epzGwvvE2ILzNG0PwDf9mCNdA=
X-Received: by 2002:a05:622a:a14:b0:4ee:1913:9616 with SMTP id
 d75a77b69052e-4f1d05aba1bmr142311751cf.51.1765787988263; 
 Mon, 15 Dec 2025 00:39:48 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFRWniEvfTeo2vJj07fDM5X+bNNfh2o4WM994jeA7CX5unkq7AjKhoLCsggahjmZTPow3hazA==
X-Received: by 2002:a05:622a:a14:b0:4ee:1913:9616 with SMTP id
 d75a77b69052e-4f1d05aba1bmr142311411cf.51.1765787987786; 
 Mon, 15 Dec 2025 00:39:47 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.39.39
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:39:47 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 00/11] drm/msm: Add support for Kaanapali
Date: Mon, 15 Dec 2025 16:38:43 +0800
Message-Id: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ftPRpV4f c=1 sm=1 tr=0 ts=693fc955 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=fD7pSEWciPXgxqq5vjEA:9
 a=NFOGd7dJGGMPyQGDc5-O:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfX9shqt25+ZfdF
 COvi1E4AKkIhUhI3FrYuXtnsZfg6N9/9jNj6CaNwcj8MGtmx19ew75tXJf3KyNuPGyJ5w0OZg8Z
 eXf7LNKNavA3R5rHHcHXoVL7+mor6+/E0TsJ7bXUkG6D4wXkANu1LeG8Gz1REjyXGFA1FNNlHBj
 jl7zUP1Qjp0BN+h2q8Rq+45sq0eUifjM9cw4sIln5nE0ZBWpgGPhAwmqoZrXa3Z1Me+1Sf3XJuk
 wcQqrNlq+v0GxOBSg34zPpY+bWzXJ82Y3A8n8AlVdtLIrmLa3YptXAbOAlLU0+hQGLXqzvGJQKc
 q5+s2asBHkN/S2ASvW6x8+y7cvMrmFJwJyQzkCsRW4IqZGFSLKfrmvVBT2QKwi9XkB4KvnkIyvZ
 ZSOtSGTGQjjbMeMS2zRkrZ/tBd4x9g==
X-Proofpoint-ORIG-GUID: nZz0yTaeeuEwb3e5mDdkLEE01Rz1WADS
X-Proofpoint-GUID: nZz0yTaeeuEwb3e5mDdkLEE01Rz1WADS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150071
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

The Kaanapali MDSS has some differences compared to the SM8750 MDSS:
- DSI PHY/DSI base address have some changes.
- DPU 13.0:
  - SSPP layout has a great change.
  - interrupt INTF layout has some changes.

This patchset contains DSI PHY, DSI Controller, DPU & MDSS bindings
in addition to the driver changes.

We have already tested the display functionality using the Kaanapali-mtp
device on the Kaanapali branch of kernel-qcom repository.
Test command: "modetest -r -v"
kernel-qcom repository: https://git.codelinaro.org/clo/linux-kernel/kernel-qcom/-/tree/kaanapali

[PATCH v2 05/10] drm/msm/mdss: Add support for Kaanapali
compile depend on qcom-soc tree patch: https://lore.kernel.org/lkml/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v3:
- split SSPP refactor patch
- add devicetree email list
- fix Dmitry comment
- rebase on top of msm-next
- Link to v2: https://lore.kernel.org/all/20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com/

Changes in v2:
- Drop panel patch
- adjust patch order (bindings then drivers)
- add dpu_hw_ssppv13.c to complete kaanapali SSPP function
- fix bindings example dts compile error
- fix other comment
- rebase on top of msm-next
- Link to v1: https://lore.kernel.org/all/20251023075401.1148-1-yuanjie.yang@oss.qualcomm.com/

---

Yuanjie Yang (11):
  dt-bindings: display/msm: qcom,kaanapali-dpu: Add Kaanapali
  dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali DSI PHY
  dt-bindings: display/msm: dsi-controller-main: Add Kaanapali
  dt-bindings: display/msm: qcom,kaanapali-mdss: Add Kaanapali
  drm/msm/mdss: Add support for Kaanapali
  drm/msm/dsi/phy: Add support for Kaanapali
  drm/msm/dsi: Add support for Kaanapali
  drm/msm/dpu: Add interrupt registers for DPU 13.0.0
  drm/msm/dpu: Add support for Kaanapali DPU
  drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
  drm/msm/dpu: Add Kaanapali SSPP sub-block support

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,kaanapali-mdss.yaml      | 297 +++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml |   1 +
 drivers/gpu/drm/msm/Makefile                  |   1 +
 .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  16 +-
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  89 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 160 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h   |  56 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c   | 321 ++++++++++++
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.c   |  18 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h   |   3 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c     |  17 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c       |   1 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.c             |  13 +
 drivers/gpu/drm/msm/dsi/dsi_cfg.h             |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.c         |   2 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy.h         |   1 +
 drivers/gpu/drm/msm/dsi/phy/dsi_phy_7nm.c     |  23 +
 drivers/gpu/drm/msm/msm_mdss.c                |  10 +-
 22 files changed, 1494 insertions(+), 72 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c


base-commit: 06aa394d58c11406569bcbd4a69b81290edf3f63
-- 
2.34.1

