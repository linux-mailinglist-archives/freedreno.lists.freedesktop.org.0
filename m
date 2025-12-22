Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1C1C5CD58B4
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 11:24:21 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E379610E037;
	Mon, 22 Dec 2025 10:24:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Sqqol7of";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="GZ5NOOSE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A959710E037
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:18 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM8hXOC3962870
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=FZWGu1DL453pQLAG88Qmw79qrBszzLEnUD4
 gV/dA3ig=; b=Sqqol7ofOMa1Bir8T0XN4p0JDMmS+Jd7hvvIlHgzjamkErhWdQZ
 WSkq1b7Fy6OPQMaRnLFhTEmkEsUc0vstin5WnIwLOtXykA1GwOh6HwMz7IayUYg5
 jaqV3nruUxYzYdrcdJSnFvMrrLAzRXK7W1Pd6/MoLAdyF/HxelEFEWUBXxVso+5U
 CHpZtyeebCHbmff7OxWsR5xDkDwJrnSzvZwgwSVb6699b2LX6veQQLdlizVBchHI
 6qN3aF7Slq6SGhfD/OsLQHqSHwTjgtpw9A9g4KURQ9z1oUqyQMnRTkG47qAk2X1s
 GACkwXn5PHD9sWAhkeTOnqO+E9gkuibV30w==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6hcwm-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88887611049so123443976d6.3
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 02:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766399057; x=1767003857;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:from:to:cc:subject:date:message-id:reply-to;
 bh=FZWGu1DL453pQLAG88Qmw79qrBszzLEnUD4gV/dA3ig=;
 b=GZ5NOOSEGTf+cqC+Uf7J4gdNjOkkr/z3I68pUp9TRqL6vFJAA48ROFSND7iR44zrxy
 TZU7NOXRmFhd1e8G41No5H9+f7HHetSpOC44xPc6SfLAPTs76dxo0Pi5DVhRywmZXeRd
 hV3EkC6iHJVJa2SaekjSZJtYy/kMP9xWvH0gSiSbzUIwCA/ZMF0KrJ0t6JU1+CE+lcBj
 G/pXwyrOwe0ReYFKb0Gt5r3kZr1QjtL3JUD3mtRcSDqQfjSLiseOTBALDnGkwpOY2Bvm
 gXYa47vwxUIC+iZOEtl1q4xjQ/wMBhB7eWRmqMsKGIPAH0hhpd6kWljIZlQ5CCgFx5O3
 QG3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399057; x=1767003857;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=FZWGu1DL453pQLAG88Qmw79qrBszzLEnUD4gV/dA3ig=;
 b=wdsGaO5eSuShhDCbA+pmzBGQSypr+TU4XO/gjzd9ItzGyGedmUgLaI5wzXuAxdYMdg
 nKE9AIaEY3F1RDouWYRo2+omCWsO6Wp656s94taTFMp3edWwcVvyt4d+4sI7DPfh/hJt
 NWbmvDPpL2Z5mq3CWjtQQ51R7MvpVogXnVEPy6F4zV1hYlGS0hHimukTdbNXrQ7vG+M2
 OieWJNu6xNGneftNEmRE/v+kbsXl9iKwxy3TcGItO8eAuqHiq30Ucysjjdy0W6703umu
 m097dJaXkLdnuXpOJrqMgjHcIgJHk4vKh1Djee+sBWoRJbyoohgNrWaToyBvtteAxgT+
 5Zsg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWaOCYIOjQ9+Et7rwTRFMgPlvaZhu+vNcedzXCb1ctiipByPL4qnLk1bejfBHxYgXAQDZMJnZg/7Ts=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yzob43Raa2UAUTZhrk75Tn+IhbnqRbtSczkR8jmMu5KqOiHWpCB
 KxlCwjSrpi6RahIMdqpfVkwL6OWkm/m8rBdDHF1+YslfY5VwROxdApxJv6b0VdnFvdhS0m2siAU
 cAYGnd197rilzrr5f/bQQeKHUaVco0rnf4MmBDc6nRbgiybOkftFlzBCwgo08Jg26HPd8pN0=
X-Gm-Gg: AY/fxX4sflgmd2BeNHdTqTFUJAUtFk9NMSEeQWAbhKpLXo/80D0jWz3GFkQsqHznAR2
 WRtXEk2qQvCEHOTC7nuONXBXJ6Kcjm6efODM9KvI/DEiJNbd3qDJZXvrXS6clurjaEQeUkzwZhG
 YdzMb3vflGh/ZyjOgR/pvLxIb7p7CAV5mOigmxL5jyhFfHcVp7z4z9Ew/9s+k2/d9/bVlt9P17t
 TKTXOqgFjJrR+sHGpaECqVcqWM0FpHmt9T0yaVasiJUcr3cHEWaVFrV6mmJJ5hrqWvnvDExwaxM
 NIIRmuyAYyJvqDqn5bi4OLbdjYckefT1oe6FbQyCJoHYI1hYlKezfYv5pSOg+OI2Wu7oSGUzaI6
 /K6/xbyfzl/ggdKwSRXhJfvHkBVsmQLZLQvLbWT8LwkIO/C7MEcwndBD2f8mQ6kVesZ4=
