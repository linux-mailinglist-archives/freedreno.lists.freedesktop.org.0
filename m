Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6C7B6B2CFE8
	for <lists+freedreno@lfdr.de>; Wed, 20 Aug 2025 01:29:16 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 696D810E226;
	Tue, 19 Aug 2025 23:29:14 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kr3KqPQ2";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7172610E0F8
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:12 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57JL0n7H019887
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=uXtfjUzzByf11+oWG4pmF8mNkBkkbpFfD4T
 0474ANBY=; b=kr3KqPQ2BQHM8y9CIGwXmvqiMqQObMhTD79qY4GbG9+5kLjJsmf
 xpUor5AIH/xYM78EW+1aJjagj8CJ9GvfJSKYTbVsdkZtjppE8Lz1jpRdidJ4AG0y
 NKvJj8FnI+AFb8wND1dbasNCdM5r3QyEXE6DK7qifZ9tXmOc1ndriLLHaAyzAd3L
 DEng6MW4Dg+5AHMCom5acBZFX8tDZdzSRd49gOYZlsI90ztEGjUHSrCj+TInoZgU
 LAdSdkgQZkyv2A2R8jC2jNDyDyq67HsdYVau2D3TyFMcGwI1wnKEkuM2SdilTEW1
 +nkQdaekBLqhadKUGlgi8yGQ0FVu3HZsghA==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48n0tfg8wj-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 23:29:11 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-244582bc5e4so69867465ad.2
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 16:29:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755646150; x=1756250950;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=uXtfjUzzByf11+oWG4pmF8mNkBkkbpFfD4T0474ANBY=;
 b=iZ4TDXfaZH06efqO8enXbVnUMnkRjg5RWTmTOqv/ppf92L2YJVBn6SV3d7QbxYt8nT
 c6+uOceoeLOq98ePPKg22/iSNsrfFHITdhfWXGGhydXZg6exf9hUZRN5dXq+hkMD3Zux
 fOJCe3F97cVj2jfTv9t50ak59mmn/i+30Hy2cCkXyiJH3chkwppZC0xxQaxd7D3BPHCg
 Ph761Ya5fd6mXN7PSbvOyO8T03xfb5goc5fAEKtnv+Es3nlAwBMxIltPR864esqbasfl
 5xGR56rwgqiF6UeR5Yx+vHMgNTP7LrdxWuJtT9ccTXdUvT5a430UFe16It4hrhXh56Rh
 PVjA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU9OacRYXB+Oi9Wj6q2vHPStHO445U6oXRwwbT32+Tg1vk2l8N0HBlOkxP81phgKtZtZ+E2N2BjalI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxq/r16VRW44p8IgSXW775up/I4glCGJ46d2OZyMKyGgREN+b4F
 jMu2k2a8do/MF5J8bZl78dYoFa4caWJl0ZXmenJroKIEszC36wSRR3qLO2PTuUtNpCkquyP0IK3
 YEkpIZ2Iv6I0sI77KppIx3S+lII5FnlGHpy0uQh9lY5JhAkSKnTRNw5nUz4TodbBofEW5Uyw=
X-Gm-Gg: ASbGncstCy9HYgfGbuyauaaV6CEYhzAn5qjGJM0w9PmodNj5ahIF9iTtxWVs/sIvWnD
 RUlY/RwodU5WtHCFVJ+24RK2UwdYuncpLn1sz4VmSEqc0mDgaoKnrfCHGYjChcQCTlirCv2N4Iu
 f0gspaQ9mzPcGtAWCO/xcHXm15lDWnCbcpw0nx75u1oMK06X7nprUQeOzxELxO4uj6IFOAksmLt
 Ekit3KCExIGdGWZoGKja//QBcpFHjAVMXrVXdrYevoD+AglGIpXNsFPYoENo8HdeYEQTJ86fryZ
 dm7qmcZEejG0i0OKC8GvvBw2Hb75+LPw6PyDTWAQsiFfnWvB2u0=
X-Received: by 2002:a17:903:181:b0:242:89fd:48cc with SMTP id
 d9443c01a7336-245ef25b64fmr7800905ad.50.1755646150141; 
 Tue, 19 Aug 2025 16:29:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqUzvFcXROWico6d5Pqt2w0AvN4+pGykRNe2nE6KgbOBguGbbEYaRHz4y5taRq3of+8i1TGQ==
X-Received: by 2002:a17:903:181:b0:242:89fd:48cc with SMTP id
 d9443c01a7336-245ef25b64fmr7800625ad.50.1755646149739; 
 Tue, 19 Aug 2025 16:29:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-245ed51a97csm8052695ad.132.2025.08.19.16.29.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 19 Aug 2025 16:29:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Connor Abbott <cwabbott0@gmail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/3] drm/msm: A few GEM/VM_BIND fixes
Date: Tue, 19 Aug 2025 16:29:00 -0700
Message-ID: <20250819232905.207547-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EuuLbScA c=1 sm=1 tr=0 ts=68a508c7 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=7-57VTQsmsoFMMg7Vz0A:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: ipEa_MVekV38d2BUA8uBr0JE_bJOgm4e
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE5MDE5NiBTYWx0ZWRfX7cDja91yDWZa
 /APH+idDYOL7naE8NIGvKEzs8fCqif1oYmnWEaTyw3JJt/4oqa0t655W+FScNJlE2J8hW/J8uxX
 mD7U5a81H5Fphyx+sGDjWE24RQHnMzzyGO92KDE0DrV9hwENYFgfnpKpdOZdsFOBaqy//a7qstU
 kSHCIUZGADqbsHkemQ/EpE3knagcmWo77dmJcCoNlifN6+SZVwl3JiEbdYCC1spz7E/tbXZShvN
 lDZjyf4+wvCCNljrvdwr4YHU0ts+q25Tu5wdMQZsusy427MqeQOWezl7jQgXieTubYHuhtGDCql
 cATxAj1gInPvUWIKoc4BiAVqdbueKpLiYywr88seke0a/vJkDGB+wTW7HYCjzsIDo9UBfCKje+Z
 ofSwe7bx0dOt7iY1V1ayA29HnMiXSw==
X-Proofpoint-ORIG-GUID: ipEa_MVekV38d2BUA8uBr0JE_bJOgm4e
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_04,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 phishscore=0 suspectscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508190196
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

Fixes for a few issues found in vkd3d-proton testing.

Rob Clark (3):
  drm/msm: Fix obj leak in VM_BIND error path
  drm/msm: Fix missing VM_BIND offset/range validation
  drm/msm: Fix 32b size truncation

 drivers/gpu/drm/msm/msm_gem.c     | 17 ++++++++---------
 drivers/gpu/drm/msm/msm_gem.h     |  6 +++---
 drivers/gpu/drm/msm/msm_gem_vma.c | 31 +++++++++++++++++++++++++------
 3 files changed, 36 insertions(+), 18 deletions(-)

-- 
2.50.1

