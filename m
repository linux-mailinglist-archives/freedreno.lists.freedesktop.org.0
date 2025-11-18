Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 87CA4C6A1BC
	for <lists+freedreno@lfdr.de>; Tue, 18 Nov 2025 15:51:50 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E54510E4DC;
	Tue, 18 Nov 2025 14:51:49 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F9T/R6X1";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bCv76s7R";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D585810E4DB
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 14:51:47 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AIE5Nld623967
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 14:51:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 CIlNewz5huhSylfx9wKBYS8mfG6SbdE2jYpeBcLcGnc=; b=F9T/R6X1DM/FfEx2
 W6Q06lUe2eY/j3Kwv2bhNjtM7SpFU8nGLfav8dvxBDqvTRkmwgAczc7Y1vr6KA+6
 t30snWDxIYtLf1a2j2O/D1hjVP8bFp/frQxU/gnXlfJWWYrhsEa41WjprDQlr9nV
 4PUqHFkFmuepL5cD0tXw84B50kTiQuDWu5YKUlTMJhuy2Ko1doYvRgZn6wLwaNnH
 37iiNsLYX7ubSgLtSC3xFFd8gCzPbofF8HHZWw6jJ5jCKvnmxJ1bgcKF2Mj1IHgw
 nsJ/iwF3nXJymYESWanhK5jhqdw4IRrdBh0ArhHYMCPLl2ky9iQH0l2uKH1LN6fz
 zI+msw==
