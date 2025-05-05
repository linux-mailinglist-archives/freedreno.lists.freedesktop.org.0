Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 37C8DAA8A1F
	for <lists+freedreno@lfdr.de>; Mon,  5 May 2025 02:15:11 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 125F010E1A5;
	Mon,  5 May 2025 00:15:10 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="HL1NeU5O";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 11C7610E1A5
 for <freedreno@lists.freedesktop.org>; Mon,  5 May 2025 00:15:07 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 544MVVwD011110
 for <freedreno@lists.freedesktop.org>; Mon, 5 May 2025 00:15:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 d0wLs0iVHofkv4RiL71eod9NJCAwyTb7zT17L0PQFSE=; b=HL1NeU5OLXXFcxXy
 TjxFc6NtarcUGFTLNJwNhYH30ubvXysRIKcrydvpwYpqJAErHlC5QSk7C69Ygyou
 oNgK9TODN1LMY8bueOKRi6Em/mCGU98zB5NLOoWx1YhFoE5GFGw9mKe1Nki20Bbi
 j6P3oY+ZlPTMpNSuXtV+fq38TqzNYDn5uW14MWocJpMZTM1Ml+lRVeTSUwYSRBrY
 wx1NcuuYHmbJteRKsUfc5VVb0H+o/DHip9hVaERvDW8VLET+E+p8/fYg5QgF85cY
 peBqqy2cdq0rUmC5rmyXtx3OcCrEOJDCM0lyeQPcTZimN/j6yBixzqHpFXw4Khi3
 asiWMQ==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 46dafg2neg-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 05 May 2025 00:15:06 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4770cbdb9c7so89650911cf.1
 for <freedreno@lists.freedesktop.org>; Sun, 04 May 2025 17:15:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1746404106; x=1747008906;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=d0wLs0iVHofkv4RiL71eod9NJCAwyTb7zT17L0PQFSE=;
 b=FBLdjapA5ijw2aHI5VSukojeN996CuaMoCzQLsJdlY/0XRs4FkK9AUjk9ZGxYH80RN
 cS5IjFgvfh1YAJO+mwTrnkSQp92VrS0rHf3LHIhjPB32nEih1T4RzTOIcLQFJxzds9jf
 A4qbTyiFRQsEmtnGEMxnQLZzB1/z0nMG8D7qteXlBVmOq60OJgUmyCVx3P55rMFtejr2
 zH/WxW8zXAvvwMHEiHl7hcjS/G+fKjmCNVzKujjs+9hlE32xAgh8qHXpteHZa8i+vd/P
 aZ/KfrkKJHudkZKhLJkzggDEHPV/7bFBFDY3W8RHP9UktHQLiJoDz/rjv2Wa9COOjC15
 npRw==
X-Forwarded-Encrypted: i=1;
 AJvYcCWP9owb0k+vsz2vfely5EVuAjaECtIVRlXBqjxNAGYfWbP0QN2lt6Ggf5vv//e8mMoYISgDTW3owD8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwzIaw6mjwEK1qjcdWnU3vPaHQHXhX8WOfOt1x89NH5ZRJ0RwCh
 P022EiEFQ9PveAVUlyze4LUWzU2WE7JDFDMSQRM1DQ0HlrZr3aZYonOLlpB8k21Xk7S/mdx12tr
 Cz4MHq+J8CvKstIN8NfumTgTa/BdTt8veOwndojSu19k/JrTwWHL81POjL01Jd86lmB8=
X-Gm-Gg: ASbGnct6SfEnQxa1S5mbe+67omugIFj5tflLMotfykXfSIXDIORRS1wybJurjihOheR
 LZeRoxW5mxOR6/UkknqsKc7FoEJUY0tgPexro+5OA7XCYGrxkpRYLNfxdExcszremPvsL/pOknU
 r14c60fFduSznYEBJ0W79B0Mk+JufT6Wnh+HmRnDI8Q+C4tvPQWn5GddEsJIaz8O2jhyWY9I4KA
 m/4XXcr/Q77rcBXb7vysZ5Ou3CUt9ifs0cFQn6sSt8fiIZ1HGv9TOFyKgTg9tP/jGcuObgRQh7e
 +8wBFO+JwtoQs/+oFqPt5c5X2y30MGv7npWCFnkSWlYbKaAva6h9og/5mKwH2dI7Y6E+vuqhWer
 us4jx9D9Al/eVkF//tP2SjiGL
X-Received: by 2002:a05:622a:5585:b0:479:2509:528a with SMTP id
 d75a77b69052e-48c32ac7333mr177680381cf.42.1746404106151; 
 Sun, 04 May 2025 17:15:06 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGSLLxowO0dJGPkvuX9RhOj9QBfPznkAxKoanIkxu8WWIzBNeIlJLloQOmPJXB6Ug9KK63z7w==
