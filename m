Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7CA02AB79E8
	for <lists+freedreno@lfdr.de>; Thu, 15 May 2025 01:52:50 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 214F310E754;
	Wed, 14 May 2025 23:52:48 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="NcQRFwfZ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EB9F110E034
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 23:52:44 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54ELEB8g025448
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 23:52:43 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=U9dXNTM0otXMtb+tXARZV5
 SVU4gth+EmAxcvRX+fMqk=; b=NcQRFwfZN9CA2RN5DDGL1fCCVQMgG2loJeAss2
 NDTyQsixhCw0dE4qn4at6blyETjMDPBsUyn94rhRlbwmZs0CYPqikgK/ygimGsXW
 xQUZEH+z8mU6YIOGp/BvAvY1jMtVfVZqUB67e6WOYxA3Ir506cmwoeu52YYx6H9c
 hqicBOG7OPYT+1m92BSc2DNHCa8zHFVTEAlVanZ2h5egaNpNxvcLq2OEBJ2yebHL
 SCz7mQAB53ipvO7OVs/tf5SQyfdZ19GEBw6Jl+FQvhsVHyeMY/rqRc+0fmT0vPOG
 pGoc/x9Rjh2NC1bwoK1/CdT2k4ikJeSaM43Grcb37NeM2TTg==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46mbew4abv-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 23:52:43 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-23195be68cdso3222335ad.0
 for <freedreno@lists.freedesktop.org>; Wed, 14 May 2025 16:52:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747266762; x=1747871562;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=U9dXNTM0otXMtb+tXARZV5SVU4gth+EmAxcvRX+fMqk=;
 b=NOAVWCGHNKLI52iyMgLFryBQB2K8aS7iXOOdzPe6Hw+SseiP1aWAtY0UqmjqKc0xnR
 1xmMjza+xpnGcTLOIlGxHKbjm9xMuFF5KgeWuJ6uuB/7RjQzvb6y2xPh+ujQmx9RWK6l
 fcFBhmbU1N7IQidzsP7VlHpZva1KxmXga7r8/kzkjnOLh9hipFeLIjEQ9EbRZpkM7jAZ
 dO5tGV7AIA0SjZNQ620nijz9Eo9rK/It74T0ER2OTXTIziw8UZXAcAnaKOB2PzwGiAPv
 nCm7ji2BbT3LM0szHZLrdFUAgWh0+6trn4RCSP9TZWeUSzIPXFPLYHtSxIQHZMZNRPny
 EsMQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX+D3xlM020AVwjlJ7ymrsRtdMWlbqBaFI7sPW6G1TtjqKiSb23GtKhDRgFxcJ87z4hpb6tZfZeo8c=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxitCYqK+b6I+JFQUg0eEuwT92T92nbpC6C07uhAL4Jw2/FM9iv
 L3GqTn4NSQmmVvMnUvb4G2KhUnqG3zvwouBh9cJVgbrdPhOcA0chJzRVRJfQZ4EE1WthTCRR6Dq
 z6W0Wu1ylHYEKlDDdHpOO5LY/rtGhGYQQLgCDQpJXEueJyLrt0T5M4fg2oTtvagFJQdw=
X-Gm-Gg: ASbGncuCCC+928K14fDgxpGk/qrmeBzlobKszeaFVjKy6uLJZdov5+hu66b3vOXZVEu
 871Ltu3lu3/iJwWtzCVDZHXrPw2F5LOLSN87rMCUISmWVD0RP7H58LU8qc3uEFXG2ix8bRwTpTu
 aV29BbCUHxi3bVG+AEDAuHKH3n/gJkWHXrnk+6A/bLVsAqQvd3MMBaZqlJopNThGatZX3HT75Nu
 3VUIfbSKrFG04KlxPXU4g518F/Jkm/zlUbMcTpW3BEDJLuhp6IC3We/KCrhJ5p5lm5b22fwX6Ud
 07jVMfc8XdAhlu4fV2EsCccQbIpw4WDn+gtEfursZI6kJl79Rlpdvc+jNUVuUeQuGVfR1kVg
X-Received: by 2002:a17:903:3ba3:b0:223:3396:15e8 with SMTP id
 d9443c01a7336-2319810114emr80995055ad.22.1747266761806; 
 Wed, 14 May 2025 16:52:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE9Q11Bf0x1w3OdQv8Gq4HJtYawO2uCX+U0G/Tc6UvUo7gpok19dbvktUtFd8Z0CtlQnSADsA==
