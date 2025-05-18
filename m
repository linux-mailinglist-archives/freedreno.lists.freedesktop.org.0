Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0D0CAABAFDD
	for <lists+freedreno@lfdr.de>; Sun, 18 May 2025 13:21:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id A994910E2B2;
	Sun, 18 May 2025 11:21:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aEU3Vfoj";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D2D9E10E2B6
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 11:21:42 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54I6Tmwj013537
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 11:21:42 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 2uKch//NQ7rpnZebTlILrt38+d7k2jrMtvdBKAoEcuA=; b=aEU3VfojgWNKJ0wg
 /NtI6gDQydL3+P6HrASlxlxqWT9fg5ThGHk4GsDhD1/8Ns4gjYfgMOwmUSn3DFQT
 LCRld4LZtI6nRPhyUdM6Nw4i9QyV1uvJuRjl6mAB/+l381sURuxSk6IzCYUFS+Yu
 ZbP/EG3UgsKVgFCnOv/0LxIErva1FyW8fF5W4Yo+BO0W6OIGavKIduLb8Lk3XSen
 p9RcMZOKILixacyd9BFHAyE34kgsFd6GG9hd5RscAC9iDatTyuRYjk0YPOLdk+3p
 Lz0ZvcGJ2ggyG6RBIKNKr1R46tzX1L3RwoiLo3RMKYUaaSkFQ1AAlaMy0za2XV5z
 LQP3/w==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46pkmm9tvq-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 11:21:41 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6f8cb4b1861so16397646d6.3
 for <freedreno@lists.freedesktop.org>; Sun, 18 May 2025 04:21:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1747567300; x=1748172100;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=2uKch//NQ7rpnZebTlILrt38+d7k2jrMtvdBKAoEcuA=;
 b=pgGV6Q5leBfQ1HrxqYZdJU8VRuYCF+Sz7pQ3q1vtS2eIqzwJTDRl3fx32boRn2P4PY
 aBi+ZMwOuQ4JF/g2XhS0HAQs16PP7zvqtojaTVcYviKRnO/THol7EchrkZicvSbBoM6G
 wqOzptRwpIvZlRbveC14vXOFFo0IlNzsLHVaPyCnVhIV8XZljpEXVM7+qWKkfBPh9f7F
 UVWUXAqM1J0+WkCLMvclrLVkHcaU7DkvEdsYKsurDVEXP5SUDExG4Lrv0Jc4MpOZ191W
 U5uSUTMiGJJFlqIBDsXePWTpQacq53LHPLHD6ehqk7KCQFt2ukXQOgJLTvTF45/68p4w
 v7Xg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUof1dChD4ynI9sUWaPXZlluPCjusDWU0NI1XsmozOOooex1mTDbVnwvHOJAYNPT7KoXLfoGNV0D5s=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx0tWKJrNPbK+WXpd4uYdf5b8ee3oqT29CUlgAdI/7KjVqUioJe
 V21Nmi86qjEKQZjtb3b7twChIO2RZ/kuQcwQDn9qU2Uc6MBo7HQ9J+v24maAMUmWULCD2Bir8HI
 L/bvnCqdj/tQPojYCnmyf355E3SsJi5F0L2Zqankz75sSlGmZYfra6y/onissCMxVE5B6Lyo=
X-Gm-Gg: ASbGncvj83mEzPOmFWCXhXAUPYWjrPoioNC/PpOLYL66dOe3r8vVuR9v6P/Ag04AqvG
 ecLmukdW8r4HtjpHJUnOHOxpFeNQzaJHUgMtWeqsUsLPR1GC+nxA0EA9Ky1+UbtM17D8oFj9y2J
 zEs8CgOTerFh/Rsf3pLx8JRp0ZLCRXXjVJwBv+Q9+GJBOsHannZaJsxZVytt9mqja31ni+7PehK
 6XjvT1EW58pww+jTIHXCLP+e/p0zSIt5hptm0UmKiY3sxpVwrJhVb/fUDLAwTLx+9OCip/+oOD7
 HZ4LqiFDN3emqJU+3bBos68LgYDrPL6aKpUK3kg+zZCZnDfnpdOl4c0a3EIU7ANUV0uKZB1OoYq
 4jKxEn/VcUSoFlliNmCAJrdQv
