Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 2BAC0C83882
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 07:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0E9A410E34F;
	Tue, 25 Nov 2025 06:48:50 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="A1D1Gbnx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="H7tuDTaK";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7028510E34F
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:48 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2h2bb1940317
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=sav2JkTpiNB
 huDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=; b=A1D1GbnxrdrPX9Y0bwmMKLo4dFs
 fFcNRG5yVSj3H47kfpiA86myucLWrR3KLKMz4tT+i21R+R3Z2NK+d/LgBTI30MIS
 VkE5tCBOxj50Vg2sbjAtmLWbFGCUbNff3EO4aN8xBgCh3Svq7vaGTB4R4AG/UTHk
 qIypC24v/Z9Fkgf0t5R4YL7feMMwv5YK9PDbMfHn2VIgxHzT8kXp9oEdAOWRqhMO
 fHVsz53H90rNSAxaee4HG0jhtwtH7DYSWEC1FZqQxbCLH2RQ08Y6jDH2oEpiC5pO
 fhqCZpLJm1dcxZeKUWrV3fo0Qv2HOZACnIwbqLLWJRsUmV/6GgknLvhUVZA==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amsst2b44-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:47 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8804b991a54so189321606d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 22:48:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053327; x=1764658127;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sav2JkTpiNBhuDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=;
 b=H7tuDTaKodt1NO7B2a3UCC+dWR+YuS8gUajcEfJnWCPKX7mXq5VbPD+TgHAvjlxasB
 HFJhfR0WJp0vI2f3efcCHWI0cBas78J0R8FhQnHsCJdte2//5pqgjkHpkpSynihnI0t2
 ibmua3l2E/5HPPhgg55LTLymRUpGC35HZk6pGRb6eDHZmgly4apRS5ucdvDLwAeNKxko
 z1zHVMhpUr+4XgbcC3ugqxhTzNTQMWyvUuMYLKyXMJuA4xkS/PIOEKcO8J6CuOY5nvaG
 7sLsQSepLTS6tx2p8FLSPs2Ges7hdT1IFu0Y/sFr0qVT2YuEQ6Igb7hxR6/OEG+iJGrJ
 bKGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053327; x=1764658127;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sav2JkTpiNBhuDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=;
 b=hCHocK/AsW78BDBkjOpRV1CxyIB9h8n4kxquaP3oPhuqKV2bPdtv3eg5W715npzfX9
 HQOaWB/9yV3SLJtyKpx0M54aq3L4ut6bvy3kOUeh0Rlw0iAk7wQBh64Yu+9eYAjo/axe
 GzdBV8GI8jlYP6aQz7v3tg/AeKcaS8OdqFTvAujZQJ17IgpTtQqmyBgOVRYqcW/YoKCR
 1G92E9JV9PcWL+tGLgJi6L7xwmldpgd2cd7yy/R7p02zJ0ZXXaIkyQu87dHjycMDkCRI
 0zvuDjXtcDF5CHum/2AUt+W6fLbFj7/qON4hYBi+QSq4pFkJiJGzkiKt81y9ZLwm4xt4
 hbSw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUGqweaUnSJ8Kj3IHG37DZzsL4d0jYy4LK/WBY7FXhhzDV5JtD1gaWN+czm0XOwD6WdCxyB4bo0UHQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxtTT1kXyX2i8/IUfTOt3d/0kk/x8C/yxaHWZz35dpSldv/IhPY
 eDqOlAD+98p1l4+a1zxjA1Xf8sr7wtcL41RPY1sK4md7B+JSHiBHaCQN5dYiQ4d/JglUv9wiThH
 lGlyc+Q4yLbVGVDDc4PLi1cqWsYtPIbqaUdREZmtndGSBejfR5l8IoHktLdZQPxhSlPyEKJM=
