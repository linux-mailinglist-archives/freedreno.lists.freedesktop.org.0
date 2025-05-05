Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 4CCC2AA8A6F
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 02:55:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EDE1010E14C;
	Mon,  5 May 2025 00:55:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="B9QjX2PV";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7462A10E14C
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 00:55:54 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5450o12r019899
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 00:55:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 bScMRW/t/S7USpvl8/Meg4mWuCwC1biGFJfQYK3oMHw=; b=B9QjX2PV9v3su2oR
 Qz6Pmc11VsUlu7mHg3jkjzPPtZwgAk7MIeImGSDS7wmaIiaYk2aQcCNx+x+QrZxe
 eCld8VOJ3yVVzkQWnEmtObXhk8QntuDYyJX7yXHz5rS/yLiAv9hNicN0udVMWfBc
 6vmk0kCpZ5M1Z/IUrW6Wzs7ifqodPbeAsgvMaYsziRNoN3xvNUUpoqf1RWxOQ/9K
 VUgExHscnNKrsWKVPZfqHCojoYNAj8POUE6pnQ6EX13ZnZM1/fOH07NJ8NZxtkmX
 0GvhawBdYR0XIwa2kXDofsvBi69Fqe1gociwgldwt8qBrronl96Lli8blthvqgre
 zLFIFg==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dd3n2hjs-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 00:55:53 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7c791987cf6so810062285a.0
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 17:55:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746406550; x=1747011350;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=bScMRW/t/S7USpvl8/Meg4mWuCwC1biGFJfQYK3oMHw=;
 b=k0anjmhVYODCICF+rcDOB0KmZVM7CMvpKLpK6NKzlkSHAGAm+oO3eBTi5nz3T25dsI
 phYGXZHPeRBklpz0GcX36Tv7E+o5+L0Om0wKq/j2U5GnUt1YHOs9a0EZ5fB+fguRXDPB
 bqINkdg7DEU+er8634jCIzsvfZjwpB5avZgsmxJbEo7OPfJzEGo3grpGOzN8W2NmA1Nm
 f9OVBGAM4C1UlpOEaAI4c3PncVQ1Mrm1iPj8Rqru1ccWM2OBsFLo28+ruwlqPfAY0zlA
 JPjIF0Qb/y15KdXdxwVIFsOG5LembxzcmY4JiKnlkaIzb4UWScadPBOPfoRr9pf3Lc61
 OYNA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVHK6a2IYLR3ccFCIY7AoUNKbYBSAnKJCQqA7y9dhYpbkwxgHiObMOG4p/ow3vY8u4ELOLigWjUFUQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yxdrc6TdhMeAYpjPi6VJAYL6J90GglZPG/da9/JtuFHzXajntpG
 Ca5OgZMSTzjpq+dbArDYGBkqII5JEXKjAGEV+mKMf1OjjT/j9q1CyxY4vwCcME6NOVu71GUw3On
 GDlIo7fCeZ7BnRG2YXRSnJeIPu9P54sbk7dqrmpMnbGByTtTajYjFXEaYYB7QtDvACMQ=
X-Gm-Gg: ASbGncsJf7tzVHWOf1GQ8tqh6mQMYTcU/UMumUbCvo6FSu4B5r1nEVvimPy4m5uHbHk
 iklfwGHxR55pUug3dDjIAQbTLfIOcFelbSvuA5bAjebHLO9q7t0sfjXy5v16Q2G9MaPTkjyTiHn
 J1f57zL6RHXAdFuwI3un8sn0fa78WvyiqjEgOT652jSQwENKkfw1n67LBDrQj/+9wyaBp/c398k
 MPJ5oRQYSTeQ1KNkLle6/I6RhgAr53ETJlWWNZe3iRkjR6HZGPkpefy30pr19NIh3SxzvrLO0bV
 m1bzV8nYSTkFNiDf+LjSphG3qUJtKHyHZzHqhoUU//rO8PnbL/Svw+26HM5RTya/LtN7HI3n09O
 v5U4mzugfzmd0jwaCMN+vaouq
X-Received: by 2002:a05:620a:288f:b0:7c5:9c13:2858 with SMTP id
 af79cd13be357-7cae39e4d94mr562789585a.0.1746406549842; 
 Sun, 04 May 2025 17:55:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGR1BnB1bqJFNML5KMH4T4Sx/W6dCdj2CMTT7+fkvXjPRs+15OY5IAA/zDDkF5eHXUukTln3A==
X-Received: by 2002:a05:620a:288f:b0:7c5:9c13:2858 with SMTP id
 af79cd13be357-7cae39e4d94mr562787485a.0.1746406549425; 
 Sun, 04 May 2025 17:55:49 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ee07asm1501118e87.118.2025.05.04.17.55.48
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:55:48 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Simona Vetter <simona.vetter@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>
Subject: [PATCH v5 13/13] drm/msm/hdmi: wire in hpd_enable/hpd_disable
 bridge ops
