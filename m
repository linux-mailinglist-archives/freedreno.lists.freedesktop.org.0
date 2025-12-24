Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 717C0CDB08B
	for <lists+freedreno@lfdr.de>; Wed, 24 Dec 2025 02:04:19 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AEFD910E318;
	Wed, 24 Dec 2025 01:04:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jlqhWfoS";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="gh2c7/bI";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CECD110E307
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:04:05 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BNElp0Z4044542
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:04:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CHgg9IL7FE026ch0/W9DThBQX+0QxyHh6wbnCQb/hR4=; b=jlqhWfoSus3AvDYQ
 rNg9bNMgYw3zocQdvrdxXy5zd9+nVPnYik3umQeq7Mmy5TnJxJsd+oTkcbSg02YL
 tJRoDy8grzJPGgruw6Maxu+YfHm6coLBuXuwydQGMU91gsjihn+disnYvNpaiYxJ
 ykGhPxjB8pKv76xpOyCwQX9Jwr5wSrHlYaXtQRIGxIyXo3f7NLyRqyhx4oI+pjR+
 k7YNcJdVZdT/hUIB2ZMPZ0Tj1SbWVvQ677CmJNXRRGCrosb8XlOFzSxJs4jjCygl
 uLcRnnKQV0wPWFIkJtQoSnI3IhTy89qHQ5TuDEMuzVZsBV+ghOHxSGDhxLmU5Uk2
 wzPqvQ==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b7cuhckab-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 24 Dec 2025 01:04:05 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-88a2ea47fa5so149348466d6.0
 for <freedreno@lists.freedesktop.org>; Tue, 23 Dec 2025 17:04:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766538244; x=1767143044;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CHgg9IL7FE026ch0/W9DThBQX+0QxyHh6wbnCQb/hR4=;
 b=gh2c7/bIR9bPaHOjE8NFdYFgf1qP/D22RzN8bbmmen9lZtSwj9YtwmH2q82PkZTKj3
 hD2FuYh4KLSbwpp3iQ1Nd5w1DxuTS6LLTZRa90qkVMvnkZckcAprDvNFsS2Op8uNHeNW
 iVALGk1JHGytHUXR3Sjyuh0x9CvuDxXMmOMrg5GoxjxV77ppC1lyjJ+TjNV+gOuFLO3b
 X3FLznbHEe0i0TpbTn35mBt3xGEAUf46i3TAgXKzNe0xKehw4xZaeSYslRfaCiryNhWj
 htwaGkpAsvq87xxAtB9iBUpZ3q+6Eopt/G0v5ocy/Bk6jji1rn4w5fthawBP7Eeah+WI
 704A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766538244; x=1767143044;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CHgg9IL7FE026ch0/W9DThBQX+0QxyHh6wbnCQb/hR4=;
 b=U3T5V0SY1/fBv1EDZBBiBmyw6o1sb4rvqsdH7vgVcznqUdtSWriTXeGePN+e/uoDqB
 wp3rLE9FTWBQTB6n6gs/D0a/JKXxx8xKIHZr3MzmYpBB11/MpCOat+bCukmak5zbitRZ
 5W7JER2kgnlgffX9yVGQ7RzxrpTNW6lR+t9YaZbsKgYfDHEKlS2zQ9vhJoPValIBSq3A
 PftSOWBZPPRireF+JHsaIEAjfpmcO/UWtTs/MmVWLoOBIxib7923XE/A87/NqXlNJWSQ
 OD4KnlXfBfYuWGWS2Mj2Wik+mWPwdCfrFMi8+PJMOfyPSxPvt6Xj2rZCCtdDaq7+FyTG
 DQHg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX8sSNhTGiBFsZncYmIZ1n9WopoLqvByT540WAqP2cUOkAtvcTogeG8CldxcfBKdWc6IUzHkZrSFLI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz5WwrkqJxbZIv44gk+62rkSo4dqhIyLWVjyxn5cfmPl8BAsNVE
 0OqRwrdN+bXSlNpT59yyDctGhu8mRccK3CdCQyub+Zt0nq4/5zeWRmCcn7kVsf8QL36XVhgiYh7
 Oxh3qqzVkZboZKBNLclXAXXZsMGqK7y6F1WH5Vmnnz/GJOJKJZ30ZVepTtjMknPgQB2/ymIA=
