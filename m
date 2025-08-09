Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EA636B1F178
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 02:35:39 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C8DDC10E204;
	Sat,  9 Aug 2025 00:35:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nU4a4UC9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D4E1110E200
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:37 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 578EC4jH003627
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:37 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=ZbGX5bxjJoDa8OQ/Re32Qt
 hpJZzf8LuGqJ7nEgpoBBU=; b=nU4a4UC95r8zh3UAkKBuonofP0oxbbv8+V3dDP
 PndUx+IBRExGN8NXOBqhVI7ID2JemTF52Ob6pZDlIe4G1kWt9zrB2ir6P25AXoVy
 WPnzUZD36lEyNS4ggguh0zGywmljQAlOCyJL9qUsDiLP+v95qzukPN8LlziTkU8D
 vpVl5mF9wBYTnWARh7BjZKiO6bEA8Sz4eH43p5rl4kxhsnzR8kmC6C/kQ26ThHx4
 7A0Cw/jboAOjQRKQYxeraPD4JNBiMIWOkwM2Acl+4kyzcoucwVlbhgEDdY+s/YxI
 p6dNVoT+2gBozw1F6iEjkbtk4Pi/TvhGKGhj8jw8z3F1PCGA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48bpyakhuq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:37 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b2fcbd76b61so4176079a12.3
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:37 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699736; x=1755304536;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ZbGX5bxjJoDa8OQ/Re32QthpJZzf8LuGqJ7nEgpoBBU=;
 b=DDQ0t6DTXVQOO3LYQfpBGS8PamMpA+PyFs5604T+22E+5oA/UhP8ItWnHO/YCb6mDq
 8xu2pXzHzR9HUH79oaccGcXDfpV7fY/IDcRAqXkMRESD+Zep7bbaMifs1rZd66XU+7IV
 8bYOIkCq/Xl3zNqFXJhYU23dJEwJY4NVyHCC4E1IkMSqPEFHRozKMOlKCAm/hs1IkVM2
 3K39Pcu+2PMqpS/c/hRicHaM0GzYynpJDLRFJWU0kKMf0/14tI2MiD02wFiEJrFVPo+T
 Q4uSSK+yafI1T3vT8AKKXj2P6FGVe/PlQbpw0UFsydsI0nmwY/BhXamCQywozzpEeUrA
 TXqA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXGOu7LpSVcsVNhsDElpkD1iB21Kt/3W/TvlEjbY1HbdefF/RBcZXm1woHV+Tv226uXfXjZokNM+FA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzRfwFUY7CLra9XnIXOLWHaiblQfus9xBsCmdCTy9kLcVvKTu+
 Y3VPvkv0m7CL0cefmH4G8w76JfvYcwhqUrkLUp2vcuEQAxETQ6JkhDrKvAKmD00zHLHryIw48VR
 M8bT4R3oOUEmpVpvckDrjGsm2EhdXGGiOgZPMe1pgQVDKcWx1AdosrOlJCDX21hCAUMJv96I=
X-Gm-Gg: ASbGncu9sFt8S+omhaiMcHg9IVzUS1rgcWBNh79z9BBjIZ+6afw+NP4uGK81BEqrEng
 WoolJPrwXHv1eI8fiRcRMgBVZIWXtSEEOtCYsc+IUhboEvwGaWRPPx9X61hNeVaxk+kGC27AFhj
 2zo38sJUnaJLf6dHhzDp+HWE0Ty9gnpccX2toi+Ya/WHwM9njG9aGTmDGytbSW0W1fchsw/erP0
 Y8M5Y8cja/z2mGyri563m1yIH+0kjeyA+PYthoxkyvSWw3HJNpAovmid9jrWbzetm/Yk+ZKD5Vs
 XK1X5kTN5jjEwmau7oDm8zmqmozK9i5N0ig/CkdoEV6mPf9e/vVmH9IVOom0KEeVFO+in7KYAdJ
 UKcpGxrFYg426MQFRWZ6bQI00
X-Received: by 2002:a17:902:cf04:b0:240:7308:aecb with SMTP id
 d9443c01a7336-242c21ff8f9mr89428155ad.32.1754699736238; 
 Fri, 08 Aug 2025 17:35:36 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGi+7fe4uPTv690KlXyI03z9asGDkSfIXdbnLoKLJoKkTTJSV1FDnOhicgZI/Utxq39clnAPQ==
X-Received: by 2002:a17:902:cf04:b0:240:7308:aecb with SMTP id
 d9443c01a7336-242c21ff8f9mr89427815ad.32.1754699735782; 
 Fri, 08 Aug 2025 17:35:35 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.34
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:35 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH v2 00/12] drm/msm/dp: Drop the HPD state machine
Date: Fri, 08 Aug 2025 17:35:12 -0700
Message-Id: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAMCXlmgC/1WMQQ7CIBBFr9LMWhoYijWuvIfpglIqJLa0oETTc
 HfHunIzyZv//9sg2ehtgnO1QbTZJx9mAjxUYJyeb5b5gRiQo+IKJXPLwKIdtXmEyNrGouqVOiL
 XQJOFEv/addeO2PlEtfduz+L7/YlaIf5FWTDOpDS9NieUo2wuIaV6feq7CdNU04GulPIBJLDWG
 K8AAAA=
