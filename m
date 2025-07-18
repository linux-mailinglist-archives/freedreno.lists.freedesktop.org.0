Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A7127B0A701
	for <lists+freedreno@lfdr.de>; Fri, 18 Jul 2025 17:21:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 143AA10E9E5;
	Fri, 18 Jul 2025 15:21:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VxzhaWjN";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id AB9EA10E9E5
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56I8aDo7021792
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:message-id
 :mime-version:subject:to; s=qcppdkim1; bh=13kqIIhvX8G/h4Zyb4Bf0S
 syUcZjDX5f8XV6NFySlbc=; b=VxzhaWjNb02Cs8EjdF4CxETxfROq7KxpJOKDej
 O6tpWw34I4DPlGeSwh4Qd1BIo9mDYr1T7gJRVU5YgWJ4kmPPioSGGcjIwDuzpu+I
 1e96n6+vXNBe8nSenamcEpnvcxsicaUPjkA49MnC7yU7PZP/bEuOns5LXepDdje7
 TRVsikGQJVp65LX162On9HMCJB4b6OJuCccRsW2hfP3Kl/qr0UZK1ofmZr+c4Fob
 dFJQmjF1qzZ/8AlltQzUMimLiLZeEfDHc+fuF1V7OdNweBDpW3VyMnn96TO87FiG
 Hcb8gLSt5ZxVeKkV6IWyMwNk2Q6Pu+5TsRfE71zFBMm51W5Q==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufu8kvt3-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 15:21:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7e350826d99so289959385a.2
 for <freedreno@lists.freedesktop.org>; Fri, 18 Jul 2025 08:21:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752852078; x=1753456878;
 h=cc:to:content-transfer-encoding:mime-version:message-id:date
 :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=13kqIIhvX8G/h4Zyb4Bf0SsyUcZjDX5f8XV6NFySlbc=;
 b=OsX0EqFJjjUFHdZp0LlbDiquDxjdsDOmke2HXL8Rj/6alpXZpgbSf6t/Dz2a+TKHlt
 VXR9yobXsyRHGLD0EggoXVuwJeKthkWPWCrJqQ1YBE24Tq9BxMeW24yK9lOSpB7DwoDo
 RIF41EApllGODLpyS6Qm1wX1c2t2WeFuf8O2c9HwRXLSlK3XOOI8uZ03JZ8EwggCqwDy
 0AYMTtWkEj5xAaYL9EL+nh6I2zw7OwZiEY5oHmDeafGZeNbmlXgnJFCapT1BZHTQ8Zr5
 NKyXxTM0QvIeMYnEVy3mjzKhDULJE5AVclI/V6txJ92u8wI6yQb74K9fdCKJ7+UgE13O
 jrvQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWSTGAFZbgr81HYdcTwAJlZl8LgtRAwgpVzMWLbXT3NX3iSx6IRq0er9lZ+uMFHauw6YasVhaw/Brk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxyS8+B6bu2H3srboJCae3m08er87+2EVWEpUbSn83OyklS2mxk
 ACpE9BbJCU6AQsEbUpOhiMFooebLEt4291OMp9wuPtGoAJ8/peNgqQPyJxANHtgq1bPzVGcXb3P
 7raI8hQfliIC9R4RrwRUFo3b+KRZ+TPc+Szpo0xI7An1vvCyQSZyWVzQjUvp7XIw0X0mGUB0=
X-Gm-Gg: ASbGnctQ9UpQtG7CYscaq7I0vq9j7xCaToZyBUjOjgquFXdVhBmAuJs5wpQrtWms3kM
 LbLbgBfFIT7uraW31hTxtJTboYMyYHqDbZ5Mt1zrQIrJWFQWebogbsaagqAvpGya8mu0rNucGcf
 HMO73mJodphAEkWqOPIRPCkJC30iYK9PDpMOkIew39oDBT3t8Qs1pbFM3Xhi366vNCDKogdEmEp
 15zWC5RruKhaR0B+FdHOooKe6K8OCkCBu48jZigXtb13r5jDq8c/b3Ipvnl2/fAA3RJRyi+95c+
 KN3tbrvOfnVuj1ssjURtV3vP+ZOTDwqedrcYsoHW9L6k4o5oJbPbCPnpUMtClbdQkmV9uezslOb
 zTKjOCq8QPuhzVP+TnK3NlzKzUozjT4HhdLQ4pA==
X-Received: by 2002:a05:620a:2145:b0:7e3:5550:22af with SMTP id
 af79cd13be357-7e3555022ffmr475413885a.16.1752852072413; 
 Fri, 18 Jul 2025 08:21:12 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGih5HUBirffAz2WZL4QKYwy08DDOZqNQMloXSzP16EApN9OS9U886pytxqNhKO8kzqfu4L4Q==
