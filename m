Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BD9F0C5B30C
	for <lists+freedreno@lfdr.de>; Fri, 14 Nov 2025 04:44:06 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E029310E9A2;
	Fri, 14 Nov 2025 03:43:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="LPjHnWB5";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="j50C/6sz";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4841410E9A2
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:58 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5ADMbS5w1607749
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 mlkabq2QaGFzbiQeBWEWbS6GvKzbru/Mv43LmIPCIUY=; b=LPjHnWB5rzvubU3o
 79ljHc3h2Y7x/2D75aNsT865jnL/ugrwxn5pfVmvzmHbFSiZnkrDgnplGnvJ3p+y
 Mt9fCIBcPfY0ahZjdaEK8/1I2FjHEYfov/4neCKqOaZYzp4QBJC/SDjm7NefounP
 LLx7yGAoReFzuC3W8Zcf+XHHtM1Xh+Hr/eMAGvnuRbBTNiiwbCHP3moj4XS5tsUz
 NeC5tTpHwedRhGp2ySGGMdA0FekTKfVsKREWWKWrXHudtt5u4iMzwdET5EfKOwQp
 I3VMolu9/zViKNaCvK+tg1KfKS6oS6zzjleqYYKjmPykVlhq4vhN7L40xdf5FGxy
 QfZdhg==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4adr9frpxg-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 14 Nov 2025 03:43:57 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-8824292911cso74678116d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 13 Nov 2025 19:43:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763091837; x=1763696637;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=mlkabq2QaGFzbiQeBWEWbS6GvKzbru/Mv43LmIPCIUY=;
 b=j50C/6sz1ikSBrFEl7ssdKlMlhMk3FPlVbR4TTFSyA+wv4+MiKizWduNG7QKelSp1G
 e/MU2N4UdrlsnE4vfyx6w81ip1d6gF+7ol/eGULaKhHY7oYKwLdaLtLkgo58rUaokSYB
 Kul16GQMhlnnbIYjG8D+bzPN52ARMMUmiBxC5i/Olb1F5fd7JR1hi7cHD1KGvYFcP3cV
 B4iP/nWlqX96cOH6eDupuMMrcU5SsttwTSmrau9mzBd/hxp/2+PJjuBTkQs36gzACe7J
 uoeODdjEtAlNKCO0+4CPnV52wHtVNz7jNEdsr+xsI5BnUCnPkea7wAtjTVV/sVATU49w
 BANw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763091837; x=1763696637;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=mlkabq2QaGFzbiQeBWEWbS6GvKzbru/Mv43LmIPCIUY=;
 b=e3o3phSg1vh/50+52HuAxZcEveWLH9gseSVNqjHPbzOxQK070k5l6C0fnSPRe87cS9
 fIk1B9Bk1Qn6ac8MBwNgh2ziYy6siuwB28LcUh7/nfSSph706/wBUY1ySJ3OzgB+Pdex
 XceW/7Qvv+pqzod3x3xLXGj96HhUdxEQzNUK/40qXIuwB0KBI42jfk2a/aqqGwSwjFOt
 72CuviZH41Qd5I6bmU1RcbqRLZs0dggYqotOG3BDLj1CBP/l2dxXGIphr3BfKACZR64T
 E2K58yKElocyEtbRuNjA5v/C52qHojRUGlLmMxLB0Oe+oKAH6my6YWmTFnU10fPl2VTq
 +GRQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVmh5eZa/Qo9mrNn9uv0ygImrnYGNg7Hh7m4Rop7Muj2+zslTn67AMmavqWK3pggltRvhD0EYBdzMc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywl1dt5WCY0by37cczSInwB/2wM+AxYdKUU8GiqVkQzb2wNkvLK
 BczdeEwabECs/td9CpO4KSvcaiMZhDj1IHVkW+giePbPb0ToD7odwndUmvDEFDbWSeQdCGSVYyc
 HQ4eWPQ2bft5e6NgU6G7bmLwKtBbpsee+Oqxa5XPGZEXwKBIMImJbBHEO1Iezqeft1EDQdbw=
X-Gm-Gg: ASbGncvkkntibnaqLsgHbc1A0rU2ohsgmy1Q/VchKFVcuoGdeMYGIhFhg2ZFysNHAiE
 DioVBCEbhjOIBqRD50AlBCCJIA/10ccT2Pmo8LOXPrkuCjRzSAtXLV7fJngrhAtRgfPQ/Dvs2+t
 yQmcad4xyGl0FvOuRSqZt36BFabR1C1W0VZPcJrgBDRbL5MdB121g06hxqdvlNDLyofmv27t2U6
 oADoJSt1IJ/Ke34DYv1janXbL0OLA4JJmYQtpnjkwUfcw+K0CUwpqe1th1A6NeThUOboUqzZOm4
 LaikSB9rlOLE/mWA29izUl638beM3tq4VGWJ9xZkm7FIc+FLsmBesGWmMiviTXRkdWOFkJRSGlf
 YAiW19m1WaJjYWM7Y9xhiTsoMxP50dCunqAOB4REFIEN5W98LDs2rnmqnNzxWp4lZ/dalO1E7E/
 WDUOM3OYjOGFMe
X-Received: by 2002:ad4:5ce2:0:b0:788:82e0:3a9 with SMTP id
 6a1803df08f44-88290f3fa13mr25626736d6.21.1763091836860; 
 Thu, 13 Nov 2025 19:43:56 -0800 (PST)
