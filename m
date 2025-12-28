Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id CF8F0CE48DB
	for <lists+freedreno@lfdr.de>; Sun, 28 Dec 2025 04:57:27 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8CDCF10F2CE;
	Sun, 28 Dec 2025 03:57:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="SxQU7t5H";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="UjseOM93";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11CC010F2CE
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 03:57:25 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BS1Iacd1527825
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 03:57:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 TgmpRwvrUbHmxLFWDS2Afnh71v9wqwGbfUtuXRPHvDo=; b=SxQU7t5H3i2uenlT
 bRsf5r4fTvPFvL97GIB1UQfXoLD/Kg2kaP7PrCK8A0QenZcZPmD0OZWDXxdimf+7
 hXfQKMK2zmakKeOtFzDDvaDmfZn1pFpix4VytpA6lpOtdMLGwU4U0nU+DXuJXWyZ
 kwJ0Rh342/bfNHJf1IFCMuNvj85yLtIHgEbNjBli/qGxluJeMF+AEcK3IUusc38Q
 8aI2lwNKY2Vv23s+Fs1T0DsGA8w8zhuji+5DKXt19C7a7mifqgVXqSZjROfltJar
 OK/ZCj6JfCBOTvsslxFRdKNIY3PVAXgj3/sk1MDH82IoMt8xskyKiWnNcQdDbxpk
 H6LsUA==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4ba87bskss-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sun, 28 Dec 2025 03:57:24 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee3dfe072dso219294601cf.2
 for <freedreno@lists.freedesktop.org>; Sat, 27 Dec 2025 19:57:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766894243; x=1767499043;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=TgmpRwvrUbHmxLFWDS2Afnh71v9wqwGbfUtuXRPHvDo=;
 b=UjseOM93nIJzrI864lxRyJpFogDleBN4FyAOEl24bRsZvQw16zD94ocCOAdHLizJlk
 feQx//fZ+iI+VRnvU5ufrmIpxXG+T8VfGJBmq/9CmXoR7SlPL+AeFcqErEAa95x+L3pW
 Y7o4sE/nzIH0YloIJSZNpGd+S1YQG83eseJE/qUNfJ8xu+aL3mgij6T0DC/D16ID6kO/
 NL5CTAoS0+yYjF8VV7zjRkWClDOFoGn5aL6lkUlBUfKeYHcQsx4u8TdbnOXwN2mVC9LK
 5CLZjnKfosEYCesFuZf7ga1m5FZaUkfAQMtZSQjE1gmvFTlgpxUQSIozY4RHxFtC4Ark
 iPMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766894243; x=1767499043;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=TgmpRwvrUbHmxLFWDS2Afnh71v9wqwGbfUtuXRPHvDo=;
 b=CTzoopow7G0j9jIF+VbBcF8sq+UpfVhVF4S/Y2WF2qv/ewn/eUaHbp/Kxx+cV6rByy
 KGuo9Nlx/JdyzO7WexbYdBPQA7GtwnSUhWEHDBAJ6tTz+Dru+dg0HQIjGhWFXNmNWt1Y
 HCs4yVxmgRBPxyWfkypFzjSJZODceKk1JhArwvJvQnWolimB7w7yqXFg4rNsS+vTjhyN
 jfXVSix72ZAhcSGGeaTBOs0HIBQryMhXiKVsarAHJ4ZmX78t9jtVD5P6TJvOf1+Zy+05
 1fMwzsH1qHM+YUBxcEJoUPHBjHYCUIqmM1kSy33wx7AqeEzad59a7zHqlTT17eY2+Owp
 ilYw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXwvmES2KzroUe7R1iaAjc9kl2IjacALdmDeVI4W3qevHln9fnYIlLOHzlU+R6qQFZsv/MOzkFJEdc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwykMTqX1a/kd/tCzAfWBkilMcBZY/cAk6rQAfVgBLa9qwiGHyK
 GakqHbvXO/1k8dPuxyagW2ixs+zBcXDMrykBTdpPsRgUoKO7LtD850qV9noloPFff1iKgvwDrEA
 bwv0x7FCkxKnwLx4SdBPzldJfzn6mmAJxllI93QMpdQWOMwDev0rv4JmvVWRgtiaCm/myOoo=
