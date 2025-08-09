Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 633DDB1F187
	for <lists+freedreno@lfdr.de>; Sat,  9 Aug 2025 02:35:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C45E510E99F;
	Sat,  9 Aug 2025 00:35:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="KFkS5kGJ";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ADA8010E993
 for <freedreno@lists.freedesktop.org>; Sat,  9 Aug 2025 00:35:44 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5790JnHA030267
 for <freedreno@lists.freedesktop.org>; Sat, 9 Aug 2025 00:35:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 AZ2xPxZ0aADglH/NNiPMVpiBOUDybWneJMhux20a+5g=; b=KFkS5kGJwoLDxjp8
 bC3AjVCcdw/tfdFuNHCF+IhBgmBBehYl/9I6Aa2o9maWBN3eXY+tZhfVzIwaDuRE
 zJHZ6ZlMk4YgKGGzmiVpo0wo7D+gZYL51sPqdj37qzE7GIAJiOt69limnIx8k8FH
 L/ZReglf9rxUYsV8y5tFGqlOVBDTeoJnz/QMDzSMHrXrTCa1ssX7z6sxASFsDC5s
 9QA7Jxaa5cVkW+t2vU2IvbcTvkjNCSdzH8r3c/06QPHhlWQpSjUHzOGSTSLX05wN
 6B7WikKnFbqAwnMkLloSdKDK48NU961+pWBd/CCDlDDp6Umo0u9pD2+6jwyXWNJw
 nTfPHQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48dupmg0me-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 09 Aug 2025 00:35:43 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-242aa2e4887so58314825ad.3
 for <freedreno@lists.freedesktop.org>; Fri, 08 Aug 2025 17:35:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1754699743; x=1755304543;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=AZ2xPxZ0aADglH/NNiPMVpiBOUDybWneJMhux20a+5g=;
 b=o1dx7Pao9JMsWvMFbKMdOX6tLoWR/PZW6j/2ncXZhfyOlf/LtGtVY9qXTvxc1uyINk
 D5/P83lxUJUZkMeCDhe0ZLv0uD/IU11cmwMkYZ9m67iqHCRrA1jk9OgihRvzThl4Moqt
 Jlif/Pr6qR8KECfYmW9vS4FwRpn5d+YLxr2C0ofZxINFTzyS9KkWkqv205Wrfo+JuYEL
 mjqGsKIa0U2dkRsmJ2QVklCfH8UTSZjq8kOeB18t2kbcBiYNohx1Iza9I0j7u1kBrjyP
 KZCTbOLsQIbznKky4tUh5ffqMq75f+J7BfP4yW9qDMjBPmZcqkzY5Kl/3rww/HynFqJz
 d1VQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCX/y+/y+5YN9o4v7PLV3gN+MNIJjqbQDk7Z5oiGdqxLbFH3dpoju05mKpF7TSh58gnM16Se2cq1q+o=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx7gEQ9MCFO6V8V6250mn/6EOgIbLqKbuoKazC/N9A4RqiGkSjR
 EX+IWQh1tCKxlCqCeaHOZxIgIKU2dS0bfofgQaORsr65oM0tfsEaNwGpwX4UgHi+PwFARDD34KG
 chYNwva3+7hrycDDDPKpHsEhgBCzBIxF80vU9mHDIRt2fS9XRinqqgAIlDYH8dh39yF13T5o=
X-Gm-Gg: ASbGncu1ZUi1+1/dP06qk0TGEJwCmyzoGZuVdojfJ+nABRxkvDYin5fXwKRvDeNn54s
 ueW4Mg9M3Jzps0CEwvNhqOmkuCLczHFrWf/jtXoSxeiP/TK7eqSKFk+w9IvWd/s2KRnk4paRvaR
 Ivk7pi37YevMouH7jZtWFKfimQXsMNCSTSU3HVxcaQt1P/Fx+ETBiNJIJt/SZUVR5cKsSJxLndn
 liC/PfcxFQEAFHdwIVrhcdpRJcUOZW945nCPu2uoaHr3aLgUuCsU2oJZK1jsQ6SkjVBQlfrLi+B
 kY70w58CzSPvytlV+3xnDbp5pdI4tSrgEnP0bwzC2r+CVv2oAy+ea4xd5l/H7SEvnO2YYIySnmX
 hX/vH7rmNZysMmYm2rq7eRkP5
X-Received: by 2002:a17:903:2987:b0:23f:8d56:b75b with SMTP id
 d9443c01a7336-242c224116cmr68534885ad.41.1754699742721; 
 Fri, 08 Aug 2025 17:35:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHAEqIzA4w/9X4in72ZzPva96ldMzCraSZJQFVFPIFyVWnAUhCwow2pLKBe5AzUihPqywBT1w==