X-Received: by 2002:a05:6214:1c8e:b0:6f5:3cae:9205 with SMTP id
 6a1803df08f44-6f8b08eb1c6mr152828706d6.39.1747567300372; 
 Sun, 18 May 2025 04:21:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHhSxWj8g056O+jlekH/YLxzN/NBJMw6auhuYPgIm+qZxaImdHyk5LkSqG55Ex6F6xfM5gwSg==
X-Received: by 2002:a05:6214:1c8e:b0:6f5:3cae:9205 with SMTP id
 6a1803df08f44-6f8b08eb1c6mr152828436d6.39.1747567300007; 
 Sun, 18 May 2025 04:21:40 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-328084ca34csm14186881fa.30.2025.05.18.04.21.38
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 18 May 2025 04:21:38 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 18 May 2025 14:21:34 +0300
Subject: [PATCH v6 01/11] drm/msm/dp: split MMSS_DP_DSC_DTO register write
 to a separate function
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250518-fd-dp-audio-fixup-v6-1-2f0ec3ec000d@oss.qualcomm.com>
References: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
In-Reply-To: <20250518-fd-dp-audio-fixup-v6-0-2f0ec3ec000d@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Paloma Arellano <quic_parellan@quicinc.com>
Cc: Douglas Anderson <dianders@chromium.org>,
 Stephen Boyd <swboyd@chromium.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=3146;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=/GMTajfgX5DJx2us6iS4i6AlKgNdptMEPO7PC3DA05s=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoKcK/DjiL8Y03I/FRxMKvknvQjg2GH898wVxON
 gb+VHMeBeaJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaCnCvwAKCRCLPIo+Aiko
 1Tr+B/41Vm0d/UkXnBsuj88/YsnYqBtPAKHVqUq3MtR5mgOWjdUnk7xRAwa8FowVCRn1PaKePum
 YIZ5S8u05sRpyoWM1lyW04bRa3S+5lyYiUctfEKv3/dY7fq1/ekPj/NGlwGLQ7Ku9LRnTl8X5hO
 DwM/b5e2mQYZKeMG6cdi97l7/B7SBnIOVKQ/E3J2TnwtOAMRfUHZH1W3+UZ1xiDo01PtIx1zl+S
 fUcdoULfPfKhLtyPt7TTUdH8g11GguNzNeOxtjgkk1Zb+JUjpGtEE8UEX987jMBIiAILZLyTqL3
 VDnfTpRp6ANMaiN7E6QAI428jBB1zH27USM5xJzQxN7wgLEA
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTE4MDEwOCBTYWx0ZWRfX5+gIh3e4i+sg
 EQFVGTaiEA8JZiAfEacU6skAFvGPYKfNYQHhB+/UEGeiGO4mi6KJswU8xJen7XoGfONRGOwtmZ5
 kVNLJbVtrhHA6BArUKZmHygDfUEUTjfDgjeK3Bwq7P1myuRY9GVplo904G6ImgPzLU86o+MFSuM
 hOSxlnyIJihtgiHFTjH/5pHmPJ1ZfNPlzzjZ2lbmWdtKBkResjHTJys3fVaula9Qf80h2Qid0Af
 aUwSW3qfhxP4RliLkZN6aoB9qYHCmiBjIlvg7MVPIqWYGwzYT/xAPr3U6JqsbcjEF098f6Sy9b6
 B3yhUC/Ww0YlfuZZHxqfe8cdbNVYl4vNaJmnH5/yopSSqkmoXGL0e2ooLx9Z6or6xhtbCm40J3f
 Gs35lwdhujlsU1pXXSqnqlKRUovZp5OsS1FS1GYHRMOtk2GXLtx4fzjeJ2MqaM/NcjzOXksj
X-Proofpoint-ORIG-GUID: gOY8SEFLwjMnwWohljJAgtyaT6aBd-QU
X-Authority-Analysis: v=2.4 cv=PpyTbxM3 c=1 sm=1 tr=0 ts=6829c2c5 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=cm27Pg_UAAAA:8 a=zRKm0RuqD35KdulPN9UA:9
 a=QEXdDO2ut3YA:10 a=pJ04lnu7RYOZP9TFuWaZ:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: gOY8SEFLwjMnwWohljJAgtyaT6aBd-QU
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-18_06,2025-05-16_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 mlxscore=0 adultscore=0 clxscore=1015
 lowpriorityscore=0 mlxlogscore=984 priorityscore=1501 phishscore=0
 bulkscore=0 impostorscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505070000 definitions=main-2505180108
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

