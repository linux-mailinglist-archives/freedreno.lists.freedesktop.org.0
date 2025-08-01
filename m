Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3267AB186F4
	for <lists+freedreno@lfdr.de>; Fri,  1 Aug 2025 20:00:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4CB0010E8E5;
	Fri,  1 Aug 2025 18:00:17 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EW2Ja2EY";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 252D910E8DB
 for <freedreno@lists.freedesktop.org>; Fri,  1 Aug 2025 18:00:16 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 571HfL4o029328
 for <freedreno@lists.freedesktop.org>; Fri, 1 Aug 2025 18:00:15 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=iHQTKYkj0qpzUWY7+WEgpg8wdP0WoJQ6dPs
 zuReeFiA=; b=EW2Ja2EYQ2iz82iQwENTK1cE6hsXSob9TuTFT78v5DR4od4kq0l
 bNpMMTYnpLdAR8uTpw3w8ELN2i9GnUHFAkdCmdUYlMiNKUon42n8B4senmalZrpP
 cvNJHyOOE5+O0xqN3mcb5rlLMmraYuS6GmXye3YySW9UG0XCnv8jhi0wtpSDO0ZW
 +D2XPZJLwn/Jf4CjLj3ZXcz2ymo1I4sYq1P6ioognzMkn4eWcPoVcyE2aARzQdlA
 3kmkZnYfdlwejawSvbqrVR1QN4CHuEFAEDu6obhRcCPrKWEavBBiJ+QH8NQZx0yx
 UPxkFdW1u8LQCAA3k4RyQq6dW3KgG2Q1/pw==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 484pm2vm63-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 18:00:15 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2400499ab2fso19954635ad.0
 for <freedreno@lists.freedesktop.org>; Fri, 01 Aug 2025 11:00:14 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754071214; x=1754676014;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=iHQTKYkj0qpzUWY7+WEgpg8wdP0WoJQ6dPszuReeFiA=;
 b=Ashhrnl7ASz8g6A0lrOkSyDT+Q/jFhQpMYIETGpyEyFtZHtWlfxH+pEazk/B3RKBKe
 GQ69TkDrP5sq4/u8iVNEKHFij7heUB20EYYpgSstDtu5CiYhnLgCScs4pVmL6ZFJ3eej
 M/9lXuhkDfQTeuVmpLwRbofeOqwCa5aHWN5FjewukGi4ksefrQBWBVHJrYUsMGk8Nbmy
 NEdtxNAy5KFMqaQXhgCRVejxx1Xxva+Dp78Spg5mOPHUOmebkOw962s7X6jTYvPzajek
 FlA3vw9RbYVqoL40aGSFLFza6x3XFP1v8Un9gqPrErPBbLBQcoioKfoBlU0xIV4pQ/Aw
 nOhQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXmauBXl19NZ1VANjSkwZNG5D9Rx4g1OCBXoS9NF/76vRmnVPpBuE+fSDWBv7gJe4NQVfPqHxVLK+4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxry6pzZjurAc8dttYKNiBoQSWHnp7NfakVGI9mqGe5UTM1cwDP
 MOHNADJwkGs67qkX/y8xSb1v8CcIrqeUSJStgYo4+UUg5K6bnCZUSQaTaAJ2AOdhka+5lZlBcGz
 8LYFhxF+F+V2R6xw5TEvsP89wzxaeZQevkGn8dfeoSXNH3M23cG5mDojBRnsHxCd4A3gvERQ=
X-Gm-Gg: ASbGncv31JKZD8Nt3df7FTFE4K1vdMFul39Y6R0xo1ttbzgP3tUI6rjH/lf160mZGba
 4qXXhFCD5Oh1IAhrLF363GqN3Z86N3J4GgljmQvVomW5pPTWZEiixK9YV3X6CUdEG2dtQ+0lFUQ
 knu9qE4Qwt3CE2jG1t8qnU5/xUjrvVmgSfgHShgkFlflgAXQIySKar3xYuPbpN7oLbqoKSQK6J3
 wtqLYIAwNK9st/AwoMstrp2gP4E+0zLBvgJbhyh32CA14mhwuO3iFlYiRYa+FvZVDW7yJ+Jf6Pz
 FQl4QjcIT2KR/c7tEODq4nCOqbPPwVGcLEkIaYzEuchN8ehEah8=
