Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 39F96D01AED
	for <lists+freedreno@lfdr.de>; Thu, 08 Jan 2026 09:57:38 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 0DF5C10E6B0;
	Thu,  8 Jan 2026 08:57:37 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="EEBYl6Kv";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="HH1WFIyT";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A795D10E6B1
 for <freedreno@lists.freedesktop.org>; Thu,  8 Jan 2026 08:57:34 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 6081DvQR877533
 for <freedreno@lists.freedesktop.org>; Thu, 8 Jan 2026 08:57:33 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Z3dXAwZWQrX
 iznkoQcO7REoUwgPXToMeXoe6XzLEAy4=; b=EEBYl6KvoIoXRs1gtt7AnVm2KvL
 7QB60ZZCQAY83/RkQikpbqT81WdjFOfaIi7maOlknf8JZfjxJMb2b7ksj+uE75uz
 6I8fKvDwDahSxLqemigUlAp35wQ5TVKUd7w34TrF//eFoSUlYz4G9cnXj2UaV8dL
 ZuGA3mdCM1AdozYJWEPCTMom/BAqf3+Es23IywaReZIeCOkM9gKTEbHAX2gd9SAj
 7gjsxVWaPhdw2XNlWfdABnnXSF8u4egnN1M2wZBjdNN+Q3++0nk0BtBCBc8FHZJx
 CExANVrHuHbRpr1Fjn94ATa+8Ak2WDHO2lnugqQXYC4K3up3alM3yFu35Cw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com
 [209.85.219.70])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bj2r318fh-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 08:57:33 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id
 6a1803df08f44-8887c0d3074so69482166d6.2
 for <freedreno@lists.freedesktop.org>; Thu, 08 Jan 2026 00:57:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1767862653; x=1768467453;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=HH1WFIyTa9U/troG51tonfVztSSFS2ifFdeOFAz6h9R17rLzDFhZHfAPmL41pVbCI3
 xaXL6YvU3bPb5XxfOaJ7P4s52Uk4nB7OBonhZIs0BrM/+UstGgZJNZhNpv0YagrfYmXw
 MmrvdLVaU/M5ZRVpuUfqvkdwyUPhyX3A+tzC1eq2LJwEqXan2dUHODUCxHPGaTMFixK7
 8Xf0FcR/ycKa5jGyQnowbMDGdQlF4V/IlfP2QG6Yf8e5gqr5YMmUsaboEAj8FfvAWZXn
 Hpoy4d4YNOICWLroKxvJ3BYgTd/Bbt1lZtnRx4Ajr/AyCT4t8fv7h3sSSYKGDbwI3yuD
 xMvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1767862653; x=1768467453;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=mv21ryxtoiA3zItlVYsSmO4LOApGsItt6Q9HgQCsPZeQz0qedQ/Hb1mVErrtp7JlWA
 KbDqwtPSjTJjszws5IbxVHVbFNzlRD4cmK90lxViKI6MJMJogwThpMKHpKwPsSqjaFzl
 HfmzeCC8qjIdopb6f8nbcgmFSvBoUK5pamMcv87H6q2uWVu9vOwTfx96P1wfQlCOXXtz
 sm75+u8wkUhWTZVmhP28tzvhaa+fix8B47JPqr3S+awsHGgj/jaRH6wLOPFeQ65nkNSj
 aIDTC5LpPd9pvwtEjH0a/j8G8gvrl0QSYjiZAV7FUQr4ZXVlg+Es1aydstM4ECiMcCD6
 97jQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWxknAxoZCZSRNUUVly9azQ1eUb6OLc+olKAEZvZ11zM+GZB58iXmwS2DdcC33dZLwItbjYZZnpxOo=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxY6PNMK7tKFmlm5NrR0ERMmTPp9SU0v+r6et+YnxAMzrseP1af
 oOSpePN40sbcLAh4VNxm0gqikEPdTHQ4nAH3V30SKf1BKtMqQqBL7N2J2Hhvc6dMEZzx99ItJDD
 xuYOJ/ZiGVoZLTcgBdOxtcFOlqlv4Tk3P+4PiMnQh7WV1O/ANkztodUSmi/lGFfGFJoWs7SQ=
