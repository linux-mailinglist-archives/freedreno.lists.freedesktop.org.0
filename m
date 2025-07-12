Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 14A9CB02890
	for <lists+freedreno@lfdr.de>; Sat, 12 Jul 2025 02:58:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E17D210E3DC;
	Sat, 12 Jul 2025 00:58:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="DzYmnk9p";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8697410E16D
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:47 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BB20JK030174
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kpz0sBR+v1h/WdMG/RhlIYKzhzI8L7RbaceCFIlPTic=; b=DzYmnk9pMCKKLcPt
 7or/cvo+N4cER94N3rqKy+jWI5yc7iOodbhyOMV977WQQZdDRP980jFaXGYZNoKi
 uuZF9rAjhOOcXixzXjOeljeh2e0wYJpEIIUqNAfLP2iE22Z8jYdhH55uNDd9fCyD
 iVeZ9Yao2qNOCWV3J7aaCXNlFmTIOz311RshrAyn3ip2TnUYZm0GA3pckQsxlrAh
 fqkHpDmlk3rLB9gStkwLeECtrqZMasxD0/ydCR+jSRN6pD0+7mDNdMX7g8fPiZyz
 Z8hK5S1E7xOg4ExlnsLNyKGlqWrCJlBAVV+cNQvtmfZLiTZUle9yLZ0lB1pOQYXl
 XLeuvA==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbet98w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:46 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id
 98e67ed59e1d1-3122368d82bso3931453a91.0
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281926; x=1752886726;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=kpz0sBR+v1h/WdMG/RhlIYKzhzI8L7RbaceCFIlPTic=;
 b=Pd75Q8AjcxhlURJ6YQYi6/WHDVtXczY6ZEah/CvIEmlCpccjl1/Yn7BTw7rHaN8v0d
 lPxnQzjT36pPRzgil1pEqnEoNw6UxX9CYDZk87BJ2PsUjdUsCAle6tdyNb5NDBD472kf
 Wrfk6AGXH/Vfz2Xi/FaTxZnB6r4nZR8aM3tXOodwP/l79TPaNr05FrfVGvpkXaElCmmt
 rha8r0dMl5EFTAeCa27njPNrRniT3hQM1jwlwChjho0kdp3f+nhUwfF5aw+Ndz1jMQru
 OcLSXEeFd0ie3dMXnjq+SFNsoqUbOJx8YHzWa7et4JsEgxz/YNYVDGpVN9+vMlitjknZ
 UWZA==
X-Forwarded-Encrypted: i=1;
 AJvYcCUoXZk/y06FdlafqwYxk5uD0izrB/NDEbaajWNlRk/+A/ZhIQ5hs6eRXKiu/i26NmoJ/aahOHF7Dng=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzdKCYz8yxsdiyWDixKKbdE7x6KjMG6H9lf8PUOZRXUZnyIVzZI
 2m87XYjICMAh5A2mwAhEOLF15KgXgmJAXcWh4L80gkyxlk19W93umG3/b99NjfdMbgt3ejiYkPn
 fK6kRgota9cA8tDSQP9OfqP73VXr8v7b7q6STLJWkXs+UM2sJO+CZp/0VOypPrEnUp+3+tJeJkP
 NEZd8=
X-Gm-Gg: ASbGncs4hctqkibDdd6PeDbiHKwzGu1mZy9jCoBNK35+UloL06m7LINsLyfQQN/b5P3
 8iIgSuPAvR1gf0/Q/eMUTJvIc1yKPqqLvMFT5WnRTYEMpityrGZ/iLpPEuACi07FG+oHEigopH8
 KprN/iZy0WOWO967Y45VjPvj6+aOs/emi3VVlFq4LYxonk+pomaCvPaY2qrNr0b3WUoFTPRrPhM
 gefO8EIgY76fDD/CNAbdxeqJXGkW8eDFy0/3KHrEWExQ3X0CX0A8W7HqBvH8Mq31cnuCojYzZaM
 ELxcxDVAyfq3EoFNdwAFUVARM0NdYIlX169BQK6r72eq9vdq+xb5eBU+yxt4WNqkfsks+TdMygF
 UHxfJ1QH4fpz1CCFPkQFjSHKL
