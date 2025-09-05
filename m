Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 9C882B44AC5
	for <lists+freedreno@lfdr.de>; Fri,  5 Sep 2025 02:38:49 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 47C9310E352;
	Fri,  5 Sep 2025 00:38:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EsvKhhdR";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1CDC910E352
 for <freedreno@lists.freedesktop.org>; Fri,  5 Sep 2025 00:38:45 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584IMUCI023981
 for <freedreno@lists.freedesktop.org>; Fri, 5 Sep 2025 00:38:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 StUJ+iCclmQ41HjQV5lQ20sHIRMRDK/w0JA6wzKy7T8=; b=EsvKhhdRefG6BvSE
 VcdRNNHHDo1rurwOaTlz5MI6kRnAH4hto3HRHbxTAbf0adpztnciBAucp8a2F/P8
 EWiGKYy3wKKBQXgE+E7ed1b+HfUSwMDlMrXkTk2rn/DFNa3WdFSgqpIharQ3kx8A
 VmmIt/YORqQOFwy1KPUUiXK8ujk5Ran7FG5NmfAdatXKSD1ETqQmG2l+636k4gXj
 BllAAhhEYWgDlO9m3PBBNTeAkfxEB3EKKb0du47O8UfOzGGwa91pB2rZAMZxJzpP
 X7FIFmc901GSpM79F9U2hEZza4RYAuuASY2EVI84ZUI/ebZ4/UAX2Xvm/gdZKifL
 bnh4nA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ut2fs4jh-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Sep 2025 00:38:44 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-70fa9206690so40413606d6.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 17:38:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757032723; x=1757637523;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=StUJ+iCclmQ41HjQV5lQ20sHIRMRDK/w0JA6wzKy7T8=;
 b=Qy5oWy2Cy8bx7bjcsk3Nyjz29+pImo121Rz/0jPu6md+bHY5xwQ1gUYNFTA+kO+D3Q
 czwzw7xrRv/e1B5KPkdF2XO1OTAbnzOu2tmQVQTPTYqBsCyif3M/wax7nIpp7TkT39EA
 c5CHgojzWcv9BGWJ9DNQZLT23ZuhgwV9Ougiudxt8e8QVWEw1dz6Fb476BsgRfuRvPJv
 za1gL2nZtprUrSOHV1+O92fD0nKbz3pXzZAJeSfA3+I7LErlHEAWytcXyQ2sLBEBNcAC
 ghH6l/3X8JCN67yg/0Jvx6Ff479To8K84YVOYU/jC0SpKkwfKsQDtZMgVhidFroU98F3
 YqFA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWOeJoZM5LOypJyoVAC0QsjgsyBmvmhrxXY8MQ5uFEZekYWBCZ1NRWpiOmJJyPoJUVOCU6X+/zevYE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yy2y0Y/JKPj/cCtGcgREf7bpE7ZjgmGqeDaij2TplHdVMyTu/VE
 z3ozypNKqDvsB4qwfJHbKRoegUWRJKoHTvHocKhzUrtkDbmX8myB45tUJqFtDBZEIq9D4NaR58C
 oedga80Y4Zk1TbJAusCblYiQ4gE0rW9l95+sm39Uw9ZVZtdIAcsuC+keafMsTUGEwL3NBJsY=
X-Gm-Gg: ASbGncsVs93QdFYH+KYQRK8H5JKoJFQaRCxzAReSGeFixaKIZ5zP4yzVQY/KpZ2cSrH
 fM7Dpw0NIyI1H4B9cZYsjABXqBolUu7k/0mf46qh5yMBZY4wCvLEbym7deHTamUfpk8JvZrjDM3
 iVhpQIettdTRbV9co6A9kaOWxfEIruOAYkChGUlW999c62HPmH9NeSk93hsudNVDGkN60EoqKUn
 Iy74u82DlqKKp9tToI3/uoiBzWoVbgEuWe7tIeGl5e5O+3dC9+ohVpN6DmR21wwy+He7+LgD+7v
 07opSwaap4eW2A5p/tKQzJ/rMM7PgwKJpF4ryYOa/MQHBwGrZPkonpV5KJNB9A1pDdYiau5dkld
 96dZR8iMjtoWqkUHOQ26HIuY9x7+vodtpIrx6Rlr3UaKqHReuvbHH