X-Received: by 2002:a17:903:3ba3:b0:223:3396:15e8 with SMTP id
 d9443c01a7336-2319810114emr80994675ad.22.1747266761421; 
 Wed, 14 May 2025 16:52:41 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-22fc8271aebsm104468735ad.107.2025.05.14.16.52.40
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 14 May 2025 16:52:41 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Subject: [PATCH 0/5] drm/msm/dpu: Drop max_mixer_width and MAX_HDISPLAY_SPLIT
Date: Wed, 14 May 2025 16:52:28 -0700
Message-Id: <20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIALwsJWgC/xWMSQqAMAwAvyI5G6hVcfmKeKgxag4upKKC9O/W4
 zDMvOBZhT20yQvKl3jZtwhZmgAtbpsZZYwM1tjSFCbD1T24ysOKt4zngg3lZCwVNQ0VxOpQnqL
 +j10fwgf06RvzYQAAAA==
X-Change-ID: 20250401-max-mixer-width-9c3c02c48cb7
To: Rob Clark <robdclark@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
Cc: Abhinav Kumar <abhinav.kumar@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747266760; l=2865;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=sZUuOX2H5sa9Q5kPSygy9aJ3DncWNwsb4nZIr1PWjis=;
 b=2fS6E10p0+LUPEXfVUGN1EiKyx+7j+1YYXZmTcrfjwLs3yXOx0XYFA0FP7+b444XrmN0u80zg
 dX1gqwXcCIyAy5RdHn+91gwbPRhUbL6nNW3xP1GaSQ/v7obPx3VJ5Cw
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-GUID: ksbjCvHpQbCrmYnNRHE6_es0EyQrNtvz
X-Proofpoint-ORIG-GUID: ksbjCvHpQbCrmYnNRHE6_es0EyQrNtvz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE0MDIyMiBTYWx0ZWRfX503YNZQKKhU2
 zA0/ojuyxAE0pPjhNAFQkM7WeFJf72U41hRNLiKCBMPmiVo5/O5DfxNqzJHAZBEgfLveE16UzM5
 n+7/T/E6SuaG4qaXRZCiwQVVJByEze/iZTh4j89oBLdBhLbQsPEmOW9cR0Yms0Op4o21VJ9huok
 avCQLIOE69O+AjfRPgJvS/zl647J6ltzqy0Yg9KdZgnKnO3/ZilMpqpao5pe3POA+hmQFVQy7UT
 Vly78zphgTLpagLWoiCkY60xPVTeA3sMH2+PHKg//H7KfUxFCthBvR0wmjhiW6H4tnERiZ7eiZw
 gDu+loSYqoIVyVC3LcwtLV+CqqcpYI9V0vFE+nJkHym0zvGcdAN7jNv2Lcr94cBke+7bqfnp04k
 iO+EZMzJhKX4QVv73F6bcOPGrRJSnSTdcRhk4UbiLTx79p0pZJwZVijvrsEpLB0VOI5Ksc7/
X-Authority-Analysis: v=2.4 cv=LOFmQIW9 c=1 sm=1 tr=0 ts=68252ccb cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=EUspDBNiAAAA:8 a=qDZEy-X_bfy3rWNFqZ0A:9
 a=QEXdDO2ut3YA:10 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-14_04,2025-05-14_03,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 adultscore=0 priorityscore=1501 suspectscore=0
 mlxscore=0 malwarescore=0 mlxlogscore=892 impostorscore=0 bulkscore=0
 clxscore=1015 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505070000
 definitions=main-2505140222
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

Currently, the DPU driver bases LM reservation off of the maximum
supported width for the layer mixer and an arbitrary MAX_HDISPLAY_SPLIT.
However, these limits are not hardware limits meaning that a single LM
can support higher resolutions.

Switch to basing LM reservation off of PINGPONG and DSC encoder hardware
limits.

---
Jessica Zhang (5):
      drm/msm/dpu: Drop maxwidth from dpu_lm_sub_blks struct
      drm/msm/dpu: Add max pingpong and dsc width to HW catalog
      drm/msm/dpu: Check mode against PINGPONG or DSC max width
      drm/msm/dpu: Filter writeback modes using writeback maxlinewidth
      drm/msm/dpu: Remove max_mixer_width from catalog

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    | 12 +++++-
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |  2 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  5 ++-
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  7 +++-
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  7 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  5 ++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  4 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  7 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  3 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  3 +-
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |  2 +-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  8 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  6 ++-
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  8 +++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h | 10 ++++-
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    | 10 ++++-
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h | 10 ++++-
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   | 10 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 46 ++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  4 --
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 13 ++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  9 +----
 31 files changed, 173 insertions(+), 49 deletions(-)
---
base-commit: 888f15dae780db7cea6ab1a3355151e4292038bf
change-id: 20250401-max-mixer-width-9c3c02c48cb7

Best regards,
-- 
Jessica Zhang <jessica.zhang@oss.qualcomm.com>