From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

It's the dp_panel's duty to clear the MMSS_DP_DSC_DTO register. Once DP
driver gets DSC support, it will handle that register in other places
too. Split a call to write 0x0 to that register to a separate function.

Reviewed-by: Stephen Boyd <swboyd@chromium.org>
Tested-by: Stephen Boyd <swboyd@chromium.org> # sc7180-trogdor
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/dp/dp_catalog.c | 9 ++++++++-
 drivers/gpu/drm/msm/dp/dp_catalog.h | 2 ++
 drivers/gpu/drm/msm/dp/dp_ctrl.c    | 2 ++
 3 files changed, 12 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.c b/drivers/gpu/drm/msm/dp/dp_catalog.c
index 7b7eadb2f83b169d8df27ee93589abe05b38f3ae..4f80eceb6ae19f542110d7379007f57c2ac16a8a 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.c
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.c
@@ -486,7 +486,6 @@ void msm_dp_catalog_ctrl_config_msa(struct msm_dp_catalog *msm_dp_catalog,
 	drm_dbg_dp(catalog->drm_dev, "mvid=0x%x, nvid=0x%x\n", mvid, nvid);
 	msm_dp_write_link(catalog, REG_DP_SOFTWARE_MVID, mvid);
 	msm_dp_write_link(catalog, REG_DP_SOFTWARE_NVID, nvid);
-	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
 }
 
 int msm_dp_catalog_ctrl_set_pattern_state_bit(struct msm_dp_catalog *msm_dp_catalog,
@@ -1039,6 +1038,14 @@ void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog)
 	msm_dp_write_p0(catalog, MMSS_DP_TIMING_ENGINE_EN, 0x0);
 }
 
+void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog)
+{
+	struct msm_dp_catalog_private *catalog = container_of(msm_dp_catalog,
+				struct msm_dp_catalog_private, msm_dp_catalog);
+
+	msm_dp_write_p0(catalog, MMSS_DP_DSC_DTO, 0x0);
+}
+
 static void __iomem *msm_dp_ioremap(struct platform_device *pdev, int idx, size_t *len)
 {
 	struct resource *res;
diff --git a/drivers/gpu/drm/msm/dp/dp_catalog.h b/drivers/gpu/drm/msm/dp/dp_catalog.h
index 6678b0ac9a67881244884d59487fa288d33d1be7..08bb42e91b779633875dbeb4130bc55a6571cfb1 100644
--- a/drivers/gpu/drm/msm/dp/dp_catalog.h
+++ b/drivers/gpu/drm/msm/dp/dp_catalog.h
@@ -92,6 +92,8 @@ void msm_dp_catalog_panel_tpg_enable(struct msm_dp_catalog *msm_dp_catalog,
 				struct drm_display_mode *drm_mode);
 void msm_dp_catalog_panel_tpg_disable(struct msm_dp_catalog *msm_dp_catalog);
 
+void msm_dp_catalog_panel_clear_dsc_dto(struct msm_dp_catalog *msm_dp_catalog);
+
 struct msm_dp_catalog *msm_dp_catalog_get(struct device *dev);
 
 /* DP Audio APIs */
diff --git a/drivers/gpu/drm/msm/dp/dp_ctrl.c b/drivers/gpu/drm/msm/dp/dp_ctrl.c
index a50bfafbb4ea85c114c958ea0ed24362a1f23136..4c0a19e14492dde92e5707ffe520681aba1ca5c0 100644
--- a/drivers/gpu/drm/msm/dp/dp_ctrl.c
+++ b/drivers/gpu/drm/msm/dp/dp_ctrl.c
@@ -2050,6 +2050,8 @@ int msm_dp_ctrl_on_stream(struct msm_dp_ctrl *msm_dp_ctrl, bool force_link_train
 		pixel_rate_orig,
 		ctrl->panel->msm_dp_mode.out_fmt_is_yuv_420);
 
+	msm_dp_catalog_panel_clear_dsc_dto(ctrl->catalog);
+
 	msm_dp_ctrl_setup_tr_unit(ctrl);
 
 	msm_dp_catalog_ctrl_state_ctrl(ctrl->catalog, DP_STATE_CTRL_SEND_VIDEO);

-- 
2.39.5