X-Received: by 2002:ac8:5745:0:b0:4f1:e97a:db01 with SMTP id
 d75a77b69052e-4f4abdbc47dmr162929661cf.78.1766399057174; 
 Mon, 22 Dec 2025 02:24:17 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGrsfs8pegLciKMntDLwPh4gHdtWkKuNF7kiUQEp7MKj3Ke2R+dIpQ0ybat95iqy/IK1BOirQ==
X-Received: by 2002:ac8:5745:0:b0:4f1:e97a:db01 with SMTP id
 d75a77b69052e-4f4abdbc47dmr162929431cf.78.1766399056776; 
 Mon, 22 Dec 2025 02:24:16 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 02:24:16 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v4 00/11] drm/msm: Add support for Kaanapali
Date: Mon, 22 Dec 2025 18:23:49 +0800
Message-Id: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: mTu2jmmpzGAZvw48mCwRcW-qGuewbYzb
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=69491c52 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=qC_FGOx9AAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=peVRiwUDOWJauV5v_QkA:9
 a=iYH6xdkBrDN1Jqds4HTS:22 a=fsdK_YakeE02zTmptMdW:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfXxd43SGaHW7X9
 8crLi+YwYRQvadw1ldA2P1Wj05eNOmaKXgj3LFwjcPj7hUT7C530nqVVmfeShFPUEr3YRhGFNrt
 YJoIXHdYKQZUePdw8qewhH9aVzxPAS8ljl1aYekj4lETkQnQCC2cBSPTM/Uw5f6Xp3U8RBYQ4Sh
 IeNpw7ndZcMk2awO2+VP6N/eEWW1FMwWlT8WFt+mxnDSwfwGoOXOG2OSC6e4rIcY3KkMh3devIB
 uS45paB6ph9K+I5wRIOvoyprG/vswYgZh/F2HWcjVjJU9Ps9swlzyGBqhuoI1kRyfLen6W7pe/v
 EDmarHrGX1YWHkCDeKQc9xXcMY26pvKmyaLCsaAzsMgYRgmaC3diSUsZNx6kjT0cmuCGAb5Y3sf
 lKOwhVbjuVWqwRkfm4MPkqcRHM0VsGHPB5w4plWuN2Wv/s5TU4sGbkenupczNmACCvNsMViA08k
 pR65KNcVyMU+VBsFHgA==
X-Proofpoint-GUID: mTu2jmmpzGAZvw48mCwRcW-qGuewbYzb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220094
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

From: Yuanjie Yang <yuanjiey@qti.qualcomm.com>

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

[PATCH v4 05/11] drm/msm/mdss: Add support for Kaanapali
compile depend on qcom-soc tree patch: https://lore.kernel.org/lkml/20250930-kaana-gpu-support-v1-1-73530b0700ed@oss.qualcomm.com/

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
Changes in v4:
- fix qcom,kaanapali-mdss.yaml compile error
- reorganize SSPP patch order
- fix Dmitry ohter comment
- rebase on top of msm-next
- Link to v3: https://lore.kernel.org/all/20251215083854.577-1-yuanjie.yang@oss.qualcomm.com/

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
  drm/msm/dpu: Refactor SSPP to compatible DPU 13.0.0
  drm/msm/dpu: Add Kaanapali SSPP sub-block support
  drm/msm/dpu: Add support for Kaanapali DPU

 .../display/msm/dsi-controller-main.yaml      |   2 +
 .../bindings/display/msm/dsi-phy-7nm.yaml     |   1 +
 .../display/msm/qcom,kaanapali-mdss.yaml      | 297 +++++++++++
 .../bindings/display/msm/qcom,sm8650-dpu.yaml |   1 +
 drivers/gpu/drm/msm/Makefile                  |   1 +
 .../disp/dpu1/catalog/dpu_13_0_kaanapali.h    | 492 ++++++++++++++++++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c    |  41 ++
 .../gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h    |  15 +
 .../gpu/drm/msm/disp/dpu1/dpu_hw_interrupts.c |  89 +++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c   | 123 +++--
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
 22 files changed, 1474 insertions(+), 54 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/display/msm/qcom,kaanapali-mdss.yaml
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/catalog/dpu_13_0_kaanapali.h
 create mode 100644 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp_v13.c


base-commit: 06aa394d58c11406569bcbd4a69b81290edf3f63
-- 
2.34.1

