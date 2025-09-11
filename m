Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 91367B53666
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 16:55:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 6D0E210E37A;
	Thu, 11 Sep 2025 14:55:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="i5GLLpNV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 14F2E10E37A
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:55:37 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB3Y4a006943
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:55:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=/xEH5bhCDH+EambDfpLJYH
 Y3ZvSSk+a6Bg2AG4xJvXg=; b=i5GLLpNVVOTy2CW0REr5xB0CVkwKWoa/nOY0Mz
 wfJuewuRr4rQ3XXbvGR5f1cL+hzkp6VaW4mus7Rppxp42EtCqo737Z4WisH8xxEt
 JddOqTCEmwc2gYdnm6WhvEPtMVAoPsdN0pAHpheVWcqe81jByEvaQ9qDybuYeoQ9
 W2SItl6kOFh97G5XtDmE0wKzsNgSM3Y19pcdFWZlmAtEishR9yUxVbjn/IxOhaVo
 5V23rmpXuwxfVBhE6RIQlFLrrKVBdolb+51/6CG1M8PGrRUdg/IUt4H/1UHPPW59
 4rCe2kVUll+DVn6Fs1UvHolgvSXxie51iUWifFhUOZ7hivHw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490e8ag53k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 14:55:36 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b521f77d978so158696a12.1
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 07:55:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757602536; x=1758207336;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=/xEH5bhCDH+EambDfpLJYHY3ZvSSk+a6Bg2AG4xJvXg=;
 b=enQZ20rrZfMHCZpY/NxIFyu+HNd2okJO5gPT3PimHRDILL13gDDVTZXZfUp8uMLoHi
 3s+xFT9SIavemEBcKCMN6LwqolGBohtYC0EDkg6cDDRqHzRduZI3GJRlxRBCkk2da4q5
 ROmNYb6iSgRy/P0lB56PBJho3hPXr/FMygnRiCyHx5UsVa6z1wvFaFvkvx7v2X/H9Dp8
 3UVxxg4PT+X25XRxDQXCQ5Q4mIATfBq1MDo8yU2EeI+4K/0hZ27QQOafaXrdUpkj0FZ3
 fFVnJbHdDlDpACTGR09dvBQL9i9sBr90E8L/EdWUB8rEGlvmGxNuQ5hdNvSeRE/rgG/R
 AENA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmS2isLCdLylZKXb70NSIyYTYaCxpD/LkQJdMQXUG1nraMf6hf8vwpbGa/b2FwbcWnt2PQgczCSW8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxejBUzvAv/3I3gwfSFg57A4HN+wcQ63g82PKc82J74vwmIdtfP
 DQR8PMrXWr6v/lGLXDYhBDJxr/JcjNVuTxkCtBNpiBRA+ezrxWjz+nJiE7jIRSLpSnWJ/vDC+hm
 o+nc/iql93EPdGwW47p2S2zN4KPe8grjYv0Xt74MTD4Hcus1tofXAYYzckRZhB2VoLijp06Y=
X-Gm-Gg: ASbGncu0UMFlKLH5zrbvgvlrosukVcasLudASP2JFAWgpf9ZoWnyVoMbK8JDn1W6fzf
 +dmRWfEFLtmRhtg8AN5N9HOxJlr5dmsVCalbUSncRC5rSQPwfwStzgmuLqYnL7SGyUcuZ9PKNRF
 v92H+xK5Huaii2RUCgkWiF/Mz1+TbwDjWn8MFEyFevnnd6T9upC6tbfBswZswz4X6H21tEyTEAw
 TAurltNXG/JFhbm7cAzASNrqbqmKSp86nG0F6Chdv5ltiVZrMwUGZ7zSvEEqKt6Rt9kY4iAS+/0
 quSS9rNT6g9NuIfZj8Yq+nZXtmBx+cNVniKfNE0U26rlWs1PgSN2uEjuzWe8tyXr2qQkYQ0N3Fe
 3ej3rEoSzETv6EsmKvFp4vb1bYwf309/TcbeJr1ANlXkDrOU2C7w64eyd
X-Received: by 2002:a05:6a20:3c90:b0:249:ce31:f771 with SMTP id
 adf61e73a8af0-2533e47d9abmr15639420637.2.1757602535609; 
 Thu, 11 Sep 2025 07:55:35 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHxaoAZb131tH41lL2qHb/K1dU+uAWx1P1xOf2PHZqYOFrD6zV6LGLcSxOT6jLhp1rAFlJicQ==