X-Gm-Gg: AY/fxX5AMEpMhrMYcJhFuOEQ9gmxoySaK9kufX+/Z2cmqZOfQJNlgbG7KR/5St280ZL
 EPZPoi9OlyES2Ys8vNM+139GNRomzVD/KGsRuYHl8WceY7pmxckc5xAr5yConmut16KEq/90fHi
 9qZCJahfrsFH1hysm8EQ7Gw8Dy1OCyVWE98TmWLN8yqpHynhqGjphLmzM2k3zLYEX7oE977rF8W
 q9fogGLxpv9S8dUyiVpXL0ig72beKlDNX2qb1fWhy5U0zEvCpDDKZzZI9A11QHIKPRDT7e4V2FS
 SknJZ4HOY+Kt9XoBBB4rakBAfwSmjr7h6b27teIQK3bDf+VvXt9P6L9CGOVhUjKLwJ1XfYrSAxI
 DwrAVwA2OlsYtoiTwDKu10S17OpiKUmPG3wCsz7/R3arQ3NPcKgyTg3LV7zWervYPj8Hs4bXSII
 xhfj5fTEWyp1saB1/djl4xijw=
X-Received: by 2002:a05:622a:1f91:b0:4ee:191e:ade2 with SMTP id
 d75a77b69052e-4f4abdaac32mr379248521cf.67.1766894243318; 
 Sat, 27 Dec 2025 19:57:23 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGxZaZkfGU4/BuqR+ShYBJeuScf4wzxq9rwMhDMYsGNrFOWaYIwakpEEcp/W8/DTX/UcIzrgw==
X-Received: by 2002:a05:622a:1f91:b0:4ee:191e:ade2 with SMTP id
 d75a77b69052e-4f4abdaac32mr379248351cf.67.1766894242864; 
 Sat, 27 Dec 2025 19:57:22 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59a185d5d37sm7883586e87.7.2025.12.27.19.57.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sat, 27 Dec 2025 19:57:22 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sun, 28 Dec 2025 05:57:12 +0200
Subject: [PATCH v5 2/2] drm/msm/dpu: fix WD timer handling on DPU 8.x
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251228-intf-fix-wd-v5-2-f6fce628e6f2@oss.qualcomm.com>
References: <20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com>
In-Reply-To: <20251228-intf-fix-wd-v5-0-f6fce628e6f2@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Teguh Sobirin <teguh@sobir.in>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6979;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=r9EPYKCxvuHAJXUnGuN/VCBndZ9RD6saAcTI/H8/eIs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpUKqahEU4fOnHtUSArqyElgaIl8PWufFXDUi4A
 DUD9MwXpsOJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaVCqmgAKCRCLPIo+Aiko
 1eIuB/4zqMzsHaYhfnTpW3yD4HFqbdv2DHVbUcBIxgGO9NFULAFCdBa0Muhhc4nqibWuSRl0u31
 x7BYo2Jba8QTicyve8/X/Xiw+fEJj3DFnphpqHfugXBaFllPT7fyTIuxLfqMuQY1Nq58xFono23
 LvVbEuFNWt4xGDWMO8vtmgklcT/cyTF+dr7mp7MXzeOGZalMuPeOwIeBEwOUp7OyHvXW3AAPjje
 nVqd9d+mJqUTt0rXxznE6Op4dBtt7KBIBsnJC5QczdYAYAQRzVcnOmL2kvsIIo4pGVnBwz60IzZ
 z42vw3nunYyoP2wG2DhtODrDWvu02mc8p8QZm1bcL5EAxl6T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: VrTiPgsYyUyUKg1AFFZq9YqzgWVfln8h
X-Proofpoint-GUID: VrTiPgsYyUyUKg1AFFZq9YqzgWVfln8h
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjI4MDAzMyBTYWx0ZWRfXwc1HrhDI8C8S
 HuJBCQfdtIffdbs/vofrNzUtnKX3RJa8i56zZpbkcq2cU5Jsv7Wyy/WFfFrhKniWsUc+5xkSUZb
 C8jeXAT4IrUUO3+iz2wNAaOARBaWIT58OqD7MuKndjbhZBXfqI/IVdOln+ulWq3KzsS0gVSiGt0
 Utke9Kfho587FICAPfL5hFSXRv50D9StB//1IMVLefYPW+JDHyBf9gsF0NhqNxFFBeYlbvaDybE
 NU2xAf2ajfGCSGW9u1s1Vs56iaXcc7+3OxBODiFAXsKRlDG1X1+48pz4q/DTYvKhAwjSeh/U2fk
 5+Qk2FJSOrv6qrj6EGIykfalQS0M2vCRFG/3rWzrwhEcZNFZzHBRP5keAooJdQ3ENIthJSxPnUg
 0XtD/f7X35jiR1L2iMosGQsIAowpZT4j/GAGnpr+uicY72+d3DDoJRvnYrzJJsd/SK71RF91Wj5
 +jb513fOj9f5Whb24pA==
