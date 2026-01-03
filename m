Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2CF2FCF004C
	for <lists+freedreno@lfdr.de>; Sat, 03 Jan 2026 14:45:12 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DF0B210E159;
	Sat,  3 Jan 2026 13:45:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DvJXS0m2";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="YSyzCQO3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 56D7B10E193
 for <freedreno@lists.freedesktop.org>; Sat,  3 Jan 2026 13:45:10 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 603CUcP72973011
 for <freedreno@lists.freedesktop.org>; Sat, 3 Jan 2026 13:45:09 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=PVewRUz4/OoxL8WpJ0DLj+
 kQy80dzRVNPuaXhm1lqHA=; b=DvJXS0m2XiaYTT8G+JbUE8FA5ZhWWYEz8W50YC
 tp4ka2YISzc++mU+Dz4ycbCkmNSokXDbmhAgo4/YvDvcEfDwL4N4qYW2p5dqRv1b
 WJrAfQqbItX8Hvv8DmJbUciYvwz/BsvSAf/7XD6FQF2FArsduy0TzgHGcftKdw4q
 h3De2O0oBQjEh9fMRwSbQnkyG8IorpSHh/tIxcvF/Dhyrc7JIoy3E7PYupKmwjfD
 /fK/ilgi9oNLyeTRh1pJB5nMjbK5wy8CEcm/Sy+YxolzKE4SMNbXJnmy890kMdye
 ZeDQSEYnN8yf3ldxxXmdGzzRTdqvHj/ohsZZEYnR666cwGwQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4berfn8u49-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jan 2026 13:45:09 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a344b86f7so471125406d6.0
 for <freedreno@lists.freedesktop.org>; Sat, 03 Jan 2026 05:45:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767447908; x=1768052708;
 darn=lists.freedesktop.org; 
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:from:to:cc:subject:date:message-id:reply-to;
 bh=PVewRUz4/OoxL8WpJ0DLj+kQy80dzRVNPuaXhm1lqHA=;
 b=YSyzCQO3oAjbd3Lot8f95hw46d/+JAByh9VL5VGeJIh33miJuePJx3CM9CnhtPWdyt
 Svd1mLrq6WwJgchR6lAvnyDDcV7pqte391XRTkY+3+SXcbRjL8Ds1IHQjUaafdUQTDKf
 9PdTAVGdmHbCLNqCKX6nIz22szgBOSeu6foNtllUD320o1t4WFP3Zcx5nLhTox9N/stw
 JBArj6V0PKqNcJjcFo9qm7WTUlMkEzo8gaaF0DrHdn0HCRrKYGiZUkZmaJphpLg4ZwbT
 STB7CdksfZtgMvHAvPnaabKFgPL29mLkwAEjbV79tzv8/SrVuPKPcuEQLJFl2gW3lnWV
 /KAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767447908; x=1768052708;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
 :message-id:reply-to;
 bh=PVewRUz4/OoxL8WpJ0DLj+kQy80dzRVNPuaXhm1lqHA=;
 b=ZjKB0ortnuBStgBrGzC7kVRTOYn9wAgscvwUaZS8+SVb3llH3uoLn9xl/8U3t1mOOb
 ChOT9NYV89E6p5CWIuaZOS7gsSPuVBTXslWkyJEJUp3SsMZxn9M7XpdQWng9JlM3Zu9c
 KBK1xq7RNNwyPeZsjPqI314rPNTEs5AoiNyRV976D0QGnpm1P8GTx874UBFrEzKxBXrk
 dx8dHOi5PyORm2HCCMbB5ydI7ImZj7hfKGLLBmZB33XBbqBma5HnA5C5lS4jAgS5OKeD
 jst9OTj2M6tHkNlf/Xv0l4jLBxSDfWVeK7fb/WE/AX3wyCtcFnwGTE/RdvyIXKq+U9jj
 5kNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCWhnhui+J53sByoCukP657uT5L2Yy9kw7ZbQr8SNG1Oy5XMyhGjD8HIs1ybtZGxKbpgm+Ik8uTM7Do=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzXW+9x0iZ/NJmLB/XKf/YUoPsSdmYRBpd2EKzDLXY2U2Pu8pdi
 +Qwn6dAwRoZ98Q2fQ/hcUGzDF6Z/0XIL0ommYeaXjxShk55ksWmw5/IrbgZt7Hb/R/OGzaNt3QC
 6suluW27Std9rxLdmCJq6PKUaqz7M+h5oCJSwI3vVKbK6W04zGzjWGmB/qtTdrqA/tIyLXvI=
