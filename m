Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C55C4B0FABC
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 21:08:59 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9E4FA10E191;
	Wed, 23 Jul 2025 19:08:58 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dY9FdImd";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 26E7710E008
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:08:58 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56NHaTYM025878
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:08:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=mASOgsCi7NBq5T98FPC/x55U6eCvkphaYtG
 YjqMVya8=; b=dY9FdImdDR9/7eLvB5z/muueEDREJzyboWBxSOLntKGdkenKupL
 19gbBWE4IN96sEDEKmNnsOorRLY3yOZ+ScfhLcoIaJknbgmpeM6GhRtjl47DnT21
 0Pf8v6kEfnLz2upXp/AV9L84pvK+0z7fIakSAwmSpI4RrPdV7s/0xIpP3BIvNmdD
 bCGYaMDGJR+9X/p5PTONCcTrvic+qz0zipnngxozjzjntjyH/YAjujokB6OtqjNy
 8fiea5orKNWNkTp3mnlaJYDJBkiCe+Ev/Bzfuf0OLl4CeL0YkimmGhv88mHszUYQ
 aR7BOf9iBfUkoKvEd34q6MAiC+oZUcgcQ5g==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48044dp3jf-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 19:08:57 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-2355651d204so1181985ad.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 12:08:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753297736; x=1753902536;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=mASOgsCi7NBq5T98FPC/x55U6eCvkphaYtGYjqMVya8=;
 b=bOwFE3EvtPv32+wBSfo5NInBJ2pTvYupIX9NfXO0hTBsgGtTl3I+lLsY56Qe8SsUVl
 nELFx6z4uYJhxVLgTv7779ut6w71vsJ5XUaOAZJuF/1+4mz+eRXjC3lKfWbvVKnRKySG
 iOu8ycMMfhDnEt1vPC+i2IyPFjrKVauVoZmhRUsAM7KIvbM1gsk+jhmol04NKEdznhlA
 BNedATN3KdldTMvcI75aB2y03UnL/esDiVGV11hbasHwCK6tT5GAekW0b7gp7x8tlQi+
 AjGNu56Qft65tN0io+w3X0ys9zzMEMN044TL7IQ/yUowvxN9L7mpN5oroMvAE5vI7W0P
 weSA==
X-Forwarded-Encrypted: i=1;
 AJvYcCV6VTC+JKry/YXWYFxJK0NjzONMaylI5G9v/FiXIQ/6LbLKpF0plsIaOQY00v6NP5hkHMauec9FRcs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywtcgv8gSHnC/VHprpwR4sXE/mVNBtxdO1HjBlDsGfBDVPKxRaU
 caCheXM2Q2jSLUnl3RsDVa6w6RfgGVvC2Aq5FAoYWWAepN2ubsBW7mimglDQhO8PwhLn+boeVIZ
 tM45m8ngUffob+nhkc0mCb7SDKo58WBWvOgJ3f4LDNVFR2HLv5z9OEPDTeeRbpLwNcupPFT8=
X-Gm-Gg: ASbGncsss7j97BJYRDR/EeZcZb7Q4qAB9W66Uwhc09T8niNhrr7C9c7Z/VbGqF9kwpW
 wy5SKLQ1JYIwUQuU9d4GrT0t2Glzk61pJ+QZgLAlx7wT43xvZO+Mza1FTv+gUDaCRj7rA1zU694
 e0td7MsMkl8lPW58CQZMCELqq/6Z9yFDqBDyEsKS//FnZs52nT0LeCBIvOHshhsJdLjp79tItz4
 5KaHMnzcvD5SzRgY5SXFdlzFvJoK9ZCH2rrbSuhHTn5F2Ke/B3VknKcmKb9XuXvIaHiPQI5YmI2
 WMx2UpN0aLIsISLlr4FybdH0OhbXqE2yxTxrpnKtoleEEFvVUUs=
X-Received: by 2002:a17:903:1109:b0:235:c973:ba20 with SMTP id
 d9443c01a7336-23f9820283dmr69182725ad.49.1753297735435; 
 Wed, 23 Jul 2025 12:08:55 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhVi/6gfyiJ69GTvshRkz/NQIrNp1El4Pbp2UDbBc4h/tVujCiVC1TqjgOnUvKlvGS+Ua0kA==
X-Received: by 2002:a17:903:1109:b0:235:c973:ba20 with SMTP id
 d9443c01a7336-23f9820283dmr69182405ad.49.1753297735019; 
 Wed, 23 Jul 2025 12:08:55 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23e3b6ef9aesm101308975ad.211.2025.07.23.12.08.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Jul 2025 12:08:54 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 David Airlie <airlied@gmail.com>, Dmitry Baryshkov <lumag@kernel.org>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 linux-kernel@vger.kernel.org (open list),
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sean Paul <sean@poorly.run>, Simona Vetter <simona@ffwll.ch>
Subject: [PATCH 0/2] drm/msm: Error path fixes
Date: Wed, 23 Jul 2025 12:08:48 -0700
Message-ID: <20250723190852.18394-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.50.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=BJ6zrEQG c=1 sm=1 tr=0 ts=68813349 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=xqWC_Br6kY4A:10 a=Wb1JkmetP80A:10
 a=eljiBBwz-SQjAQrFlygA:9 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-GUID: OtRtBIx6Wfy4cOTCSMCma9DrzWDwcjia
X-Proofpoint-ORIG-GUID: OtRtBIx6Wfy4cOTCSMCma9DrzWDwcjia
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDE2MiBTYWx0ZWRfX+8aBx+mJeNkH
 OJJu/6CnKEFHJLpMac2/A6B0VfpJaFINoYOAjfhhFLEQuDoTi5b4kl+IS8Cmzj49LKtifkObiL/
 S6oFCxmNnb9dSUry+qvuKp6dlCbdcVI2eISaUV3i/2AGZofN50QMRjjtGoMTQWmwPbLUijB+d8Z
 FEvY3kJSD6uZ6RHLD7NvDUPuKhJpv3kmVU/BQJ6z9Dn0JYPsLXFDJtuQ1J7WUwu8yeKWR6Rii6Z
 eb/4enmjqLcyoXubv2EyRDv2fwIp4rV8PmAObLy5vy+SmEDKbeBqyaw+R20W0RjxIMvo8nI11xp
 Q6ALxl0So6p8/ngO/Dnkuolhr+Pej0JDbvq/E7a3g033pSgdXhcMBYYFcWZPLpaRrghnrskDUFm
 FkrtLSYZoVu4mVeJ9jKzj8Kx7Due7OkZMhThqOkWisvZVbgfq3ZF3JEWneMcFHuhWkMNk1hb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_03,2025-07-23_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 lowpriorityscore=0 clxscore=1015 spamscore=0
 mlxlogscore=952 suspectscore=0 impostorscore=0 phishscore=0 adultscore=0
 mlxscore=0 malwarescore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507230162
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

For reasons unknown to me, systemd-udev recently started limiting
max-files to 64k (at least in f42), which exposed some problematic
allocation related error paths.

Rob Clark (2):
  drm/msm: Fix refcnt underflow in error path
  drm/msm: Fix submit error path cleanup

 drivers/gpu/drm/msm/msm_gem.c        | 4 +++-
 drivers/gpu/drm/msm/msm_gem_submit.c | 9 +++++----
 2 files changed, 8 insertions(+), 5 deletions(-)

-- 
2.50.1