X-Received: by 2002:a05:6214:2462:b0:70d:ae61:7ddd with SMTP id
 6a1803df08f44-72bc5842ebcmr27109296d6.31.1757032723159; 
 Thu, 04 Sep 2025 17:38:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH6x/823MfOPPReu6md6Lo6garBg/o9gfwd3G1nNGaUC//kgW1+Kkl8wp8jUJc0HWSYSKQcog==
X-Received: by 2002:a05:6214:2462:b0:70d:ae61:7ddd with SMTP id
 6a1803df08f44-72bc5842ebcmr27108936d6.31.1757032722658; 
 Thu, 04 Sep 2025 17:38:42 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5608acfd938sm1510059e87.109.2025.09.04.17.38.41
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 04 Sep 2025 17:38:41 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 05 Sep 2025 03:38:31 +0300
Subject: [PATCH v2 02/12] drm/msm/disp: set num_planes and fetch_mode in
 INTERLEAVED_RGB_FMT
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250905-dpu-formats-v2-2-7a674028c048@oss.qualcomm.com>
References: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
In-Reply-To: <20250905-dpu-formats-v2-0-7a674028c048@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=8457;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=o39sacG97yC+L8l69fpJCUgj4xq9EtSHTWrOyUyGs+Y=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQ8YuQ86D6f/u6GrN+nWmnXu5+GF+np/mLm/+Ff8IFGU/t
 FL37reUTkZjFgZGLgZZMUUWn4KWqTGbksM+7JhaDzOIlQlkCgMXpwBMpHUF+z/ze0uNinQ7I4qn
 LufqN2dVaSnzi8jVyFiqrKz0h7Fc8Mz31eq90z5H9dSonV6k8cHojt2SvH1MJ/zYI1ROz2mM3yD
 NvdJls0Km34KGuZyZQjVVkofD1A+yCmsLvchKUboktfjQ35ieIo8MRcOpT2couc959tt/8lfuPr
 7TFzXPz7z9Yv2tN4KhwQqX5+roK87Kf104dcrCZ5Y1wd+f3qzxY/UyjGT74TjN2zQ2Z0HEkwuc4
 sbBiUabEqcETO29sEzpygwT/wqp+sz/pp+t9s/prud5wzbr8r+0xUGrRAPn5dqWl5VstL8jV1X/
 KqI57VCoU5KXZNHD6BB1du0/z+K+lMrV5m+ati1V28gLAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzOCBTYWx0ZWRfX8zyivoPAmnvU
 lFjjZ2+gjjXW0L3WD6dXVTNQzi1qToq6nVBkiv6CM7yozqady495M6pM5ts8q6/0EQqg47eUpcz
 1YEWwO2dV0CT1RTQ1daI3xHAuaPFSdQSXhaxI4cJpXNAxgXEusHEBnBYb0JCVAz/1CjdNTkJsYq
 or9ignaAKHDlRusOR9hTQ4Tm3L4URzLvetkRBK3rKECmXKAZIyONzcIfZn1d2EWVM2FS1WOVTMK
 l3jWJx74SzOIEWoSGqmN5bydp0hAD64+VOdpUeQ82DPau00Zf+0qDxcp3e4kVow985l0B99uax1
 fMZ3cbA287tHPBpwLqfDhYh/lHreIj2cIKAhlghtQpg5ZnT1FrMKedbdE/SlkNHGgSVKlY2mh6M
 nYLurnRs
