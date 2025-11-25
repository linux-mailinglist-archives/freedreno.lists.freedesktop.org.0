Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 31CDAC838BA
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 07:49:34 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 077E710E357;
	Tue, 25 Nov 2025 06:49:33 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FzGbr7hU";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W6IKMZhR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0617110E350
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:31 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP4wIia1672533
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=OMLdFutodWp
 WHUQwzTx9cYTOE2PbYgwc5aWDG8hPTMs=; b=FzGbr7hUJh58BwhxTL7jr4/MvVM
 d1v9HaelRvizsBBOD6RCFrBjvkKiB8WonI0EVHh6WemqUaUV0yAorgKbP4SW+AKT
 GWsefpJiht89SYwlRQpefVTZdvHhqaI2e/0zVHVjH9sD1ybMOu1i3mUtn42Kjmpb
 0bwIuU0dm6sFWeNNEranwkPh4OpBYLiAes3QyDRaSpoAkXCc+mDutU+62l+Dn8kW
 Sv0Z2Ov17Bb49afLEwXfbuFqb4lFz96KkryiZRMTp7KHyhQqihIwG5s7wsSC7nti
 hkDpGxOlPhXXX0paxMbchyys735MatGGbMcdWGLjU7PgTCXIUI3wmA8ILbQ==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4an5w809r6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:49:30 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-8b2657cfcdaso587966885a.3
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 22:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053370; x=1764658170;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OMLdFutodWpWHUQwzTx9cYTOE2PbYgwc5aWDG8hPTMs=;
 b=W6IKMZhRy56t0Lz+POBKBsh+lvT4kl9/ePKPj2WmZc/sxz8KMDam+/hAtwz1vba4HB
 pADbQtkWpM2Lc1mL7Y7UvP3O9upGU5wvVDeAfXRypYYPJLTGYnjNhgSCu3d2oIWeZNAF
 WWjV+UIoAjKkMVRE6iOJ5sWbFUowY/eRxMQXpfeFjdYhLbf/NsDSpdb6ygFX2yCkTYrI
 6MSdy3Mxv5gonY1rShnmZ8OoHAvJLbJfJfxYcuLoeVeS1ZPjx5oogUKA/KTLcEsDT3RP
 Cih//SvHKhEcA47/DWcDSbgeURCiGTaNOt9HOx6t/VOycReMMLiKZLJf5yx0Ii+yIos4
 MlbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053370; x=1764658170;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OMLdFutodWpWHUQwzTx9cYTOE2PbYgwc5aWDG8hPTMs=;
 b=ap75CoZP/IERRRUSL4Q9ii5kweMWnRXLC2j9AeNRTc2RL2XP2Rhes2f9TY7v1pQDZf
 L99uP1e4XaHdZBbd7n7FAk2DlGrUXcKjj2OsmGVyahIh7tuwNiaQJpXnvUFb1j0xbpie
 Xknfx21157/fSusLF1A9CmJc4trmPdUTX97D9g6r+fChUhkw1cQSzYX8LsnIdo74OPhV
 bEaMdBSwIixw7UbYWeyjRCEZdIhLEKyIQk6ur5g8D+y0fhywhiv3dpM46QE4gQPFaQ2O
 VdjzEEswoK47ZrBnNiZcffg55kQD+FATuXw/H4fBg4W+hXz3gZpe6nUBUpRVM2WYlYk+
 v6Mw==
X-Forwarded-Encrypted: i=1;
 AJvYcCXLf4/gG+dvcntImSvdPs7vEkecvAmeWARQGtFtnm2+/dYP8JhPDFjIj+dEpQew3yNXdcozHjSXVFQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxggfqCANLrWGwIMRXiMjtBP1z4UY5lN+QVZKQZxu85D3aFCpv6
 /zIhQWkpT9Ym3mEFF+e6zZ+fdPUNtBjjvYk300HRzTBYJHW88nUGsb6LjOfww/uqroNAm7k3ym9
 WeUDbrCbIXb+XnDqBUCt6Y3u29VO6sAC+wvcg+G6E7WiaEiy2eSBa2ZyG+hH7Cerrbq6QAWU=
X-Gm-Gg: ASbGncv+K9xHP57IKLpEA+pdU/HhvScfaLPN8B8J8/+jJ5tff6Qu7Mp8BBoBIKnkRVP
 vBVk5Zcwvi+xjoMI2GlVUKe7DJCgxvmNC8FPBH/4VIYZbQQLO5dLoCE0OsfNT6AEEM0utRIP9mX
 V8S1EQW0m8YshXvPanaBcxv7guB9fzMAQxUOhbWlLa5NqY5JVCaG4IMLu/DBaJrzlhA1IbyD+8O
 P6q/DtBWq95ZcV5FWwx1JD1KA6xNXKRRMvWJC7W2eR4X1lw8x+3uB/qGZv1X53hOWcg1rez9KAR
 BxYPo9Ky7TJSyKIGaGXmBSMfNoQi+RXpd6XQGRt80q7jNqbsktaMeqwkKyV9+Red14Ge/SjKTf3
 GtANFNqz/z6PKONaQHfyJ8iW0D0Br0SyA1pbjr3Gd6voI+KfgMVqLocQ+yNaPPt88DZeFb1s=
