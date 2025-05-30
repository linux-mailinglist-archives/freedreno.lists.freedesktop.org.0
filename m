Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id AD54FAC9503
	for <lists+freedreno@lfdr.de>; Fri, 30 May 2025 19:47:51 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2D55210E869;
	Fri, 30 May 2025 17:47:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="FdiuEyk9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7EF9E10E85D
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 17:47:47 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 54UBo9aS018019
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 17:47:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 MzWFt16chN6vIu9WEyj7pbXUxecSq7Tf1b7Fhb2bIj0=; b=FdiuEyk9LZOIgG2X
 DXUeU3BG9YY9qaVl1cdSaNsa6h0raHzjJnOvQfyRAwi1PGybqKpy+xNQcBzrI2Ku
 cCY/I78JgkyLDEGlxOSTKSIok5xGOxShzI79PVEjrH3k2wb/sEiM+O9tllGeulOT
 ZK6aBtOgpMAXl0RJwE7JDITFKtj8Wrn9bo0pDhVABQXtvxQK9hclPIvehpcWxjpU
 ZV40DScfxuiDgLrOMSxT9NUMydsg88GqRH+UcTsUHike0XJdxMvkkG81blPvoPMV
 Ye/I7ScILFkV5iV1K/4PhU3SA1pIG6Oz6rnxjYu407IRukFC3iRaaEU59QfhBYT2
 sSNfEg==