X-Gm-Gg: ASbGncvJXcqTl3WPGbNcqrvvANnv6Z+VwE6uebarQPiL63+BlkiYLKhMRC/F+e73OnT
 YIq9CL4k6izlWCl9+DZQa/BzvZB/2qTmtMafNaqf02teGCXKpnZ5kxRT7K/+YfYm1odG3xdynEN
 4YiA8cT4LQV655dqFbOqODWPPh/AFuT0gqfamwG3ru+XRq/DWFSaYE2g6yynAvOcCkA3Oj2N4Kt
 PLpHh3CnVTiv+iYf7AL4w9HZsPsKEI8XmF1+MMeVmW6jFzvhplyVJrX/79+OhVkMiSPKQtAuDyy
 8vSOdLcF1mC6zPimjj+MiH397cNY9Ul2+wOjZTMqSrO+Dof9Q2fUxKGNqTIxPHm2x/wsgdqxBh1
 3KttpcHL1kVPjllAZ1cEudmcHFacCcm80787QPI4NFBrvlLwKm2aod6vZbjT9CLaUVbDKRGc=
X-Received: by 2002:a05:622a:303:b0:4ee:15af:b934 with SMTP id
 d75a77b69052e-4ee58b0644bmr207487581cf.79.1764053327072; 
 Mon, 24 Nov 2025 22:48:47 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH71783JNIvrMRVHdGNlmiZuEs7Iy0PRRr9PWxHrAh8mFu1oAwTLpeENpq76fFhnnNwxFIx6g==
X-Received: by 2002:a05:622a:303:b0:4ee:15af:b934 with SMTP id
 d75a77b69052e-4ee58b0644bmr207486891cf.79.1764053325783; 
 Mon, 24 Nov 2025 22:48:45 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.48.37
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:48:45 -0800 (PST)
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
 tingwei.zhang@oss.qualcomm.com, aiqun.yu@oss.qualcomm.com
Subject: [PATCH v2 02/10] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali
 DSI PHY
Date: Tue, 25 Nov 2025 14:47:50 +0800
Message-Id: <20251125064758.7207-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=bM0b4f+Z c=1 sm=1 tr=0 ts=6925514f cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tNVMJPnUsVqa3Ada0T4A:9 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-GUID: yIpirbCLNkTkmu8rTE_5Yr7IQSNdFrU_
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX8c5NayHqA8Zg
 qxpk116+cbG4Iujv8Pydvc3udfNnVQko9/R/QIiEYZFV4UawGGywLM31i46BJj01ECnw6fvcneY
 2lNz2D0qrzc5FKOK+/+WdwyEgE8VlzsynqK1ZhfddtmI5qWsXNFkxZF+5wOngy7DfqTRWpCcOgM
 JYr2OeLtXZNQhJmw5BcEkPyQ+kfOdgy2v13DEGyJQJsAOBV/zIszDpj8b6LgQKWTTmzpPR+Sl2o
 Cb7CKZ3sKrTaRdjtnhaas2/vfb0s9mGA+hblfDLrrJAqIcUJRe8GXWQa3xyRq51eKb1MZ/vxo5g
 wXBNxNjhiMh/JuHM+UmkkXWK43eBVBgZuRgP/R4yWcERkZuNHuB//skcy+4DKDFjy1PYpzEEWk8
 lcG7Ni7+nPuzHIuUiAyZxupOtXLNtw==
X-Proofpoint-ORIG-GUID: yIpirbCLNkTkmu8rTE_5Yr7IQSNdFrU_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0 impostorscore=0
 bulkscore=0 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015
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

The DSI PHY registers on the Kaanapali platform differ from those
on SM8750. So add DSI PHY for Kaanapali to compatible these changes.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 1ca820a500b7..a6e044eed3df 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -17,6 +17,7 @@ properties:
     enum:
       - qcom,dsi-phy-7nm
       - qcom,dsi-phy-7nm-8150
+      - qcom,kaanapali-dsi-phy-3nm
       - qcom,sa8775p-dsi-phy-5nm
       - qcom,sar2130p-dsi-phy-5nm
       - qcom,sc7280-dsi-phy-7nm
-- 
2.34.1