X-Received: by 2002:a05:622a:1b8e:b0:4e8:83b8:9e7f with SMTP id
 d75a77b69052e-4efbd8ca5d9mr22384021cf.14.1764053369626; 
 Mon, 24 Nov 2025 22:49:29 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHiWneXixXB3xjrJUwkHgPebGASZPAo0VwGDiJADDtvYnesA26C81fRxH8HLYpaCJG40TQhxg==
X-Received: by 2002:a05:622a:1b8e:b0:4e8:83b8:9e7f with SMTP id
 d75a77b69052e-4efbd8ca5d9mr22383761cf.14.1764053369213; 
 Mon, 24 Nov 2025 22:49:29 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.49.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:49:28 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, quic_mkrishn@quicinc.com, jonathan@marek.ca,
 quic_khsieh@quicinc.com, neil.armstrong@linaro.org,
 yuanjie.yang@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com,
 Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v2 07/10] drm/msm/dsi: Add support for Kaanapali
Date: Tue, 25 Nov 2025 14:47:55 +0800
Message-Id: <20251125064758.7207-8-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX4CwqUG5fiB6I
 ewCCn6ovXaiNTFatYRvm9PErO05Xwbwehi+uqh9sBiNVgHTFE08ga76/2tPOUQoGLSwWa5LWtSb
 mbmoFaPqdHr0dfRrf8Li3Kf9KFRnZDAw34PUhlo9gzDt4TmYZ0UkymBd0YeLPotKwhfqR70tGJ5
 saGVYhjz5QTlkhnGDTDjmHZWZeiBhBzquPtyvAW/5+rzfP/rsuMNMZOy6AjPpUlu4PS9d40OE/E
 YHPdABvnaVg66ZZLa6eeBHdglQO4mg+vdRZSgqlTB2MgVO4Gp1difuhNFs2ycCYifm/6fKVvF/t
 9x6M/ahJTM1gVg15wWKPkSOLc7cEFXWdsOhS5GtB5nFNdqLuNp6BmrlWKRx9xCWkk5rj0CGWZGv
 XMIQ5aKxY6qLYOmvFTFsoNUjCcoZAg==
X-Authority-Analysis: v=2.4 cv=RvTI7SmK c=1 sm=1 tr=0 ts=6925517a cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=EGddA7oXPexY6v9tJfMA:9 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-ORIG-GUID: r54sCTd5UBk0pKobMPysShLQqB2zob-8
X-Proofpoint-GUID: r54sCTd5UBk0pKobMPysShLQqB2zob-8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 malwarescore=0 clxscore=1015
 bulkscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250054
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

From: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>

Add DSI Controller version 2.10.0 support for DSI on Qualcomm
Kaanapali SoC.

Co-developed-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dsi/dsi_cfg.c | 13 +++++++++++++
 drivers/gpu/drm/msm/dsi/dsi_cfg.h |  1 +
 2 files changed, 14 insertions(+)

diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.c b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
index fed8e9b67011..bd3c51c350e7 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.c
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.c
@@ -205,6 +205,17 @@ static const struct msm_dsi_config sm8650_dsi_cfg = {
 	},
 };
 
+static const struct msm_dsi_config kaanapali_dsi_cfg = {
+	.io_offset = DSI_6G_REG_SHIFT,
+	.regulator_data = sm8650_dsi_regulators,
+	.num_regulators = ARRAY_SIZE(sm8650_dsi_regulators),
+	.bus_clk_names = dsi_v2_4_clk_names,
+	.num_bus_clks = ARRAY_SIZE(dsi_v2_4_clk_names),
+	.io_start = {
+		{ 0x9ac0000, 0x9ac3000 },
+	},
+};
+
 static const struct regulator_bulk_data sc7280_dsi_regulators[] = {
 	{ .supply = "vdda", .init_load_uA = 8350 },	/* 1.2 V */
 	{ .supply = "refgen" },
@@ -332,6 +343,8 @@ static const struct msm_dsi_cfg_handler dsi_cfg_handlers[] = {
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_host_ops},
 	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_9_0,
 		&sm8650_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
+	{MSM_DSI_VER_MAJOR_6G, MSM_DSI_6G_VER_MINOR_V2_10_0,
+		&kaanapali_dsi_cfg, &msm_dsi_6g_v2_9_host_ops},
 };
 
 const struct msm_dsi_cfg_handler *msm_dsi_cfg_get(u32 major, u32 minor)
diff --git a/drivers/gpu/drm/msm/dsi/dsi_cfg.h b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
index 38f303f2ed04..5dc812028bd5 100644
--- a/drivers/gpu/drm/msm/dsi/dsi_cfg.h
+++ b/drivers/gpu/drm/msm/dsi/dsi_cfg.h
@@ -32,6 +32,7 @@
 #define MSM_DSI_6G_VER_MINOR_V2_7_0	0x20070000
 #define MSM_DSI_6G_VER_MINOR_V2_8_0	0x20080000
 #define MSM_DSI_6G_VER_MINOR_V2_9_0	0x20090000
+#define MSM_DSI_6G_VER_MINOR_V2_10_0	0x200a0000
 
 #define MSM_DSI_V2_VER_MINOR_8064	0x0
 
-- 
2.34.1

