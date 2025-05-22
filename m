Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A9127AC13DC
	for <lists+freedreno@lfdr.de>; Thu, 22 May 2025 21:03:37 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7022E10E752;
	Thu, 22 May 2025 19:03:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICUZxNiF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8C8FD10E752
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:03:34 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54MH0soY001233
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:03:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=UkdtLDWPWV86WMIXjh/84M
 WseBY4yX2yXHBPJxMZ3kk=; b=ICUZxNiFZgYqtRmX8jYmbzvBUWf4j0U1zyTYei
 Xr0unvWTNsM76pf6SWTw5P8OETXqmV2f6VS1eiwcumXNQ8F9YTKaVm2pUoLNWwFQ
 bpnvs7H7zs2hLYBOI6Xl3XIegqYBJ4t1RtSfl2i7Dlu1nffl8+qv89ebNngVpuZp
 hw+kipCWog8G2uNxBaXXYRzogqInOQ0fN5CGCQjyn+qy/q3U8Yb3ZZurRGfKoo+y
 59heevnpSqxuXUsnuARs8y9RV0ew4vurOZ45q36d7eErdciYpCRv/lzDEImUWTtG
 0hb1iyNrQeX15NAGRNC9fdBpv4oyCn2ocq/b0+vyfCecSvwQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46rwf6ybc0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 19:03:33 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c9305d29abso1501553285a.1
 for <freedreno@lists.freedesktop.org>; Thu, 22 May 2025 12:03:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747940613; x=1748545413;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=UkdtLDWPWV86WMIXjh/84MWseBY4yX2yXHBPJxMZ3kk=;
 b=FwldLIA+zysaQy6hzn/7rO5iKrcB7a2fGr+2VQ90KbeZlwFTifbBm/jAuBeRLnOJ4l
 BB7wEzE0Z0aeLM2Z3Gmsiv052kH8Z/bZnensYGa6lI/5XhUa8F4Owzwl4lXlMSqMgD5z
 rg9PHsKlqt9Gfwifc6rn916aIIY22ApIcTm9zQZSG4nFIijq5lFghSK3NjBHi0lBy0gB
 +l2HuEngJUaY08uno+n9EJc/k6mcSGFRDXqgrMP+W6Tdwwfwe+uQzkjV3vpAzInDmQdf
 bdAk9MrlC3wBDBHDrhY9zEcxJ5qZ9VVWFvvrNLapLPfHJpn4/UsFf7HHvcGmicl34xu/
 x7Hg==
X-Forwarded-Encrypted: i=1;
 AJvYcCV0k8tE33kdN3w8e76aeD8tOyO27hpNRKFOlHe051OaHQUjZAyXBRg8jjDMlntE2XzKUHL+6cP3pqA=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzEuDI7j80d13OwfInS7JkbHCeBoOQ1GR7FM9SMzyKFv/t4al7i
 JWt66OYMAgJe+zjiyanJpQ/zENu7l+Ov7HyL8/F2pW83HXPw/Rnrai6tNWiihl4YV3IhmbxxJMT
 KvEzXMQ94fa8/33gezMSevhiH00wSWTcWOb8i25J3tBo1fASGIfubAffWJW3lePVba4qe4/A=
X-Gm-Gg: ASbGnctReoNIDMbesr2U2LSlK8stzIeqhEK/BjfvdC/EO4x605pIsiOZSLyc0/mDFzf
 zzn5Qri63aeufOr5C4pXw/IsKGRDNUKarARW/JmLYY/4RtuAtigElUsDxnvJ9pm09crnqrfF37o
 8iQKrOA4vtkyAVmz/uVNu0FSPHxcBt4+bYUafDHDQ+auEDsGPgjum75TUFv5/JzNdlsLctXYzkB
 9au/FYKBHanMIc064o8HQ+9S3FH2Y1Hd/ykUKcuyAZB2s8M1qTifzNeRm59bSzdUTXW/Vu0zo9R
 ul7O1TSSErLMpGhBRsROLQ9DPmfduMGGCL8qDAvH4RFL+bG+NAbMxjq3XQ5i0Q3NuTWikfhSRRA
 6h0hJS3Apwewf7X/mBMZjb7SK
X-Received: by 2002:a05:620a:2549:b0:7c7:93ae:fe56 with SMTP id
 af79cd13be357-7cd467a9b62mr3939272285a.51.1747940612588; 
 Thu, 22 May 2025 12:03:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEy/n5ztww6OKTyWk1l8kEgne9HO2Dpgd6If8J3vYhRa+Ry7rHzuHnJj7UGH+LV1945QHf4sw==
