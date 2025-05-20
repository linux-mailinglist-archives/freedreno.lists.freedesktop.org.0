Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 23910ABE4F3
	for <lists+freedreno@lfdr.de>; Tue, 20 May 2025 22:45:00 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id F022A10E55C;
	Tue, 20 May 2025 20:44:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ludPCjVp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 891A610E0A2
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 20:44:57 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54KGeqQh016921
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 20:44:52 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=CnhEAhcJpQDgCGDvh46RTj
 Mj70tEmGh9F2KinGlWxFc=; b=ludPCjVpTFJkbjufdT8J1F5lvW9Xegoi+XLqb7
 CV10DQlYvLak/aB54M3Xx4I/38nSwr79c6um/ULPMTgVAbAyEqorClVstrXC58lD
 2pSoT6aSt5jbt8niKXpxSjWIbyuTlvqGftylKQO+6Ytae/vcYxpPF0N7oZeaJwW5
 v06dQdkYBcEy6JtrwI7jQYmNGxcSRdG253VOpab85aghNjttOpZ+bvT4vkOG4WeE
 T9lRx4uzMCPN+9nfio3ToGS5Oz4X19egzL/kkd8R55LA1Ahmi6bVrNK6UeDRQmYv
 2ghM2FQ/nsTPJo/mur7GmuKSe8qst7eY1f6XGfXafCNsX0Fg==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwfb0k89-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 20:44:52 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-6f8aaba2f62so113452736d6.1
 for <freedreno@lists.freedesktop.org>; Tue, 20 May 2025 13:44:52 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747773892; x=1748378692;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=CnhEAhcJpQDgCGDvh46RTjMj70tEmGh9F2KinGlWxFc=;
 b=BBaywgjN7ELX363ilYJg7FlDR2P3FXlhHu0cOldYoNEaFbteMxiRLxJl0jQjR7DOyQ
 XGyE2tOMjemfqgObMV3t14P0/d/Q6V/ip3bBveTQvruPdD/F1pR9SGoBfokHTYiID4FB
 rJbj93GgKSy3teNMOBIxB05vnCW21z/ou5kATbeM3pxEIOaorH1eqwcNSbgOfGjPZ1XZ
 bCJmmrfkVZfv8JJXa2ayzDRA8Ivhl3hP+HZ1C20t6V+IaSTD9W5tPPYbzVfkxLYH4zyj
 Ysmm4Un/mczeDlayV8r9nHS8pl6LWwzzcSG/SJ/rvlsPRDkSYqLzIdd9W7J22c+Zfs3m
 xRQw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUfpgPL9YxcvXMrp8n/OZyaEelfTYHGs4AFUChgXuP1RhOzbRVCLAqP7yBIKeJv5OCyqlKE5VbPjWo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHh/VakEpgJppeHg52PXMGb5pN+WhQwf1Lamo0C6nr82Xc5SCb
 Pln+H1QTzHdxkF5HnWTaU2+MfU4vrNlIF1e/gyuX9qso7vrIzgOU4h6ntdferlbQ9P7Mm1Nx76X
 Btnxt4JB6R2wCxba6RnjDwiCt61Pmguakz00vKXcTMmGy7NjrndXqjkHNOaAPkQRKQuwmS/s=
X-Gm-Gg: ASbGnctABA0proQmRzCCf+OZr5tKI8Qj10bAnI1QpaYx/BN1BCBkzpWjjN83WUkOhZ8
 8Ine3tVewIxk91g/+uGqtTWL9ncun2QUdK3vF7EhLIeqRGGHUsfFsKJiyUYYe4F+1yShdX1Besx
 HAET3R/5Yd358pF6LpPOuOAL0t805J1NAcUUJFOUb2f5lxxwLw3hxbHANRCtXEEN0nVpXE0V4OM
 zZ07VO89nyec82Of8InL2o9tpks1yj5bDGtUclPLgttNScaYpCNB2EqhAsHRW/9yFtC2Ix3yP9t
 eOvNi8cHPOuJ4UbDJGCn3JeJra3VdU9yIc2pzMfLXKYoWrqp1DEWtWwVTelbykD0CndSPcihFyh
 DtRJzBSloUnMibqpdHwod9Ep9
