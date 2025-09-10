Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3F867B52291
	for <lists+freedreno@lfdr.de>; Wed, 10 Sep 2025 22:44:33 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EF95110E9DD;
	Wed, 10 Sep 2025 20:44:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="XrU8KvlU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 389FA10E368
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:29 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58AJ6HIW024499
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=nWIoku7RCCmxR6hiLsQeRJ
 gxh4TQgexEWCOmvJvrbBE=; b=XrU8KvlU3vGyH+KjktquJW/5Qdf2u74w5e7fCp
 aeasgqh6UBtPmRY0Pd4JlThpVgJMYBBQKAZP6sNseY2UG3nVeKaunThETKPEE2T/
 GsvAC9/aXv3SUKokTYn24jrK3ZWS9kYfHtAZSt1AxFFmDZrTP7Bq8PvEqg+mGjFE
 hFD8j+G2tj49MfeijhoLY7pXcjOg+kS/SCtJ3S3cRZNheMSz3yzTLsZs8sFJyXcQ
 xKS7wUrdqvxSGJ9Ggi36OuMQ5RIOX5j+rKR7Blfwuvf2JdON8qV6oZjx3nZsAE03
 wWVO/MYe6Dlhs55BNcMFrPwSRZVfAWUsqzlOtewCB6Ae32Vw==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 493f6h07jt-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 20:44:28 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b522037281bso23732a12.3
 for <freedreno@lists.freedesktop.org>; Wed, 10 Sep 2025 13:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757537068; x=1758141868;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=nWIoku7RCCmxR6hiLsQeRJgxh4TQgexEWCOmvJvrbBE=;
 b=t6JwUgcUWJpowoRli8H65cdMbnJpmevvZ5j/e5kU0FxjQE44JKxw4MFNo7yK1dj41n
 9l3enizhLmMoFVaAfJ4Adiml+LIZvRBMnOvot0cBHrbntgtZDQrl/E9jfMCva1o8+kQw
 CR1w3TK86cSRrjRb68EDMtDDUH7NZXWoOkbbVdvjCo8xNYgVsQ2MOpZOl+7mfpLvprDh
 NDstGaOoiLW+QheLmrfsue0EQS7Pkpv4k4iP5IoMukSRk1oIJzkrR3Bzgldqz5bQ39aS
 254WHg0MoQrzI9nAT8c3fd/hZqrX39cSGSlj1B8Nqiu8WxsolsoVJE149MYGCyjNUJ7u
 F7QA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX1jZXUI5G2uEhgyhjg5AefGHoeMbRZA47kH/YR9aGNWm49SV8H6/M1yY4Mw+hDgvRC6kEij7s6cio=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzDNuYli/XxksASdo6QqjSCdx63eWHaw8D4VX+Fe7jafXQxo5cC
 uJjLn+CgwD7J2z6TLyF3M0VUiy4gblD3EdSOXVFQAJ6nr631O2N/3TIz1GIwPNk8IQbIatszSPq
 g66f68JCMEZz0EcElPY6bR6YrKC60OY7v9f1d+jJVw6AjW5UptJmhidaD146ZQL3B2bjLmMs=
X-Gm-Gg: ASbGncsKKnkDKcbwrxI9B5yJ1j62HRGb8/R9BC0vl0uo3FMct1l9jX1TcC0jyqGUJqV
 MjY699UZfli6qIoBv0Vn5qJ+dAhC9nru+rVRzV7R2eGsAOf++/9BU2wJPMaGuW6gpmB5IZ9xvwu
 hyK7gHEclaMa8T3zwsSl6q3UY+CfUGeD+Ps6w3H750mTuIVmYMXw054YlNam2WLn1cle7m2xTjv
 dH03ckkUo9WtHFEs2P9of3M0stvWEdi8T4AvzM1mx+IzNSplN0iQwaONKjC92Eb6sJ9zf1/OMsk
 eEX78vDb8T+CG0dyiOO29f5jQ6eXwVE10HXN+SX53qwW9hjwl+vEUY+SqMU0kjkR
X-Received: by 2002:a17:90b:3f8c:b0:32b:be68:bb30 with SMTP id
 98e67ed59e1d1-32d440d2749mr22619405a91.37.1757537067804; 
 Wed, 10 Sep 2025 13:44:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFLzBx/C6rpXTx/AbKEdDRvKi+XAeJbA0oSLh+2R4Y6TD77ThmcYAVvMZfgGZ6ZPkjXKl0yyQ==