X-Received: by 2002:a17:903:2987:b0:23f:8d56:b75b with SMTP id
 d9443c01a7336-242c224116cmr68534535ad.41.1754699742334; 
 Fri, 08 Aug 2025 17:35:42 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-241d1ef678dsm219865355ad.39.2025.08.08.17.35.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 08 Aug 2025 17:35:42 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 08 Aug 2025 17:35:17 -0700
Subject: [PATCH v2 05/12] drm/msm/dp: Drop EV_USER_NOTIFICATION
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250808-hpd-refactor-v2-5-7f4e1e741aa3@oss.qualcomm.com>
References: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
In-Reply-To: <20250808-hpd-refactor-v2-0-7f4e1e741aa3@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>
X-Mailer: b4 0.15-dev-a9b2a
X-Developer-Signature: v=1; a=ed25519-sha256; t=1754699734; l=2134;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=0luC8UsEHN9fWfXH6p1zip80kT4QBQaB8aTLon8BdOg=;
 b=KNHcay1Gz47I5v9s9LO4RakqENVxCn6/IpqtvSmuQPh6gYrJ4N3079g2LhjPpuzGoc1HhXkfJ
 VeSdBpztAebC7a6u6j0IrGagrIck7UzQwpogYuVlmzDmeeGdRJ5o8hg
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Authority-Analysis: v=2.4 cv=bY5rUPPB c=1 sm=1 tr=0 ts=689697df cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=isfJdaZdMnE_RitM90UA:9
 a=QEXdDO2ut3YA:10 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: TL2OhNHIL7vEPouQU6LQkh0XF1s_TkRQ
X-Proofpoint-ORIG-GUID: TL2OhNHIL7vEPouQU6LQkh0XF1s_TkRQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODA5MDAwMCBTYWx0ZWRfX1tbJFkVYMUWw
 b/OrBCroa+LvSW8RPrPf8h4VKad0yZYww4J5L6EqQgLGNnGoazjljrdhSgd8SA0A7bORSnYrYgL
 FjIzUYfWk0epvMxhFTdXxVs2l6pjBBtb8g6hgSYdbAwFJYRM+hbJ2WrxCY7SmHwEIbjryYD75pe
 6R4CXta4LRH3T7AHW7P3o21kFDv2PMdwbSd5gXTa5Cm34natgDtX8SHMFy3UOlAugGD4NekqmCt
 W/9m+C3gkuAGy/NeUAs/3o5doHRZFMpO3dj9znaGqvJbHIqf0vD2jxVvmLwtaNoUoqVYP9QeJPu
 hYQ/r0Xi5BCJ29Db98yOajHCLECT0A4PWbwCe4rwao8fcQMWJBqbmQwyJi25bdmEiwXDl9tJsjs
 AVTwKGhi
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-08_08,2025-08-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 malwarescore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 clxscore=1015 phishscore=0 adultscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508090000
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

Currently, we queue an event for signalling HPD connect/disconnect. This
can mean a delay in plug/unplug handling and notifying DRM core when a
hotplug happens.

Drop EV_USER_NOTIFICATION and signal the IRQ event as part of hotplug
handling.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 11 +++--------
 1 file changed, 3 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index c849befe58f0..55fe8c95657e 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -58,7 +58,6 @@ enum {
 	EV_HPD_PLUG_INT,
 	EV_IRQ_HPD_INT,
 	EV_HPD_UNPLUG_INT,
-	EV_USER_NOTIFICATION,
 };
 
 #define EVENT_TIMEOUT	(HZ/10)	/* 100ms */
@@ -428,7 +427,7 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
+	msm_dp_display_send_hpd_notification(dp, true);
 
 end:
 	return rc;
@@ -497,7 +496,7 @@ static int msm_dp_display_notify_disconnect(struct device *dev)
 {
 	struct msm_dp_display_private *dp = dev_get_dp_display_private(dev);
 
-	msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+	msm_dp_display_send_hpd_notification(dp, false);
 
 	return 0;
 }
@@ -518,7 +517,7 @@ static int msm_dp_display_handle_port_status_changed(struct msm_dp_display_priva
 		drm_dbg_dp(dp->drm_dev, "sink count is zero, nothing to do\n");
 		if (dp->hpd_state != ST_DISCONNECTED) {
 			dp->hpd_state = ST_DISCONNECT_PENDING;
-			msm_dp_add_event(dp, EV_USER_NOTIFICATION, false, 0);
+			msm_dp_display_send_hpd_notification(dp, false);
 		}
 	} else {
 		if (dp->hpd_state == ST_DISCONNECTED) {
@@ -1112,10 +1111,6 @@ static int hpd_event_thread(void *data)
 		case EV_IRQ_HPD_INT:
 			msm_dp_irq_hpd_handle(msm_dp_priv, todo->data);
 			break;
-		case EV_USER_NOTIFICATION:
-			msm_dp_display_send_hpd_notification(msm_dp_priv,
-						todo->data);
-			break;
 		default:
 			break;
 		}

-- 
2.50.1

