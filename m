Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 03374AE1DAC
	for <lists+freedreno@lfdr.de>; Fri, 20 Jun 2025 16:43:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D40B810EB86;
	Fri, 20 Jun 2025 14:43:25 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Zl3GmeIu";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CC78510EB70
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:22 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55K8GiVC024427
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:message-id:mime-version
 :subject:to; s=qcppdkim1; bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbe
 uErvpeQ4=; b=Zl3GmeIuf0dgfyvT0aSr9VnNCZ/6LpbW5f9OlDK4aCKSHamBuJz
 uPMG4E/kYChX8HWWeUK4RdZwyZdp16pbU9ZqiVF3ZO8p5oOSLCYli7BqmPl5A89Z
 n+WvQpRnjPXFmJvQeawf1PEwUxD2Qc+Thy/HsfOqWhOwjf/yMv3UWDEbjs3owgz6
 ua0YL+WHP7uD6us0YZHYgbrszrukHrC1Nz1eiDI2qpbSC1sHp8Gqm8H1wrLSilYr
 q6iaeu91vOIZi8CkaI7SE5rD9jucllprKZ6mowldd3+nRBPwIED8TlTY8uQe7NzG
 kvYifR59cDNOP+Qoaq/4V3mUii4UFLMXLAw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47bw13fkm5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 14:43:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-235f6b829cfso17751085ad.2
 for <freedreno@lists.freedesktop.org>; Fri, 20 Jun 2025 07:43:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750430601; x=1751035401;
 h=content-transfer-encoding:mime-version:message-id:date:subject:cc
 :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=YAhoTHSslWHI/eVI5RR5ldeEIDPqTzprLbeuErvpeQ4=;
 b=X/7D95mGIcOD+HPA1A11eqJm2cy3a/SZTDX07U4c3frJdoz2WJmnMbIPG/wbNGm636
 M2eUixSL1VykfYyqVdDBIIWXuKgXgc8iemc/VmidwR/J26gOvZOR9aSbOkAc0emRoRsT
 yF7F/Q8pY2uuiG3LgrvbB5amCEBgTAtPqOfMZoUpLzPPYYdLqsGrpQpumL3DIeazc4Oy
 NZV8TasubYfPjQGKMoprgxCFA5mrgb4VLCkcsI7w2/ZyIPcJlF7C/sZimsuBeC+fG9RQ
 ecS7q0DaBlNv0wuMVaIdB+4/xv/4QMBwrflGabQUE05+R6cTDyx6bBu5cTon310Cd/+L
 En3w==
X-Forwarded-Encrypted: i=1;
 AJvYcCU5gjrOCqBn093RAoj4Cc69JabwzX5yp5U/KZdhokRHFpiIecD9AsybrBWcJ/EgajUYrVP41OWzVkI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzHnNqK+l+CWSLnsaRTtVeQ5lKBPAdaanRCGy04eNHPThx3GLGd
 17nSyaJtVpILkGUbHOR61DRysBt4het7tGFw0orGuxj0e4Qe/spWfyyHPFe2QSmjjHzrfJ4tcpY
 iMEbus6h3NMgiMyadY0tdSFD8bKznlrv2XyncxLmw+Bcj68a9e3LSSADvFUtZzN2fbem5NNI=
X-Gm-Gg: ASbGncsUxeL1WI89w8lt/FaXkYYBU338A4f2pPggMK9iYT8I3cDS53xyu3V9liffEam
 BNlhizKRhJj9yrDzrXKjAxIo4vbu8DH1Vkw7Nol5HMyDruPF8+CamJvo/NBdgZGgTUrwIx0wUyD
 9XGEuEKa86EQJ8SVHcw1Wmt/Qr+5dOXavEv/3OnC1hYl1MBcGV9yw9VSrqAA3+hgt5iUsTTxGGR
 sRI4yW6yu5eNN6N8Z3Zm6f8ww+vP9RIKf4lOtjN6apYT6ANU0M0pjccSyRWgxKKUHDxisRbDt09
 UKN5BhUOq9I8f0IE0krm/wicNrkyBN2B