X-Authority-Analysis: v=2.4 cv=do7Wylg4 c=1 sm=1 tr=0 ts=6950aaa4 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGfW19dKLGIg-ZbO5EIA:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-28_01,2025-12-26_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 bulkscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 spamscore=0 suspectscore=0 phishscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512280033
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

Since DPU 8.x Watchdog timer settings were moved from the TOP to the
INTF block. Support programming the timer in the INTF block. Fixes tag
points to the commit which removed register access to thos registers on
DPU 8.x+ (and which also should have added proper support for WD timer
on those devices).

Fixes: 43e3293fc614 ("drm/msm/dpu: add support for MDP_TOP blackhole")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c |  4 +--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c | 48 +++++++++++++++++++++++++++--
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h |  3 +-
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c  |  7 -----
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h |  7 +++++
 5 files changed, 56 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
index 3921c15aee98..058a7c8727f7 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_encoder.c
@@ -775,13 +775,13 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 	}
 
 	vsync_cfg.vsync_source = disp_info->vsync_source;
+	vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
 
 	if (hw_mdptop->ops.setup_vsync_source) {
 		for (i = 0; i < dpu_enc->num_phys_encs; i++)
 			vsync_cfg.ppnumber[i] = dpu_enc->hw_pp[i]->idx;
 
 		vsync_cfg.pp_count = dpu_enc->num_phys_encs;
-		vsync_cfg.frame_rate = drm_mode_vrefresh(&dpu_enc->base.crtc->state->adjusted_mode);
 
 		hw_mdptop->ops.setup_vsync_source(hw_mdptop, &vsync_cfg);
 	}
@@ -791,7 +791,7 @@ static void _dpu_encoder_update_vsync_source(struct dpu_encoder_virt *dpu_enc,
 
 		if (phys_enc->has_intf_te && phys_enc->hw_intf->ops.vsync_sel)
 			phys_enc->hw_intf->ops.vsync_sel(phys_enc->hw_intf,
-							 vsync_cfg.vsync_source);
+							 &vsync_cfg);
 	}
 }
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
index a80ac82a9625..7967d9bd2f44 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.c
@@ -67,6 +67,10 @@
 #define INTF_MISR_CTRL                  0x180
 #define INTF_MISR_SIGNATURE             0x184
 
+#define INTF_WD_TIMER_0_CTL		0x230
+#define INTF_WD_TIMER_0_CTL2		0x234
+#define INTF_WD_TIMER_0_LOAD_VALUE	0x238
+
 #define INTF_MUX                        0x25C
 #define INTF_STATUS                     0x26C
 #define INTF_AVR_CONTROL                0x270
@@ -475,7 +479,7 @@ static int dpu_hw_intf_get_vsync_info(struct dpu_hw_intf *intf,
 }
 
 static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
