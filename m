Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 951FFAF9DBC
	for <lists+freedreno@lfdr.de>; Sat,  5 Jul 2025 04:47:36 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5107F10E15E;
	Sat,  5 Jul 2025 02:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="fmJz75Pg";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7212C10E158
 for <freedreno@lists.freedesktop.org>; Sat,  5 Jul 2025 02:47:32 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5652BwiA028340
 for <freedreno@lists.freedesktop.org>; Sat, 5 Jul 2025 02:47:31 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 uwF0yXtjcYZZHTWUtFBuT2u76dwiF/qWvZ0FO2txtq0=; b=fmJz75PgADpZWKXy
 Oyq9zd3dCsSv3twi/x2G5XmcBCfrJpXIdi00LqpxGyfzPFauCKTJRIgwfr7i84YF
 JWl8u02ObtgrM58bJgf7fczu/0STHIwqDB6zLxflVLXvhi2lZpb11+q8qvr38z4c
 x+qXSUAKuoGOGwaP6PJD4akjul2DonIhtwTuwD9Vb/gnaLojhR6mRXUTwbuYoqZN
 RcgGaOroEMk9AMbZEUX0calVBZ/XbW3KP63G9sCWnjl4RbmaFAYy5FOlS1b9PjzE
 aNi6uxUFBNtIXWcfNo2QIn3pv3m7uPnEAxj4HQe3Ud+dET7rMUT9nfKR8w/pH3hc
 nkPA4A==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com
 [209.85.222.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47pu2ag127-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Sat, 05 Jul 2025 02:47:31 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id
 af79cd13be357-7d40f335529so382679185a.0
 for <freedreno@lists.freedesktop.org>; Fri, 04 Jul 2025 19:47:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1751683651; x=1752288451;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=uwF0yXtjcYZZHTWUtFBuT2u76dwiF/qWvZ0FO2txtq0=;
 b=dk0ueCiQ73upVoW18em6+59ykluBAafbTIQis4ZMguyLAVIgvlLNPTmWDGnKtxX6ue
 bpkvs5BT93nEq9jaMmccp/OGqQ1FIAUv0rh4OM9VC92ReoO6BOYmCC76ikSwow99vPDH
 wZKzdKLZKDbI88FtSKCgKPo/r1Tprv3aL5u3SpB/h8TLXW+Yk9suwZ5pAcUB5dsynquN
 D0SxpZ78v/XULqV8aEWb8MtNb5dT+zUrNThMjvDJaCk4+k+C0c1ly5PEJZbDXCCgu+ST
 cSvw149sps+xSLZYazr9ah+9r2iP+4VrwmedeDoRu45dUlAF9L1XAl6spWU4iBoko+mM
 ybpA==
X-Forwarded-Encrypted: i=1;
 AJvYcCXKX4Lu9XuEEnckYFm8Ue/QulGwLFuSGqhYGOgx6Nb7G6vT0sPViA6O8zOaUzuK7pgV0d0NBGaq4LI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy5uDSpLSPRuXPXbU0a9s6pw1MmEXcq2VEkwgcyUQJhFxrkZL7C
 xKli66F9IuXHYmBDgb5lL3VDZVuq49xNTw+u4XOMQK6y6eE011GdL/1tPNhjDwQb89o6GCft8xV
 x/FUQZ4jA0NIgtU/9QU0vWCph198qsYxbii6mOLzTtisc4yHbBPiPIsDOoGwcNp3nLops62k=
X-Gm-Gg: ASbGncsyG8M6L4Td8UBglDapyvlB6QZVl+0+o9PtmB5i14SHOaXT2qZ2TPFENcV2UDf
 yOIppClLvSo9tobt6TdHJC/Nz2T5Q8ipF/+gaU3o+wmRWxBZrehtaYcpvW/y05CXdyzvd2OrZ+0
 D6HxiosF6erNsyxxdIuKp7Q8bXKTXl4VvheiLuamcVrq06RPHnuICqhD85WL+4IlPtk35Rcht8t
 1cCsi8bQJUqH6LE6o9S1m/qegewDwoAHmIpYUhrMZJ9RA2Df0VTUhuQ+DVkHOBSZd8KfVbTOgY5
 FJqUMi+7HcsI9m8cRgVuCmN/XpMWRk3xtnhgqQ+t6UnPkEtdqGXVeTFoL5Y83YJsuVugSbM2izl
 DLrZXvxQcPSvvS6ZdaST0Yt7A3a/he8IzuG0=
X-Received: by 2002:a05:620a:618b:b0:7d3:e56e:4fd8 with SMTP id
 af79cd13be357-7d5dc66a567mr648064585a.12.1751683650865; 
 Fri, 04 Jul 2025 19:47:30 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFjg/CcD45AAmgdd3TehstYt7pR3hgyi7SoBp8wsgbVpyLR3/nu3VuQCR1BxdlZ/oY2Ff7THw==
X-Received: by 2002:a05:620a:618b:b0:7d3:e56e:4fd8 with SMTP id
 af79cd13be357-7d5dc66a567mr648063385a.12.1751683650425; 
 Fri, 04 Jul 2025 19:47:30 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 38308e7fff4ca-32e1b1418b3sm4092411fa.76.2025.07.04.19.47.27
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Fri, 04 Jul 2025 19:47:29 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Sat, 05 Jul 2025 05:47:22 +0300
Subject: [PATCH 01/12] drm/msm/disp: set num_planes to 1 for interleaved
 YUV formats
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250705-dpu-formats-v1-1-40f0bb31b8c8@oss.qualcomm.com>
References: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
In-Reply-To: <20250705-dpu-formats-v1-0-40f0bb31b8c8@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1624;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=PILnmvpGnr1q9TnXm9+RxFGUB/bQl/VAfEMPj6+eJQA=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBoaJI8paQmJDx7acunG6Rf9svsL1sBNNN8yILi1
 QsJil1O4PSJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaGiSPAAKCRCLPIo+Aiko
 1UbCB/4vpQ/e5si1WCvR1zIPoAKe0Cg64TLcbGLi5QW9+TbtNS4WiMoqWkTqspNexCPf6ZTlvD7
 TPiFirmzpRC03azsgzeifdnimiztH3xJY2OoLOrv/Fle89yDyWnzGUQWxTjc9p+ip86laJrlhsi
 Du6eu7Q83pXnaqO77KFNK4q3YcWEwrjywKDyVb62DYUjkpABfkwxdXfDRPe2bVkm1UkPULF6fFz
 srSV1jIPaHj1LopSyJy7JjwXh5rUsgzGqbBprpyrjfQw9tO+Z8SPCSQTc2SAC4n/imEGRCgKAv/
 U8kqIxJM9tehJVCyDcSA3aZ9y7FnT86MN5QFngDEPvdca60/
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzA1MDAxNyBTYWx0ZWRfXygk5iT+U7KAr
 EBzvsMBBSbfk41ntj2GeqknRvEvuuQZ1nVJa5bUkqH8LF4SBVDUb59t5Peg0rok/a2EKvULTLPI
 CtY8Km/kcoWJy2HhcCOvpc6IHXZJgid4nM0ul5pT5D/Gjw856C+DsuyPrmgmlSUYtq3Tw1kCYv3
 7l0Xr/aQQAiwfRfNm6ywyyhoAYQBSyGKBfZrEnYVeoKL7nAjz9RrPuatMRQP7n4jd2jFfdU9Jk2
 TGn6OgojT4HrMZeioUxw2KnIs3W71AY7/OJpt7KTY1goPFOhY+yCcfRLak4NCF3L07jhvBV3dWe
 gqT6l+EUf9cF54xNMj2+WsdWok2T1C8L4tX3Xl5vpuxjVNiDcYGih+TImCoxkTxi1wCVpZgVn6I
 5LVFFQihNAbDzeU4iaa4PxlNK6XEaNl+O4lodtqw4JB5l+IDwg2mIkbXYhMTUkkA2Nack0mf
X-Proofpoint-ORIG-GUID: yqqPxHusXaMw6yJwVQE7s9J23NG8oQND
X-Proofpoint-GUID: yqqPxHusXaMw6yJwVQE7s9J23NG8oQND
X-Authority-Analysis: v=2.4 cv=erTfzppX c=1 sm=1 tr=0 ts=68689243 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=Wb1JkmetP80A:10 a=EUspDBNiAAAA:8 a=DB8TyEHaRv6uusbT9jkA:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-04_07,2025-07-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 clxscore=1015 impostorscore=0 spamscore=0 priorityscore=1501
 mlxlogscore=999 bulkscore=0 adultscore=0 malwarescore=0 phishscore=0
 lowpriorityscore=0 suspectscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507050017
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

Interleaved YUV formats use only one plane for all pixel data. Specify
num_planes = 1 for those formats. This was left unnoticed since
_dpu_format_populate_plane_sizes_linear() overrides layout->num_planes.

Fixes: 25fdd5933e4c ("drm/msm: Add SDM845 DPU support")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 426782d50cb49d57a0db0cff3a4bb50c5a0b3d1a..eebedb1a2636e76996cf82847b7d391cb67b0941 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -479,25 +479,25 @@ static const struct msm_format mdp_formats[] = {
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C0_G_Y,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(UYVY,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C0_G_Y,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(YUYV,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C1_B_Cb, C0_G_Y, C2_R_Cr,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	INTERLEAVED_YUV_FMT(YVYU,
 		0, BPC8, BPC8, BPC8,
 		C0_G_Y, C2_R_Cr, C0_G_Y, C1_B_Cb,
 		false, CHROMA_H2V1, 4, 2, MSM_FORMAT_FLAG_YUV,
-		MDP_FETCH_LINEAR, 2),
+		MDP_FETCH_LINEAR, 1),
 
 	/* 3 plane YUV */
 	PLANAR_YUV_FMT(YUV420,

-- 
2.39.5

