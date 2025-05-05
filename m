Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 6B795AA8A34
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 02:15:29 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 42E7210E2E8;
	Mon,  5 May 2025 00:15:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Mo2sEw2Z";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id CAF7C10E2E1
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 00:15:26 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544NjmaP016270
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 00:15:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 4AojzG6jCxROBT7DQt2jv8yK6mPKIHDtAt836rfmBsY=; b=Mo2sEw2Z7bVvXTJd
 Okv6W6bM4rmdKV0ks2shTdfFmmSMhuz12Hv2wMT+W7FcA6GOWSik4QlGudbf9TnN
 OXnRX0xnyLtCNKx/OBZimZy3bQ55AIHZMNafJ77/xrd7uVMgqeITFveG+C2QMilC
 gd7wnO88dh6tYFO60Al6q6eELAs7Bg0yFiDDZw1EVzyAtYWP9UBZhVxPzhogi+gK
 0zmuKqMQ9vs0VUlE4bKYgGBbHODwpFHQ96ASAc3jHEEVJgfuT4PstEdZgy9t1HG2
 7sqQ/yuZiI2bmwhFAhNlqEmS9Ln3YJ3uVc68VwjnUsVOr6xfvS1KWiZpTwPeZyy7
 uey8eg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dbwfjj5p-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 00:15:26 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-47b36edcdb1so51310631cf.2
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 17:15:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404124; x=1747008924;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=4AojzG6jCxROBT7DQt2jv8yK6mPKIHDtAt836rfmBsY=;
 b=FImz1kfQadqFfsVcwATbUMxAH7qp0oSUr2CHoE3sAOf5q+/qs9mmSzesRt5U6zD6G6
 C2nIqBZv8vtXfG3Gf19YsbLhTviqZUQlhTpQPdhW28kSIXOXWwXo15c4Zmb9S11vIzob
 fyJjTi4wWHOZNKJwX5wnun7SYyGkmrgfvCTCS8eDBz0ZNoTMvbLB+Yqte9xGGBsdI1+G
 vzd/EYrftJEbVFeQ0PLsTmS0WgTLuXNFcu6Qx5S4SXJDqvDyyFLKZT9rgW5+P7+Sj8my
 by4Z88gR8i5iRxCTF6PF6uBQwVpZaEBHPuZKfo4+C0fb/enuqIi5fKe0PAz/bCs4wNVd
 aJFg==
X-Forwarded-Encrypted: i=1;
 AJvYcCX2fgwkgvMNAljSvIM9jwRCNI9iMc8YLsFvvnaLmb9tP8qmacQm+vhQ4CRSLnwSt1OdmdXFPRQ2tDk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyFdSrQXvReHyy8hrLQx/C+KiR5MtvdN81b5wQC5pjP46XfFAS4
 11WdC+2YiUxybd8Xr+53/8TubnZWCYHHpamIVrZwvCa6To2B0pmu6g0k9ncDNVqalfMehrMUHmF
 IqTT7X9Ujn5vUIQjew6JHA7noNppf5U+qNBs2MUBHFsCb60E/xh4t6u7HCb0lZ7z9zQd4GWZn9d
 o=
X-Gm-Gg: ASbGncsjIVfd1W2EAIJ1x0JUt0Sq6aiTwgdB/4pRja60J9D/KJa0F/2tTHgUqohW0TE
 nzFcnzqBKHxikaR8nPS8CVyqUFb+apPy4EXbNWT2AMMHtSx/CaNmqsp1zWSvwsFt51y4mKhS/eH
 NEJ17RRpVZ47Zdokaifjncm8DWz4ccjeQ8Cf3kdgqI8pn+ky7B1IxhQSoK/q3aQCghK5KmPbI5F
 HiKKRcvbjp0RiLRGcfExpjKB7b4oqxq+1bU+8CQDcZw7bn5RyeKVBjLxbM8WOIB1j5M8MXA7Nmq
 uW7ItV1hlr9CxxTNRieEdBRMCeruhUPK99GVL7STwO9EaIeI9OXMAzT3q38rWq2M+PD+Au/G/yR
 OV+9ckCMZUVls4yY2zOm8x/Nq
X-Received: by 2002:a05:620a:410c:b0:7c5:43c2:a907 with SMTP id
 af79cd13be357-7cae3aa39bcmr692999985a.26.1746404124100; 
 Sun, 04 May 2025 17:15:24 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGB8NTXM8sLgxQ5EDQiBqnHjvBehzk0c2YXdh0OUwFkg8Bd4jMJXvp8mozV1nZ8OQOYX3W3Jw==