X-Gm-Gg: AY/fxX4o/k1hU1rbb4HijaLgCXHq7aqFRbjEAc7EXGm6zPvgQCwpVlHUzcRtCQs5sZo
 Ulfao0QLKcq06KdiCr+uGmVHkScl2GI0nToALlhCf+Qsz52PJRgGB7ZvScDIG/oK10RWacQjQnt
 FAqoJKksLW8xlAy1p1Ppk6lyJVKqoiqhTJqUIYD1Qe1r7Ul028iKRoI8bxeXjA+I6k7urRcwlhP
 o3aqrY//Myy8mLi66KMqo89EGAUB1RxeUPzTD916wWYAzZg5+EPBf3rzbp7dIhXbjKWsbOaVkia
 lpb1ehWpO7YiJHbbvAGBm93no+5cCnyaFLJfGOk61nKAVXpK5apXdb8n1ebiiRDnLuLxwunR9F2
 ti5r9nGbRHB/7w5H8VbJ4zWl8DXCh97bcj5cEO4NQIv29kEBO9iaJBJQEzm+M5ZtIzeZJIHI+pP
 ocnGICzQW93VNAAv6u6EW4wx4=
X-Received: by 2002:a05:6214:2626:b0:88f:ce04:3261 with SMTP id
 6a1803df08f44-88fce043356mr609201576d6.6.1767447908245; 
 Sat, 03 Jan 2026 05:45:08 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG9C7I4ZqjoudC7nVN7fRk1ATaRrFw7J3YjztPqT00J1e59eX1vgYQAtskZhvEvIhLBC2QEeQ==
X-Received: by 2002:a05:6214:2626:b0:88f:ce04:3261 with SMTP id
 6a1803df08f44-88fce043356mr609201266d6.6.1767447907807; 
 Sat, 03 Jan 2026 05:45:07 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628422sm12920873e87.101.2026.01.03.05.45.06
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 03 Jan 2026 05:45:07 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 0/3] drm/msm/dpu: Drop max_mixer_width and
 MAX_HDISPLAY_SPLIT
Date: Sat, 03 Jan 2026 15:45:03 +0200
Message-Id: <20260103-max-mixer-width-v2-0-ef5d3d246709@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAF8dWWkC/2WOwQ6CMBBEf4X0bLGtEMGT/2E4tGWVTSyVbkEM4
 d8tcvSyyezOzpuFEQQEYpdsYQEmJPR9EuqQMdvp/gEc26SZEqoUhZDc6Zk7nCHwN7ax47U9WaF
 sUVlzZunrFeCezlvirUm6Q4o+fH6ASW7bPauUxV/WJLngtjJatLUxVVldPVE+jPppvXN5GqxZd
 0aAYUxl4w5iRhPwzYQx62GOR6cpQkj29Qta/ST/4wAAAA==
X-Change-ID: 20250401-max-mixer-width-9c3c02c48cb7
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, Xilin Wu <sophon@radxa.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3081;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=X9sF3LaDgRv/B45HUHc0a5tLkJCayBzMWIFKEyiafEk=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpWR1iWMRaaNZrUCikmwh0dRlBiXd025GIw5C2b
 vPaIKlvIUeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVkdYgAKCRCLPIo+Aiko
 1cTGB/9EXQoT5YcrFrQ95HwRtx7BQsX5KnVwrXP9AjuFOHuIH4GLxQsBD/BDsGGoHUyeN+t+0Nc
 QDJNRc3acCtHQ1zPrQJG6EQpWQU8ZkNkQv5TtC3j/iknAwrVRkJuOjZVhweOGUurs3j/RhY/AQX
 yzyfF20t3ayzRAfJ8dbki01SPHtpavgsJcfByDMCgvYJWpArxWH3BSLo+gDfUjgFZYcaoiLevbh
 2TZmKejTuOcGnacMRm5Hx0qusnykcqnHBvQoNZwcPw3Sm03Daq5/UjPd/ESUz9R2lOiGfV5GmDl
 gxiy4CGeec66Xqu4guxbN8rYu6p9H9uWFlFmKQeDIehL5fcS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: UWbzSxa1ijQpi0gVwz-hs1YMJNXoUZDj