X-Received: by 2002:a05:6a20:3c90:b0:249:ce31:f771 with SMTP id
 adf61e73a8af0-2533e47d9abmr15639396637.2.1757602535088; 
 Thu, 11 Sep 2025 07:55:35 -0700 (PDT)
Received: from sziotdisp01-gv.qualcomm.com.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b54a387cd4bsm2107453a12.35.2025.09.11.07.55.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 07:55:34 -0700 (PDT)
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
Subject: [PATCH v4 00/13] Add DisplayPort support for QCS615 platform
Date: Thu, 11 Sep 2025 22:54:57 +0800
Message-Id: <20250911-add-displayport-support-for-qcs615-platform-v4-0-2702bdda14ed@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-B4-Tracking: v=1; b=H4sIAMPiwmgC/5XOTW6DMBAF4KtEXteRZ2wK7ir3qLIw/mksBQw2o
 EQRd++AVGXTDavRm5HeNy9WfI6+sK/Ti2W/xBJTT0F9nJi9mf7H8+goMxRYCQ3AjXPcxTLczXN
 IeeJlHvYZUuajLZ9QcbpNFDuOQdTosTUoNaPGIfsQH7v2faV8i2VK+bnjC2zbzVEAqA85C3DBh
 TZKysZp6cNlnKONvT3b1LFNWvCvvaKX8Fg7UrvCVglZQw2huaRSzuNs7tTevQn5JhoUxwhJBL3
 fOqy8ldr+Q6zr+gsijr6+rgEAAA==
X-Change-ID: 20250911-add-displayport-support-for-qcs615-platform-2f072e2ba239
To: Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, linux-phy@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com, tingwei.zhang@oss.qualcomm.com,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757602527; l=4013;
 i=xiangxu.yin@oss.qualcomm.com; s=20241125; h=from:subject:message-id;
 bh=PxQ+Nl+6gXCfV0SnVCZ6IaDcnEi2VND1S9/H0brbNM8=;
 b=A3jxmUUA2sbBI+BX54DDNMZhtyvRapP9PvOmX6yKpvtKD3v4cUgHbeOLw8W0YXg71m/8SEC5q
 PIm0TDCnoZVAoAYe6fq2H1VETMItFDUUQOJl/5mAVI6JMEu2+p4zrA6
X-Developer-Key: i=xiangxu.yin@oss.qualcomm.com; a=ed25519;
 pk=F1TwipJzpywfbt3n/RPi4l/A4AVF+QC89XzCHgZYaOc=
X-Authority-Analysis: v=2.4 cv=H7Dbw/Yi c=1 sm=1 tr=0 ts=68c2e2e8 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=COk6AnOGAAAA:8 a=NhqbsNcZucgFEQMbMWwA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=_Vgx9l1VpLgwpw_dHYaR:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: 9oxCTrtVeJwAX-dg6m3jP08ghYQUqIuK
X-Proofpoint-ORIG-GUID: 9oxCTrtVeJwAX-dg6m3jP08ghYQUqIuK
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzOSBTYWx0ZWRfX6eJ23nOfVTZU
 8/gudAVIFckchSOxKqdErFPgwZjFzTJRpGgZpIZkL7zAqzJQnc0J1XwuqxwWx6Xwu738MRJ5o3d
 B5fo8FpoPd79ANavXTdmh/AAtAsHmbYvnPn/a79XCS5N/MB7HtiS6ExVSR2AsxssHz0IkAzDTl2
 xCi+HUXPmykbFrcS96HwcxBYAeoSFsD7dZJVqDCjXPJhVNTA2CWT1A2kcCdkMfAXYdQRXNtCOyi
 xVlhUyrVeCReU6mzjX2yYGvUWUODA1bmn5v3TRt28NYlDEJGIFaX7Xypc+qDxF31lv5/A/ZkgtI
 PlQj57irKiZL45hJSpqd9QDTxz14KymZ9VRWIipVnoH6LkSGKClwoVngsHjsTSPOT5Y4rxhGI+p
 w96dRIFb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-11_01,2025-09-11_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 bulkscore=0 impostorscore=0 adultscore=0 phishscore=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060039
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

This series aims to extend the USB-C PHY to support DP mode and enable
DisplayPort on the Qualcomm QCS615 platform.

The devicetree modification for DisplayPort on QCS615 will be provided
in a future patch.

Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
---
Changes in v4:

