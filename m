Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 25F66A99A01
	for <lists+freedreno@lfdr.de>; Wed, 23 Apr 2025 23:10:26 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B900710E29E;
	Wed, 23 Apr 2025 21:10:24 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eNDHNM6+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id F2B4010E27E
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:19 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 53NAbjXW016256
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 nrVtWH6tESq1UP3QtmhPrfd4OSTJbd5wusMpKFP/3tQ=; b=eNDHNM6+9WJEUQLL
 P2DTjnamaO8f7mcaoiVLnGovumC8hrx5b0+VcGyZMZwNVqgFL589EyDEmm/aL6pt
 hFvPfKrxO/fzmLIwR9Wv1a87CZiqO10Z/ogWM5n/2v1RSFPEOpp5dnx4YNaIr8VI
 FPNfyc4Bfny5653P6Ee9YFkp5fPZSbnKJZbh1l0lCWMB3q1eBBCZC0QkZbUYc/4h
 90EJcO41wJt2fQgb1hYNZF1dAawwUPvk2SyBJ9kmoasb0fUbJIIsFvljnPoWmAWf
 OmmzvHsxd/zUuxUwPlpuU+5LuZsW0NiCHtRgOoidhEWn5I7nvYkyzq3vEysNsaEI
 w/jaBA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 466jh3kdab-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 21:10:18 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-6e8f99a9524so8308696d6.1
 for <freedreno@lists.freedesktop.org>; Wed, 23 Apr 2025 14:10:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1745442618; x=1746047418;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=nrVtWH6tESq1UP3QtmhPrfd4OSTJbd5wusMpKFP/3tQ=;
 b=YPkG68BAoYaltyxhrapw15sS9zA+cI4QjVqvAF9WKNmBY8uF3UYLYF0R1rKdjRg1iQ
 hSf/h3t8kmCEqNb29bx1xu1j6bch/DOvckfUVfdbmMZKXOjukt6a6pGGTbweg1akBETJ
 y0L5yQQ01gNbf8tWI7mthyoQtCbOQHB68V5jp6q4xFiU/wf8zwYTkNZOL1bdGrV0Ko5v
 qEwaQFrsoPDphbkw8gg9Xtd+uq3q88X5fk44WlvkxIQNM61zL5hXuLwwczQt9xgQ+zrE
 /c1UMDNwEmZZOH9gyjPWJdlMODvjppLeOPr+MGw1kckU0Ae6Z39hvq1Sie4CsQieUMWk
 zinA==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9MwjqZMptR15Uk0IwgJqgH+uyNZVFrv1F2yq5Jwpfz/yrZCG57jiACNkAjul/Y4LTg+UBmPglKq4=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyK9yXQR37UUuepmDAD6t3IGBs6vmzsk92yiPidtoRyN5bfys4l
 pU93eyZMRGPDKhr2yUwyBqj5N/X7dZtEpWtdi+Pov+8ztmhqRBfJRnL3LvjHh2IjNg5kTpY/wpS
 opvbDDR6EaQ4gfxGEqFjq0JJ3/DNaW1luzv8cIRAxdJh2HE1k+k7R43A5riauk8ZkwT4=
X-Gm-Gg: ASbGncs4EeEh/olwiWzmFENU2x6o8ZldZ4eIzTz7i9J+6n8sJHJjuXD/L9nWQE+njc5
 vvYTpjoMT4T6ougJz8Mo5i0c1VTNhuCXMkodBGHOCxSWAypsr9PpmMyEtgAnXT5Ejc6BJ0ZKmDP
 diAhqLG7pwg47KX76/+ifMve9Pep3jV9J8UiAqyKNW2KGmeb6OOqFyVJXALJXQS8oBTcu8URcPh
 SVFpLZoXfamTM/leuVNET5mZs9zSBw13OrtCQSGyDI5zzqH2hDtOeBeyeL+tqPypZVEZiZ6PgAe
 /jBwzJSbhwXxeuEAETHHejbp+fRRF35P2tzLfD8I/sEunrgwFGFMaErW60j+88TJXyeOVqtT24p
 lLi+M5Mx57DSKo+srpPeedbrV
X-Received: by 2002:ad4:5c82:0:b0:6f2:d45c:4a25 with SMTP id
 6a1803df08f44-6f4bfc9677emr2898536d6.41.1745442617980; 
 Wed, 23 Apr 2025 14:10:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEdN8j3WxVtC4umEdxXTXJ5CwdHR5VLabTb7DZpOIhVSxnxjki9ZdAxSPM6E0yzlSTACN9uGA==
X-Received: by 2002:ad4:5c82:0:b0:6f2:d45c:4a25 with SMTP id
 6a1803df08f44-6f4bfc9677emr2898126d6.41.1745442617513; 
 Wed, 23 Apr 2025 14:10:17 -0700 (PDT)
