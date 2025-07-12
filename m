Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 35576B02893
	for <lists+freedreno@lfdr.de>; Sat, 12 Jul 2025 02:58:52 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id D9B8F10EB12;
	Sat, 12 Jul 2025 00:58:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="d6CEWo6o";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D96B210E16D
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:49 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56BNpwcR029951
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:49 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bszOuNEzmYEHHlgQlK1KYpB1RHEkBL6gk1zou4Kczfs=; b=d6CEWo6oMn75QCMA
 eP9iMW8OF9R10iyrHRSm+vVx8ns2eAJKJUYPNkDazLyslYaVpGIWnqLZmFdnFInZ
 x/4uVBEdBEgZU3z65jW3hRxycwrZiqdZ0RK0Esa4p4VMb4qep+I4fs+nXpV9N+Da
 iyw6udVBLUSreh8QnJju4oUBb7hv5rnwUMEqSMj3NqLGb7K6zX85ywdNxWaKi/tW
 FNK5c4U0pbb4yurc/i+eDewmHRA3mqwxpxfem97o2eMEqQYk1veR1nxuE4Mz/4YW
 5OsxdcocS02p3rUhpVAFV1hOXDH5u+bOG6w1GfXiti87uGzFWs8v9DvDx3fknyP8
 UDcgxw==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47smbet991-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 12 Jul 2025 00:58:49 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-313d6d671ffso2413367a91.2
 for <freedreno@lists.freedesktop.org>; Fri, 11 Jul 2025 17:58:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752281928; x=1752886728;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bszOuNEzmYEHHlgQlK1KYpB1RHEkBL6gk1zou4Kczfs=;
 b=NelZK1LKcKZaEr5JBQykGvwhQoRSJXpyKcIQX3f9Vuy35d1/yF3y85S8PLJWnTJe+d
 8S7M6T1qopGb5tdJO4pelJwohPxycvyMrVy1LVhEY0GfqFXJ4dKOiEsYph/oK9DHPrYT
 +BQXwRUC5+IJBPDjVEGlM8f2BVSmejGDeq8fhdyfezyYMDwQOMr1LnZCFNoUGofpatUL
 0G44ggNCozpmD1sgO2OaxC7Ke8/BGW7M8NaVcIZnmmi06rG6LiqWUMhHEWqLECswVU6f
 z+VPL21cz50FFCPMJ61izuno65gB2PmBwPlVflL9TcuKkW1B9KvLbocO1eusH67LpukN
 N9/A==
X-Forwarded-Encrypted: i=1;
 AJvYcCVQhsyuLFsQDuGg/S9eMeaQFHjtRx/Sg8qeiwXiAKvzKZu34hYRFYOIPhHvxg8luTldyrIh2p3x2JU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzRAb9pJ8FEdMtAtiYm7amys+VLqZUZHGwLFkN54/njZE1SteGq
 vetAJ46WHpnZ/4Dyh+S8BpuGO5FawIKl7Khz8IvKs74d2lzvSU0pDo/9fdSFWrbRmNy6+ivO3gr
 CZdwbKWR7B2iQGmlP1QdgVsH3bj+JzI5cu4dyixXnIvuSWGaI8fOWoa2QvJEoEBiQehZwWn8=
X-Gm-Gg: ASbGncs6gid+sOdOZXmMHJX5JJr5fyvxTdEZ3C1bJmf0iv8Te4hYzJb9KFilikaUBJM
 HHkFBPWTHHhcBkrdnKhYcW/368yorMYy/Pm9mJyCQXjAd2at6e/IEk8JxBJohBweHNIJtF2+QnP
 vfRv+1tdIsLuz9KuCkeUpTHEvutNtUFiJ5gdwUNGqf64aiVFExrkyxWDcM8gpZwMGs82NsOGYqY
 1Jwj3yqiilmFW+doQGyEtRGzSQiTn2H4ioI/067YzsLqPtL2cRQPEBgs0M3RHFgthiPUiw7RcAj
 nGH2g0d/2/naS1H+YRoy8cMEQIDQWNmpMmu4cODiLDUW5hF0kE2y+GjEu9QDDLUfN8e5T7D/aXd
 q4/LVP772MSr/Gv1mbkO7K55R