X-Proofpoint-ORIG-GUID: UWbzSxa1ijQpi0gVwz-hs1YMJNXoUZDj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTAzMDEyNCBTYWx0ZWRfX4fck2eSCZZJ2
 0XMjNOqm+KVV8EdjxSkDOkKYyAPBDrg0JqyHgZ9ZbT22Pli3Yz9/R5+7Nrpos3jqX02VExDuYup
 TBtyrvS0vZT8wfEUeZbGx52oD8L3AhlW3auXePn0GsjVdX1vGRTwdh/mnOWPz05CjuDsIk+Aj79
 BlWdTRvHosoSu00WYCh18cq86wX88IOMf8gkJOgmKAXj9xcPjfyL6r2qdBLqHy7hYVb4HRxE9sZ
 QDwI4h0gqY6v2qNtEQACBgiI/MUPdBVOsWJLTgIyj49etS8NvJJuMgfgmU8sZHECaxlV7w0/BRN
 Z1xKmL3tRTldzYorp6LCBQIa9c4bfY9X5mxCVin8MX4G8BIbMB6tJYT54IodhJAyftXswm+mXoB
 PT3xbSrFdVktdoQejHqNmr7VtJJ9SSA0Kbh9i2boHQrLxI0S7w2k5Rr83C2WvHMAivLSX6mKmMN
 h+nWzvw0Eu2OPNT2zHg==
X-Authority-Analysis: v=2.4 cv=GNkF0+NK c=1 sm=1 tr=0 ts=69591d65 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=d6ssToJDxaT8U7i-MUwA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-03_02,2025-12-31_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 adultscore=0 malwarescore=0 clxscore=1015 lowpriorityscore=0
 phishscore=0 priorityscore=1501 impostorscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601030124
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
Changes in v2:
- Dropped PP and DSC encoder width drop the catalog, they are now
  determined in the code by using the DPU programming
- Corrected DSC encoder width for DPUs < 8.x (2048 vs 2560)
- Link to v1: https://lore.kernel.org/r/20250514-max-mixer-width-v1-0-c8ba0d9bb858@oss.qualcomm.com

---
Jessica Zhang (3):
      drm/msm/dpu: Check mode against PINGPONG or DSC max width
      drm/msm/dpu: Filter writeback modes using writeback maxlinewidth
      drm/msm/dpu: Remove max_mixer_width from catalog

 .../drm/msm/disp/dpu1/catalog/dpu_10_0_sm8650.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_12_0_sm8750.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_12_2_glymur.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_14_msm8937.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_15_msm8917.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_16_msm8953.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_1_7_msm8996.h    |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_3_0_msm8998.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_2_sdm660.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_3_3_sdm630.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_4_0_sdm845.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_0_sm8150.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_5_1_sc8180x.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_2_sm7150.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_3_sm6150.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_5_4_sm6125.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_0_sm8250.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_2_sc7180.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_3_sm6115.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_4_sm6350.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_6_5_qcm2290.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_6_9_sm6375.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_0_sm8350.h |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_7_2_sc7280.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_8_0_sc8280xp.h   |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_8_1_sm8450.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_8_4_sa8775p.h    |  1 -
 .../gpu/drm/msm/disp/dpu1/catalog/dpu_9_0_sm8550.h |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_9_1_sar2130p.h   |  1 -
 .../drm/msm/disp/dpu1/catalog/dpu_9_2_x1e80100.h   |  1 -
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c           | 44 ++++++++++++++++++----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_catalog.h     |  9 ++++-
 drivers/gpu/drm/msm/disp/dpu1/dpu_writeback.c      |  9 +----
 33 files changed, 45 insertions(+), 47 deletions(-)
---
base-commit: 19eee9de953679506fd24a2db2613e165c6fe801
change-id: 20250401-max-mixer-width-9c3c02c48cb7

Best regards,
-- 
With best wishes
Dmitry

