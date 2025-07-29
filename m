Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88326B14FB5
	for <lists+freedreno@lfdr.de>; Tue, 29 Jul 2025 16:57:43 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2909310E63B;
	Tue, 29 Jul 2025 14:57:42 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iwrQamTT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A7D5E10E3E8
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:40 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56T8k59b005004
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=r5UPSy+ehArJ0kieZ3fL0Y0tSoDuquiGCGJ
 +T2zz/U4=; b=iwrQamTTYmbGr5OuuQJyvBsvyoBJHBz7WmIenzJNu2bJlTmmqUt
 14wBqLSUfgr3VZj6ZS7/vDOFRcQln0hnbbhSMXXMYlJePJLhCvjqeAqCyaRcHT18
 vF0eqM7eyZJEkgMZzDot1ZGpOqGhT0sEe/Vt9zqQqDfVCQuY9wvN/f5UA2fZeFg7
 wR3VV2bc8cP2zA0Auyal7KvfwJsdnTHh1Jbp3BYDyRQG6+Fr1ES6FMMmv17vWw80
 Mem4gyOpU7iLgGoUntkNLusn5OtOUMd5vMdhAi13udf7EAnCsMS9EitRv7PrfOBv
 Ax4VJQ5klh29ZlNctBDciBlm9va/9P34R1Q==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484nyu0s0d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 14:57:40 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-313c3915345so8841154a91.3
 for <freedreno@lists.freedesktop.org>; Tue, 29 Jul 2025 07:57:40 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753801059; x=1754405859;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=r5UPSy+ehArJ0kieZ3fL0Y0tSoDuquiGCGJ+T2zz/U4=;
 b=lZ0aOLyZlhp/YcJyBhZtAGqMe7q59y9p622RdGWrSaWx9VMG1yiK1x77Ikk+zhBr97
 S5VVlQLdLsm1uE+urMyUgymvlZBRIPuUuAGcNBCKRlO6bpc4O7ipU4cImgz3Y17fzMe4
 AeSOmcl63SPk995NDYlbudnzyWjXKKpIsnfR6Ba10ngp7jyZpzU/6n17HYJFlbpb7AJn
 AXnyC9uM7g0bWMS1xzI4nZl7FHzIGcsLH+c0n5rd8cSqD6fCNGLW8oEB4lDgmPJW4Zbu
 b7QX2gpD7qPNA2TWDYQV9cAl3GEcQ1WlbgTwEg/UqbNGJYKBrqfVBqV+hMbpgFcuUy4t
 F6Qw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXq/uTQe3o2AHLq/dip5T/bDt1+0Raj/sbbvIyCycRB0WGtbnMarjvTnD1cE4nfayl43EFLW5JezDI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwZ+VgftpBt+lz8gUrCcCcwfenU2/iQ+c+8T4hj/h5wrG4zMm3j
 woOS1ItJnsoqPzOHLI1GAVJUgxfa7geC+w5joTF7IJXP1JQXm8KzRISsVTv9MKRUJ3Ou7Pa6/gR
 3OgUJXEbVeYtL+NotOfBWwqW4sP7T2JSxJBsGLZIdZAAsAvDU39H8+ZY6R/G95W6L4EZGozo=
X-Gm-Gg: ASbGnctzZ/LCXky3ayMT0YtiPuyCsX05ibIUCkCOBONdfr4hk0DDMoByvCq2JNNXuRU
 jcxzf6APlTFe7Mez0XssgeSna2iOmmahu7CdRr053fe3V6AYj/cq50elCowktRHzjTCok+mEVRl
 /XDk0gn+UxbZROneFdqNG31USCBGnGF9qBWzBkdoiZe6OYiPDw3fgaZIB+D+jSnAUstTJtW8S/1
 O5jPHlq9l+RZI3H0l54YyMSIIFtllA6SSXFvcVO0RtVvM2qPSt1gDpOfy/7++VZ79fmdOh/2pwf
 MnRvbOrXO4r8UXYOBtCyvvhXbM6GIDmqJ8U7RUFiF/Nf46kH89Q=
X-Received: by 2002:a17:903:283:b0:240:6740:6b11 with SMTP id
 d9443c01a7336-24067406f22mr49778045ad.40.1753801058342; 
 Tue, 29 Jul 2025 07:57:38 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHFQovZlrhwFov5F/FdQdGq2gSTgHMjBMBeH8Fux2H9TUnRq58+154f4BSUz7QjrZqjwgo7yA==
X-Received: by 2002:a17:903:283:b0:240:6740:6b11 with SMTP id
 d9443c01a7336-24067406f22mr49777165ad.40.1753801057121; 
 Tue, 29 Jul 2025 07:57:37 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2404483f5a0sm38202595ad.191.2025.07.29.07.57.36
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 29 Jul 2025 07:57:36 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH v2 0/7] drm/msm: Various snapshot fixes
Date: Tue, 29 Jul 2025 07:57:17 -0700
Message-ID: <20250729145729.10905-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: Kj0hcyhtE-NZJzwD-IVvxeGXYyGwQd-C
X-Proofpoint-ORIG-GUID: Kj0hcyhtE-NZJzwD-IVvxeGXYyGwQd-C
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI5MDExNCBTYWx0ZWRfX5x7ozdt+Vmhh
 601/wWmJ03XH8YO3oPSDhDodZlKvJM3yaBWBanb5l5QX3+CJLOH8/hIRBzXPL3kEI/+BgRufcGo
 BhIYn4+hqfsMhY5HtRGCSeU6ZGqikqdgEQaaa9SXrxFp22mNsXdGyJ04Cv2XrGx3rRqv3c3/Rpv
 nfCilgyi3jbfWaHx8rgx94igg7tWk2hLZWA+QL9c62VkL0VPpY9e5JhxtBf4AldOrR4M+bBJirm
 Gi9sgVNH6VXwScLNMLVHhQStN0M5eB+EheshHL9TrloF9k2Sg121X/w864FcZM9jhNmhyeU+DvU
 GHybObgF7pXUesslwA4hEdSmHCm4h2gn1yybrfyPrFjwRqm3xeeXsskMr4JetvfeDSQiQTAlyDd
 OpGSzI+SHEA2cSCQwkiPar9BKP9FJ8um8g3D06FfBxRy5C33m9R/pyLGDMCLbsRYi6C8pY4O
X-Authority-Analysis: v=2.4 cv=CLoqXQrD c=1 sm=1 tr=0 ts=6888e164 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=w1cFhwVCMIBtwBHhTYMA:9 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-29_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 adultscore=0 suspectscore=0 mlxlogscore=999 spamscore=0
 priorityscore=1501 phishscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 clxscore=1015 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507290114
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

Various fixes I've found so far while ingesting upstream devcore dumps
into internal tools.

Rob Clark (7):
  drm/msm: Add missing "location"s to devcoredump
  drm/msm: Fix section names and sizes
  drm/msm: Fix order of selector programming in cluster snapshot
  drm/msm: Constify snapshot tables
  drm/msm: Fix a7xx debugbus read
  drm/msm: Fix debugbus snapshot
  drm/msm: Fix a7xx TPL1 cluster snapshot

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 26 +++++++++----
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   | 38 +++++++++----------
 .../drm/msm/adreno/adreno_gen7_0_0_snapshot.h | 19 +++++++---
 .../drm/msm/adreno/adreno_gen7_2_0_snapshot.h | 10 +++--
 .../drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 34 ++++++++---------
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml |  6 ++-
 6 files changed, 78 insertions(+), 55 deletions(-)

-- 
2.50.1