X-Received: by 2002:a05:620a:410c:b0:7c5:43c2:a907 with SMTP id
 af79cd13be357-7cae3aa39bcmr692997185a.26.1746404123665; 
 Sun, 04 May 2025 17:15:23 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.22
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:22 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:55 +0300
Subject: [PATCH v5 11/13] drm/msm/hdmi: expand the HDMI_CFG macro
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-11-48541f76318c@oss.qualcomm.com>
References: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
In-Reply-To: <20250505-fd-hdmi-hpd-v5-0-48541f76318c@oss.qualcomm.com>
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
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2467;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=7KB7IcHxi0VqX9I5ufq901Xoeq2I7R2imjBgnmx5DoY=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ4YE099AvsjXwWoLAwuWa7JorxAvWKQiHmbIEXFrqcPSa
 w+U1eZ3MhqzMDByMciKKbL4FLRMjdmUHPZhx9R6mEGsTCBTGLg4BWAii6o4GPpeW2a/vS/6uk9U
 Ke9z+qI9/16cupf4P1fU+l7I3hldCjkbE1ZI3j75gdlvod1S/zuJQrMyyr0XdM9KO/Tce9IBgf0
 a06rEpnGW7d71VuiiNeNS9xP+5TGf+Rca20dZK7Q7/np177vE+Wlrpi7Xl+MxtuOTW91ar/fLRf
 HJs9qmVDlT7W38Jtuus5mom6QtXrU7hGd1rjHzNiUl5/wd1Qv/tDbn/NN4fkj235TIj8IxUVnlC
 WGvGKvtnp06/cCqOWq6ebAla19Wthd33IQjn0OX3v//WiB9O4NH4dHClAmLn3QdUlXh+O6xT/LJ
 8twS1/D3JwUSpYPetP/XuPqpxHD1p7QNpfv4LZRTQ60UAQ==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: acNNIdpk4zsMi0rdxofwKizvirw0TWB1
X-Proofpoint-GUID: acNNIdpk4zsMi0rdxofwKizvirw0TWB1
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX3e1vdopZOwTv
 9MZOzDF7G5TOKF1gLF2Gu6hMjhFrkxxPUQy1wuawDbPE/mLK9O4PRtr/YH4aTPN+Mw6V6b8JG9g
 IqfJwUazizXJjlnYpMcnc/RartsBebM2JQJfq1y+khFn1tyJ2/CmVqrb2fgCmlIjqvMsbk4+URk
 wihnEZw2KEeazlwGsIGtlCML31Y0ycDnjZKVKLKf3Zw4kiDjaXqNx3X7ddNyqizNyfevdy0Uy8x
 C6dSzZgsgwvglM+pf2M9hcLq10P7GYyg+8JyBOukooC9sFbyxPZKl5Ui4Lrs5pexFLrCrW1zrtM
 mZtTrE6+VaEzsCbzuezh+gFEvtSEZv8nbkgVcDVgwRJwE2dyP3m5vNsd4cxqRnvQsta4OC2RiAw
 S5n9noSYeyWQ9ycty1P/P6+c7bqvtezwgVHOVtp4hJkAYia/ial5aRQNIHMc31+bIJNpD5Dx
X-Authority-Analysis: v=2.4 cv=AfqxH2XG c=1 sm=1 tr=0 ts=6818031e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8 a=Pd00KUci3bVIrXXMz04A:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22 a=cvBusfyB2V15izCimMoJ:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 clxscore=1015 priorityscore=1501 phishscore=0 impostorscore=0
 mlxscore=0 adultscore=0 lowpriorityscore=0 suspectscore=0 mlxlogscore=999
 spamscore=0 bulkscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2505050000
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

Expand the HDMI_CFG() macro in HDMI config description. It has no added
value other than hiding some boilerplate declarations.

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 16 ++++++++--------
 drivers/gpu/drm/msm/hdmi/hdmi.h |  2 +-
 2 files changed, 9 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 8e6e3e6a04bd2d86bcbd23c110f3533f56c17887..3d10fe6f8545198365a047b2f5652081703101aa 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -221,24 +221,24 @@ int msm_hdmi_modeset_init(struct hdmi *hdmi,
  * The hdmi device:
  */
 
-#define HDMI_CFG(item, entry) \
-	.item ## _names = item ##_names_ ## entry, \
-	.item ## _cnt   = ARRAY_SIZE(item ## _names_ ## entry)
-
 static const char * const pwr_reg_names_8960[] = {"core-vdda"};
 static const char * const pwr_clk_names_8960[] = {"core", "master_iface", "slave_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8960_config = {
-		HDMI_CFG(pwr_reg, 8960),
-		HDMI_CFG(pwr_clk, 8960),
+	.pwr_reg_names = pwr_reg_names_8960,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8960),
+	.pwr_clk_names = pwr_clk_names_8960,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8960),
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
 static const char * const pwr_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
-		HDMI_CFG(pwr_reg, 8x74),
-		HDMI_CFG(pwr_clk, 8x74),
+	.pwr_reg_names = pwr_reg_names_8x74,
+	.pwr_reg_cnt = ARRAY_SIZE(pwr_reg_names_8x74),
+	.pwr_clk_names = pwr_clk_names_8x74,
+	.pwr_clk_cnt = ARRAY_SIZE(pwr_clk_names_8x74),
 };
 
 static int msm_hdmi_bind(struct device *dev, struct device *master, void *data)
diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.h b/drivers/gpu/drm/msm/hdmi/hdmi.h
index a28437beb1574553c1dc00a0c693b390389353e0..fb64652162b6c5e6e2fe3357b89c40e2a28aa47e 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.h
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.h
@@ -86,7 +86,7 @@ struct hdmi_platform_config {
 	const char * const *pwr_reg_names;
 	int pwr_reg_cnt;
 
-	/* clks that need to be on for hpd: */
+	/* clks that need to be on: */
 	const char * const *pwr_clk_names;
 	int pwr_clk_cnt;
 };

-- 
2.39.5