X-Proofpoint-ORIG-GUID: mQuJt6SaaeY80CgEaIMLryfaHWpTIIGr
X-Proofpoint-GUID: mQuJt6SaaeY80CgEaIMLryfaHWpTIIGr
X-Authority-Analysis: v=2.4 cv=U7iSDfru c=1 sm=1 tr=0 ts=68ba3114 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=uYEdUiPHXpurYBtsK8sA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-04_08,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 clxscore=1015 impostorscore=0 suspectscore=0
 malwarescore=0 priorityscore=1501 adultscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508300038
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

All interleaved RGB formats use only 1 plane and MDP_FETCH_LINEAR.
Specify num_planes and fetch_mode directly in the macro and remove
unused parameters.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 114 ++++++++++++----------------------
 1 file changed, 39 insertions(+), 75 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index eebedb1a2636e76996cf82847b7d391cb67b0941..26be35572fd2ee7456401aa525cc36025bc52ee4 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -67,7 +67,7 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 #define MDP_TILE_HEIGHT_NV12	8
 
 #define INTERLEAVED_RGB_FMT(fmt, a, r, g, b, e0, e1, e2, e3, uc, alpha,   \
-bp, flg, fm, np)                                                          \
+bp, flg)                                                                  \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \
 	.fetch_type = MDP_PLANE_INTERLEAVED,                              \
@@ -80,9 +80,9 @@ bp, flg, fm, np)                                                          \
 	.chroma_sample = CHROMA_FULL,                                     \
 	.unpack_count = uc,                                               \
 	.bpp = bp,                                                        \
-	.fetch_mode = fm,                                                 \
+	.fetch_mode = MDP_FETCH_LINEAR,                                   \
 	.flags = MSM_FORMAT_FLAG_UNPACK_TIGHT | flg,                      \
-	.num_planes = np,                                                 \
+	.num_planes = 1,                                                  \
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
@@ -228,218 +228,182 @@ static const struct msm_format mdp_formats[] = {
 	INTERLEAVED_RGB_FMT(ARGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX8888,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, 0),
 
 	INTERLEAVED_RGB_FMT(RGB888,
 		0, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 3, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 3, 0),
 
 	INTERLEAVED_RGB_FMT(BGR888,
 		0, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 3, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 3, 0),
 
 	INTERLEAVED_RGB_FMT(RGB565,
 		0, BPC5, BPC6, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, 0, 3,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGR565,
 		0, BPC5, BPC6, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, 0, 3,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ARGB1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR1555,
 		BPC1A, BPC5, BPC5, BPC5,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX5551,
 		BPC1A, BPC5, BPC5, BPC5,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ARGB4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(ABGR4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBA4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		true, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XRGB4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(XBGR4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(RGBX4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRX4444,
 		BPC4A, BPC4, BPC4, BPC4,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 2, 0,
-		MDP_FETCH_LINEAR, 1),
+		false, 2, 0),
 
 	INTERLEAVED_RGB_FMT(BGRA1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(RGBA1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(ABGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(ARGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		true, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		true, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(XRGB2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C1_B_Cb, C0_G_Y, C2_R_Cr, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(BGRX1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C2_R_Cr, C0_G_Y, C1_B_Cb, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(XBGR2101010,
 		BPC8A, BPC8, BPC8, BPC8,
 		C2_R_Cr, C0_G_Y, C1_B_Cb, C3_ALPHA, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	INTERLEAVED_RGB_FMT(RGBX1010102,
 		BPC8A, BPC8, BPC8, BPC8,
 		C3_ALPHA, C1_B_Cb, C0_G_Y, C2_R_Cr, 4,
-		false, 4, MSM_FORMAT_FLAG_DX,
-		MDP_FETCH_LINEAR, 1),
+		false, 4, MSM_FORMAT_FLAG_DX),
 
 	/* --- RGB formats above / YUV formats below this line --- */
 

-- 
2.47.2