X-Received: by 2002:a17:903:320e:b0:235:2403:77c7 with SMTP id
 d9443c01a7336-237d997f3eamr46312815ad.37.1750430601395; 
 Fri, 20 Jun 2025 07:43:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHKsJtreskCbpXvBM14rVJruFPEilAe5QcPvqswZYUDdmFWdwF5fK+Gys5jp5oB13njFvevOQ==
X-Received: by 2002:a17:903:320e:b0:235:2403:77c7 with SMTP id
 d9443c01a7336-237d997f3eamr46312525ad.37.1750430601017; 
 Fri, 20 Jun 2025 07:43:21 -0700 (PDT)
Received: from localhost ([2601:1c0:5000:d5c:5b3e:de60:4fda:e7b1])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-237d83fc120sm19865865ad.87.2025.06.20.07.43.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 20 Jun 2025 07:43:20 -0700 (PDT)
From: Rob Clark <robin.clark@oss.qualcomm.com>
To: dri-devel@lists.freedesktop.org
Cc: linux-arm-msm@vger.kernel.org, freedreno@lists.freedesktop.org,
 Daniel Stone <daniels@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, David Airlie <airlied@gmail.com>,
 linux-kernel@vger.kernel.org (open list),
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Simona Vetter <simona@ffwll.ch>,
 Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 0/2] drm/fourcc: Add additional float formats
Date: Fri, 20 Jun 2025 07:43:07 -0700
Message-ID: <20250620144310.82590-1-robin.clark@oss.qualcomm.com>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=QbBmvtbv c=1 sm=1 tr=0 ts=6855738a cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=xqWC_Br6kY4A:10 a=6IFa9wvqVegA:10
 a=wxOPRAE1bK0FDlpJDKYA:9 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-ORIG-GUID: yYjdWQ2PWRZw1El1Yq5NnzPzjqGjSlX3
X-Proofpoint-GUID: yYjdWQ2PWRZw1El1Yq5NnzPzjqGjSlX3
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIwMDEwNCBTYWx0ZWRfXx4Vsr/7Ybh1g
 DIsJLUVQXIbzHC+mMCNUCj/uIUBQNh+hxUvb+3A+b+neziYMTmAnUXdYbTOTIitkvbUcuuu8YOG
 vRhE++SC8wN4pomPRk2bxKbMSjbJVquocljMc6Y+DskGSrf95gWDDqLJXizXmKoh8mXIhLUMSmH
 deNYk/d/yQww0RPpTFt9A0uMYbq6ee1RuzGRGWagIZEJkfUseF8I3VDSwuuXVmsu/rN2iKaAI8Z
 7w+BtsHR1NNqD/02bIKLDhuuFawjq5BnzIvWG7p27zlyskkDyUf5C91PDIMO1E+OONcniNCNvb0
 izpEkPlfRundGzY5npyevsrZjt3f6Uv2/gVV3otuIYKwEUKcQH6G9ID43GFCeVyPlS7sSV0o3b0
 sJ2J0+IXV2mgxylN65SAlbPfyJnlOTm4RcnMa6nj3HZrJZCzuMFgdqbWmRkU7JQoP30Gx8Gi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-20_05,2025-06-20_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 malwarescore=0 mlxlogscore=965 bulkscore=0
 adultscore=0 phishscore=0 clxscore=1015 suspectscore=0 lowpriorityscore=0
 mlxscore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506200104
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

GPUs support 1/2/3/4 component f16 and f32 formats.  Define the missing
fourcc's needed to import/export these formats, and/or create with gbm.

Rob Clark (2):
  drm/fourcc: Add missing half-float formats
  drm/fourcc: Add 32b float formats

 include/uapi/drm/drm_fourcc.h | 16 +++++++++++++++-
 1 file changed, 15 insertions(+), 1 deletion(-)

-- 
2.49.0