Date: Mon,  5 May 2025 03:55:47 +0300
Message-Id: <20250505-fd-hdmi-hpd-v5-13-48541f76318c@oss.qualcomm.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=4345;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=SzYbiSJHs1yMPXj6OmRiDQC/Js3KF24ybXscune0PUw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAuq8oeBoszbBJhsuHgaf/J9Vn91t4s2pFa0L
 KQP44Y9ZyeJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgLqgAKCRCLPIo+Aiko
 1QeeCACVtDaCnd61a6+aWoQBYA37uOTTFipnJMx09Bimgk5R2wDPo3W5QQ9KQblYw/JuXRrS6NT
 3aI52WYS5+oANdWEfOynFa8FsoAVcef2bIl8BdPgY94UnlS8qrPjC8C6tgbFrnXOSJPGTY6KIIo
 +Zjizl/URZ6sL+KZaRISQ1ADm4DGNVZrqopTlz9P/zSWFEHT2UTb5hDS2ai8l+0qopAbDeS/vrz
 JJI8jqTUHbUwMJsI5B1n/XEgyuzvdgLm+5tZ7RBSK4tY0fZ35pYkpF508xGDG+L269aLDALkxmN
 OeVPWNQoA1xEI+khIRrkdkbqQmwpqUoXD9p2sM53CqDpTTQd
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
Content-Transfer-Encoding: quoted-printable
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwNyBTYWx0ZWRfXy1JFpYmCd1aD
 TsmNVnp3FzLdISmi4aQe/7FPDvLG6ReOAs//0R36YJFV/8sRtyCXzXZNgqZ5yV9LCcHY2vokkKw
 /J83Smvhl5yOx4QujwYylRw/bt9X06KKYYFu1DjUTrq7havHKy5L+Nm3HqnB8ZAg+ntPLygYTWF
 DaRVc2DNb0+OcLIZVxWUkoBfXU7D+39us3/CO7hgpdyidPVRRgCC8CjM9UFBQwgL1cI6IEyXKsi
 yBly3gRS1cNHC1VBZqnVYXmehxwgZC3WRUHZA74Q8B7jlHJAqqAr0h5nvCvsX4zTKynwu41JoOV
 EalvnP/fZsoSki8DG93HBG9ewFa1Zdq2+8CGaqicvsSgc4N9sp9VsFfg452/vQpOJZJRvuL4cjN
 7R/7GxUAiQU0LzDn6knllugetmaE02OPqu9yy7x1CFoq9+3Qe0FD9VhnuLeBNLrdLyq+r8W4
X-Proofpoint-GUID: 3EeKjumVOhdFdVqejivvMboGl_gJVfNc
X-Proofpoint-ORIG-GUID: 3EeKjumVOhdFdVqejivvMboGl_gJVfNc
X-Authority-Analysis: v=2.4 cv=UNDdHDfy c=1 sm=1 tr=0 ts=68180c99 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=6oMmD3cprD66TWOKKWcA:9
 a=QEXdDO2ut3YA:10 a=IoWCM6iH3mJn3m4BftBB:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-05_01,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=999 adultscore=0 suspectscore=0 clxscore=1015 lowpriorityscore=0
 mlxscore=0 phishscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050007
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>=0D
=0D
The HDMI driver already has msm_hdmi_hpd_enable() and=0D
msm_hdmi_hpd_disable() functions. Wire them into the=0D
msm_hdmi_bridge_funcs, so that HPD  can be enabled and disabled=0D
dynamically rather than always having HPD events generation enabled.=0D
=0D
Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>=0D
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>=0D
---=0D
 drivers/gpu/drm/msm/hdmi/hdmi.c        |  9 ---------=0D
 drivers/gpu/drm/msm/hdmi/hdmi.h        |  4 ++--=0D
 drivers/gpu/drm/msm/hdmi/hdmi_bridge.c |  2 ++=0D
 drivers/gpu/drm/msm/hdmi/hdmi_hpd.c    | 12 ++++++------=0D
 4 files changed, 10 insertions(+), 17 deletions(-)=0D
=0D
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdm=
i.c=0D
index 5355cfd391c5cc3053f771dd03e24dfde16733bf..2fd388b892dcb3d83cf57b4616b=
7a65f9ff674d1 100644=0D
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c=0D
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c=0D
@@ -200,12 +200,6 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,=0D
 		goto fail;=0D
 	}=0D
 =0D
-	ret =3D msm_hdmi_hpd_enable(hdmi->bridge);=0D
-	if (ret < 0) {=0D
-		DRM_DEV_ERROR(&hdmi->pdev->dev, "failed to enable HPD: %d\n", ret);=0D
-		goto fail;=0D
-	}=0D
-=0D
 	return 0;=0D
 =0D
 fail:=0D