X-Received: by 2002:a17:902:d415:b0:240:417d:8115 with SMTP id
 d9443c01a7336-24246f595eamr4151495ad.16.1754071213712; 
 Fri, 01 Aug 2025 11:00:13 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHIiS1uNtFlKO/TgDqfd33YVLs9CK624JVjnlxU52duE5nqqItwb0e7s0qZCDfogQasU+SoRg==
X-Received: by 2002:a17:902:d415:b0:240:417d:8115 with SMTP id
 d9443c01a7336-24246f595eamr4151005ad.16.1754071213205; 
 Fri, 01 Aug 2025 11:00:13 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef7562sm48517715ad.24.2025.08.01.11.00.12
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 01 Aug 2025 11:00:12 -0700 (PDT)
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
Subject: [PATCH v3 0/7] drm/msm: Various snapshot fixes
Date: Fri,  1 Aug 2025 10:59:57 -0700
Message-ID: <20250801180009.345662-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: DKfBEpKZeqMmiR8aAfcjKHcKn-OTijrO
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODAxMDEzOCBTYWx0ZWRfX8jWbfUx+5RUd
 rkwPhOZDIE5btGcpwMnhGQdCV2dK8E2NLrSlPyG3CylOMl/1o9eA/zuHjcel43VmKZVQ89RGMqR
 8Od93g86xTQiZFqkA3BVkjwVGyEC3jCf86W86uzOyoQy6cVJjo0+3vJJkTap4Fgj926+QRjDkj9
 U2B4C4Dhy4oarrIwCkcemOLEkbq58LP9WyqAgj/1XhlCMEhbLzqCHjZsw+g+LrWGy9yhgwDnbf+
 k20iMC3r618RIGXDPHrgR5y8D7yc4j+cXy2MQubjFGof118NJiTwPo2YPcVgIXhyYJadjTV+gog
 FB0gXL3lnONJ0VaUYhfCV4z6eTBQIScAZq3l707RmRQJ+vWRoKTnjfEvO3JoDRLRT2lORbwq83d
 QVwAzEz7LACbg95QN9A6MGue+3rSgRULsuYPF14VTtBw7zshdEvDz9cVnmLubwOqJ9xrJRzp
X-Authority-Analysis: v=2.4 cv=HfYUTjE8 c=1 sm=1 tr=0 ts=688d00af cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=2OwXVqhp2XgA:10
 a=w1cFhwVCMIBtwBHhTYMA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-ORIG-GUID: DKfBEpKZeqMmiR8aAfcjKHcKn-OTijrO
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-01_06,2025-08-01_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 bulkscore=0 suspectscore=0 impostorscore=0
 spamscore=0 lowpriorityscore=0 adultscore=0 mlxlogscore=999 phishscore=0
 priorityscore=1501 malwarescore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2508010138
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

 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.c   | 47 +++++++++++++------
 drivers/gpu/drm/msm/adreno/a6xx_gpu_state.h   | 38 +++++++--------
 .../drm/msm/adreno/adreno_gen7_0_0_snapshot.h | 19 +++++---
 .../drm/msm/adreno/adreno_gen7_2_0_snapshot.h | 10 ++--
 .../drm/msm/adreno/adreno_gen7_9_0_snapshot.h | 34 +++++++-------
 drivers/gpu/drm/msm/registers/adreno/a6xx.xml | 14 +++++-
 6 files changed, 101 insertions(+), 61 deletions(-)

-- 
2.50.1