Received: from umbar.lan
 (2001-14ba-a0c3-3a00-264b-feff-fe8b-be8a.rev.dnainternet.fi.
 [2001:14ba:a0c3:3a00:264b:feff:fe8b:be8a])
 by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-54e7cb3987csm3852e87.59.2025.04.23.14.10.15
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 23 Apr 2025 14:10:16 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Date: Thu, 24 Apr 2025 00:10:00 +0300
Subject: [PATCH v2 04/33] drm/msm/dpu: inline _setup_dsc_ops()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-dpu-drop-features-v2-4-0a9a66a7b3a2@oss.qualcomm.com>
References: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
In-Reply-To: <20250424-dpu-drop-features-v2-0-0a9a66a7b3a2@oss.qualcomm.com>
To: Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Vinod Koul <vkoul@kernel.org>, Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Dmitry Baryshkov <lumag@kernel.org>, Dmitry Baryshkov <lumag@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1652;
 i=dmitry.baryshkov@oss.qualcomm.com; h=from:subject:message-id;
 bh=pmq5vBCUeBdexnqWIWU7CFkRwfE1mAJP/nnHW7qtnOo=;
 b=owGbwMvMwMXYbdNlx6SpcZXxtFoSQwZnuNb5wrJr2VbZ3pd+aopnix4TOpr1KLyK1dm40YaLo
 TjxYH0nozELAyMXg6yYIotPQcvUmE3JYR92TK2HGcTKBDKFgYtTACbC68/+V1bWfIVXc9pcFg+L
 DTGGD1+m+nowevZq3BG/rC/IsLS48/BzL7V+afY2xgXJ6l/Eqx8HX9nG4Tttgu7h5teiAbXHZyT
 H9XJIZi6O5+CTk89dvcjUMbTmid6K7xOMFq/U2PGgpMW8cWZWRajNKweWTqHfsy/qHFBxUvz5gF
 122px79fff+FlM0cor/fxhW/Oxa6sVzebOtuEx+6vWLJgntcFpXZ43b8qc7X8lnkw74naxoXB9n
 laH98IN75Z9PMrqVntY/Tzrzyf/IhdoG138tORHz5/qaCXPU8eOBwftvqIuLPBb7de6nNSXrzd3
 mtbPbJYyrW++JcXGmhcmX+7pvWqF6uSmmrsaSorP334CAA==
X-Developer-Key: i=dmitry.baryshkov@oss.qualcomm.com; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A
X-Proofpoint-ORIG-GUID: YK-WWS7sOIoSh20-lD2-_mwcY-M7O5f2
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNDIzMDE0MyBTYWx0ZWRfX8bAzw5AfXKob
 0u4/obaAQx8cw/Ny5rXVz7IEkmSVt87/UpyWTUP9z8XK+SgetZnpOziaohXOceaNl5FSQuqk/n8
 3Gm2sRI9p5AZXleHWbzLMkiPUic/aRGlncA1XVATNRIpmMVOYtNUr+PyFyz41o2g0aiqBB8TW8H
 DpHchhWNgpz2miGAEISvf7fzI2NtPeI5I5DBHf4V1hclaqfm5+EBB6wnrzNWjgovSioXjHWqtlR
 AOLucYxsUPTcRumS1bT0xAbFfczmZ0J0HkC1/kOKdXQ6KpBEHTYlvOr9jurB0lSlG4AKB+fjJoy
 HehlWqKcV8VfOS+/Cs4VHNWioj/cW3Pfw2DIp1uhyoIh0QdAwMPEWySQROEoyXwcTdheyc4uGVY
 NV45uv0zFUTvurtIhpFqfzadFGAJGsxeyVNrFfEcNjFAJU7SijYF6INdeAmkFlzXkLqndlPH
X-Authority-Analysis: v=2.4 cv=ELgG00ZC c=1 sm=1 tr=0 ts=6809573a cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=xqWC_Br6kY4A:10 a=IkcTkHD0fZMA:10
 a=XR8D0OoHHMoA:10 a=VwQbUJbxAAAA:8 a=KKAkSRfTAAAA:8 a=aBwJmt2KlYBR8C_sNNsA:9
 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-GUID: YK-WWS7sOIoSh20-lD2-_mwcY-M7O5f2
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.680,FMLib:17.12.80.40
 definitions=2025-04-23_11,2025-04-22_01,2025-02-21_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 phishscore=0 spamscore=0
 mlxscore=0 lowpriorityscore=0 priorityscore=1501 suspectscore=0
 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2504070000
 definitions=main-2504230143
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

From: Dmitry Baryshkov <lumag@kernel.org>

Inline the _setup_dsc_ops() function, it makes it easier to handle
different conditions involving DSC configuration.

Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c | 17 ++++++-----------
 1 file changed, 6 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
index cec6d4e8baec4d00282465cfd2885d365f835976..c7db917afd27e3daf1e8aad2ad671246bf6c8fbf 100644
--- a/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
+++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_hw_dsc.c
@@ -181,16 +181,6 @@ static void dpu_hw_dsc_bind_pingpong_blk(
 	DPU_REG_WRITE(c, dsc_ctl_offset, mux_cfg);
 }
 
-static void _setup_dsc_ops(struct dpu_hw_dsc_ops *ops,
-			   unsigned long cap)
-{
-	ops->dsc_disable = dpu_hw_dsc_disable;
-	ops->dsc_config = dpu_hw_dsc_config;
-	ops->dsc_config_thresh = dpu_hw_dsc_config_thresh;
-	if (cap & BIT(DPU_DSC_OUTPUT_CTRL))
-		ops->dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
-};
-
 /**
  * dpu_hw_dsc_init() - Initializes the DSC hw driver object.
  * @dev:  Corresponding device for devres management
@@ -213,7 +203,12 @@ struct dpu_hw_dsc *dpu_hw_dsc_init(struct drm_device *dev,
 
 	c->idx = cfg->id;
 	c->caps = cfg;
-	_setup_dsc_ops(&c->ops, c->caps->features);
+
+	c->ops.dsc_disable = dpu_hw_dsc_disable;
+	c->ops.dsc_config = dpu_hw_dsc_config;
+	c->ops.dsc_config_thresh = dpu_hw_dsc_config_thresh;
+	if (c->caps->features & BIT(DPU_DSC_OUTPUT_CTRL))
+		c->ops.dsc_bind_pingpong_blk = dpu_hw_dsc_bind_pingpong_blk;
 
 	return c;
 }

-- 
2.39.5