X-Gm-Gg: AY/fxX4MdX/r5K8kXjCNsw5LMFnBDJp5ipbiKf0t6T7hjuYhomUdhEhvF6ppoC4uNi5
 TlNwza+TojOY2c7P6CN+HHHK4tf4i232RFOCbMSjNwGcBxu2o4C+tpU/Ywcy8493kR8M/ToV/gE
 Y+9xpT7I3Cv4GtOyV5oWnBAWzpqAa8is7NXrLa/d78OoJytbixK+gdhGRoZqdVqK6gW4TzPq0yt
 2iJ1pvaSKTCFWFPkjsEccgsZfXcr0KlBv4PnjECfahofviObd86TQjcja49SSVT/iMRHj20dglR
 mYaTFQ8tVBsd3oPW/c/4TVYd2MFPth5h2p+irPSCCEGtM1PA7OA7SdHbL5VfSSTbTZl4wAnaDjv
 nkeUljsM8jh8WYhHsOXxZvNrmDZLWBl0g8MyqEnVt8jpFt8S1vlYZvBsgqzjRZNJvkU8=
X-Received: by 2002:a05:6214:4113:b0:890:8244:1eac with SMTP id
 6a1803df08f44-890841af6d4mr74582926d6.29.1767862653061; 
 Thu, 08 Jan 2026 00:57:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IE/Evr+b0nr4KGzD5p/6Wv1eoS+TOm0VkfP2EcZzyUCS11BVsI7wQRinfhjGKtU/zIVgywDBw==
X-Received: by 2002:a05:6214:4113:b0:890:8244:1eac with SMTP id
 6a1803df08f44-890841af6d4mr74582696d6.29.1767862652628; 
 Thu, 08 Jan 2026 00:57:32 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-890770cc7eesm49680326d6.2.2026.01.08.00.57.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 08 Jan 2026 00:57:32 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, jesszhan0024@gmail.com,
 sean@poorly.run, marijn.suijten@somainline.org, airlied@gmail.com,
 simona@ffwll.ch, maarten.lankhorst@linux.intel.com, mripard@kernel.org,
 tzimmermann@suse.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, neil.armstrong@linaro.org,
 konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com
Subject: [PATCH v5 01/12] dt-bindings: display/msm: qcom,
 kaanapali-dpu: Add Kaanapali
Date: Thu,  8 Jan 2026 16:56:48 +0800
Message-Id: <20260108085659.790-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
References: <20260108085659.790-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTA4MDA1OSBTYWx0ZWRfX1Vw2jka79y2y
 q+oyIbdtIQgI0ITx7lZTNz9QXBNHPZvZGrDEufthEb4W7toTaBpBYpbIFQFuF2E+RIG9xPPGFuI
 WATCeY7eH79t2ezbfUf2jpoZLq3dC6CTMGmgf26WjVMxbZbZJCeJNRKyExVQa/Je+jVRsWCdWh3
 ohm4aQed68NTRU5xJI7bAfnyOE5lbgGsJoUwOdGHAJP5IUJD8zibOhh6k4czqQK/joVrKLe2x6T
 nbFLBuM/F437gMxYRcpOTeVnELhoY6SWjWTd6iiZqoHVk5NXXSQtjkrtORnZyuruClih4MJj6GK
 3UUNT4AdwmLJqzzSh0/jWhkgQGYAJDXX+ogKth2d35P8gM3bNrBLAohNqST+2TNFmJbyJj/b46z
 wk9dvq4r98fgr1PvdR2ObjFVxhEIAdphubuqBgQOn2hD92oSZnzhdO/JZFVtITkudx8OryEyker
 jHz9vAeEPdngt7pkYpA==
X-Proofpoint-ORIG-GUID: ZzpmZ-kECHn99FUxq3PaoiE_aSfVeE3E
X-Proofpoint-GUID: ZzpmZ-kECHn99FUxq3PaoiE_aSfVeE3E
X-Authority-Analysis: v=2.4 cv=S4nUAYsP c=1 sm=1 tr=0 ts=695f717d cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-08_01,2026-01-07_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 clxscore=1015 priorityscore=1501 spamscore=0
 lowpriorityscore=0 adultscore=0 phishscore=0 bulkscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2601080059
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

Add DPU version 13.0 for Qualcomm Kaanapali Soc. The Kaanapali
DPU and SM8750 have significant differences, including additions
and removals of registers, as well as changes in register addresses.

Acked-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml         | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
index fe296e3186d0..e29c4687c3a2 100644
--- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
+++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
@@ -16,6 +16,7 @@ properties:
     oneOf:
       - enum:
           - qcom,glymur-dpu
+          - qcom,kaanapali-dpu
           - qcom,sa8775p-dpu
           - qcom,sm8650-dpu
           - qcom,sm8750-dpu
-- 
2.34.1