X-Received: by 2002:ad4:5c49:0:b0:6f8:d920:6962 with SMTP id
 6a1803df08f44-6f8d9206bd4mr119468226d6.14.1747773891736; 
 Tue, 20 May 2025 13:44:51 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHGfp+ypX9kSBxgzbkN+MgSu5aIfQQmM0ZkghxJplqrv3tEo+2xeiuUHFeyxXpUk9ezuAwdhA==
X-Received: by 2002:ad4:5c49:0:b0:6f8:d920:6962 with SMTP id
 6a1803df08f44-6f8d9206bd4mr119467926d6.14.1747773891241; 
 Tue, 20 May 2025 13:44:51 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e6f163ccsm2497950e87.39.2025.05.20.13.44.49
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 20 May 2025 13:44:49 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v4 0/5] drm/msm/hdmi & phy: use generic PHY framework
Date: Tue, 20 May 2025 23:44:42 +0300
Message-Id: <20250520-fd-hdmi-phy-v4-0-fcbaa652ad75@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALrpLGgC/zXMQQqDMBBA0avIrDuSiaGarnqP0kWiiQmtRiYiF
 fHuDYUu3+L/A7Lj6DLcqgPYbTHHNBeoSwV9MPPoMA7FIIVUgoRGP2AYpohL2FEp2zWkve37Fkq
 xsPPx87s9nsWe04RrYGf+j0Zo2RHRtRE1SWoVaSQsv5X32hrec3il7f6Os+FUJx7hPL/eOzUUp
 AAAAA==
X-Change-ID: 20240109-fd-hdmi-phy-44b8319fbcc7
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Kishon Vijay Abraham I <kishon@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-phy@lists.infradead.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3665;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PA+tCKwTo1nH+Lso+Uwg7CdiMtEk2emhO7vsfJ9adLI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoLOnABXk81kaZokLdiRD1RUNWGemqA1YFMLllF
 8hqIxr9ewCJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCzpwAAKCRCLPIo+Aiko
 1XGYB/9dPRhf86STXfF/uE1qb1TGI/f4ZSLGsiECHc/89fO5BSSm418umoc5AOiIwXGAm3B6JjO
 mOZvsLU1z7MspwYTdtlCgg5TILBd8hjF9c/gXk88g4U458MGK0DeKV16vwmp03DrehbbmQd4qpe
 BMJ4d+AMsSm2q7iAbSi5pllmP4dpciCdUalImp2CsoOsDRcI2WQ8oC5fDK/YLPZMn3dn4QXGY0M
 nj/elZWzy8TZq7iqunmFG0oeOVPvDmhxHCNmPImrcobEXvWetj7qdNPqUwjk29WEi1sFmc2shBY
 nLtLpx8bcdlN5XTSymqHtEW6JSeWIUBLGDp2nJoZihXt75UA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: ZeFUu0gq8C_jQR3hROST112FJS3KwLst
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIwMDE2OCBTYWx0ZWRfXylPhHT0BHnug
 f2v3+0g4Mc0sRkbD/5QWO62ci7Op3DxkaC5WIbUIHJAH8PNh/7Y2HXBND5q/TjVJwnANkhXYHI/
 /SY0VTWhsx7lUZrVniSwQ0JpMN8cyt/UB+ojAbtRcjOMQurv+nA7wvYwssxpUeTpGJFHE8rJmJJ
 xm7+mfVgZhd7s8ko0LjkFMBRdgaI/x4WwDlSurBqwGAD5CewRFD//ADyCTnAy5edi5mS2D5octR
 dxibR4nBG99tEVidkpPhCDI2FYlcQDyP2wBRGfmS18DJpWrschSYyYkYMZh4GzMXDfc31WlbG9K
 4cBGLkFX5sVNnxS+/C3SlQRoIiqW2nfzOBREHXT/dx22XLY+NaL8aYkt/AYGYUnxe8blvThtk2w
 qY9ITXUqSE+N7PiA/aZq0ypfvyVaCJWdUh8luS1lFO/2j+MjmNpO4eTOgEQw5kaKfyTuvFKq