X-Gm-Gg: AY/fxX5YO+T0PabhFlUE0QLqdelHOM8Ne5//oU7dxuar2d34LrrBQ50o/dI/EdQhmGl
 /7qh20wGfsT5v/5PkZVtuu9pmmkbADIFrOAPNZ8ROYhu4/JAZT0Io8uH5qeLRa+iXC8WcoKOxz0
 cAauagwCa4D2f86ynXzRAXu1A1S66BtJbsdEQEaFfMt22MoSGpqc7RCKikGyMf9fJrXF2YNq/iw
 0dWB7/b1DOteeuugjJ8JSu/9wZfaT4i+oXUAqiDyhIZORjUUXnnRBm4VZF3zPFlNIlGD2WdzIX2
 T0+NFnGJqr7oO0eb9jWSy+R1JnIyd8Y3W7mNNSQ4t8WEsdvbFBDCDllQ8iCTyujgGZx0ERSjSKy
 NisjYVtimVQ86+W6vb2LssJSJUK8K5GANuoYyxBhyc0QqEVoBboabYyaLWbl8wOPuMPnDtGUINU
 P2S0vvjwOc5Io8RDkkUBrFCqk=
X-Received: by 2002:ad4:4e8f:0:b0:888:7d61:b218 with SMTP id
 6a1803df08f44-88d81d47b5fmr175846786d6.11.1766538244311; 
 Tue, 23 Dec 2025 17:04:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFu7+HH145K//WnhennzRUAZ/qC4YMZkCHH5OOgkflOfdjzzhnjIk8vQXkFQam/FvXO84smjQ==
X-Received: by 2002:ad4:4e8f:0:b0:888:7d61:b218 with SMTP id
 6a1803df08f44-88d81d47b5fmr175846286d6.11.1766538243819; 
 Tue, 23 Dec 2025 17:04:03 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a18628284sm4545268e87.93.2025.12.23.17.04.01
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 23 Dec 2025 17:04:03 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Wed, 24 Dec 2025 03:02:59 +0200
Subject: [PATCH v3 10/10] drm/debug: don't register files for unsupported
 HDMI InfoFrames
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251224-limit-infoframes-2-v3-10-7fd3cacfefed@oss.qualcomm.com>
References: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
In-Reply-To: <20251224-limit-infoframes-2-v3-0-7fd3cacfefed@oss.qualcomm.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Dave Stevenson <dave.stevenson@raspberrypi.com>,
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>,
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>,
 Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Andrzej Hajda <andrzej.hajda@intel.com>,
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
 Jonas Karlman <jonas@kwiboo.se>, Liu Ying <victor.liu@nxp.com>,
 Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>,
 Matthias Brugger <matthias.bgg@gmail.com>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Sandy Huang <hjc@rock-chips.com>,
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>,
 Andy Yan <andy.yan@rock-chips.com>