X-Google-Smtp-Source: AGHT+IHelPfmbqEPEaJV9rhK/zZRhzFOZC07eb56SvApfcmSy5Au+W5kiqFYSczUx0p26Bwj5dtUkg==
X-Received: by 2002:ad4:5ce2:0:b0:788:82e0:3a9 with SMTP id
 6a1803df08f44-88290f3fa13mr25626556d6.21.1763091836400; 
 Thu, 13 Nov 2025 19:43:56 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-5958040575fsm800713e87.84.2025.11.13.19.43.54
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 13 Nov 2025 19:43:54 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Fri, 14 Nov 2025 05:43:35 +0200
Subject: [PATCH v3 08/12] drm/msm/disp: drop PSEUDO_YUV_FMT_LOOSE_TILED
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251114-dpu-formats-v3-8-cae312379d49@oss.qualcomm.com>
References: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
In-Reply-To: <20251114-dpu-formats-v3-0-cae312379d49@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Jordan Crouse <jordan@cosmicpenguin.net>,
 Jessica Zhang <jesszhan0024@gmail.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=2270;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=EfFodWq2fss0e83GymFoQFbaTtvN367Me3klIoPCb3Q=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpFqVmVQ5P/YY6C98/98eRr+wqSpCN7yvITy5eM
 pNHSaY/hLuJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRalZgAKCRCLPIo+Aiko
 1QVaB/93/BzR7UT472jfC8Bhav9semHxAtFdh6/6cz1OgwcifgEPOE7dJ9WAvPM+cfRFMBBTG/Y
 tZWaZzHXypJIb0gCAWoliy8cMLi34/tC8v5NekUtQBs5S9BST0VqPFuvvjjwzq+vPY3v1caiP4R
 J0BYXBuZXWQzpHAVdlvk63nmWgal25Q0j7Q6oEpj5knBdEaYZhBnWvJlIPEZbYzjyt1eDucqbWi
 W/67VwuQJLjM5M91cPlQjX09zzVKLR3H5R/mG5exVS9+g8S2rhknzD/w5TB4kCFqJQJ5dLqsGJq
 s5ltuJ8FtReii9Abdg786LREwo/wIRY+qxPQHLOxFkY5nFvM
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Authority-Analysis: v=2.4 cv=SdD6t/Ru c=1 sm=1 tr=0 ts=6916a57d cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=iz29p33r4uX7jxN-whAA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-GUID: o6Af2B3yYAFkPQTCw9Y3c1zaL0ZHeWzX
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE0MDAyNyBTYWx0ZWRfX59bMt96aXmpd
 oT8X8IqpXLt8NWh0aM9mJNp0iGVizivKGbU7pX8PaZZESPJ9zah5sLpli2v5q3xJ+EPX2AfMit1
 262oEX9UlBcRcxWAwIhmXAAJKwm8KHBl0NYluoxOu9KISc8idLX8FMNfAor9b8ox9GXoNziqYf7
 m/yDpR5sg3A+XRyKvgvVCutcZP6Hrmqp8UJbdQbQahQAEyl3BxqmbCr+qscDMgiL8CNwHNSaKnf
 zqKtvniwZpuucno3FMy8dMmEPfXAtLcRAMAA+6vIAuuTAonCPhCt2nYbnu53PwiS/8ryfK0q2h4
 el8VOJBTiS9Qpy5PPjtkPQCaNUNT5VMXXet971ucUcOCNr8ZqkjKKaPC1c7lofGmsSqmH2iayhs
 NUm12ee62YhENs76nlQYokZ2irO2ng==
X-Proofpoint-ORIG-GUID: o6Af2B3yYAFkPQTCw9Y3c1zaL0ZHeWzX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-13_07,2025-11-13_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 impostorscore=0 phishscore=0 adultscore=0 malwarescore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511140027
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

Drop PSEUDO_YUV_FMT_LOOSE_TILED(), the macro is unused.

Reviewed-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/mdp_format.c | 20 --------------------
 1 file changed, 20 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/mdp_format.c b/drivers/gpu/drm/msm/disp/mdp_format.c
index 5a1efbd99beeaf454f726e2824cb26d2bf31cf22..33da569eae5efebf39e91be1bf6c8b5c22bcac35 100644
--- a/drivers/gpu/drm/msm/disp/mdp_format.c
+++ b/drivers/gpu/drm/msm/disp/mdp_format.c
@@ -326,26 +326,6 @@ static struct csc_cfg csc_convert[CSC_MAX] = {
 	.tile_height = MDP_TILE_HEIGHT_DEFAULT                            \
 }
 
-#define PSEUDO_YUV_FMT_LOOSE_TILED(fmt, a, r, g, b, e0, e1, chroma,       \
-flg, fm, np, th)                                                          \
-{                                                                         \
-	.pixel_format = DRM_FORMAT_ ## fmt,                               \
-	.fetch_type = MDP_PLANE_PSEUDO_PLANAR,                            \
-	.alpha_enable = 0,                                                \
-	.element = { (e0), (e1), 0, 0 },                                  \
-	.bpc_g_y = g,                                                     \
-	.bpc_b_cb = b,                                                    \
-	.bpc_r_cr = r,                                                    \
-	.bpc_a = a,                                                       \
-	.chroma_sample = chroma,                                          \
-	.unpack_count = 2,                                                \
-	.bpp = 2,                                                         \
-	.fetch_mode = fm,                                                 \
-	.flags = MSM_FORMAT_FLAG_UNPACK_ALIGN_MSB | flg,                  \
-	.num_planes = np,                                                 \
-	.tile_height = th                                                 \
-}
-
 #define PLANAR_YUV_FMT(fmt, bp, r, g, b, e0, e1, e2, chroma)              \
 {                                                                         \
 	.pixel_format = DRM_FORMAT_ ## fmt,                               \

-- 
2.47.3

