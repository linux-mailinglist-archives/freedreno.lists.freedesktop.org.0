Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 1D424CBCF90
	for <lists+freedreno@lfdr.de>; Mon, 15 Dec 2025 09:40:09 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 434D110E39E;
	Mon, 15 Dec 2025 08:40:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="GLQP+rnH";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="bhR6kRRc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7620110E3A1
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:05 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BF8e2ue2670834
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=sav2JkTpiNB
 huDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=; b=GLQP+rnHjxmM4Gu3RrUAsJrjuj1
 WpDKzVpDAvzh8NeF/pp58Wa3J3hkeqYZWI+ZUPRiBWGhppANJOF8oxGUCJeGodO/
 ii6SF+2m7/Qa4HfkDOjrv0jPGvzQQErzm7uzvEXSJ74TXf4uvBLDCq/P8R3Np0SE
 5x0GS5Md0rqELXQ2YFv7P5Lo8GANQaSJvjP6LB+blyGfg9QNnRlCOHikrbQ9UOTz
 Xc/209FbIwXf1EzLi5wuw+8coxbI1r++iZI5l5z7cl1WYw/nQWKQtyY3yvXqxHC5
 cOIlAR2isRBB5f0gk0nTYR4h4v73IGSA6UP3rN51xNGEplYv/iERt1mF05w==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b119akrkp-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 08:40:04 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88a3822c06bso15384856d6.2
 for <freedreno@lists.freedesktop.org>; Mon, 15 Dec 2025 00:40:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1765788004; x=1766392804;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=sav2JkTpiNBhuDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=;
 b=bhR6kRRcxWBFGM9eY+YyIicQy8+8KzsuiLXVbkGsvoutAHPXkcHnF3C0tpb012ak4r
 XXpXzQmrhuxIYc8c5Lhrhwl5NVSZ/3uatmAflIHVj/wX+t8wM8By9YDR3tz5bJFwaxsQ
 dywZCg3Mg6rv1aXNz0hkU2u2B4PEBEIxUA/zHTRKz+lnFMXx5NZr2sVIQUzLsFu6cQ8S
 p+uv9Pkoe3PEHztIgPd0XVLmpJ6CylZ0IBFbO34JuuUxT5mcd80HYgEtqRytbEXtwkBV
 SkX7n9jpI74LoJNSfsZYU/WxKcW/Bmi4riou06ApuZQdKUVKSqDNZBYg7IYXa/26H+MS
 XanA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1765788004; x=1766392804;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=sav2JkTpiNBhuDhe1bdSzqFnq6opp4D6AgKKwiZEkUs=;
 b=ssoFW0iv/14D90fvmHgqpfhMPR1Kt+HUzwKKaetHiOc2CwSg84ze517Eoo/fOL8plz
 yxXLY/lgHaGQzU8xSNb+OQYBVUMX7pVZUQb+nRvhsY3HM7IDP1fUhdWCZrEhYMiEdIQJ
 C3hZFTSTABMQ2SnLHGyKlqUnDL88l+VkCm5zy2oc7YUiB7iXPwEryTbgcE7ZXSdpbSgt
 aVmtfyp0e3ZbDhwE2JKVXB83NpXkw3g7JWZdkX44G7X3m+EZjLM/L153jm30itnajJrx
 /IRDHqvNTcumijlMVS4gkb9csZJLeANTifp/hzSrydMjYZpxN42IPr0mxAX+3BWgEoue
 dA+A==
X-Forwarded-Encrypted: i=1;
 AJvYcCXthSdZ3nfz0SLt2oWu+beVDdfuawKm86ZUgxTVyC+zaexrKqZFrxSnuCysnf+jQSItUsYLacjCbsQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yyg72JXA2vIjsF1iL5Gy4CfswdZLV3rIHtGgIoxFJ2F5Ul2ITZw
 rOe8KVDPBdyhXnZBY+lO1o/8EbNGvNu6rlZPEpcMX/dzQz39tZGFh+2UW1JoYmZ4ZV7fSyGVOuS
 g8KTzJXLAdZpaUBdo28LbD0H5qDMXhXMoKOwDsbmtSdUsPgVFVAMs1e1CdQHVbdz7zf8XArs=