X-Received: by 2002:a05:620a:2145:b0:7e3:5550:22af with SMTP id
 af79cd13be357-7e3555022ffmr475405285a.16.1752852071615; 
 Fri, 18 Jul 2025 08:21:11 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-330a91f09a9sm2515041fa.94.2025.07.18.08.21.10
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 18 Jul 2025 08:21:10 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH 0/2] drm/bridge: lontium-lt9611uxc: switch to
 DRM_BRIDGE_OP_HDMI_AUDIO
Date: Fri, 18 Jul 2025 18:21:07 +0300
Message-Id: <20250718-lt9611uxc-hdmi-v1-0-0aa8dd26a57a@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAGNmemgC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDI1MDc0ML3ZwSSzNDw9KKZN2MlNxMXeOUFEszYwOz5JS0NCWgpoKi1LTMCrC
 B0bG1tQByS41fYAAAAA==
X-Change-ID: 20250718-lt9611uxc-hdmi-3dd96306cdff
To: Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-amlogic@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=970;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=8QWEbzhz2HbUL5CsjbPmWgU/3XJPnqot8B2ZA16nFWs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoemZmrEL2Zztp1/d85i0Oy9Zc2oZaO+hb0CQUZ
 ZBKX+ii2zqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaHpmZgAKCRCLPIo+Aiko
 1Rd/CACs4rPc7tst3TZYIDDeEoQX9zKw6b34Lk1QY82wtNiwp1z7kv5KTqL+H5iB5gH9P1UDiSS
 nw3HcHcejQ5xrn5NDQRYCAtIh+Yk8v3MYHW1UHNxSPIHyMS8SbNufXY3ThYqJMcFkJ5OF+mVlVe
 3nQcukkkQUAj59qsqfWFJsN70YCDBUQIe9qu1Y9Sx6orOgASt4ws1mGKpBEx0TTwa/F5j8cSk1v
 y1NqCttIgJc/n5GDXUbDDzKXUJxU16RWjIDq+u8NnSu8N2+u1+mtGdsTKxEh89zBNGgpILUZhTR
 ybERI466cwrPMuVeppkJibCtOrWqkLHbQsc6qCw9J4KcJ+gV
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE4MDExOSBTYWx0ZWRfX4PPQSTDLrDK+
 KfyZdnoSU/NOBOw+N8GVlRNNeKTdI+8XTBK8f1yh1p2yvcLTQEIPHiCyvIApnZT5qh5+En30HLK
 WSNiNAzd04NaYlxBn5shWiGjXXRvJBQtZ0wVJ7y5xKB6f/PfT1+LFlmz8pPhB87+q/xvUOTCIY1
 Jn9+9pyJbbjpHnDZw5OQdLya9cq37MIXGfoIxmxNSEAcF+iMZfnAbDCyW6OTdZgmfdxRZeRtnaM
 nCxCG3iWW6r586vTfiQtJKwUKdFCXXO/+J1t+0zG7QQsl+viQbIPy74qgo/Z3RkMGcCD7gL6a8Z
 OFsm7YyglwtqjvA1ED7MWCC+nEnJlFTzMG9BIHvEipnEfHxtSjTWHgt1QB3slMGSRWpUmSaj/+C
 /TAXNtyiK61sHoWCF9BlC+L1KFqiDci8FtQSWHWDdzUn70rjj9alMR9NBD2oSHcnHTuWPm2Q
X-Proofpoint-ORIG-GUID: s3x_k77TzweGwqE0ha5vjEwGXviiTAcQ
X-Proofpoint-GUID: s3x_k77TzweGwqE0ha5vjEwGXviiTAcQ
X-Authority-Analysis: v=2.4 cv=f59IBPyM c=1 sm=1 tr=0 ts=687a666e cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=viR3P9R_XIStfHs_oGYA:9 a=QEXdDO2ut3YA:10
 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-18_03,2025-07-17_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 spamscore=0 mlxscore=0
 bulkscore=0 suspectscore=0 impostorscore=0 adultscore=0 priorityscore=1501
 mlxlogscore=999 phishscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507180119
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

Use DRM HDMI audio helpers in order to implement HDMI audio support for
Lontium LT9611UXC bridge.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Dmitry Baryshkov (2):
      drm/bridge: add connector argument to .hpd_notify callback
      drm/bridge: lontium-lt9611uxc: switch to HDMI audio helpers

 drivers/gpu/drm/bridge/lontium-lt9611uxc.c     | 125 ++++++++++---------------
 drivers/gpu/drm/display/drm_bridge_connector.c |   2 +-
 drivers/gpu/drm/meson/meson_encoder_hdmi.c     |   1 +
 drivers/gpu/drm/msm/dp/dp_display.c            |   3 +-
 drivers/gpu/drm/msm/dp/dp_drm.h                |   3 +-
 drivers/gpu/drm/omapdrm/dss/hdmi4.c            |   1 +
 include/drm/drm_bridge.h                       |   1 +
 7 files changed, 57 insertions(+), 79 deletions(-)
---
base-commit: 024e09e444bd2b06aee9d1f3fe7b313c7a2df1bb
change-id: 20250718-lt9611uxc-hdmi-3dd96306cdff

Best regards,
-- 
With best wishes
Dmitry