Received: from mail-qt1-f198.google.com (mail-qt1-f198.google.com
 [209.85.160.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4agahfasry-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 14:51:47 +0000 (GMT)
Received: by mail-qt1-f198.google.com with SMTP id
 d75a77b69052e-4ee205eb70aso27799901cf.1
 for <freedreno@lists.freedesktop.org>; Tue, 18 Nov 2025 06:51:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1763477506; x=1764082306;
 darn=lists.freedesktop.org; 
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:from:to:cc:subject:date:message-id
 :reply-to; bh=CIlNewz5huhSylfx9wKBYS8mfG6SbdE2jYpeBcLcGnc=;
 b=bCv76s7Rt/o3eRg8BzKx225lEuWt/CBLy+1NQ4UaSS5P9oDQQzpAgmpoRyEjSf1EsI
 Q8ZS9tcbtkYEMpb76q3ww+1lPv+0f73m3OqBCNoWlxx7uKknVgxZlTo79pofmoQq7WlI
 xe3dEoO5qVcJ4dBxG61nIrk9G1GVNqLWeCv1x46KXeKdnWDcN+wOc947sMxcmpIGx533
 /RnaoacUdNIxkzbgt16X7HrgCEjKhS1+9TRMCviVulAMRLjoGA6GWJRLelsTwlwdSdWZ
 Yql97i7Ny2RQIPUjzJh94JpBSjqGnfm1hHaw70MulMshbQgiwMI3yU4Tr+J+tT7toUma
 NO/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1763477506; x=1764082306;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=CIlNewz5huhSylfx9wKBYS8mfG6SbdE2jYpeBcLcGnc=;
 b=gBcQvV0tR80zp6GghFE4kq+aQm6ZLumXlndr0kk4RnTVqMapLFFeZQCvSOc13DA1Ag
 GUN485q2dtahPO9vWtzSUiEd7TU4yI7XMxe27wzCr4YlqUYY004TCSZYcekw0JTygMnM
 QeHoCmBjiEHzJY0EZMj7QrydG4iKY64DpSO/mFmEXmJiHcZ+d1XXwmlRnNjEbm70k5us
 SxNufuZdNdPOrjD7IaT52CDusFXVdq41G1+r/HpsacoPWjj+eThA+2+cobkEHRB0PTuJ
 yU891BFEcDF6kzbfXxiM9XJJtbkaAWWxpiNZ41wnmfYShYB6bd15lV2BAwDhs3yD8kio
 bfhA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVEqSmmu3cHPUwIfSpWsQX0mnenk5moqoYtvGD2N36vmADLO4F+h4tG155YUVB0IfW2im2P/yTtKao=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzvGL3zPLFxA3qGXtpEOCu+6ZGqutrMEOsQ982Pwzr+nU1eaQVa
 7VFJrrD/Aj1CBhaQKdfwTL1m+QVUSYphyG2hK1m7MYGGJYTG5crEJdTJW5pH9f+uOsVmJOQa8KT
 WqmVn2b4bpvWj/EHne5wGQAv+Uxh6SOsQRF4BTqON5oXXkOL8xj5M6PotHDVRftGoJk/1v0A=
X-Gm-Gg: ASbGncuyhod4Q2KIYHvDkESdadClUQOFA0YCt+rZtuy3Hz+ppFSie3zX83C62PIeNfz
 LiHSZiq0vPTQ/uZ/eusKEOpyH9jgcdCdXiUvIV7IoW/9ioVVw+YH3/qV19guaUWTQ3+Yw20K2rF
 j8OJA8G9ZUeF3xx5aUj8tYk4X1VGowj23ql7xKuFJbTnJMznrA0bU9mwKfDbNurdc9KQPFN47ua
 NL4IR8fwm2VE3FkYy47BpdyDvbUe3xR/n4ZZ1PVvzvxnE/H00hhCrtv7ZuSETQuTkDpVRR7PgHc
 BWtyaotUqyruO9yhWmnW3ja+oitNMfhYiQCagIWNmto0rneO+r83R9/JiZpHkTlGGqNMdyUY85G
 1S/KUpBIA0DicMgsO5nfClRK498u+VtFdfvHdn9vPsGVS9nUZrsagmYtPQNf8zEKBeyXWC1NvuD
 ZNUw2GfaDpXYe+
X-Received: by 2002:a05:622a:ce:b0:4c4:6b67:ccd7 with SMTP id
 d75a77b69052e-4edf2115889mr222028451cf.55.1763477506253; 
 Tue, 18 Nov 2025 06:51:46 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGVS8N8VHsVYiW0k7onzk7eNE1qizFWtu9jQliWalm//hreHBJzziNsUwpECi5l77abjRGbhw==
X-Received: by 2002:a05:622a:ce:b0:4c4:6b67:ccd7 with SMTP id
 d75a77b69052e-4edf2115889mr222027991cf.55.1763477505770; 
 Tue, 18 Nov 2025 06:51:45 -0800 (PST)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-595804056c9sm4078452e87.90.2025.11.18.06.51.43
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Tue, 18 Nov 2025 06:51:44 -0800 (PST)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Tue, 18 Nov 2025 16:51:40 +0200
Subject: [PATCH RESEND 1/2] drm/msm/dpu: simplify bg_alpha selection
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251118-dpu-rework-alpha-v1-1-293d39402b59@oss.qualcomm.com>
References: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
In-Reply-To: <20251118-dpu-rework-alpha-v1-0-293d39402b59@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1778;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=sY/SEDXrsZr0BmS/LMw9TXkPSauhq7bXwHnS9koPDnM=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBpHIf88T0dnu/Bdnvg8CfTfhWTjN0pkQ597GtgI
 kD/IPt7miqJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCaRyH/AAKCRCLPIo+Aiko
 1X9XCACVLoKFvOqIsZB5xZvyetFJqy2ocjHKYtlm9nXB1OARuPziEaFV6ilby7xmEmoiSOnR7bQ
 TkVIoeS4HB0cto8afZWvKu+1EDRW6kyOfayiXsnOya2Ocg50npHenJdrT9gyU1yeo6IxJgDOvo6
 7hD739r6BwDhq5YWWaFefsic1vtinbZWNRghG1GgZDBgZ1z8StmN3oOUQRI93tn7RPnrQqdbG+Z
 p20YN3+XTHZme3rpVoy/3TvLfY55TVUcpFPPOLptHWWzlCJQ5i8l2uaAgCxO/T6y5QCxXo9zTGE
 DACManN9BppwPJLbRFlQL1CS1eAJVPZ08+4IdGZGZZP+Fv2T
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTE4MDExOSBTYWx0ZWRfX+ngxdHVGb3Qq
 ljH2JVt93kbhb1EwXzSK0b3Y4nBwGf7yW65i6llJiDyjfb/6eHKoHYuRlHwJcO/msbCWZewdcbh
 yuwc6d1+0reqVLQ0noyy5FX6nP+YVnzqdGYiL1s6tWbdQrSbckQgq229ls4xYVmg33EQKuNLluU
 BGImJN1GoF/Sfpqt2/mtZMjZopxoFj/get9vXkkc2R0b8oVwQVmXcBp6tESX/QuUtQ77K3sJ+Td
 au+yFKWCQeyLUPAsL60Q2zymDJd1fHH2p1tJKXGgOGhd5cWstWoXnV+7EpHdfBkFfd3UR/DlKdp
 JOlwF50VtbSq3ZlvMYNkA6JMFjX3skWh5Ky8O7V9cWxGo1kS+YNXJLAlhhTLaxX92YnZDS6qsZ9
 MgPjLaai/2aunJOZGPyNwsrHaD9+RA==
X-Authority-Analysis: v=2.4 cv=RpTI7SmK c=1 sm=1 tr=0 ts=691c8803 cx=c_pps
 a=mPf7EqFMSY9/WdsSgAYMbA==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=ID75BBqnTVE1V_rUnp8A:9 a=QEXdDO2ut3YA:10
 a=dawVfQjAaf238kedN5IG:22
X-Proofpoint-ORIG-GUID: Gw5y1ixvHEsQgBETAVHzpBePbSeemNFY
X-Proofpoint-GUID: Gw5y1ixvHEsQgBETAVHzpBePbSeemNFY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-18_01,2025-11-18_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 clxscore=1015 adultscore=0 bulkscore=0 suspectscore=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 phishscore=0 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511180119
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

In order to be more obvious in fg_alpha / bg_alpha handling during the
blending programming drop the default setting for background alpha value
and set it explicitly in all cases.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 4 +++-
 1 file changed, 3 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
index d4b545448d74657aafc96e9042c7756654b4f0e7..651159e8731194d75b52c05158bfd1c9bad8b10c 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
@@ -335,13 +335,13 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 		max_alpha = 0x3ff;
 		fg_alpha = pstate->base.alpha >> 6;
 	}
-	bg_alpha = max_alpha - fg_alpha;
 
 	/* default to opaque blending */
 	if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PIXEL_NONE ||
 	    !format->alpha_enable) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_BG_CONST;
+		bg_alpha = max_alpha - fg_alpha;
 	} else if (pstate->base.pixel_blend_mode == DRM_MODE_BLEND_PREMULTI) {
 		blend_op = DPU_BLEND_FG_ALPHA_FG_CONST |
 			DPU_BLEND_BG_ALPHA_FG_PIXEL;
@@ -350,6 +350,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 			blend_op |= DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
 		} else {
+			bg_alpha = 0;
 			blend_op |= DPU_BLEND_BG_INV_ALPHA;
 		}
 	} else {
@@ -363,6 +364,7 @@ static void _dpu_crtc_setup_blend_cfg(struct dpu_crtc_mixer *mixer,
 				    DPU_BLEND_BG_MOD_ALPHA |
 				    DPU_BLEND_BG_INV_MOD_ALPHA;
 		} else {
+			bg_alpha = 0;
 			blend_op |= DPU_BLEND_BG_INV_ALPHA;
 		}
 	}

-- 
2.47.3

