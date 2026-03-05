Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id hjwvBamTqWmKAQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 15:31:05 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E39C213751
	for <lists+freedreno@lfdr.de>; Thu, 05 Mar 2026 15:31:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 3EBE610EC31;
	Thu,  5 Mar 2026 14:31:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bvJd+QZV";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="eVs7ezsE";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A8D0010EC2C
 for <freedreno@lists.freedesktop.org>; Thu,  5 Mar 2026 14:30:59 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 625AFosQ456101
 for <freedreno@lists.freedesktop.org>; Thu, 5 Mar 2026 14:30:59 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gM1FM0OVfdRIp4jLyHcwDI8KJBwQikDnEiW6JeMAtS4=; b=bvJd+QZVd1cuXnBe
 d1Iu4H0BCI2RvIQ9+FkYoE1LMp3W7g5Uc6RN07q/YdOmW1zHapFWPIWyeWiFKAav
 YKH24h5m0nbgSt8D74Xju/mrNkgbx2PV26C/BNweWP0lsDNrG33K7h7XW1jU9VtR
 ew+d7k8hen45yRRSpoaDEZEXf0S9Q67KHumSzIg3f4YYC50wNAO5bLBlSc8Dn30+
 Kz/97wUNFKI7vThte+/E6Q2jg4qNXVGeogaG+SZqwXWDg/1m3iilIKYb64Lif0G/
 pA/RQEexF2cAUbDw1dY8n4GUS4DBcdTo1srCJ+CSPFRv3E/dvZwg0tRzDTichBoB
 EgXcFQ==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com
 [209.85.221.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4cps0wkj41-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 14:30:58 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id
 71dfb90a1353d-56aa6d6bb5bso8355299e0c.1
 for <freedreno@lists.freedesktop.org>; Thu, 05 Mar 2026 06:30:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1772721058; x=1773325858;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=gM1FM0OVfdRIp4jLyHcwDI8KJBwQikDnEiW6JeMAtS4=;
 b=eVs7ezsEowX3YdxKC4eSLkv4aaqYWqZRGYw4t5QJjHC6E86slvoMoimfbDp6AlTIaV
 FOecgFaeqCCOgwUEQ61con74Sl/4OVkEIYLprBB7Zo/N7DW8zbuPlX/C0KhbuTutXR8N
 61L/EGJQcpHGUkBT6tbj9OtnLZRHtD/vXFv6zeFEYXvkBitzNlJYgDMt+OxEEM8dHj6N
 72zyYTrD920BesvxrwFN6TqiE+8w6tjCVTAcQXP7IvO0iHTEzI7CpbqqCya/fV3V5EzD
 sCKMedrAM4LrgyEiPpPeHGSZ+Z16HIrSd05cQpUPJSinzEtKa2GV6e+1DuuCez/hCLE+
 ZCjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1772721058; x=1773325858;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=gM1FM0OVfdRIp4jLyHcwDI8KJBwQikDnEiW6JeMAtS4=;
 b=hZkemJ0tG/ZVl6SFKkvdIkGAOBuZ9kLlBt0g8YmJJygYnwFUSSSE2FN2MOU2C13Cl3
 lUof56fUrmkVFFnibORtd9iyRk7pLQKhMlaN9gocHKKxw3U2MDt8vaIS4tdL0UHW8K2h
 n2ISKTLMovRkt8QVtOMqmR6GtDg7pE6F7amO3M8gvbmmYmsqCGarM4G/sxOTcurjJuzq
 25NbFr7YRYQB5MKqsh/l/c/h/1rd61eL5vxW5cDeQGy2Q1aHfll+jx8CvVdiRNSMzOrO
 29FJ43Kzy0GmbpEhS75Dg8CavHoujx4tchVD2hf6ztXa3kFjjBeg5+seJ9h68DHCmDya
 ECOQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWWEVmBYIzC2AZ4UqAH5mrPSuJlfg3aEfbBSpirbhozn8Vf4aFQf+AcQPykPldIXisoZiMamPf9ywk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YysnaDo6CjiZxubjt/ozIqRsWamAk4VM31xQa3hCE5q8xVHuBFU
 bKeG7SZ3s87+2nI+KQlXo4W81w2mlBNjrwFDNgdo+5GkTR7YCJgpXN5p1owBpuqSoLOFdOozJ4u
 Jxi3Fs5282hQ2B92Jnv45DEFfvqDUb8SrjnSDTMI+A6WBn9apk29SZyjx60IGGgDuuqcIqyI=
X-Gm-Gg: ATEYQzydLJP7vDxlmIWvPSin8u9PvSgzLCDFt8vo+sWJUizyDBpx+RYKLeaO0ilCte5
 +P9t+BMBYS+Sc/czf/sT6t6CJtwoR/lji2rRnkq6RyE84X1Knkv4faRHzQpYF3JxpHSE1N7Qqfb
 6asDOu0NWVMUI4L4JEDsjUWLvyC+FaAHOkFb/1a4QVtIxrRXQK0rFeyhgRNHuY/+CCS6277eVKS
 ZY85UYQisJJ0K5uAxxOcAT9S9RBvhwHKuTJPgsIA5VF43MiLQaRbl/TdKFS7MJvYdPOnaOE2XcZ
 HTO7mevW2U5JUdc/YVLG+Vg3JoULMF/EG7ZgR0ZhZ22hiOKDOLKMM/KxUPpGWLLW7Cz/Rv2xDjp
 QXxzLLFyqkoRc5UB6TugKLJvVhybkm8FbY6GSSbFZzeVtN3UxvxGA9BZXHYmYJnx4Ubyft/G54/
 yl9LuM5DFfS2hoj/QaqftBJwoTaxiIavMjKC8=
X-Received: by 2002:a05:6122:3b11:b0:559:67df:5889 with SMTP id
 71dfb90a1353d-56ae7603caamr2234059e0c.6.1772721057668; 
 Thu, 05 Mar 2026 06:30:57 -0800 (PST)
X-Received: by 2002:a05:6122:3b11:b0:559:67df:5889 with SMTP id
 71dfb90a1353d-56ae7603caamr2234012e0c.6.1772721057127; 
 Thu, 05 Mar 2026 06:30:57 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5a126fcf563sm1522618e87.27.2026.03.05.06.30.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 05 Mar 2026 06:30:56 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 05 Mar 2026 16:30:46 +0200
Subject: [PATCH v4 4/9] drm/msm/dp: Move link training to atomic_enable()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260305-hpd-refactor-v4-4-39c9d1fef321@oss.qualcomm.com>
References: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
In-Reply-To: <20260305-hpd-refactor-v4-0-39c9d1fef321@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1716;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=JI7bZYAZgZZoG3QbCYkVN62ORKAZ93CC/pbTrYikaXc=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpqZOYJcHCddaM4Ycs5ue+0qxkZQCBHCEMF1NlK
 SScGLBEaXeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaamTmAAKCRCLPIo+Aiko
 1QzyB/9fUSrBJ7tXabZzoPSyhUByYGbsn2dwnTzGpCkrAjntqwc/Mvda3/QcMsW+TyTExxAMs2M
 uJn3K30cHJ3NJjol+mvY7nv8c/FVBw+JaAhKVwwyVripMBXYbheLqRTwnliIo00Oxn0Lw0kXZxe
 2Gcb2i4YIg0IUhgubc3D4xY1EAS8M1wYZuCFDNuIdykwpshp8qAkQ6GGUD6Vrtdm4tmLA4CM7M/
 eY7KoHPqppMk6+nsWgXJ2P61V2eInZvVGs1gPd1Yuh/BbFLf7zmCw3qluHzYcWR0EXJQvpS8VeK
 hi4FHW4s/frRPcAQmJYOucfohIoY5zf9dG1PzU1M8RcZTCKm
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: -tc6BKdEZOPNKyOtui3otkdG7ZLbbhj7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMzA1MDExNiBTYWx0ZWRfX08R9ZZYAzzrk
 /WO2+b4ncg/H+H9e3nNinK/4z9+/uuI7nKBzkfbLp70cGF6yh6crTbad32sM8y6RzgK2JkFiLl8
 Tsm5ktK7521z3r9GvA2JfMEuP9N+vt3Kn8+WNCGY1vOcSXA3loerpogI8lc0Yf4QouHTRqyjfm7
 2F4SxAtX2OTfE8uPYMbkCDtt0xw0bYmVcctUfYxd26J5hlhv/IDpq0NWxPIRk/5lrcKH4XQvH2M
 Xwq7dUKJmTNrJGLdV3uDRDuQFK6HrTV0R/WXU/hqOccbCRrEAxqiw/Rn7ZWWZF3Un2PPIQDV4R0
 wQqtewx3+rc7o3McSp/A0vHpN3qBm4iHJ4OTiVddiRFXaTWk4ZYCtYL4/h8fcCmf4hl1gVvSU8J
 5RHRcldyDiZizPfeH51ypAviXWeTcnG9Z6jVTqhzP87dpFGE+vFU2tkBu/uCgU1mJvT7eu5HFVU
 vdtzNZOK36GIG9JNfjw==
X-Authority-Analysis: v=2.4 cv=OYWVzxTY c=1 sm=1 tr=0 ts=69a993a2 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Yq5XynenixoA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22 a=EUspDBNiAAAA:8
 a=IoBVowuyLm_M3JZO-XQA:9 a=QEXdDO2ut3YA:10 a=XD7yVLdPMpWraOa8Un9W:22
X-Proofpoint-ORIG-GUID: -tc6BKdEZOPNKyOtui3otkdG7ZLbbhj7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-03-05_04,2026-03-04_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 impostorscore=0 adultscore=0 clxscore=1015 priorityscore=1501
 spamscore=0 malwarescore=0 bulkscore=0 lowpriorityscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2602130000 definitions=main-2603050116
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
X-Rspamd-Queue-Id: 7E39C213751
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_RECIPIENTS(0.00)[m:robin.clark@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:quic_khsieh@quicinc.com,m:yongxing.mou@oss.qualcomm.com,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:jessica.zhang@oss.qualcomm.com,s:lists@lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[oss.qualcomm.com,kernel.org,linux.dev,gmail.com,poorly.run,somainline.org,ffwll.ch,quicinc.com];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	ARC_NA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	TO_DN_SOME(0.00)[]
X-Rspamd-Action: no action

From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>

Currently, the DP link training is being done during HPD. Move
link training to atomic_enable() in accordance with the atomic_enable()
documentation.

Link disabling is already done in atomic_post_disable() (as part of the
dp_ctrl_off_link_stream() helper).

Finally, call the plug/unplug handlers directly in hpd_notify() instead
of queueing them in the event thread so that they aren't preempted by
other events.

Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 10 +++++-----
 1 file changed, 5 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index a05144de3b93..e7b1ed5491c4 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -436,11 +436,6 @@ static int msm_dp_display_process_hpd_high(struct msm_dp_display_private *dp)
 	msm_dp_link_psm_config(dp->link, &dp->panel->link_info, false);
 
 	msm_dp_link_reset_phy_params_vx_px(dp->link);
-	rc = msm_dp_ctrl_on_link(dp->ctrl);
-	if (rc) {
-		DRM_ERROR("failed to complete DP link training\n");
-		goto end;
-	}
 
 	msm_dp_add_event(dp, EV_USER_NOTIFICATION, true, 0);
 
@@ -1695,6 +1690,11 @@ void msm_dp_bridge_atomic_enable(struct drm_bridge *drm_bridge,
 		force_link_train = true;
 	}
 
+	rc = msm_dp_ctrl_on_link(msm_dp_display->ctrl);
+	if (rc)
+		DRM_ERROR("Failed link training (rc=%d)\n", rc);
+	// TODO: schedule drm_connector_set_link_status_property()
+
 	msm_dp_display_enable(msm_dp_display, force_link_train);
 
 	rc = msm_dp_display_post_enable(dp);

-- 
2.47.3

