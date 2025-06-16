Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 282B1ADB4AD
	for <lists+freedreno@lfdr.de>; Mon, 16 Jun 2025 17:00:09 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0033510E3D0;
	Mon, 16 Jun 2025 15:00:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Haj0Tu6M";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7256B10E3CF
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:05 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55G8ki4V003184
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=xbppaUr2NrQq7pTt21P6ALoliC5BeUqVa1k
 k21RgCQU=; b=Haj0Tu6M2xT442eQDTceNCrrrvqsloZgSta/oVj2dnQjY1eEU1O
 LTB7RKgx0Xpvxr05RSyqIn5AI/dRbaONgTEKXxarvHv3+kLXDbVWvTZR1YoZ/Cat
 Eva4xLN9pWtSK3+Jq4SCCnIf5dpDd5QTRe4oUMCbCJ1AiDKwGVJ8Nd5koS6xIyNw
 j4iO53knWFtI8XUsJjQD+UycKDrfzUHGsAmAVSo+iwfsUAuUvwxYOBS9WTAJDyTv
 cO5rgKLRLwPYzLLLHjSziU0frmFgOnQ9k47RpeqAZApdG0akwiLBULuOmbMA4Gkc
 wwj9iUuaSCyprJgLyNLqWeM2/oJEt4zKZYQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ag2313sc-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 15:00:04 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-234f1acc707so31939695ad.3
 for <freedreno@lists.freedesktop.org>; Mon, 16 Jun 2025 08:00:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750086003; x=1750690803;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=xbppaUr2NrQq7pTt21P6ALoliC5BeUqVa1kk21RgCQU=;
 b=lRn2ty/p5TGt+Ucf+40777kZyb0ZaPuoBhmIFk4OT7OjXpaKHsuiv2x1o+SGA4n0rf
 ynD7CqDzuyp1qyblmD/5HR5bphjlNHQNU0EYZBv0WccXfJwfh8A6ZNp5xFkB1+Yc696d
 A9PY15ADkkjWlkNSYOYf57h4Qzy8xZ2mVTtV/eIWcubcuq1gS17aBUK0pdwnwt4yo+JM
 qdSPpvg2sO12j8o/rEYdc1TMs5hy1CdW1JXW3xNrQmLBPuEfgprWT2J6cfSbL55gBr0I
 nO5fzZ78vVKcQykqHXLcZi5DrBxn5JbrHkIeoy0CbFCo5DmgWlOKCmWUUwERdQz1wbro
 bZog==
X-Gm-Message-State: AOJu0Yxwlja05DoZ2xTSzBiwLksGVD/T/JEDly0B4Gpg+gAlV4AAoGIt
 Gl9nQAKB3TZKpfsqYKggEGKVJVrRXUMOZV3xzMfwZFUjGFgfZwMzOIw1xY6eeiYnVeVvWyNF97H
 1bylHew0aOrGOyQfvZ3gEd8DDYL5ByJpbm8KkkGKCo/oobBkFKqgLDtADV4qbV9/FFb5IKVo=
X-Gm-Gg: ASbGncsONojZvoDDaWMN55IJMcF6ijsCa+8WZ/hsTwFrPsQcb5AAmqt1L36/o9nsA/3
 m+mtakgziCUbnqt4gQY8eqdIWth2B44n/JxvpQAasgdDdsrarmFzWc4BgQR3WICj6hXanuFTJV+
 5HPmAvRoU8cMXluQZIeyRjdB35bt5PVNhgAcXL4GgTWDcQnvSjPcxonuzwx0DOEyMABS3KepM9v
 eruzQLWaGeLQAD9l4QPR4LJGMqGS67SKKZtx2tlNo2WuMVNJd0Y+Lhmk9T9Qg9E/9BA03No0SUK
 KfzKDsJ69pd2It6aH2YXW+Ggn+o0tABI
X-Received: by 2002:a17:902:e5cf:b0:234:cc7c:d2e8 with SMTP id
 d9443c01a7336-2366b3c3897mr135205065ad.37.1750086003246; 
 Mon, 16 Jun 2025 08:00:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGByieJvQC5PoCbVHaqizg7yUTH2Fgq/z/jFnF1lZLOWUWRn/2Xz6BKqzn/JxUX+pb3is1aaA==
X-Received: by 2002:a17:902:e5cf:b0:234:cc7c:d2e8 with SMTP id
 d9443c01a7336-2366b3c3897mr135204465ad.37.1750086002816; 
 Mon, 16 Jun 2025 08:00:02 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2365deb0fc2sm61892525ad.180.2025.06.16.08.00.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 16 Jun 2025 08:00:02 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 Danilo Krummrich <dakr@redhat.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org (open list),
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 0/2] drm/gpuvm: Locking helpers
Date: Mon, 16 Jun 2025 07:59:55 -0700
Message-ID: <20250616145958.167351-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: S7imFmxcvhuTGwaQZo42EUxjFXIaXiih
X-Authority-Analysis: v=2.4 cv=edY9f6EH c=1 sm=1 tr=0 ts=68503174 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=GKy6C-6KEHNy0sv7olcA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjE2MDA5NSBTYWx0ZWRfXzUk6lw5DSZ/s
 BOPvLdDLteTT1cLHrVPTMPRMcYHoASQ2x0Ipr3GDw12TYaTXMVzrSsIM0u0X0UnOLcLJIUD7sp6
 HYQIKR+KZNoBSWTcnas8oND/b4RZbTD/sF8tE/xVOvJPO+yvsgaN4/dwMj1lpN0COHx1++Qascl
 wMNdDvO12gYAom8JKv8jyA0DY2vqDTs3SqAFEXbbOOYXOM68qVcgVmxE/o2qo8HtwK5TXztp5Hh
 m6201zJbuaz09bI4V1Hj2ljvgd9XbvQl9c0imB+Mj0znECBXht9DIBytKpwRyFaca4Ut9Dx/228
 b1mTPqW+PSydPxTuLrmKVnP5J90rYdbQL7p0C+HwyfaEvfjZQnNPuF9785sDge7t8/I/k+1k6va
 DbLttNqv6peBYl0/+N1g/iGzekQQkU5ERM8Tw6s27Q5OwNPIbNHgRYyQdEaDCdktONQ2mucU
X-Proofpoint-GUID: S7imFmxcvhuTGwaQZo42EUxjFXIaXiih
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-16_07,2025-06-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 priorityscore=1501 suspectscore=0 spamscore=0 bulkscore=0
 impostorscore=0 mlxscore=0 clxscore=1015 mlxlogscore=855 malwarescore=0
 phishscore=0 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506160095
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
 include/drm/drm_gpuvm.h     |  8 ++++
 2 files changed, 92 insertions(+), 3 deletions(-)

-- 
2.49.0