- Drop patch v3[01/14 & 13/14], will sutbmit new patchsets based mst dt binding series.
- Update maintainer of qcom,qcs615-qmp-usb3dp-phy.yaml to myself.
- Add missing aux and pipe clocks. [Dmitry]
- Drop second TCSR phandle; register offsets are described directly. [Dmitry]
- Add USBC PHY series related init_load_uA configs. [Dmitry]
- Drop v3[04/14] qmp_phy_usbc_type define and use dp_serdes offsets to confirm DP capability [Dmitry]
- Reorganize sub-patches as suggested.
- Link to v3: https://lore.kernel.org/all/20250820-add-displayport-support-for-qcs615-platform-v3-0-a43bd25ec39c@oss.qualcomm.com/

Changes in v3:

- Renamed qcom,qcs615-qmp-dp-phy.yaml in v2 to qcom,qcs615-qmp-dp-phy.yaml in v3 for QCS615 USB3+DP PHY.
- Updated patch v3[02/14] to revise binding title, description, and property order. [Krzysztof]
- Updated commit messages in patch v3[01/14] and [13/14] to reflect the DTSI rename and clarify compatibility. [Krzysztof]
- Added USB3+DP mode implementation in patches v3 [003–012], organized in logical chunks. [Dmitry]
- Dropped patch v2[03/13] to maintain full backward compatibility with USBC.
- Link to v2: https://lore.kernel.org/all/20250722-add-displayport-support-for-qcs615-platform-v2-0-42b4037171f8@oss.qualcomm.com/

Changes in v2:

- Add new binding qcom,qcs615-qmp-dp-phy.yaml for QCS615 standalone DP
- Split DP PHY driver into patches 4-11 by logical chunks [Dmitry]
- Update DP PHY configuration flow to align with QMP Combo PHY implementation [Dmitry]
- Update all hex values to lowercase [Dmitry]
- Remove redundant comments in DP PHY driver [Krzysztof]
- Remove invalid USBC type define [Dmitry]
- Move lane_map， max_dp_lanes， max_dp_link_rate parsing logic to dp_link [Dmitry]
- Add TCSR-based mutex logic for DP and USB PHY coexistence [Dmitry]
- Drop patches 6–8 and remove related binding properties as rejected upstream
- Link to v1: https://lore.kernel.org/all/20241129-add-displayport-support-for-qcs615-platform-v1-0-09a4338d93ef@quicinc.com/

---
Xiangxu Yin (13):
      dt-bindings: phy: Add QMP USB3+DP PHY for QCS615
      phy: qcom: qmp-usbc: Rename USB-specific ops to prepare for DP support
      phy: qcom: qmp-usbc: Add DP-related fields for USB/DP switchable PHY
      phy: qcom: qmp-usbc: Add QCS615 DP PHY configuration and init data
      phy: qcom: qmp-usbc: Add regulator init_load support
      phy: qcom: qmp-usbc: Move reset config into PHY cfg
      phy: qcom: qmp-usbc: Add DP PHY configuration support for QCS615
      phy: qcom: qmp-usbc: Add USB/DP switchable PHY clk register
      phy: qcom: qmp-usbc: Add TCSR parsing and PHY mode setting
      phy: qcom: qmp-usbc: Add DP PHY ops for USB/DP switchable Type-C PHYs
      phy: qcom: qmp-usbc: Add USB/DP mutex handling
      drm/msm/dp: move link-specific parsing from dp_panel to dp_link
      drm/msm/dp: Add support for lane mapping configuration

 .../bindings/phy/qcom,qcs615-qmp-usb3dp-phy.yaml   |  111 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c                   |   10 +-
 drivers/gpu/drm/msm/dp/dp_link.c                   |   71 ++
 drivers/gpu/drm/msm/dp/dp_link.h                   |    5 +
 drivers/gpu/drm/msm/dp/dp_panel.c                  |   78 +-
 drivers/gpu/drm/msm/dp/dp_panel.h                  |    3 -
 drivers/phy/qualcomm/phy-qcom-qmp-dp-phy-v2.h      |   21 +
 drivers/phy/qualcomm/phy-qcom-qmp-usbc.c           | 1089 +++++++++++++++++---
 8 files changed, 1192 insertions(+), 196 deletions(-)
---
base-commit: 8f21d9da46702c4d6951ba60ca8a05f42870fe8f
change-id: 20250911-add-displayport-support-for-qcs615-platform-2f072e2ba239

Best regards,
-- 
Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>