X-Received: by 2002:a17:90b:3a46:b0:312:f88d:25f9 with SMTP id
 98e67ed59e1d1-31c50d5dd27mr5480908a91.7.1752281928530; 
 Fri, 11 Jul 2025 17:58:48 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHPp232VKZu5fw0vh7/xwi5GtN1guTWNchaqd+MF6vNbgX0pVciWwweX1gqU38GAdEKUujB/Q==
X-Received: by 2002:a17:90b:3a46:b0:312:f88d:25f9 with SMTP id
 98e67ed59e1d1-31c50d5dd27mr5480891a91.7.1752281928124; 
 Fri, 11 Jul 2025 17:58:48 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-31c23006d72sm5202274a91.1.2025.07.11.17.58.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 11 Jul 2025 17:58:47 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 11 Jul 2025 17:58:19 -0700
Subject: [PATCH 14/19] drm/msm/dp: Drop ST_CONNECTED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250711-hpd-refactor-v1-14-33cbac823f34@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1752281905; l=883;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=rUc4Sgw5rxOU20loNM6AdBhsgLGh23bqcztnvCfOjeo=;
 b=ofz4DmMAv5I6W/4k9XAX02jtlY82ln0uuSdJIP6n0rJn+5lWf3v5ties60153vfPtnsCPGq3S
 QElekPUwvEHBF8kimc20I7HFgbTWwwOGAq8QBTFIY7ozh/OADyjlT5v
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzEyMDAwNSBTYWx0ZWRfX0EtkBB2xYBn+
 4TE7VwOwmwFyVMvNzUFcYEwpmoV+RV2+DnBG8o6CJfynNHD1tuGOyQTYxDzr3EwHBs1V7bSh81x
 DRRWAhOEx8Dv2IdyYh0ix0QT6RyGqGDUAM0VEONDaIfgMKeaWhfDMYo/fXDstImuhXHlFTmoUg5
 gj8Ko/IIdSB6BVbgbBHAFhbt2fS8II6SXlZ/FlZS4FMRoA+xLA1rdwT1jJsCAAS1fxiBXIxOdv5
 QGpbIotP9HLPtaBJbVkuF+Twbb3ncF66pf4tfPCHulrQMQy1zvRChey1q7ZAyMsKKj1oRh7HhXI
 usSJjO72KEuwR+yGe/vd2wkcXIWVxQyp7xAZoSnr7+QwtHRsNioscI4HV11yqUBp80wzlRNm9/4
 5A1r6/BkG8noC5Fi2BZAYOpKbJJHRQ0wwk2VBSxiZZIvnE5kd0M5DSLYvkoF2/Eaz1moniaS
X-Proofpoint-GUID: w1JUrMiV9X8shkjar4vHJUBRkjubyt8F
X-Proofpoint-ORIG-GUID: w1JUrMiV9X8shkjar4vHJUBRkjubyt8F
X-Authority-Analysis: v=2.4 cv=VpQjA/2n c=1 sm=1 tr=0 ts=6871b349 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=k23i9R_ERYQwGrdfUk8A:9
 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-11_07,2025-07-09_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 malwarescore=0 suspectscore=0 clxscore=1015 impostorscore=0
 phishscore=0 mlxlogscore=979 lowpriorityscore=0 adultscore=0
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

Drop the now-unused ST_CONNECTED state

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 4 ----
 1 file changed, 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index dac5078a849d..c7ad61e96b37 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -45,7 +45,6 @@ enum {
 
 /* event thread connection state */
 enum {
-	ST_CONNECTED,
 	ST_DISCONNECT_PENDING,
 };
 
@@ -1594,9 +1593,6 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		msm_dp_display_disable(msm_dp_display);
 	}
 
-	/* completed connection */
-	msm_dp_display->hpd_state = ST_CONNECTED;
-
 	drm_dbg_dp(dp->drm_dev, "type=%d Done\n", dp->connector_type);
 	mutex_unlock(&msm_dp_display->event_mutex);
 }

-- 
2.50.1