X-Received: by 2002:a17:90b:3f8c:b0:32b:be68:bb30 with SMTP id
 98e67ed59e1d1-32d440d2749mr22619323a91.37.1757537066397; 
 Wed, 10 Sep 2025 13:44:26 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-32dd61eaa42sm46771a91.5.2025.09.10.13.44.21
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 10 Sep 2025 13:44:26 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Subject: [PATCH v2 0/4] drm/msm: Assorted fixes and changes
Date: Thu, 11 Sep 2025 02:14:03 +0530
Message-Id: <20250911-assorted-sept-1-v2-0-a8bf1ee20792@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIABPjwWgC/2WOwQ6CMAyGX4X0bAkbDpWT72E4DCiyRBisg2gI7
 +4Ab16afM3f7+8CTM4QQx4t4Gg2bGwfQJ4iqFrdPwlNHRhkIlVySwRqZus81cg0eBSolMoaoWS
 alVcIV4Ojxrx346M42NE4BbE/llBqJqxs1xmfR3MWiwu66gxbuDXsrfvs38xiT/+K5V/xLDDBJ
 qXqVmqqlUjvljkeJ/3a3HEYUKzr+gUK+ao84gAAAA==
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
 Jonathan Marek <jonathan@marek.ca>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757537061; l=1041;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=J+p7EMrTz5Ci3v4cB32sGVNKuiRkVCCBePNgL++HPk0=;
 b=hvl43ly3LC2M/bCZ1O8Ib5iiOmQszyzcHxa1HmifszeN2jgiCGmATP61nlgRwPvXFFV6x013r
 ekqQUg/+U7kDXj8WEFR08JKHtAioiH86Vem1M3D/Cs/IK+d2AWRQ7I8
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-ORIG-GUID: bQjtuiUtQ_fWPrIq7_M__DMZQgIJBA0o
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEwMDE3NyBTYWx0ZWRfXyDHk9VPJ+3sm
 wOgP7CoTlg7TVPsDLcgEHnQaNkHxIwMqcF7zRCU7W1IaG4CGW/PLfMCrrWC0NVN9PQMpd6xiF5+
 TqrH1Ny/vmSNIWBZ3aKzBF/tEhgu77aB0Z7+/79k7Gq5l5MyTHuFBaaV1sB56eb3MmOPOP3jBw1
 GD+BfJMEqHkeal5kiriRHFCAC+6im1XUwdMV6DLfBR7bSGbDuwL7iJVz6yQQwVjESTIE/PLXvMH
 zo+++cphanfbBeiMhajPROIiF+4s7LJg84Ya+ew2qLlBApqKBDdovaKvkZSHw6tW5cvVj/MurI1
 XadDI+OvkiocgfNANCFKLrlR4Ua/W0atQ0tXSl3cUmr56MrnU9sUEU/xX4ngXTp9hihrmMkyn8r
 CGrC2xK3
X-Authority-Analysis: v=2.4 cv=WPB/XmsR c=1 sm=1 tr=0 ts=68c1e32c cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=vskJOa3sKGgw8GBTMRoA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
X-Proofpoint-GUID: bQjtuiUtQ_fWPrIq7_M__DMZQgIJBA0o
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 clxscore=1015 priorityscore=1501 adultscore=0
 bulkscore=0 phishscore=0 suspectscore=0 malwarescore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509100177
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
Changes in v2:
- EDITME: describe what is new in this series revision.
- EDITME: use bulletpoints and terse descriptions.
- Link to v1: https://lore.kernel.org/r/20250902-assorted-sept-1-v1-0-f3ec9baed513@oss.qualcomm.com

---
Akhil P Oommen (4):
      drm/msm: Fix bootup splat with separate_gpu_drm modparam
      drm/msm/a6xx: Fix GMU firmware parser
      drm/msm/adreno: Add a modparam to skip GPU
      drm/msm/a6xx: Add a comment to acd_probe()

 drivers/gpu/drm/msm/adreno/a6xx_gmu.c      |  9 ++++++++-
 drivers/gpu/drm/msm/adreno/adreno_device.c | 13 +++++++++++++
 drivers/gpu/drm/msm/msm_drv.c              |  1 +
 include/drm/drm_drv.h                      |  3 ++-
 4 files changed, 24 insertions(+), 2 deletions(-)
---
base-commit: 5cc61f86dff464a63b6a6e4758f26557fda4d494
change-id: 20250901-assorted-sept-1-5556f15236b8

Best regards,
-- 
Akhil P Oommen <akhilpo@oss.qualcomm.com>