@@ -261,9 +255,6 @@ static void msm_hdmi_unbind(struct device *dev, struct =
device *master,=0D
 	struct msm_drm_private *priv =3D dev_get_drvdata(master);=0D
 =0D
 	if (priv->hdmi) {=0D
-		if (priv->hdmi->bridge)=0D
-			msm_hdmi_hpd_disable(priv->hdmi);=0D
-=0D
 		msm_hdmi_destroy(priv->hdmi);=0D
 		priv->hdmi =3D NULL;=0D
 	}=0D
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdm=
i.h=0D
index e488ee31cc865b4eee9d486d978217c00f7816bf..d5e572d10d6a14b866f13c3a0d6=
63cc6ae435ef5 100644=0D
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h=0D
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h=0D
@@ -216,8 +216,8 @@ int msm_hdmi_bridge_init(struct hdmi *hdmi);=0D
 void msm_hdmi_hpd_irq(struct drm_bridge *bridge);=0D
 enum drm_connector_status msm_hdmi_bridge_detect(=0D
 		struct drm_bridge *bridge);=0D
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge);=0D
-void msm_hdmi_hpd_disable(struct hdmi *hdmi);=0D
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge);=0D
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge);=0D
 =0D
 /*=0D
  * i2c adapter for ddc:=0D
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c b/drivers/gpu/drm/msm/h=
dmi/hdmi_bridge.c=0D
index 8ff0079abc801448e96b73ebea4730edea55ea6c..53a7ce8cc7bc7b6278eae2cbc42=
c3fda8d697f6d 100644=0D
--- a/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c=0D
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_bridge.c=0D
@@ -459,6 +459,8 @@ static const struct drm_bridge_funcs msm_hdmi_bridge_fu=
ncs =3D {=0D
 	.atomic_post_disable =3D msm_hdmi_bridge_atomic_post_disable,=0D
 	.edid_read =3D msm_hdmi_bridge_edid_read,=0D
 	.detect =3D msm_hdmi_bridge_detect,=0D
+	.hpd_enable =3D msm_hdmi_hpd_enable,=0D
+	.hpd_disable =3D msm_hdmi_hpd_disable,=0D
 	.hdmi_tmds_char_rate_valid =3D msm_hdmi_bridge_tmds_char_rate_valid,=0D
 	.hdmi_clear_infoframe =3D msm_hdmi_bridge_clear_infoframe,=0D
 	.hdmi_write_infoframe =3D msm_hdmi_bridge_write_infoframe,=0D
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c b/drivers/gpu/drm/msm/hdmi=
/hdmi_hpd.c=0D
index e03d0ca230e64d7675534074d6e14587815119b6..407e6c449ee0d84628e4cae9dd4=
3c1b1f2c0090f 100644=0D
--- a/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c=0D
+++ b/drivers/gpu/drm/msm/hdmi/hdmi_hpd.c=0D
@@ -60,7 +60,7 @@ static void msm_hdmi_phy_reset(struct hdmi *hdmi)=0D
 	}=0D
 }=0D
 =0D
-int msm_hdmi_hpd_enable(struct drm_bridge *bridge)=0D
+void msm_hdmi_hpd_enable(struct drm_bridge *bridge)=0D
 {=0D
 	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);=0D
 	struct hdmi *hdmi =3D hdmi_bridge->hdmi;=0D
@@ -73,8 +73,8 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)=0D
 		gpiod_set_value_cansleep(hdmi->hpd_gpiod, 1);=0D
 =0D
 	ret =3D pm_runtime_resume_and_get(dev);=0D
-	if (ret)=0D
-		return ret;=0D
+	if (WARN_ON(ret))=0D
+		return;=0D
 =0D
 	mutex_lock(&hdmi->state_mutex);=0D
 	msm_hdmi_set_mode(hdmi, false);=0D
@@ -102,12 +102,12 @@ int msm_hdmi_hpd_enable(struct drm_bridge *bridge)=0D
 	hdmi_write(hdmi, REG_HDMI_HPD_CTRL,=0D
 			HDMI_HPD_CTRL_ENABLE | hpd_ctrl);=0D
 	spin_unlock_irqrestore(&hdmi->reg_lock, flags);=0D
-=0D
-	return 0;=0D
 }=0D
 =0D
-void msm_hdmi_hpd_disable(struct hdmi *hdmi)=0D
+void msm_hdmi_hpd_disable(struct drm_bridge *bridge)=0D
 {=0D
+	struct hdmi_bridge *hdmi_bridge =3D to_hdmi_bridge(bridge);=0D
+	struct hdmi *hdmi =3D hdmi_bridge->hdmi;=0D
 	struct device *dev =3D &hdmi->pdev->dev;=0D
 =0D
 	/* Disable HPD interrupt */=0D
=0D
-- =0D
2.39.5=0D
=0D