X-Proofpoint-GUID: ZeFUu0gq8C_jQR3hROST112FJS3KwLst
X-Authority-Analysis: v=2.4 cv=dLCmmPZb c=1 sm=1 tr=0 ts=682ce9c4 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=I5G884IeurQlcsuiieMA:9 a=QEXdDO2ut3YA:10
 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-20_09,2025-05-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 adultscore=0 bulkscore=0 phishscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505200168
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

The MSM HDMI PHYs have been using the ad-hoc approach / API instead of
using the generic API framework. Move MSM HDMI PHY drivers to
drivers/phy/qualcomm and rework them to use generic PHY framework. This
way all the QMP-related code is kept at the same place.
Also MSM8974 HDMI PHY, 28nm DSI PHY and apq8964 SATA PHY now can use
common helpers for the UNI PLL.

This also causes some design changes. Currently on MSM8996 the HDMI PLL
implements clock's set_rate(), while other HDMI PHY drivers used the
ad-hoc PHY API for setting the PLL rate (this includes in-tree MSM8960
driver and posted, but not merged, MSM8974 driver). This might result in
the PLL being set to one rate, while the rest of the PHY being tuned to
work at another rate. Adopt the latter idea and always use
phy_configure() to tune the PHY and set the PLL rate.

Merge strategy: cross-tree merge via the immutable tag.

Changes since v2:
- Rebased on top of linux-next, solving conflicts
- Squashed add-and-remove patches into a single git mv patch
- Dropped HDMI PHY header patch (merged upstream)

Changes since v1:
- Changed msm8960 / apq8064 to calculate register data instead of using
  fixed tables. This extends the list of supported modes.
  (Implementation is based on mdss-hdmi-pll-28lpm.c from msm-4.14).

- Fixed the reprogramming of PLL rate on apq8064.

- Merged all non-QMP HDMI PHY drivers into a common PHY_QCOM_HDMI
  driver (suggested by Rob Clark)

---
Dmitry Baryshkov (5):
      drm/msm/hdmi: switch to generic PHY subsystem
      phy: qcom: apq8064-sata: extract UNI PLL register defines
      phy: qcom-uniphy: add more registers from display PHYs
      phy: qualcomm: add MSM8974 HDMI PHY support
      drm/msm/registers: drop HDMI PHY register definitions

 drivers/gpu/drm/msm/Makefile                     |   7 -
 drivers/gpu/drm/msm/hdmi/hdmi.c                  |  58 +-
 drivers/gpu/drm/msm/hdmi/hdmi.h                  |  80 +--
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c           |  32 +-
 drivers/gpu/drm/msm/hdmi/hdmi_phy.c              | 225 -------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8960.c         |  51 --
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8996.c         | 765 ----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8998.c         | 769 -----------------------
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x60.c         | 141 -----
 drivers/gpu/drm/msm/hdmi/hdmi_phy_8x74.c         |  44 --
 drivers/gpu/drm/msm/hdmi/hdmi_pll_8960.c         | 458 --------------
 drivers/gpu/drm/msm/registers/display/hdmi.xml   | 537 ----------------
 drivers/phy/qualcomm/Kconfig                     |  21 +
 drivers/phy/qualcomm/Makefile                    |  14 +
 drivers/phy/qualcomm/phy-qcom-apq8064-sata.c     |  23 +-
 drivers/phy/qualcomm/phy-qcom-hdmi-28hpm.c       | 330 ++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-28lpm.c       | 441 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-45nm.c        | 186 ++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.c      | 212 +++++++
 drivers/phy/qualcomm/phy-qcom-hdmi-preqmp.h      |  81 +++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-base.c    | 185 ++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8996.c | 442 +++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi-msm8998.c | 495 +++++++++++++++
 drivers/phy/qualcomm/phy-qcom-qmp-hdmi.h         |  77 +++
 drivers/phy/qualcomm/phy-qcom-uniphy.h           |  65 ++
 25 files changed, 2584 insertions(+), 3155 deletions(-)
---
base-commit: a0fd124020ae02815905d4c6808261bfd262ac08
change-id: 20240109-fd-hdmi-phy-44b8319fbcc7

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