X-Received: by 2002:a05:622a:5585:b0:479:2509:528a with SMTP id
 d75a77b69052e-48c32ac7333mr177679971cf.42.1746404105839; 
 Sun, 04 May 2025 17:15:05 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54ea94ce656sm1454066e87.105.2025.05.04.17.15.02
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Sun, 04 May 2025 17:15:03 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Mon, 05 May 2025 03:14:47 +0300
Subject: [PATCH v5 03/13] drm/msm/hdmi: move the alt_iface clock to the hpd
 list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250505-fd-hdmi-hpd-v5-3-48541f76318c@oss.qualcomm.com>
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
 devicetree@vger.kernel.org, Jessica Zhang <quic_jesszhan@quicinc.com>,
 Konrad Dybcio <konradybcio@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1513;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=OUSREmRh8249bUIyNnvM4Q8G4H+YLOauuOGWEq+Beno=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoGAL7KLXUMBlRbyuEJArZP28ojba3pXgt+c1/7
 okMpiFlV4yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaBgC+wAKCRCLPIo+Aiko
 1Xm6B/4gs76RF9xtIzBzLSkxCGgpkPU1UtrIEEvR2dHR8161J3VbiGvR7Ho29PviL72l057riaX
 NrQAUbxJjM3NBSI97ryLHmN3LAFCjIKCPLGGg2jC8RcYRV02KzNB5KcXvfLOAarTKfMRxxLCB09
 bZTxJOrJPbR9Q76Os5esA7DB7VasvSsJrub2zlYxD5WZTtMIZ68bCGJxOgkMkdsOS19tVutXkKZ
 DxpQifCrW9U8CIXk3GVAU95EdQUpTwBucj0J+6lRmtf4R9P80W4C2G+U2KBogFT5hSdvCU8MUy3
 vw/9EYy9LjHyseDqJIoZCglgw9ae8APErjI5wti7eMo6y7lS
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-GUID: v-FD4j6Nr_DEC9nImy2Nn44iOsdIkkH-
X-Proofpoint-ORIG-GUID: v-FD4j6Nr_DEC9nImy2Nn44iOsdIkkH-
X-Authority-Analysis: v=2.4 cv=atqyCTZV c=1 sm=1 tr=0 ts=6818030a cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=dt9VzEwgFbYA:10 a=qC_FGOx9AAAA:8 a=KKAkSRfTAAAA:8 a=COk6AnOGAAAA:8
 a=-Tkwmxe0xhrxJHpsn9cA:9 a=QEXdDO2ut3YA:10 a=dawVfQjAaf238kedN5IG:22
 a=fsdK_YakeE02zTmptMdW:22 a=cvBusfyB2V15izCimMoJ:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNTA1MDAwMCBTYWx0ZWRfX4D7s1cVajmyI
 r5tFHZYE35KRNq2kCLEHpCdHqsngHJv8hUJ2xqzTpzCRxNHyo8noKG6PDbTmzFYfZ3YetSHj6jc
 L+RA0nez17YdwDg2fHxb5O36uhU1ucTQnTJKFmSSFZDUhpu8vV7rop8UBGO/JnDEuSMCtYnQnZh
 DVjl4Tq0w81tVYVNUGWz6R4GE5RBpHf2Uf0KnRPlVqRU2pZdUJD5rRD/6bkaT1T9wtRt+3/c8iG
 Yhmk4fCTNKtOL1dLcEuzpVznXxLIbb0Xo5BWuzG5c1xsRA4hr+E8dAap+vOIbn+ll4HqMN8utSA
 3lYD2hYVRgpZ5xpJCr4EwfgTHFulEWGdYe5HkVT7EBegBqT7BZI9ATMOq68hpl5xhNl+6HXCp7+
 ij4tAh2aat/EgtzsDth/5n58XKFmNCGHBc49i32Y+MF+2w7O/fqC2NABshntGqijIypbwuWP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-05-04_09,2025-04-30_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 priorityscore=1501 phishscore=0 malwarescore=0 spamscore=0
 lowpriorityscore=0 mlxlogscore=999 mlxscore=0 impostorscore=0 adultscore=0
 clxscore=1015 suspectscore=0 classifier=spam authscore=0 authtc=n/a authcc=
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

According to the vendor kernel [1] , the alt_iface clock should be
enabled together with the rest of HPD clocks, to make HPD to work
properly.

[1] https://git.codelinaro.org/clo/la/kernel/msm-3.18/-/commit/e07a5487e521e57f76083c0a6e2f995414ac6d03

Reviewed-by: Jessica Zhang <quic_jesszhan@quicinc.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@linaro.org>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/hdmi/hdmi.c | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/msm/hdmi/hdmi.c b/drivers/gpu/drm/msm/hdmi/hdmi.c
index 9e9900882687fa2ae4a734d5cf10b5bae5af2f87..ebf9d8162c6e5759a3780c74354b6c159598750f 100644
--- a/drivers/gpu/drm/msm/hdmi/hdmi.c
+++ b/drivers/gpu/drm/msm/hdmi/hdmi.c
@@ -233,9 +233,9 @@ static const struct hdmi_platform_config hdmi_tx_8960_config = {
 };
 
 static const char * const pwr_reg_names_8x74[] = {"core-vdda", "core-vcc"};
-static const char * const pwr_clk_names_8x74[] = {"extp", "alt_iface"};
-static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core"};
-static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0};
+static const char * const pwr_clk_names_8x74[] = {"extp"};
+static const char * const hpd_clk_names_8x74[] = {"iface", "core", "mdp_core", "alt_iface"};
+static unsigned long hpd_clk_freq_8x74[] = {0, 19200000, 0, 0};
 
 static const struct hdmi_platform_config hdmi_tx_8974_config = {
 		HDMI_CFG(pwr_reg, 8x74),

-- 
2.39.5

