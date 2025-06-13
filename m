Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D4D4AAD98CF
	for <lists+freedreno@lfdr.de>; Sat, 14 Jun 2025 01:57:17 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A947210E9BB;
	Fri, 13 Jun 2025 23:57:16 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iYcXUohV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 69B5910E576
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:12 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55D4tpRk006466
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=vo4XmmAgYUZTgkidya3fkre0Z5bz4I+Pzm+
 3AnuH5Yc=; b=iYcXUohVmqKL4uIdQlfsFSW8Sg28c4PoVHPpLqQ3WfbpCs4sso2
 ZVA8whL039C9NKvi0KGXrQQ3A9yCoT8n17jBTaNz93gDBOn3HZh+xp50TPdMcFmg
 Ab7mCELdJ2eeXCDeTep4TvOLi4U+OR75Vjr8f9gt/foxBvUIm31+E0/yD6LvWQa2
 +yjJVMP6z5UK/9n034UMhC40qKjj18H+St89RtznmcbtG2/nnRoOa3BHGJ3vtLK6
 HNETvXQNa3Ct50ItH1EhWQHB8P30yCZayH3S6MF9NLqcv3Orkg6tVqsk+wVUfAFl
 3lCe4LDU36K77zrihXYJoZ20rNqRU9AEDBA==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 476jrhkk73-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 23:57:11 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-74868e73f4fso2054372b3a.3
 for <freedreno@lists.freedesktop.org>; Fri, 13 Jun 2025 16:57:11 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749859030; x=1750463830;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=vo4XmmAgYUZTgkidya3fkre0Z5bz4I+Pzm+3AnuH5Yc=;
 b=SWXE+1GyCIFHT53wn3yw67a6vnDadmLuZE6wB+tGnz9JWjmrj4HYK/J54xZPA8Tu46
 YXXQp7owQNPOsbF1cansksOw6Ae3i5t/LBrR1ABFy/ppNVQJUADdSqkPnqL+btUV9Y5n
 U3WukHUSsD2uZB0mtiFGenVTQ6OxCyGwMmuRAYpjDmfy5SvYScTbQAl68jxMZYlbgQ8f
 9GW70f2UqBw2Ui8AtZT+4gEID8i/HMwYFxJovYQd0aJGdwT2epIqG7s6+fS8AuggWpzW
 0qcQsHJUzJP6kdFrMDNMNw9IKaZhP5hkAOErLG2ALxpe2vmAYtDsXuTBX1vrRVkBCD0p
 BUPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCXdr0QMi5vjUAi8sN9jcY9OEyMFFdKPUxIrFn2d2dHOBG4txk8B/sPHXq0fpIWugQF7vj1PkMUw7U8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwI7KBOMQG1Jo7Jbfc3bRWBcfZzCQXvKDD+aYLMbRb3MM0HBz3K
 EImtE+kmxQ5YXVFQvryR2SPebEjxP9SpzpLKO9lOmVw9/h9TFH2QkpxXDka3si+BmC9CV9YB2ti
 7LERX/dbDQj6uiFbgkIR95fv+/ri1MzUtHeslTOBpKqvU0usNnh/cCpGJBlFJ+vK8ZUnjscM=
X-Gm-Gg: ASbGncurH+cmGSVzWRGxnDbviGJ6cGQHB8VyGgDbXDVTbJYWJY4cD9XgW6Bg12GpcKK
 C0Ovo4g8c6/zKvSgYbgZnaA58gI0UQscpbcxSi+zErpfuJLZU+I280D9VFSasHhroG1ybIQDjr1
 74sbbZctR0vrtd2FsD5fQjKLRos/TKxTJUSlcflqq/KEjkkRX2rdWOmfE/eicqnp4eLUk7ofBZN
 8HvgV8jU6gTfifDOhTmKEGKMvfCy9sk1bR04Gwwm5DkROwxFJzbGZ+khRnnCxEcy07RLAJRGUDW
 K1NxsdcqbTq7gmBrnTI7hm692uT9/viQ
X-Received: by 2002:a05:6a20:2589:b0:1f5:6878:1a43 with SMTP id
 adf61e73a8af0-21fbd4ca4c9mr1765502637.14.1749859030152; 
 Fri, 13 Jun 2025 16:57:10 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFnJbt5NIgLECytUdxWBytGTQ51ZldvE8PCrvMN8X7vGLEoCu4MjtZ4dgCdy6WCUnaT8c/EOw==
X-Received: by 2002:a05:6a20:2589:b0:1f5:6878:1a43 with SMTP id
 adf61e73a8af0-21fbd4ca4c9mr1765474637.14.1749859029726; 
 Fri, 13 Jun 2025 16:57:09 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b2fe16432b0sm2384679a12.24.2025.06.13.16.57.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 13 Jun 2025 16:57:09 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org (open list),
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/gpuvm: Locking helpers
Date: Fri, 13 Jun 2025 16:57:01 -0700
Message-ID: <20250613235705.28006-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=EovSrTcA c=1 sm=1 tr=0 ts=684cbad7 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=aKBb6tC2I0So4jIVd84A:9 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-ORIG-GUID: niu6hOF-agBelDiZRX7bqg1XTrLsH7q5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjEzMDE3NyBTYWx0ZWRfX2OXzNn5q4VGD
 4buAurfq6ofJ43d2CrU+okyI9f1In4YPd+LW08TupggVvy/P8wiEy67QvJzaabxLUEwPUSKSvfz
 kQPmzoCaxHWB//HP9hlMiLKIo++JmkW0k18W6uVWECnNzCSfomPm1DPa0Is5bIP+mUh60qOZaRe
 l2ILBGP5HlaGNuIsbubkmwosWH2r8Yylb2EzC4HOj6gVUFxBEN27VHJkUanyvIslcZlXZ4mO2v9
 k+NBPfFNTvoPKn5iAZ7H8HE6oE4OjMF8X4SmdP+Qi1LrqGlPdJdvabhnkUjHhCQ9/bj68cnR58n
 JZPQKRNH9NItGdSi1TtTVHC52UI+6ydwADrpNm73ZJJAHsJiCFLRzt2eNwd6pu0YC+1zaQLFm2T
 /pqT9gO60uEdThXznnI58xGze3p2oHBgHnXBZ0pbxCdOTH9Y9NPwZF32naXfdw2HFE2tCtQj
X-Proofpoint-GUID: niu6hOF-agBelDiZRX7bqg1XTrLsH7q5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-13_04,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 suspectscore=0 priorityscore=1501 mlxlogscore=853
 mlxscore=0 clxscore=1015 malwarescore=0 adultscore=0 lowpriorityscore=0
 phishscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506130177
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

First patch is just some cleanup.  The second patch adds helpers for
drivers to deal with "invisible" unmapped BO locking.  Ie. a VM_BIND
ioctl won't explicitly list BOs associated with unmapped/remapped VAs
making locking all the BOs involved in a VM_BIND ioclt harder than it
needs to be.  The helpers added solves that.

Rob Clark (2):
  drm/gpuvm: Fix doc comments
  drm/gpuvm: Add locking helpers

 drivers/gpu/drm/drm_gpuvm.c | 87 +++++++++++++++++++++++++++++++++++--
 include/drm/drm_gpuvm.h     | 14 ++++--
 2 files changed, 95 insertions(+), 6 deletions(-)

-- 
2.49.0