X-Change-ID: 20250523-hpd-refactor-74e25b55620a
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=2514;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=GcppbpLyBA9b1yf2lCD9BuTJMMUuGA+FkmOmn+rmg2s=;
 b=4JF/mkzCvIDHNqLd9NKmhnVuxsW0hiYQreE5SpMBbfbel+6PDV1d5C+Cb38ZRK1JqxcUnFZ4s
 mmHrn7CAiP5AMbC+8MtborBGBd2E4rpRpdWZ1V5/XNJtMoaJgUAEPlk
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-ORIG-GUID: XPVcQYIWazgydXlAu_oLPdk01HYDJ8Jk
X-Authority-Analysis: v=2.4 cv=MrlS63ae c=1 sm=1 tr=0 ts=689697d9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8
 a=EUspDBNiAAAA:8 a=ykQkPS02loRjcs06OSIA:9 a=QEXdDO2ut3YA:10
 a=3WC7DwWrALyhR5TkjVHa:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA2MDAwOSBTYWx0ZWRfXx2xZWm40iGvg
 yupddEZsaEXwMJ9n6nEaJHa0VkpCrvVae4QUgSQrcOsleDLZCdHT9Cfh8LaFOWlKeZd+mEE98m5
 KnyqhBPXnowTjrsWw1L9Z4xdJVjILL/3wji3T+JgaPtRQzw/ol92JJEPY+1Gp9+bd3cMdyj9aNz
 8+YOADEjGZGeqP5twrG6vb0WQJ+G6WdjvoqjGYTyPDk/OXJUc+kSP7ghFL3r5Oz9EaOJhuZXlVT
 qiO3rchYdRG3uDxqzJTFzTAbBNyuPfByRiciH/wvWSv7yDTJcgyYzvTRny3qY/gCyKjb8m4JTps
 47fgU1QhU3rYlQmwY4XuHxjWkgvUiuURSh+orQGRSrugIDgqiExftFj35pV+4tzMwogT+HjQgcm
 K+MLaKUE
X-Proofpoint-GUID: XPVcQYIWazgydXlAu_oLPdk01HYDJ8Jk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 suspectscore=0 adultscore=0 priorityscore=1501 phishscore=0
 spamscore=0 bulkscore=0 clxscore=1015 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508060009
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

Currently, all HPD interrupt handling must go through the HPD state
machine.

This has caused many issues where the DRM framework assumes that DP is
in one state while the state machine is stuck in another state.

As discussed here [1], this series:

- Removes the state machine
- Moves link training to atomic_enable()
- Changes the detect() behavior to return true if a display is physically
  plugged in (as opposed to if the DP link is ready).
- Remove event queue and move internal HPD handling to hpd_notify()

This has been validated on x1e80100-crd and sa8775p-ride. Any help
testing on other platforms/use-cases would be appreciated!

[1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738

---
Changes in v2:
- Dropped event queue (Dmitry)
- Moved internal HPD handling to use hpd_notify() (Dmitry)
- Reworked bridge detect() to read DPCP and sink count (Dmitry)
- Moved setting of link_trained to plug/unplugged handling
- Dropped msm_dp::connected (Dmitry)
- Squashed all hpd state related patches (Dmitry)
- Link to v1: https://lore.kernel.org/r/20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com

---
Abhinav Kumar (1):
      drm/msm/dp: remove redundant checks related to ST_DISPLAY_OFF in plug handler

Jessica Zhang (11):
      drm/msm/dp: fix HPD state status bit shift value
      drm/msm/dp: Fix the ISR_* enum values
      drm/msm/dp: Read DPCD and sink count in bridge detect()
      drm/msm/dp: Move link training to atomic_enable()
      drm/msm/dp: Drop EV_USER_NOTIFICATION
      drm/msm/dp: Use drm_bridge_hpd_notify()
      drm/msm/dp: Handle internal HPD IRQ in hpd_notify()
      drm/msm/dp: Drop event waitqueue
      drm/msm/dp: Return early from atomic_enable() if cable is not connected
      drm/msm/dp: drop the entire HPD state machine
      drm/msm/dp: Add sink_count and link_ready to debug logs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 --
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 580 +++++++++++-------------------------
 drivers/gpu/drm/msm/dp/dp_display.h |   1 +
 drivers/gpu/drm/msm/dp/dp_drm.c     |  20 +-
 drivers/gpu/drm/msm/dp/dp_drm.h     |   1 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |   2 +-
 7 files changed, 187 insertions(+), 440 deletions(-)
---
base-commit: 8290d37ad2b087bbcfe65fa5bcaf260e184b250a
change-id: 20250523-hpd-refactor-74e25b55620a

Best regards,
--  
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

