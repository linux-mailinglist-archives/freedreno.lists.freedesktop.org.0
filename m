Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DB1FEB3FE64
	for <lists+freedreno@lfdr.de>; Tue,  2 Sep 2025 13:50:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 82F7E10E67F;
	Tue,  2 Sep 2025 11:50:44 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="l7gJ/s/F";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0422E10E67F
 for <freedreno@lists.freedesktop.org>; Tue,  2 Sep 2025 11:50:42 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 582B9Bvh030988
 for <freedreno@lists.freedesktop.org>; Tue, 2 Sep 2025 11:50:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=eAziRhwZITCfoOpKyth9/b
 vxKnzQJ9GiVsebHG4acH0=; b=l7gJ/s/FrO9c7rOdBehQ3lDEsDcToCsA1jWapn
 88nbf7UWia8GInbSmzFkce7rS4ZVXTGcGSCMasazMiWbaozXIisgUo+XjclOUEVh
 tzpokthFISXxtv4ygsS3uJPIS3GqGZ9n64exYXw2ZEictZHS9kDpE+uYkydxuq9C
 RSW3d0OBvi4b4g4YfXulRRYDp9FhbWpipH6bZqkWkHzILKeo/EaZ+4VuYIfG8KAL
 X7kH96ZuxMBjPft0/LIwwvcLaU4DMZmFAyOrr2FWUDLHxFtwmdip00LU8/3tV17O
 GqWFEqkb1grGvGK35EBuWbZ/n9nZWcyX7q+gc17WQg9bA38g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush2yhq6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 11:50:42 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b471737e673so7635716a12.1
 for <freedreno@lists.freedesktop.org>; Tue, 02 Sep 2025 04:50:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756813841; x=1757418641;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=eAziRhwZITCfoOpKyth9/bvxKnzQJ9GiVsebHG4acH0=;
 b=KzEnWZhDhPYXFaZZdrkN00o5XheWO3us0zZbsE4AmrF53hkrxk3UOvhKbYW53qVPwx
 crXL24fyoHBVe5brHgMS1I2VXk9COAKOfN7gWg7NhCvlMpWHrB/Ue22vZS/ToNzvYyzQ
 Gu7ObHSb2lZsuXPnQNTE8ib5pJKgLk5XeVYhWUTES9JiBgER4PmZiYfg/pYi3j1WKuyR
 yaU+valRjhjEawlLCHBZmF2rnGto47pyydbYDn+7CcrmzJsf4rcdrsgycWry9RU1uAKw
 8sIpEzB42QqtYnbgFJpegNW1rTwqEJVf/CycrudioNWkO3hgNxZbOHN82KQKYeZT7Fto
 5TAg==
X-Forwarded-Encrypted: i=1;
 AJvYcCVengSOQoHb7kfDKW9HL+Cuupv1dTSMzFVmkofszc3oP6khPQIKDMJqQ/lTfn/YL9FS+zcfFd5kqCs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxp2flnJLojdsuRNv5KCOfJMN0IZQ0ycPDaBF+yD4bC2ZGlDNTX
 qhMvcvzAoUaE68ufNxhZaQgHfv9TY5xfeXkRUhv1XZ1WdN3L5frcS3YTXXCMx0ZBw488PPDsHXX
 dS5W2b3N/LYBwr2UOX/3VzFXVUaqZFfJqXJiZ7xu71LinWfcLJlm5YNbRAB6HTSobE9oFZAE=
X-Gm-Gg: ASbGncvTb/SWufETSi7Ks7q83+DPfsrDf3uZhQfUFHjnGqnVxkgb8jquOkktMlZ3STt
 IgGI4SrLsWERvjq3nreT4CsfVxgUbAhRPIpftgmtYICSNkjdJ/P8gKoLPy41sFfN1woMMkVjpWi
 N4WALEV5eoKeFmShAoWkjxfJl6nn68aGqM2YFspLu7ksc+c4ugUciBKfrF6uv//maPsIJoWfJU1
 4ZUoJ6l7A0plMA5UCKhENC2a2SCEySUzvodmQ4pTHF99oTeP4mFAKgBOyY2TLeHvkZ4kF1JmK9h
 qttYrnJWvgkMDiQRvRTzkSkWmLGcWrqqXaj7LgXLhmzRf53xUCCrwIb9ck5g6mcj
