Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 963FBC8388B
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 07:49:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1019210E350;
	Tue, 25 Nov 2025 06:48:57 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Cz5ijLBl";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="ThtR/RPs";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 072D010E351
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:55 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2gjpH2216867
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:55 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=OqlJLDbVw4T
 n78JJhjxStsJzAZqGZdEBuegjg/h0GSI=; b=Cz5ijLBlzgvJwMtMyOD7NHXmfyX
 Hqgjs1vyo3visScVH+P7oI4AnXwJkUTFxeQqjhNSZA1tLLIF7fmQ7Hct0Iywdd3/
 7hUKvCmtiIX8IG2Heu7ltdBRubzoAkPvaZTrIIRGpnTm0kQWS4L3M7CzK0Jw13qA
 TZpyp4xNxAGS2K7iJ5xzKVr0xUObZ9HIQPoYzNMRgTa1J1ZuFq7nhQkbkUKb342r
 MzxfZMwhEgqC3YSKoxdpyRwm5X1CtiWLFeusJSBTVOWmvlSi8bR2p2JYZTG/LzG5
 AvigkOvgUnYDIXvDvPz4SFhbP6WXFvYuQI8dIOGDrfXmDMnOd0SOfvnQwxQ==
Received: from mail-qt1-f199.google.com (mail-qt1-f199.google.com
 [209.85.160.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amsk6add4-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:48:55 +0000 (GMT)
Received: by mail-qt1-f199.google.com with SMTP id
 d75a77b69052e-4ed6e701d26so121938611cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 22:48:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764053334; x=1764658134;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=OqlJLDbVw4Tn78JJhjxStsJzAZqGZdEBuegjg/h0GSI=;
 b=ThtR/RPs9f21Mb85NkMhn8WuYiqYKE6ahJhiEG5ggekztF4yg12sugfIqJ0/+Umt/V
 1+x1aYxB1b3VxER7/MHaE6gHoJN8rURAix8s+XVNl79bZL2Pk1KCqL8JqklhDUrPsfld
 o2eFsQmSzKrQ4JrnsNKwGdMcujPo9HLY55Dm8Hm24m7r70+YG0L1GB8RtPGAmxXqJtqX
 +zxXDt5zj4j9ZgcjcIUE7IkAyKa4VikjSh5QB4Gj9qv6ChgI1n1rtPXRARbKCkzzF0X2
 RkxpUIlqOlkEttHH4Cy9tJRB+aC+0tu5ugKouSJvlQ+4VS9fxcr2kiqY2xoHsDSHQwMJ
 PaRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764053334; x=1764658134;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=OqlJLDbVw4Tn78JJhjxStsJzAZqGZdEBuegjg/h0GSI=;
 b=rlB7BdKBmlEc1o0jKSavDaWa1xd0IGCLVSPzETz6ek5kZi5r6AtT++vJnMCJDJ7i2y
 0pU+Mn4Vkkx9G82HWP+/y4Wn4RUX7lnoCoW1k4nE+qOlwjIGEJd8J3CTZidh4nZ86TLg
 Cr91B54AsFnELW722rCKwwfWFDoPN3Dh0b5DZZYFY85eyIh1GcexYUdt7EYlLEAvfgx3
 fQBekoN6kKqwyfSe/fpgo5NE1jPJADPfdNWzZ/4i+TuSxR1WZaTNimzi0ehxB7Oxi/kL
 UmriuxECkk/AWQlAElyANNKNz+0cT0zjAB48j3OAaHkCIKLpr7fCduF3UXKrZEwpGMkx
 zfPg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUE85T9pyFUjLfGB9LsyB7RHfe/Br/K/qvFkM0b/6gbQoMOAUOm8z7JwdDUabPiyMXBKvZTDwx1QtE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwoQ+LLndOAak/HWesGq7OBPXnvooLS4icRdd23kAkxJ6G2knAl
 Q7SEkfRjCh9cMjbecFOhI28qSqfrESI7B5ofC7P9afwrMi/vz4BEql0ytP+7HgfiL8NdqJAddfH
 QKaoGv++7K65IdlmAosiONe6kd8flzjedjQ9jvL67Y6HHEQnvuj5Gd98Qeqix3/OnGnvL2yg=
X-Gm-Gg: ASbGncvHqjknICXyANmRPShzvUaqhExa6oGfTZzmBLJh/twOjI2gA25nqCUyEiH/IQW
 OZoAcPeU52IVrud6iMvpqciKv0OtDJu62TwNO2Q1GBgufrd2O6f5/XiDpnpgRt1QlZh3X669PKe
 SM3Envm5PIm2vQpsVBkRTY2ZZ8Wmq6ff34TZh76gnrdzsT9BDKuUm8+KJ5Sc9NuJESDQ4XYnTe4
 XwGnpHluXTlv+D8JKfudjD3TPgBx290WBwaUu7AIWjAlhjlkI1QKuzAUhH4DViH3w2UPpXEgx29
 gjnn34R0pqodTm/Ld8umu0y5Z0F6ElKND3E04niw0Fp/TdMNeBmuhWVjyJrVZipIbcwuCINaczt
 +7i+0pA+Zqo6QQ9dF5t8cPmLRtQoxwtIt/9O+xPEMG0J8NiUJwy8Amvc73eETegZArByOGeo=
X-Received: by 2002:a05:622a:1aa3:b0:4eb:a0aa:28e with SMTP id
 d75a77b69052e-4ee58936cb6mr191919571cf.64.1764053334591; 
 Mon, 24 Nov 2025 22:48:54 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFaU+K791QjFnobNp/KGKhqyUiww2Up4fYHtIc8c49z3Godcl3Fl5+c/+96X7shmR8C6UrmpA==
X-Received: by 2002:a05:622a:1aa3:b0:4eb:a0aa:28e with SMTP id
 d75a77b69052e-4ee58936cb6mr191919251cf.64.1764053334173; 
 Mon, 24 Nov 2025 22:48:54 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48e3edb9sm100645971cf.22.2025.11.24.22.48.46
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 24 Nov 2025 22:48:53 -0800 (PST)
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
Subject: [PATCH v2 03/10] dt-bindings: display/msm: dsi-controller-main: Add
 Kaanapali
Date: Tue, 25 Nov 2025 14:47:51 +0800
Message-Id: <20251125064758.7207-4-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
References: <20251125064758.7207-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: XhyTSz-XZAt2o5Z3INHs8ZnZXDgq4L-Z
X-Proofpoint-ORIG-GUID: XhyTSz-XZAt2o5Z3INHs8ZnZXDgq4L-Z
X-Authority-Analysis: v=2.4 cv=WL5yn3sR c=1 sm=1 tr=0 ts=69255157 cx=c_pps
 a=WeENfcodrlLV9YRTxbY/uA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=NRHHWUy0EX9jfUzwrTwA:9 a=kacYvNCVWA4VmyqE58fU:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1NCBTYWx0ZWRfX35BaoPb2xUTP
 cS10jY5apbyg9xn7pu6LSGc0vY5fE4SNhf/EYeRqN/opZsG3vXg0u6jsBfuVAkpa2bI/QtWAoNg
 b6lhqzjuV/1hcAIbfJUCHr8t9nFg2pD+SN2KbzsVxr2gmnFRiZ/XIf5kkxpluzsZmS8BD1aGLVF
 NQo+BKCWSwv5skq2MIFE4+LkaX2V6XPxvQsBTLNkzJqQzvdiKKDbTOztJYhvmY+C6PLj+jueo9l
 SrXeQTEqZK4BO/ggU5YBW8O/XvngCPbZ+oh72l2aPTdul2FtEh8KM51VS7VmiTR3chVINUoFmQc
 V2ctfS18ibEyL4FPsi5UfVDomGtn5pT7k7rY3idCxCkRPT6Zu2CS5FrQWfLDOcoCvBrcSMuN1RG
 k+ojHSfwB3yOUgl+LdMdXL324l7GOg==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 clxscore=1015 impostorscore=0 suspectscore=0 malwarescore=0 spamscore=0
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

The DSI registers on the Kaanapali platform differ from those on SM8750.
So add DSI for Kaanapali to compatible these changes.

Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 .../devicetree/bindings/display/msm/dsi-controller-main.yaml    | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
index 4400d4cce072..536ebf331828 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-controller-main.yaml
@@ -15,6 +15,7 @@ properties:
       - items:
           - enum:
               - qcom,apq8064-dsi-ctrl
+              - qcom,kaanapali-dsi-ctrl
               - qcom,msm8226-dsi-ctrl
               - qcom,msm8916-dsi-ctrl
               - qcom,msm8953-dsi-ctrl
@@ -369,6 +370,7 @@ allOf:
         compatible:
           contains:
             enum:
+              - qcom,kaanapali-dsi-ctrl
               - qcom,sm8750-dsi-ctrl
     then:
       properties:
-- 
2.34.1