X-Received: by 2002:a17:90b:3886:b0:311:d28a:73ef with SMTP id
 98e67ed59e1d1-31c4ca845famr8018768a91.10.1752281925797; 
 Fri, 11 Jul 2025 17:58:45 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFKh0L/9TQnNmBay88tOhLWbbUb90POPJfrncC4mgSklO12N0KVR5eOs5fxviRSmmoM4Hox/g==
X-Received: by 2002:a17:90b:3886:b0:311:d28a:73ef with SMTP id
 98e67ed59e1d1-31c4ca845famr8018725a91.10.1752281925320; 
 Fri, 11 Jul 2025 17:58:45 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:44 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:17 -0700
Subject: [PATCH 12/19] drm/msm/dp: Drop ST_MAINLINK_READY hpd_state
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-12-33cbac823f34@oss.qualcomm.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
In-Reply-To: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=1230;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=yjltdvgzQFS/rBBYfAe4dvA1j+EvnEUZxQgjt30Wp1o=;
 b=WfFiy+F0KkPjBLpzzbEf5tdoau0ORRRNR4ey0sQZ/xL06nlHnVc1WCtGxOBpGqdwwrs2bFYu6
 FD54qCrYupNCmUD7Gmmd/+FQEoCpVzIuDjYOmuh1aFneX8YdiD/3Rp/
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX4DglRzmpqQ0i
 PoQVF2aRj/tMRM4v4kIl0Uouo1seXh7eRToivhZ5mSV8+tItmrVg/PTnW+CV01Cwcs6MiOT+bz+
 H2Ebqpwl6e3emZ9RDCR7hoViTeqAjopxbbpIxH1lUlHRXS0jHTgUDYIHtUXXF8zzzlwR2UCjF8B
 Nqa7aDHN4bIcZ1LjTqdel4lxRMkbZ5BgBn51AY6mJBZJcY+tTCRWkB81DmDjH4p1YjWA/5z6p0N
 uSsSQ+7PgtVvPIPDP4VYGsbG6iq0xRhq9kQUtpLlf+ef3gxC19AxcgF7onvVUsSgk+JnLLtPlEz
 GYab373BJ16RNvmQyyQ8uU7zp9vZMe21Spxxbbw6es/IlWfluFhCl8dMpsJoGYsGHrkg4V7VDrY
 zQ+CQmloGVV10KEiBcgJtJWZdZSMGgu5IzxYE+iz14/S58lqJeh36ZEKAavpcAGBpMnJJahh
X-Proofpoint-GUID: nbRLCx7mvgEcz-nd6hQ8GhYEnmckoibo
X-Proofpoint-ORIG-GUID: nbRLCx7mvgEcz-nd6hQ8GhYEnmckoibo
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=6871b347 cx=c_pps
 a=0uOsjrqzRL749jD1oC5vDA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=5QVpEtgF4fCaE371oBMA:9
 a=QEXdDO2ut3YA:10 a=mQ_c8vxmzFEMiUWkPHU9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=999 lowpriorityscore=0 adultscore=0
 priorityscore=1501 bulkscore=0 spamscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507120005
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

Drop the now-unused ST_MAINLINK_READY hpd_state.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index 17093b78900c..5efc8d4ecf54 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -46,7 +46,6 @@ enum {
 /* event thread connection state */
 enum {
 	ST_DISCONNECTED,
-	ST_MAINLINK_READY,
 	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
 };
@@ -526,7 +525,6 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 		}
 	} else {
 		if (!dp->msm_dp_display.connected) {
-			dp->hpd_state = ST_MAINLINK_READY;
 			rc = msm_dp_display_process_hpd_high(dp);
 			if (rc)
 				dp->hpd_state = ST_DISCONNECTED;
@@ -613,8 +611,6 @@ static int msm_dp_hpd_plug_handle(struct msm_dp_display_private *dp, u32 data)
 		dp->hpd_state = ST_DISCONNECTED;
 		dp->msm_dp_display.connected = false;
 		pm_runtime_put_sync(&pdev->dev);
-	} else {
-		dp->hpd_state = ST_MAINLINK_READY;
 	}
 
 	drm_dbg_dp(dp->drm_dev, "After, type=%d hpd_state=%d\n",

-- 
2.50.1