-				  enum dpu_vsync_source vsync_source)
+				  struct dpu_vsync_source_cfg *cfg)
 {
 	struct dpu_hw_blk_reg_map *c;
 
@@ -484,7 +488,42 @@ static void dpu_hw_intf_vsync_sel(struct dpu_hw_intf *intf,
 
 	c = &intf->hw;
 
-	DPU_REG_WRITE(c, INTF_TEAR_MDP_VSYNC_SEL, (vsync_source & 0xf));
+	DPU_REG_WRITE(c, INTF_TEAR_MDP_VSYNC_SEL, (cfg->vsync_source & 0xf));
+}
+
+static void dpu_hw_intf_vsync_sel_v8(struct dpu_hw_intf *intf,
+				  struct dpu_vsync_source_cfg *cfg)
+{
+	struct dpu_hw_blk_reg_map *c;
+
+	if (!intf)
+		return;
+
+	c = &intf->hw;
+
+	if (cfg->vsync_source >= DPU_VSYNC_SOURCE_WD_TIMER_4 &&
+	    cfg->vsync_source <= DPU_VSYNC_SOURCE_WD_TIMER_1) {
+		pr_warn_once("DPU 8.x supports only GPIOs and timer0 as TE sources\n");
+		return;
+	}
+
+	if (cfg->vsync_source == DPU_VSYNC_SOURCE_WD_TIMER_0) {
+		u32 reg;
+
+		DPU_REG_WRITE(c, INTF_WD_TIMER_0_LOAD_VALUE,
+			      CALCULATE_WD_LOAD_VALUE(cfg->frame_rate));
+
+		DPU_REG_WRITE(c, INTF_WD_TIMER_0_CTL, BIT(0)); /* clear timer */
+		reg = DPU_REG_READ(c, INTF_WD_TIMER_0_CTL2);
+		reg |= BIT(8);		/* enable heartbeat timer */
+		reg |= BIT(0);		/* enable WD timer */
+		DPU_REG_WRITE(c, INTF_WD_TIMER_0_CTL2, reg);
+
+		/* make sure that timers are enabled/disabled for vsync state */
+		wmb();
+	}
+
+	dpu_hw_intf_vsync_sel(intf, cfg);
 }
 
 static void dpu_hw_intf_disable_autorefresh(struct dpu_hw_intf *intf,
@@ -598,7 +637,10 @@ struct dpu_hw_intf *dpu_hw_intf_init(struct drm_device *dev,
 		c->ops.enable_tearcheck = dpu_hw_intf_enable_te;
 		c->ops.disable_tearcheck = dpu_hw_intf_disable_te;
 		c->ops.connect_external_te = dpu_hw_intf_connect_external_te;
-		c->ops.vsync_sel = dpu_hw_intf_vsync_sel;
+		if (mdss_rev->core_major_ver >= 8)
+			c->ops.vsync_sel = dpu_hw_intf_vsync_sel_v8;
+		else
+			c->ops.vsync_sel = dpu_hw_intf_vsync_sel;
 		c->ops.disable_autorefresh = dpu_hw_intf_disable_autorefresh;
 	}
 
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
index f31067a9aaf1..e84ab849d71a 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_intf.h
@@ -12,6 +12,7 @@
 #include "dpu_hw_util.h"
 
 struct dpu_hw_intf;
+struct dpu_vsync_source_cfg;
 
 /* intf timing settings */
 struct dpu_hw_intf_timing_params {
@@ -107,7 +108,7 @@ struct dpu_hw_intf_ops {
 
 	int (*connect_external_te)(struct dpu_hw_intf *intf, bool enable_external_te);
 
-	void (*vsync_sel)(struct dpu_hw_intf *intf, enum dpu_vsync_source vsync_source);
+	void (*vsync_sel)(struct dpu_hw_intf *intf, struct dpu_vsync_source_cfg *cfg);
 
 	/**
 	 * Disable autorefresh if enabled
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
index 96dc10589bee..1ebd75d4f9be 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_top.c
@@ -22,13 +22,6 @@
 #define TRAFFIC_SHAPER_WR_CLIENT(num)     (0x060 + (num * 4))
 #define TRAFFIC_SHAPER_FIXPOINT_FACTOR    4
 
-#define MDP_TICK_COUNT                    16
-#define XO_CLK_RATE                       19200
-#define MS_TICKS_IN_SEC                   1000
-
-#define CALCULATE_WD_LOAD_VALUE(fps) \
-	((uint32_t)((MS_TICKS_IN_SEC * XO_CLK_RATE)/(MDP_TICK_COUNT * fps)))
-
 static void dpu_hw_setup_split_pipe(struct dpu_hw_mdp *mdp,
 		struct split_pipe_cfg *cfg)
 {
diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
index 67b08e99335d..6fe65bc3bff4 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_util.h
@@ -21,6 +21,13 @@
 
 #define TO_S15D16(_x_)((_x_) << 7)
 
+#define MDP_TICK_COUNT                    16
+#define XO_CLK_RATE                       19200
+#define MS_TICKS_IN_SEC                   1000
+
+#define CALCULATE_WD_LOAD_VALUE(fps) \
+	((uint32_t)((MS_TICKS_IN_SEC * XO_CLK_RATE)/(MDP_TICK_COUNT * fps)))
+
 extern const struct dpu_csc_cfg dpu_csc_YUV2RGB_601L;
 extern const struct dpu_csc_cfg dpu_csc10_YUV2RGB_601L;
 extern const struct dpu_csc_cfg dpu_csc10_rgb2yuv_601l;

-- 
2.47.3