X-Gm-Gg: AY/fxX7TO9py/hYj8YJNAT7TWqx0JvpuKde3CITQYjO16hvbOB/echYa7b9rdE6R3NC
 z35kd748D3Rhgk61j/RHK7MJAwJKsyn6Fzk4+7ov9V3/TYpIQFOXlJyDGiSa6xkbwlnXHiHlrm5
 WxNsScuzdZN+ajT7nQcMOpJCX1Tdc7tHaNyoZsNFkvq+G3MwhdCfeuds5C1KBwD+/X7FcLqrctp
 NG32wZIsc3fxDxHMo+oM8+m4xHKXF/dOMVSDEAI+CmNTP9psqNPKWLlB9zD2sJfTrNnaG1CLatL
 /J4VphSdKz7Vk9enxZTmedC+gc4jdWD6Hny9al/m928F57p4h0VzXsNDkzm2Vha4lR4DL0tvcVn
 2Qwr+OHrYJnRYUEWpGp0M/eO2MdXAI0ewGjr9SHuPoy3CJQnwFFRhikeJXXwuGeubkzo=
X-Received: by 2002:a05:622a:59c4:b0:4ed:1bba:f935 with SMTP id
 d75a77b69052e-4f1d05e1009mr142361801cf.57.1765788004061; 
 Mon, 15 Dec 2025 00:40:04 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFjYobfDnCO0D7Ol1hDSoFkMn3Lh3k7Wfl96wThmTVmw+iAn7yB3AV0vwzn0Pg3esUZljPQiw==
X-Received: by 2002:a05:622a:59c4:b0:4ed:1bba:f935 with SMTP id
 d75a77b69052e-4f1d05e1009mr142361631cf.57.1765788003667; 
 Mon, 15 Dec 2025 00:40:03 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f1bd6b50afsm90557971cf.21.2025.12.15.00.39.56
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 15 Dec 2025 00:40:03 -0800 (PST)
From: yuanjie yang <yuanjie.yang@oss.qualcomm.com>
To: robin.clark@oss.qualcomm.com, lumag@kernel.org, abhinav.kumar@linux.dev,
 jesszhan0024@gmail.com, sean@poorly.run, marijn.suijten@somainline.org,
 airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
 mripard@kernel.org, tzimmermann@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, neil.armstrong@linaro.org,
 yongxing.mou@oss.qualcomm.com, konrad.dybcio@oss.qualcomm.com
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, tingwei.zhang@oss.qualcomm.com,
 aiqun.yu@oss.qualcomm.com
Subject: [PATCH v3 02/11] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali
 DSI PHY
Date: Mon, 15 Dec 2025 16:38:45 +0800
Message-Id: <20251215083854.577-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
References: <20251215083854.577-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=ftPRpV4f c=1 sm=1 tr=0 ts=693fc965 cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tNVMJPnUsVqa3Ada0T4A:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjE1MDA3MSBTYWx0ZWRfXz3v7iHXv/P6m
 0xpzKMvhXGyR0PSSIKgNJAY6nVlI+sa/YlC3gSR4o2paH4PgJgdGZ7UYBBhPWJfLBe3O5F2sReC
 Ng81hWW9sMJOhtVD77s89uW4wnu/Uh7BS6C9v5+Hak87Nlmyz5P3g1JOuLhTalrM4ZBL+R4vpsB
 F0M9uBrxJ/JaEG9yoKUt4jYRZtkHmHivVBHASvNdUaehlOfEPRtAvoRrQmiv6/tL1qIMbcUFiZp
 c26KwdQI3NVzznnxWsq9SIMQ8aeMpfFxv/5xpajrC/1SqA5pB68CHaAM7DMRxCRMk0XmFQ/CxwK
 BpRDPCAVDlGAs2DDb9YksropyH99sXJqenk6yeV7jNyte6DS+bzCWtwq/xC16dAnnAzxtV6nmaV
 ECTcP12AGHEfQRtKbMKVxEB7OMELuA==
X-Proofpoint-ORIG-GUID: T8pMauo10WWMEIHb0OXjc0Z6pAHKrvTI
X-Proofpoint-GUID: T8pMauo10WWMEIHb0OXjc0Z6pAHKrvTI
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-15_01,2025-12-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 clxscore=1015 bulkscore=0 malwarescore=0 impostorscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2512150071
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

