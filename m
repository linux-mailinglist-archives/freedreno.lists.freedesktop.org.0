Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 28C1FD22CF8
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 08:29:20 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5ACA910E6C2;
	Thu, 15 Jan 2026 07:29:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ApFqPLMn";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Fh9GYyqU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 05BB110E6BC
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:13 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6g4Kg783533
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:13 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=h72bZwdSi+QRO6gwAB/PZa
 NU8NpDQH/mFKJvFIHBoMk=; b=ApFqPLMn4dBPDTyNTmXb9QMxAItLkKkUzkW2yL
 kmM2waxBqeFB5qLZ6Kw2JPDus/IdLKlMTR8m1ycmgr09/Q+tDLt2RHGfPvdPpTw7
 1+JzOp2ZBH2wEn62oLDwiC0I2B1jKQ4MgYwAZu9VBF86zeDMibW2FdUnRyMvggaj
 4lZbMks/DX+GmzHzKhts4eyR4L//CelWddgSut5TscvYUJGn0cMsyx8puh8pTmma
 zlOBOMFogkDTS/kpUgH1nlOPbBuX7Cj84tPefpYIFfz7dO9xyz/e0CKjTmwjf+6Q
 mJvZJ26xt5kpkxZG/2qjSanLS2Xv90TXha9hBJaENL98JxpA==
