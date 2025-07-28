Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8AA63B14347
	for <lists+freedreno@lfdr.de>; Mon, 28 Jul 2025 22:34:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CD8610E002;
	Mon, 28 Jul 2025 20:34:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SOV+dHYK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B9D4210E002
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:19 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56SAlOEO023593
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=Vx9YOMF9/vaXXfGAitKrXqT/YmN37duAwQA
 vLpyxaqo=; b=SOV+dHYK+WJTfpTVBLvWtAMYbSlZzjo1WkmIzRaTjaOOviYOA0A
 JvCLdsPn/jE/Nncto1gn36Pyynu6vdxV4ForI/qlFJmJEBquwn3RKP3qSU5JwLBK
 arKBt2Hcp1qmIKlrBjlnIzYmqQEM7S71EdGONwPlvqFTy2vIHJzS2iExCf6Cwsuy
 YAuqT4JtQic/ytbL2etrz2qokMFPAhR8HBtaTg950tIshxXTwuCEF5Z1cZx+vbFM
 6RYC0rQNVKPUbOKSDw1vteVC+4IF01RcxlWMcNPyXNWiTHcDx+AmWA4AG9hvvWn+
 KGCxEfVezrIa55qdmphmQUCPa6BTNXRMDFg==
Received: from mail-pg1-f198.google.com (mail-pg1-f198.google.com
 [209.85.215.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484r6qnqx6-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 20:34:19 +0000 (GMT)
Received: by mail-pg1-f198.google.com with SMTP id
 41be03b00d2f7-b31c38d4063so3605190a12.3
 for <freedreno@lists.freedesktop.org>; Mon, 28 Jul 2025 13:34:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753734858; x=1754339658;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=Vx9YOMF9/vaXXfGAitKrXqT/YmN37duAwQAvLpyxaqo=;
 b=PODp6k3svEdUZQCl/wcdeEFOkFtn0s/4MRzlDK4xAR1W5rSfHvTQVq4MnCMYkCMFK5
 zN1tkF45n8enkTgCeZdarxBOV6xssx4j6UNbLRF0tWu0j++tI40ouVlYs78s2ASpZBuo
 LU/9Hx0Xt7EsfRHXBusiZ+GPTqyNj5LCbRl/w/NYkrnwBw5MBMGULQVRDV8rnyKCjqQg
 2rD3YkKAFP4wNXzCzk7VC6GYIL7VghDk2+Gsv0T+CXHDtLV7LM7w0LY7jZr7iu5S2f6f
 lXD2RdoBoTtMatWvEC3onid5M+7GOS7TUb2CAFoQZpHml9/rD63opz93jMdlw4gvZNxt
 RjHw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWF7TK4i2Jtnx8r+X/yK1+zXMNuneG10zl6YLiQX2gcunAK02HfUhZ3lRuT/i5I8H8CT+XE6Yhv64o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyLdR8EPPS7H7zKMoH9pI540GunSVPa1IoyTNjF/HQPeIPMNujj
 gJjO5ssbE0NSt/j9TjIcr6EMhD2xTlxCn3h7qC1tt+3/mU9dglR/OBnJahzjllC6s7QaAPWhQRO
 HwS+Y75aqF5LgwXKFdHjIzwpZi4o0egMQwmTXX0xs6XADoBxrWRkjM1uFRfH7p5i4FHqEovg=
X-Gm-Gg: ASbGncvPir85CRRLWp6qHHU3/jDwCbYhVXxM7e3EGwL4adhUYxe/l445H1/L9OuZzKs
 NBFDt3jamIHszMryT1EA7ICByENL03djhhf4OGS5tiAB2kKVoXppTAlSoX4Qee0HC3o2HXwYDBJ
 Kwss8msSlFR7RrSjkLffM5CnFIJe0elvkLUJ03g2bCrsmF+BrrdLGwSH824KwtpK5sRoiiDAfYz
 iqstWyBGVkMyS+fKSXhOvJRoDbxNMPisNKFoGLfPj+0OOzSjlKBZgAwrip9xIvRhWeDdRCdyM80
 wZ3fqkPxRaLuwbl7HKh9AScz2l7uESzq7kukj9QxmUj62OkNEyg=
X-Received: by 2002:a05:6a20:3d82:b0:238:3f54:78ef with SMTP id
 adf61e73a8af0-23d7020a87cmr21229906637.45.1753734858338; 
 Mon, 28 Jul 2025 13:34:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF2NfubVkX7OmnivNJmSnmau6UKEHaNttBxrPWDyk7ZRlG/54KN/lEb53AfFRyD8rGryWhf+Q==
X-Received: by 2002:a05:6a20:3d82:b0:238:3f54:78ef with SMTP id
 adf61e73a8af0-23d7020a87cmr21229878637.45.1753734857904; 
 Mon, 28 Jul 2025 13:34:17 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b3f7f6ae43bsm5545654a12.49.2025.07.28.13.34.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 28 Jul 2025 13:34:17 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/7] drm/msm: Various snapshot fixes
Date: Mon, 28 Jul 2025 13:34:00 -0700
Message-ID: <20250728203412.22573-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzI4MDE1MSBTYWx0ZWRfX8gj7VNqzB3Tj
 +60O5zCNAuvKALOneiNyXqGgTdgxdT+t1zO8cyCtL1B6MiXgMXQ3IfgArnjJBv6LNjXp+WJbJyj
 0qTBtL1iSYOG7t79I3f4zF+/fZF8EORpt4u1uNOoyKMgYjCm0/ttzXKKFfDfQ235pR+VMoK9CIH
 so9HAkaU4z+DD0OXZHa0xI67+Gg9lOBmT/YO9S9eoeHAGglsjf/KpUgCNVISCLJ2NN4dA1w59Sp
 KxXR2VxuTjVm+gyLcH4ThQqhmOx0ZMWFsfMcvtEQDl5HaOkp++IsFKegoUxnW0pgZPOCoJcWSw5
 ec9uTtTE76r1k7VPitePCZ2ttzEvIX8Da4DFLiN1Lug62dykuW39jMfi4ROMSW4jRI56Wn5DSxR
 tXWbsfhHOspn5fV1bFC7TBDoBtFKX9jeEuUqly4MNsMTBu1GTSPe0QPzw3eM6q1+pwORBbzR
X-Proofpoint-ORIG-GUID: dJ2E5P98DS-2NKryZFsgl8_d1UUfbG4-
X-Authority-Analysis: v=2.4 cv=ea89f6EH c=1 sm=1 tr=0 ts=6887decb cx=c_pps
 a=Qgeoaf8Lrialg5Z894R3/Q==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=w1cFhwVCMIBtwBHhTYMA:9 a=x9snwWr2DeNwDh03kgHS:22
X-Proofpoint-GUID: dJ2E5P98DS-2NKryZFsgl8_d1UUfbG4-
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-28_03,2025-07-28_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 priorityscore=1501 impostorscore=0 lowpriorityscore=0 phishscore=0
 malwarescore=0 suspectscore=0 bulkscore=0 adultscore=0 clxscore=1015
 spamscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507280151
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
 5 files changed, 73 insertions(+), 54 deletions(-)

-- 
2.50.1