X-Received: by 2002:a05:620a:2549:b0:7c7:93ae:fe56 with SMTP id
 af79cd13be357-7cd467a9b62mr3939266585a.51.1747940612101; 
 Thu, 22 May 2025 12:03:32 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-550e703c2f3sm3482506e87.214.2025.05.22.12.03.28
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 22 May 2025 12:03:30 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v5 00/30] drm/msm/dpu: rework HW block feature handling
Date: Thu, 22 May 2025 22:03:19 +0300
Message-Id: <20250522-dpu-drop-features-v5-0-3b2085a07884@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPd0L2gC/4XNwY7CIBCA4VcxnKUBBijdk++x2cMIUyXR0gXb7
 Mb03UWN2Us3Xib5J5lvrqxQjlTYx+bKMs2xxDTUMNsN80ccDsRjqM2UUFoqCTyMEw85jbwnvEy
 ZCm+tgOCBSLqO1bsxUx9/HubnV+1jLJeUfx8vZnnfvjS9os2SC9451wtrld+3tDvFAXNqUj6wO
 zerF2GEVquEqoTADq3Fdg+odqmU5nvCk0/nc1PHE4K3EFTIB/ToZABj+38g/QcZ2a1BukLWG3K
 OQIKDFWhZlhteW8P/jgEAAA==
X-Change-ID: 20241213-dpu-drop-features-7603dc3ee189
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, linux-arm-msm@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6762;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=LvHpzkBXpQpS6a1CNyb0eHhKR06FkrHNFz2Vb8Rs+HI=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoL3T790+sMC1fTh8sf4v2cPnQ2YpE/MKGy7u7q
 8uc9hDMus6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaC90+wAKCRCLPIo+Aiko
 1VgACAChGrC/R4NUQTnzHLFYbc0EkGkOD2LbpA7jOehjTtJ7O3jaWmQDFKiz4BMfqlRCptcBXb2
 0R6QpdXB3PZNG7SloFQYzZn0OI85ze6TBTQRMIprq2yFPCJWQdKHrJp/onLTwNl5IApkIo7jQRV
 clcOz1/TFLuKKdHSn5LueLfFfHggD+c3U1Z5rhE6bZfIkomtBL/MUA1LKV4xdK8nDwunfeZPeNs
 I1J4eWleTcXgDJZyPOCl1wir9p1ANy26kogPbIzCMCVR4noqttb1ZUTJUQaJnSUnatePYSE3mpE
 r71VPk96fq/WR6b8YyJVzyS5aRhGd+coYI+KmO55iJ7LqWB0
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: e5y_i8lfELSPtbse8_sPNUVXT-4tKq-c
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTIyMDE5MSBTYWx0ZWRfX2LvR99v50uM+
 rf96bZJkGCV5ER2sWNVwjsyJXEIGLCHAX8T8STkn3MinlXHoGVcngWPPpyN9jJJRiOKnA2eKSW5
 oL6tceg5iqXrSiFE1e5mcERE1F7kCFV5JoOUJ7aMOgWxjqQHl/8m9J6+nZ9pwpuCIheqxptjRF4
 ewVicPYhqBeEiN6GOeETwI5pGMrV/A8w8ohxg01mtK/6fY98on5u1p3brcAJCSPpC1fe4ACr1h/
 9B04bTfB1IgK5XplJuTbLrYLrwPd+RYd8kh6HzBA4tDqYe29EKcS3NlDQJZEMy08kjhvJ8GexnS
 pd5oiWYKF9Z3Hvs/N7I8wx5IVkKTlo3f/Q6wk33kiFMtKT/F6+aimw8SgPpJGqzxvuG4WyImDF/
 zmSbmBTWm8DTZ3SOnEamQBU23+t24UrvzvWjyVR2dxD/ainsxyxSONiaNIpg4VGX5UUHz1xF
X-Authority-Analysis: v=2.4 cv=fZOty1QF c=1 sm=1 tr=0 ts=682f7505 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=KKAkSRfTAAAA:8
 a=t8tNeZB39Io7CcBQPAcA:9 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: e5y_i8lfELSPtbse8_sPNUVXT-4tKq-c
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-22_09,2025-05-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxscore=0 adultscore=0 spamscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 impostorscore=0 mlxlogscore=999
 lowpriorityscore=0 phishscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505160000 definitions=main-2505220191
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

Some time ago we started the process of converting HW blocks to use
revision-based checks instead of having feature bits (which are easy to
miss or to set incorrectly). Then the process of such a conversion was
postponed. (Mostly) finish the conversion. The only blocks which still
have feature bits are SSPP, WB and VBIF. In the rare cases where
behaviour actually differs from platform to platform (or from block to
block) use unsigned long bitfields, they have simpler syntax to be
checked and don't involve test_bit() invocation.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v5:
- Added version check in _dpu_encoder_phys_cmd_update_intf_cfg() (Neil)
  Technically it's not necessary, but it makes it easier to follow the
  code.