Received: from mail-qk1-f198.google.com (mail-qk1-f198.google.com
 [209.85.222.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbj5jyxp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 07:29:12 +0000 (GMT)
Received: by mail-qk1-f198.google.com with SMTP id
 af79cd13be357-8c52fd4cca2so160765285a.3
 for <freedreno@lists.freedesktop.org>; Wed, 14 Jan 2026 23:29:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768462152; x=1769066952;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=h72bZwdSi+QRO6gwAB/PZaNU8NpDQH/mFKJvFIHBoMk=;
 b=Fh9GYyqU3TztJEFmQZE+W9Iog50RlBMjqxZ8inqdp3ugwi+GQh9+Rhs5DDfgvRkcNe
 MWYDRAOrU7NFfHScv0sxEBYc1z7r7yY52LYnbTyXH3PIQ0u9Qf9Z+Q8dvL6ng7E0HEB/
 cvmgUlULQrK9aR69KH9dEJd4NV0PY4uIakpumTDzibRg5uG6g01cyR36+Pn9RdKjU3sN
 BcnD0l3IowtZmRMDHJgsrpoJYeJlkw8lBdpfoEv67rNdQVWBiYYvMxBJfYGhA0zKCBQ4
 PrDL1oaujISPh26YihnTuS6SxrAmuAlsJTGBjfS0FDLOQ33PBhz3/heZowPHPJf7U2wr
 MpSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768462152; x=1769066952;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=h72bZwdSi+QRO6gwAB/PZaNU8NpDQH/mFKJvFIHBoMk=;
 b=R2vOsh0V7fbL/KW4LxKoZAH2o36SEY71iQbrxoEGM1MdMcU7b5wMVe0gTtP9rcVVCq
 bpqRJWrjDiblkFTwauYx1O9IiFw1xTDCIAl8tJeRV8Evo6G8kbW21BZg9/sElur8ubGx
 Ha5S8eKqiFtFNaBi2LaiwLnshML3ihueXed7+PYP82JMYbmaryxtty3NA6h4lJJA7EH6
 y/kLzGBzC0XniJJlb+EU28fHDi12lIwjyaE4j6U4Pt9D3NBh1mJImm1ps+tnGGtkoZ9K
 T5O1t5pGUiRlzfcDHod8oQZeS/EN87+ASgQY6rKb56NzOlEeHTMCiyNyNptmv0UBjZGf
 DY2Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9IWotx352YPsOgtrfGzrbQmGRMxhSogJHwgai2QgH7yCQBfy1yS0Az/foQ807cIGyEb8xK2TDYIE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz05v4tKj8OWJrLtB1Mw9P2I+8glY5rsZL40ao/dadXG0dIwvbp
 gfgtUp4akFkAWGKGQLhn2fBocqESNLD0ea9+ncOYHvEbKHrl6mFeTKZENt/18hrEVGTU6u29kCY
 OKnajnlfuZFA4+beHz88/B1IBcr411Q/fibhjZFgJzZicGufmU7ee5RUZrjqq0L2tzwBjbzA=
X-Gm-Gg: AY/fxX4GHiNZn8rBAcSfZtWKdaRVdUP86gSFjnGEdCL4QLwmseBAHkyAWJjqEV9v6BL
 ovrYwGZlMrdWEUPqxY/isYSg4KxxCOLzIswJYsldwmmoGraTS91c1MBZpLOGGxWxNlE7m40RxgI
 J26EDkK4nstePe4CeioiSyJMWFxqn3YVVV+SsFioCd30Kq6Xs0lJ18DXhjBJa6cUxqjdMDz9OV2
 6RjtQfvbASRRfbxMAGSwfR3Zsb4Du+Q2q8ienKUeQTy2rKoHNeedTv26zNhIKQY+SoUOb/in3y4
 GNLQ01MmkuzWF5T4SY2fQT94Xk1mlJrwuQvdRf1gidgsb7n3Llrc/vUhMaUzLznNqR+az79rLo8
 on2PojhImYi07UWxtd7cdYSb4Fztfye4Uu1sccEH7sr/vfqle8AksWg9UBdFwAv2s9lgVrj/Qan
 1mRhzFl2rTfvY401fDJ2W3zJM=
X-Received: by 2002:a05:620a:2808:b0:8b2:6bdf:3d15 with SMTP id
 af79cd13be357-8c52fb236dcmr733253885a.8.1768462152308; 
 Wed, 14 Jan 2026 23:29:12 -0800 (PST)
X-Received: by 2002:a05:620a:2808:b0:8b2:6bdf:3d15 with SMTP id
 af79cd13be357-8c52fb236dcmr733251685a.8.1768462151808; 
 Wed, 14 Jan 2026 23:29:11 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-382eb7b1a4dsm58078801fa.17.2026.01.14.23.29.08
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 Jan 2026 23:29:09 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 0/8] drm/msm/dp: Drop the HPD state machine
Date: Thu, 15 Jan 2026 09:29:05 +0200
Message-Id: <20260115-hpd-refactor-v3-0-08e2f3bcd2e0@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEGXaGkC/23MwQ7CIAwG4FdZOMsCBWTx5HsYD4x1jsS5CUo0y
 97dbh6MxkuTv3/7TSxhDJjYrphYxBxSGC4U1KZgvnOXE/LQUGYgwAgDindjwyO2zt+GyK1GMLU
 xWxCO0ctITXis3OFIuQuJzp6rnuWyfUNWym8oSy64Ur52vgLVKr0fUiqvd3f2Q9+XNNjiZfgYl
 ah+DCDDtholWi2dU3+MeZ5fq8r3g/MAAAA=
X-Change-ID: 20250523-hpd-refactor-74e25b55620a
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=2608;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=m86ld7IhIkQDXjy3Y5weZUVJI4ZHVj+c8sLf5mumz7s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpaJdCjtkDFa+i+6psenegKh3OkYiHeRBG1uY8b
 PGr671WMd2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaWiXQgAKCRCLPIo+Aiko
 1VQLB/95pAha7y+54mAYSqmZqac8WgGav2PRQ47+7Zke6AgWGNysjTJVTTjqoBnn66z8mDHpyJ8
 Y+iPRFFzDJKxHcn3zEeU10ufB+ompE3/bJwIs0i6V30hoQUaR+BfJMkHWGdPwlinMfQZkMkinwA
 efV1tdiHaXjpT1iPPPTfwPZloBosQtNMYEogflSKtLPS/x8LZqdEKpVrhRiExI+OQb8R8+4B3pO
 HTPsIeIsMUU2OtGYHdSG0k9L8JNAO0mKHnCFGYgrZzIGNotfwSQzTL3LAAUMEhV7NLzwy1gR/qb
 3UQugs9NDQ45L6Q7U7EzqccbSuxoMzLK3ocCuhyOVRqyn6fB
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA0OSBTYWx0ZWRfXwjsQuTtpHn9v
 UiVsModPdu4tBxx3i/moPX8qUl/0cXylAe84FZZt6CrFQ2JwxA7lUaOXW2MjsRSM5q3bMILfhn9
 n5gQAy1cAIE3Be0F0ehwHBNyumHuBprtQ8nOYbLMkGRzoL+D9ARh9/PnU5DRLMxxS3LIqStNhAv
 3aQulElFSeXV0dqN9iV64wR+b7FzMxTlHDmFNlsNsQHOI3p8q2Xk0PNTEb/MYXXxPqZIoIGPgWR
 e3cGO1j5BPW79/nVlFA58JjWBuFrh1VjNo8yM1mCQU0ORRMn0nbUhQCadCGquj6/PdzqT3D96qU
 gHq1jE7jt+9YnvPHdlzvvA8kA2tUnYAgNMC7LLSloFHB8m673euhjhSFY25eORC2sGuq2eUm+U3
 jLpaZzHK+8Nf9P4xSxRfTRxP/MhJJUEbk1ORtlFTY2RIbrI/nM9q5Ly6p8/I1tU0ltoOKfy3sRm
 2J3DcUXlz7kjSp3f7QQ==
X-Proofpoint-ORIG-GUID: RFfCLVcs0zxIN2WwPxOrIkY4kKYESyNX
X-Proofpoint-GUID: RFfCLVcs0zxIN2WwPxOrIkY4kKYESyNX
X-Authority-Analysis: v=2.4 cv=aapsXBot c=1 sm=1 tr=0 ts=69689748 cx=c_pps
 a=qKBjSQ1v91RyAK45QCPf5w==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=e5mUnYsNAAAA:8 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=Q-giyGzHwlFVuBBPpRIA:9
 a=QEXdDO2ut3YA:10 a=NFOGd7dJGGMPyQGDc5-O:22 a=Vxmtnl_E_bksehYqCbjh:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 clxscore=1015 priorityscore=1501
 lowpriorityscore=0 impostorscore=0 bulkscore=0 phishscore=0 adultscore=0
 suspectscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150049
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

I'm not completely satisfied with the PM runtime handling, I might want
to review it at the next iterations or with the another series.

Note: eDP is mostly untested.

[1] https://patchwork.freedesktop.org/patch/656312/?series=142010&rev=2#comment_1201738

---
Changes in v3:
- Take over the series (thanks, Jessica, for the previous work!)
- Major rework of the series, squashed the set of patches touching the
  HPD states and handling, it is easier to do it this way rather than
  pulling the strings one by one.
- Link to v2: https://lore.kernel.org/r/20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com

Changes in v2:
- Dropped event queue (Dmitry)
- Moved internal HPD handling to use hpd_notify() (Dmitry)
- Reworked bridge detect() to read DPCP and sink count (Dmitry)
- Moved setting of link_trained to plug/unplugged handling
- Dropped msm_dp::connected (Dmitry)
- Squashed all hpd state related patches (Dmitry)
- Link to v1: https://lore.kernel.org/r/20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com

---
Dmitry Baryshkov (1):
      drm/msm/dp: drop event data

Jessica Zhang (7):
      drm/msm/dp: fix HPD state status bit shift value
      drm/msm/dp: Fix the ISR_* enum values
      drm/msm/dp: Read DPCD and sink count in bridge detect()
      drm/msm/dp: Move link training to atomic_enable()
      drm/msm/dp: Drop EV_USER_NOTIFICATION
      drm/msm/dp: rework HPD handling
      drm/msm/dp: Add sink_count and link_ready to debug logs

 drivers/gpu/drm/msm/dp/dp_ctrl.c    |  22 --
 drivers/gpu/drm/msm/dp/dp_ctrl.h    |   1 -
 drivers/gpu/drm/msm/dp/dp_display.c | 673 +++++++++++-------------------------
 drivers/gpu/drm/msm/dp/dp_display.h |   2 +-
 drivers/gpu/drm/msm/dp/dp_drm.c     |  22 +-
 drivers/gpu/drm/msm/dp/dp_drm.h     |   2 +
 drivers/gpu/drm/msm/dp/dp_reg.h     |   4 +-
 7 files changed, 208 insertions(+), 518 deletions(-)
---
base-commit: b775e489bec70895b7ef6b66927886bbac79598f
change-id: 20250523-hpd-refactor-74e25b55620a

Best regards,
-- 
With best wishes
Dmitry

