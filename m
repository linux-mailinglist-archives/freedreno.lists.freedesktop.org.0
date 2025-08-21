Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 492DDB2EC19
	for <lists+freedreno@lfdr.de>; Thu, 21 Aug 2025 05:37:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 477B910E86C;
	Thu, 21 Aug 2025 03:37:35 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GPtQrzy8";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DF9AB10E86C
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:34 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57L3VMbQ021486
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=; b=GPtQrzy8TIOYTIc9
 Vc74+YztRre+8yF1n0QVmxru+2H6j0GHXcc6EKQv8BDktJXRJ6saZkvOgGIsuB31
 tsp9fmJB2Rlsx8TlE0L23A3wUVkAnvCDUfHMcLYx8QNPymDV0PI/vGePJ8Y1tERE
 fiVSRRVbvZYxMKmgX5jK/CoqqZ0JEBOuUPetF1KDNkJWqUROrbghNoN10UsOHyzz
 VG6kVgX3skmArO55dEouE78l/SyVmCIR8PETcGnf4CikN8EGMqLLAq5gwRBIVts8
 /a5BTcuXQ3bQtFRq1HZwQ+D3n7qL1J6fgP8K/PF1yfIzXd1PISvhFGyN84Xomyyb
 S8i0LA==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ngtdhq3f-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 21 Aug 2025 03:37:34 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b471757dec5so1012417a12.3
 for <freedreno@lists.freedesktop.org>; Wed, 20 Aug 2025 20:37:34 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755747453; x=1756352253;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=s5H/bF7V+/uMeSq3g0gxgqc/EofmL6r/gf0PKGC0ccY=;
 b=EFHncdwd5D4BabO0oPW0O4ebvKsXR0ituc2TywzxMuWB9AEukg0eEkh6VSVxQX1knD
 7ZgCc2kJavV5v+ogqMd8uOsjIKaKZJuxXRVd3IXWiH2Fr/lZlwnk50+WcEElUlSONAv4
 lxn13aOuUF/a6RIeScCEJsH89dhOJQCsu7E6od7J30lL35J79LfNPh0PD44lbvhW91Z5
 d+l6Cmi5oaI4a2SVAPiKgAHgS1UkMF01e9q02DrDakEnRZnjvENHaRBY78K+zGZRdPU7
 QpcuoNZ9pPt0TKgxRAnCQCl1xFdwgrgKZy8jHW3KJAuCuD4kUHCbK6kgRhHox+uZFp4w
 3BpQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXcrEC45FJkYXfqDs2XMVACaDT5DwKt4daxerhR8VO0BU8tX3CtYrtjWBmVMgpUtx7VORMMVdgJl/4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxU99UtZSO3VIRqY1+MeibFjjhig1RcIAE5v90usZNmBIfgs+tF
 rNweoTmT/uc1H4OL/MT/iEceQ8USK2TPPgeL0p8xUzfLxYpjGOjzmXDHMRFOOmsj5moEdsietBa
 7Kl5IhGFfMFWRvAu8rC8ZWGa+FviLXD52meAOJ9n9fS76ClH+HiKBiESnWtAayk/as1+9yUI=
X-Gm-Gg: ASbGncugDE91h7xmpSU5Tgt9KVbZrXyQNRbkR9WJ/qyud9ebcUfXI5i1Yn+NqToFOaW
 rK+ZPpqKw2P4G55ubTRFQA93DbHxyT6xpVgG5yxHfFusPKltyAtRKAXJDxiNVE7KuyZvluzW5bC
 sSsPBvkmjgPPCKSOxP35h8tf+5mELsPpxSj0LJ0me4+/rrEklVWkkvBwONPKwuIjuptMw4P02cO
 rsOuno5vcaUDRTqa0U96Ye+ENDC3cT/nf4ZXmnXPijWZJQJTsowmQruGpd7b/s+mMq9Vy+bq+XG
 F5t/jfWWVIp7LB17r7SlSXXsLjfhuqcBsHd5EB7i1okfkdnKalyvkFCaGBCsjuohez4U7Hc=