- Fixed commit message for the DPU_MDP_AUDIO_SELECT patch (Neil)
- Link to v4: https://lore.kernel.org/r/20250519-dpu-drop-features-v4-0-6c5e88e31383@oss.qualcomm.com

Changes in v4:
- Rebased on top of linux-next
- Dropped three controversial patches, will be submitted separately
- Folded MIXER_SDM845_MASK into MIXER_MSM8998_MASK as they are equal
  now.
- Link to v3: https://lore.kernel.org/r/20250424-dpu-drop-features-v3-0-cdaca81d356f@oss.qualcomm.com

Changes in v3:
- Repost, fixing email/author issues caused by b4 / mailmap interaction
- Link to v2: https://lore.kernel.org/r/20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com

Changes in v2:
- Rebased on top of the current msm-next
- Link to v1: https://lore.kernel.org/r/20241214-dpu-drop-features-v1-0-988f0662cb7e@linaro.org

---
Dmitry Baryshkov (30):
      drm/msm/dpu: stop passing mdss_ver to setup_timing_gen()
      drm/msm/dpu: drop INTF_SC7280_MASK
      drm/msm/dpu: inline _setup_ctl_ops()
      drm/msm/dpu: inline _setup_dsc_ops()
      drm/msm/dpu: inline _setup_dspp_ops()
      drm/msm/dpu: inline _setup_mixer_ops()
      drm/msm/dpu: remove DSPP_SC7180_MASK
      drm/msm/dpu: get rid of DPU_CTL_HAS_LAYER_EXT4
      drm/msm/dpu: get rid of DPU_CTL_ACTIVE_CFG
      drm/msm/dpu: get rid of DPU_CTL_FETCH_ACTIVE
      drm/msm/dpu: get rid of DPU_CTL_DSPP_SUB_BLOCK_FLUSH
      drm/msm/dpu: get rid of DPU_CTL_VM_CFG
      drm/msm/dpu: get rid of DPU_DATA_HCTL_EN
      drm/msm/dpu: get rid of DPU_INTF_STATUS_SUPPORTED
      drm/msm/dpu: get rid of DPU_INTF_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_PINGPONG_DSC
      drm/msm/dpu: get rid of DPU_PINGPONG_DITHER
      drm/msm/dpu: get rid of DPU_MDP_VSYNC_SEL
      drm/msm/dpu: get rid of DPU_MDP_PERIPH_0_REMOVED
      drm/msm/dpu: get rid of DPU_MDP_AUDIO_SELECT
      drm/msm/dpu: get rid of DPU_MIXER_COMBINED_ALPHA
      drm/msm/dpu: get rid of DPU_DIM_LAYER
      drm/msm/dpu: get rid of DPU_DSC_HW_REV_1_2
      drm/msm/dpu: get rid of DPU_DSC_OUTPUT_CTRL
      drm/msm/dpu: get rid of DPU_WB_INPUT_CTRL
      drm/msm/dpu: get rid of DPU_SSPP_QOS_8LVL
      drm/msm/dpu: drop unused MDP TOP features
      drm/msm/dpu: drop ununused PINGPONG features
      drm/msm/dpu: drop ununused MIXER features
      drm/msm/dpu: move features out of the DPU_HW_BLK_INFO

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  49 +++-------
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |   2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |   2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |   2 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |   7 --
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |   7 --
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |   7 --
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |   4 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  17 +---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_1_sdm670.h |  11 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  39 ++------
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  43 ++-------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  29 +-----
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  19 +---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  16 +---
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  38 ++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  14 +--
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  16 +---
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |   5 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |   6 --
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  40 ++------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  22 +----
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  46 ++-------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  43 ++-------
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  49 ++--------
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  43 ++-------
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |  43 ++-------
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  48 ++--------
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_cmd.c   |   3 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_vid.c   |   5 +-
 .../gpu/drm/msm/disp/dpu1/dpu_encoder_phys_wb.c    |   7 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.c     |  42 +--------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     | 102 ++------------------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.c         | 105 ++++++++++-----------
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_ctl.h         |   4 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c         |  21 ++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.h         |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc_1_2.c     |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dspp.c        |  10 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c        |  14 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.c          |  28 +++---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_lm.h          |   3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_merge3d.c     |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_pingpong.c    |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.c        |   5 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_sspp.h        |   2 +
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c         |  11 ++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_wb.c          |   2 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_kms.c            |   4 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_rm.c             |   8 +-
 52 files changed, 257 insertions(+), 813 deletions(-)
---
base-commit: de63bbeb5af60172f1dd4d45bdc897816753fa69
change-id: 20241213-dpu-drop-features-7603dc3ee189

Best regards,
-- 
Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