Cc: dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-mediatek@lists.infradead.org, linux-arm-msm@vger.kernel.org,
 freedreno@lists.freedesktop.org, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1244;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=e83riHemz7jmVSC1s86WzW2uTf0LnBtD9CtSbMUNt3o=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpSzvaPmw40jATyUWTrYBTNEusZxIc+obHstv5S
 b4iElplUN6JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaUs72gAKCRCLPIo+Aiko
 1di3B/95raEOH5VDkaGoqgK45/yZh46TpjSkI0p4xAQ5QWmsMaaCn7Newqpeo25B8E3VpDS52aa
 up3rolkowr24CN+AOTFNP4qaLU+wQ5ufsLePmUId4/Sf7f/3uLCmTjU2bAAc7WkBJDBOUgESVoE
 VPOds3GCRBLX3X0qEONZ6Q6pJmz9433H5cMK5o5GZz3dTS0dZZqphPcLWyxJSLEmmZrEn2G8Wyx
 MZQXEWNaui7oT4aHMyYoZX0z2RTqrLwJAAmkkLQISa4jHnSF5bBJb4YQauizaBu+BJqV1TOmbVf
 WZtZHkfsakdCoN6Xjk8QGpdcOMYzMgS1IQv2DEwSOdtfE7Y8
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: qWP0X-qHE4xQbT7wR9plXkCLNnBz2Ms4
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI0MDAwNyBTYWx0ZWRfX4r3kxY9pFAuu
 QyjJk1Af0TL7xbeRyuiCLLUFQfDKRtzOtpwsCnBG9SV9qxBJOz3Old414Tchg59kWg4Jt4QPWwd
 pF7bnjwTz8Sj6XOT33ufsifMB+1yfVQbFYUC/QQO4yDmza0fPBiO97kECPO5t/Mbrn/T0QGk/hn
 yYuLZ/lnHdlS1udp5FH/4gXUum5t3//obQUIkGPGSv92xPrJ4luG/kL7ZvSNIwKw9CI4Uf8iu7L
 dsdOEfTpMkljIkNmv/G8JmQz0cWzaxLBUDnckTCeFoKWNRbUHTguffzNF2KTBEl08Mh2w3Cf0+b
 Di2pkuEdUBf1jegnzXFm26UeQ0JcSYk48JvkdrvEEeAwnKr/iqu/Us+cqMQv7FYykjufhK09hwi
 ioWmH0kd9rbkiAdoDWzHmwf1pHsByBOCXPZ5WSodscz8/RlkxURr5A9KInMyb4ntaXNs5csB1yE
 3Ir4kz2VYMomYZw9QNg==
X-Proofpoint-GUID: qWP0X-qHE4xQbT7wR9plXkCLNnBz2Ms4
X-Authority-Analysis: v=2.4 cv=NZDrFmD4 c=1 sm=1 tr=0 ts=694b3c05 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tIAOKlZC_mo2NaXw_9IA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-23_05,2025-12-22_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 clxscore=1015 impostorscore=0 malwarescore=0
 suspectscore=0 phishscore=0 bulkscore=0 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512240007
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

Having debugfs files for the InfoFrames that are not supported by the
driver is confusing, stop registering those in the debugfs.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/drm_debugfs.c | 7 +++++++
 1 file changed, 7 insertions(+)

diff --git a/drivers/gpu/drm/drm_debugfs.c b/drivers/gpu/drm/drm_debugfs.c
index 365cf337529f..ae1c6126c2c5 100644
--- a/drivers/gpu/drm/drm_debugfs.c
+++ b/drivers/gpu/drm/drm_debugfs.c
@@ -672,6 +672,10 @@ static int create_hdmi_audio_infoframe_file(struct drm_connector *connector,
 {
 	struct dentry *file;
 
+	if (!connector->hdmi.funcs ||
+	    !connector->hdmi.funcs->audio.write_infoframe)
+		return 0;
+
 	file = debugfs_create_file("audio", 0400, parent, connector, &audio_infoframe_fops);
 	if (IS_ERR(file))
 		return PTR_ERR(file);
@@ -726,6 +730,9 @@ static int create_hdmi_## _f ## _infoframe_file(struct drm_connector *connector,
 { \
 	struct dentry *file; \
 	\
+	if (!connector->hdmi.funcs || \
+	    !connector->hdmi.funcs->_f.write_infoframe) \
+		return 0; \
 	file = debugfs_create_file(#_f, 0400, parent, connector, &_f ## _infoframe_fops); \
 	if (IS_ERR(file)) \
 		return PTR_ERR(file); \

-- 
2.47.3