Received: from mail-pj1-f71.google.com (mail-pj1-f71.google.com
 [209.85.216.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46yc4ys3t0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 17:47:46 +0000 (GMT)
Received: by mail-pj1-f71.google.com with SMTP id
 98e67ed59e1d1-311f4f2e761so2366045a91.2
 for <freedreno@lists.freedesktop.org>; Fri, 30 May 2025 10:47:46 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1748627266; x=1749232066;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=MzWFt16chN6vIu9WEyj7pbXUxecSq7Tf1b7Fhb2bIj0=;
 b=wFz9eEXOUiOQI0jqgz2lOhIIf4Eo5vfs8RKBNk+fMSzyKE+2buVzBtCmsWRTebQhXO
 L2cePrVh+wvyi251mtfbbX2UuJl/cDUoRnIlonbZjiR+bpnQMGc/T/m2OlhSNfJeghQ0
 ZQd4DxRs6V5j5plxCbdUAGKa+pYtlZY4oRuC9foCq7tjijL7k7ikrpeYXIjhMMlHtIOE
 Zjrm6DsRXl3qfDR49WtjSWFDBtFRzTWvBwDOdK5cb8ENg6PsnY9RQLc0A82Lx+p5RTGS
 gouAQfWnWdmAyWvFcPkr1NWAlFhJG+ySIk8MxEJhIxpCcrthWRZDhMPa2qEHkW1mrVnp
 HI6A==
X-Forwarded-Encrypted: i=1;
 AJvYcCUP/+ZSmIod3GtbaxJUFxA49wtDVmqSq5OO5nskdQG7/HOJM2DsmNqAqX/3kt44CejaVDtTjlk4h7w=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywajo8SbPDGypzu/fyw4fuOvmvYXQRF2M4dtTdsm8hfATuaXwia
 Jhh23bv1F4wffP17l8GmhP3nrxatuZLAuBeA5N1LXNFgGWvC+F/KPgWgMkF7NguNOW0DDrpwUxk
 +2VJzVjmyu3fgi8Q9hgx9/eWCnAO77sWzmUqIduiK+4h2UA6AkmCxcDvzGLVb6KXkzgID8Yg=
X-Gm-Gg: ASbGncvNaoa0q1VB5xalmchVxW02izyHOnJPrpfgJ8D3oyJvDwawVHPBC49UsNHFkz0
 a9poCUoVx5toMUaW1kRmFCPDEU/+yXYj5WrG2lkiMFTvDEa1aG6bLqEvajyELdYaJ1SH3S3s8K7
 4CflznAoJka1sbrTt3MN7peRnrRwbIPJkcr7c4HwSHvBYE94Uj4NFjbSQg3lPDB9a+eWwyXncVs
 3zdUremHYl8d9Fc+S5+wlkOPxc1krF3PZF9S0Usq3FLlWDR6/+OiDX40TjVlvMNBQUEaFcMyzYP
 UxcYVtHAlXIr8Xu7AEMhCy0xacsEgGCbPLi5PqpwJDe0MBMlk8RN06mfEvt+ohf06iuMIwvP
X-Received: by 2002:a17:90b:2dcb:b0:312:e9d:3ff2 with SMTP id
 98e67ed59e1d1-3124150da88mr7360775a91.7.1748627266026; 
 Fri, 30 May 2025 10:47:46 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH44Ez8w2kSkFGiWXJyTRDICpcy7Z7sFhIreQn9zU0Akkst+TmIzvezQ7ZxQQV4CDoSwIXaEg==
X-Received: by 2002:a17:90b:2dcb:b0:312:e9d:3ff2 with SMTP id
 98e67ed59e1d1-3124150da88mr7360740a91.7.1748627265598; 
 Fri, 30 May 2025 10:47:45 -0700 (PDT)
Received: from jesszhan-linux.qualcomm.com (i-global254.qualcomm.com.
 [199.106.103.254]) by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3124e399b0fsm1615381a91.30.2025.05.30.10.47.44
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 30 May 2025 10:47:45 -0700 (PDT)
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Date: Fri, 30 May 2025 10:47:25 -0700
Subject: [PATCH v2 2/5] dt-bindings: clock: Add SC7280 DISPCC DP pixel 1
 clock binding
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250530-dp_mst_bindings-v2-2-f925464d32a8@oss.qualcomm.com>
References: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
In-Reply-To: <20250530-dp_mst_bindings-v2-0-f925464d32a8@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Abel Vesa <abel.vesa@linaro.org>, Bjorn Andersson <andersson@kernel.org>,
 Michael Turquette <mturquette@baylibre.com>,
 Stephen Boyd <sboyd@kernel.org>, Mahadevan <quic_mahap@quicinc.com>,
 Krishna Manikandan <quic_mkrishn@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Danila Tikhonov <danila@jiaxyga.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.15-dev-64971
X-Developer-Signature: v=1; a=ed25519-sha256; t=1748627260; l=862;
 i=jessica.zhang@oss.qualcomm.com; s=20230329; h=from:subject:message-id;
 bh=YcjeN4u37rChhC2e9vyygUDR5/9ourQp/Z4Vjz3aqaY=;
 b=4V+1vbUqjNallDMi4o5HtOHP1e5c2KVcVyGeo5DMGTjvm7tRoaV9zFs4DFYTtqTv+nTiRbwRV
 6bG9bGyWiyOA8qrekpoVJYMfqPwDIHSo3Bka5HIDElilp0rnW2u027w
X-Developer-Key: i=jessica.zhang@oss.qualcomm.com; a=ed25519;
 pk=gAUCgHZ6wTJOzQa3U0GfeCDH7iZLlqIEPo4rrjfDpWE=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTMwMDE1NiBTYWx0ZWRfXymweMK5Twn6Z
 2XNj6YOJl6gcQKXDQwoaPZsRY4JbefuxNxI1/GH2lJ8W/h7Se8mbdSkvn8xxVDlzWci9h1diMwl
 n/KBdA1hHH0cNN0hSTXazkRG7aWc8W2AGpqc8YODYGP70v+Ft/ZsSLzGG3grN0yv/5lGZohG0mw
 YGnDCBjlAGt4yZJU4hKxZJm8Ax4XT+moTBA/PmorNCNsaGJBZucDjB9MsAj39g48feToeNn0qSu
 856r6S2yq9BArXTeiq5m5e8Pi8HIrQBxE74gKpigz/S4br4A1w2iA6znJdC6wP9QG97KOQrzOSQ
 c+36vYVdClvju39Sh5KQG6KoGHP/KVE8JoQsQUm3kKwSYqc9yau34KcagdzupyEGKQySpJED2Nw
 o4zyDjf3+zLc13aANnGCI6HV8tr5pAnn/UsfYYLVxWrFv4BbNMkorD2yQXsGxmdN3vW4wetG
X-Authority-Analysis: v=2.4 cv=Ybe95xRf c=1 sm=1 tr=0 ts=6839ef42 cx=c_pps
 a=UNFcQwm+pnOIJct1K4W+Mw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=dt9VzEwgFbYA:10 a=COk6AnOGAAAA:8 a=EUspDBNiAAAA:8
 a=HZRYMJrZkReahVkyUwcA:9 a=QEXdDO2ut3YA:10 a=uKXjsCUrEbL0IQVhDsJ9:22
 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-GUID: RWOUPI6r_qqG3tDsOEkjQF1xbSRM2ym1
X-Proofpoint-ORIG-GUID: RWOUPI6r_qqG3tDsOEkjQF1xbSRM2ym1
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-30_08,2025-05-30_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 spamscore=0 priorityscore=1501 mlxlogscore=862 malwarescore=0
 lowpriorityscore=0 clxscore=1015 phishscore=0 impostorscore=0 mlxscore=0
 adultscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505160000
 definitions=main-2505300156
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

From: Abhinav Kumar <quic_abhinavk@quicinc.com>

Add DISP_CC_MDSS_DP_PIXEL1_* macros for SC7280

Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
---
 include/dt-bindings/clock/qcom,dispcc-sc7280.h | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/include/dt-bindings/clock/qcom,dispcc-sc7280.h b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
index a4a692c20acf..25f736629593 100644
--- a/include/dt-bindings/clock/qcom,dispcc-sc7280.h
+++ b/include/dt-bindings/clock/qcom,dispcc-sc7280.h
@@ -48,6 +48,8 @@
 #define DISP_CC_MDSS_VSYNC_CLK_SRC			38
 #define DISP_CC_SLEEP_CLK				39
 #define DISP_CC_XO_CLK					40
+#define DISP_CC_MDSS_DP_PIXEL1_CLK                      41
+#define DISP_CC_MDSS_DP_PIXEL1_CLK_SRC                  42
 
 /* DISP_CC power domains */
 #define DISP_CC_MDSS_CORE_GDSC				0

-- 
2.49.0