X-Received: by 2002:a05:6a20:7343:b0:240:6dc:9164 with SMTP id
 adf61e73a8af0-2433089e19dmr1159862637.15.1755747453479; 
 Wed, 20 Aug 2025 20:37:33 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFi4mGJZ5wAX9bpRLqAWGzqaPdfb8se3vOWiYgqadgqnAUMN/U4mRyTaYFAwyX37dTnizeIeA==
X-Received: by 2002:a05:6a20:7343:b0:240:6dc:9164 with SMTP id
 adf61e73a8af0-2433089e19dmr1159817637.15.1755747453048; 
 Wed, 20 Aug 2025 20:37:33 -0700 (PDT)
Received: from cse-cd01-lnx.ap.qualcomm.com ([114.94.8.21])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b47640b6554sm3497780a12.48.2025.08.20.20.37.26
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 20 Aug 2025 20:37:32 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 21 Aug 2025 11:36:01 +0800
Subject: [PATCH v8 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-qcs8300_mdss-v8-6-e9be853938f9@oss.qualcomm.com>
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
In-Reply-To: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1755747404; l=1242;
 i=yongxing.mou@oss.qualcomm.com; s=20241121; h=from:subject:message-id;
 bh=jmOF3YxLYSDfb8Ohpc4kXPJtA6m1LCaahphFup+ozoQ=;
 b=9nEXtJyTvuvPoQMKa9vJn8WmfjXRNxEFGH4TAyQUtRSsAGs8a/pirBy7epfxNHUOJ6F3AyD4s
 mxQRny+F73nB+a5BUu1ybLK0EPA9/GcvDWqt7ON6vzsbdDND+MNtPmS
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=zeCnFRUqtOQMeFvdwex2M5o0Yf67UHYfwCyBRQ3kFbU=
X-Authority-Analysis: v=2.4 cv=LexlKjfi c=1 sm=1 tr=0 ts=68a6947e cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=E9mFum2VwHQHOKsBOicA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
X-Proofpoint-GUID: MBHAtxLTpj5iS0e11tjWkgNiL8RdEPPR
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIwMDEzNSBTYWx0ZWRfX1HaRqVTH46QK
 sQRnZkJoZ0cff103h+uF9eEWMs9T1FmWHIxClWeVeJwKn/L7IiGtDaJjSnSTuFH4Y5Ba0gWWIMj
 Ga7p2cPhXQ+bDkeTR5sn0U8Vj1f5MaPk9yHpbL/VtpQGEZ04zK1BQXADqilO9m5OCHBInVB3k6d
 VxPdicLoGWTfpEx9gVoob2CsUL4iVSs4jOkNDMRhYAh0g4esmLDPIFp+uDzOjLmIuU078sMSBku
 ksSg47ZEHU+urWSSBW3PvZ+cQORfiHgB9b2s3c84i2EoLXjRvkonLwoJFu3IFMP+wa6jvZOpdE6
 5Q1ZatCbm4a0F/PW0lkrRet23DDuhmE8frJrxn1d5qnKnwMCMyBF9FXgy+x8vMnd9fIRD+CMJt7
 +1jj+yJU0OuufZ0ob5TboBoykPXbdA==
X-Proofpoint-ORIG-GUID: MBHAtxLTpj5iS0e11tjWkgNiL8RdEPPR
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-20_06,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 bulkscore=0 adultscore=0 malwarescore=0
 spamscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2508110000 definitions=main-2508200135
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

The Qualcomm QCS8300 platform comes with one DisplayPort controller
with same base offset as SM8650. But it requires new compatible string
because QCS8300 controller supports 4 MST streams. 4 MST streams will
be enabled as part of MST feature support. Currently, using SM8650 data
structure to enable SST on QCS8300.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/dp/dp_display.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
index d87d47cc7ec3eb757ac192c411000bc50b824c59..bb4660585849d1a67921a28e7e12422e0c327ab2 100644
--- a/drivers/gpu/drm/msm/dp/dp_display.c
+++ b/drivers/gpu/drm/msm/dp/dp_display.c
@@ -187,6 +187,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
 };
 
 static const struct of_device_id msm_dp_dt_match[] = {
+	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_sm8650 },
 	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
 	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
 	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },

-- 
2.34.1