X-Received: by 2002:a17:90b:4b90:b0:328:116f:b124 with SMTP id
 98e67ed59e1d1-3281543c7admr18577433a91.12.1756813841033; 
 Tue, 02 Sep 2025 04:50:41 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF+ZMH+Vzg0wlRp9EAopZVWtcIW8yWlVtbtcynxk3++LYhebYu1Ii2WgJTBzPGGOljv90GvhQ==
X-Received: by 2002:a17:90b:4b90:b0:328:116f:b124 with SMTP id
 98e67ed59e1d1-3281543c7admr18577399a91.12.1756813840345; 
 Tue, 02 Sep 2025 04:50:40 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-329d089395esm3175428a91.1.2025.09.02.04.50.35
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 02 Sep 2025 04:50:40 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH 0/4] drm/msm: Assorted fixes and changes
Date: Tue, 02 Sep 2025 17:19:59 +0530
Message-Id: <20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAOfZtmgC/yXMQQ6CMBCF4as0s3ZMW21VrmJYlDJoF1CYqcSEc
 HcbWX4vef8GQpxIoFEbMK1JUp4qzElBfIfpRZj6arDaOv3QBoNI5kI9Cs0FDTrn/GCcvfjuDvU
 1Mw3p+y8+28NMy6eGyzFCF4Qw5nFMpVGrP5sbcrxCu+8/0LJHyo4AAAA=
X-Change-ID: 20250901-assorted-sept-1-5556f15236b8
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jonathan Marek <jonathan@marek.ca>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1756813835; l=749;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=oRUzrfj+bFbJZIfg9yUPlnyYWmPonREj6xzhaQwtGK4=;
 b=pRDSyxIvQu+ZNc+l0Lj15nZLcXhUN3GxU8l2stlbBCWCl5j/py1iUWsNgeO9XH3jOXpi7EK9S
 8LyuQX/ThMbAwqDH5rW97j7IgK9O7FPneBCVzTIkV6Ia4Ulhw9t8LRG
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX31a6aJknA76r
 ht4zOekwk9pxVR12PzI5k5NIie1HUXwWHir+M5Kfczfv+UE2aCT76ZeYLxEPNljWcFTZzRgwSVj
 CNTuu1CCa29nqdL1s979Psca7FV6bysxmHfO/kRgVszcENw1hIDBrqiuBzMs+8gNGQDrhXx4qLj
 v8u6dN6moqFYb7//TZ2xeoH0P/8+4OTxJ8xAtB17vB4AiiWBf1KPywqHpGvwPU5VYQqxZcIVn3M
 /PR61/kNm9gJcGCG+aWdLa0z8Ie4GxllFmvJ1p3sy/zQpdUsR0+0v14cnI7GEki6HZaGm1do9kT
 U6JWOLl/flZtmBqF+ekWc/k0tpjlEq46qOpFneISIz8hTAp3YfmAqAJJ6SpSE8ysRw5c7JtYkoh
 i6GcJQWh
X-Proofpoint-ORIG-GUID: P2EM9zZsOHP82bhJkcMEXa4woZwyYS9B
X-Proofpoint-GUID: P2EM9zZsOHP82bhJkcMEXa4woZwyYS9B
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68b6da12 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=dW-ANKit55rmDTnjG6YA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-02_04,2025-08-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032
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

A few changes and fixes that were lying in my stack.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
Akhil P Oommen (4):
      drm/msm: Fix bootup splat with separate_gpu_drm modparam
      drm/msm/a6xx: Fix GMU firmware parser
      drm/msm/adreno: Add a modparam to skip GPU
      drm/msm/a6xx: Add a comment to acd_probe()

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  5 ++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_drv.c              |  1 +
 3 files changed, 18 insertions(+), 1 deletion(-)
---
base-commit: 5cc61f86dff464a63b6a6e4758f26557fda4d494
change-id: 20250901-assorted-sept-1-5556f15236b8

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

