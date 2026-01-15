Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id B1E8ED23807
	for <lists+freedreno@lfdr.de>; Thu, 15 Jan 2026 10:28:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 878F710E722;
	Thu, 15 Jan 2026 09:28:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Umef+Inq";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="hoXqbmzU";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 3EA5E10E71B
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:27 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60F6fxOk1991708
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=tf4dNBy/KLh
 WAf/5SoedaBN7FYWOkjyT2K3kQyqfwiU=; b=Umef+InqOBFJnu5Z+DcXMfZ8ZkI
 llgTB2EeNIeb/ZplW98yyTUzhpYVrIy9m0v3OXsZN7fMwDeCXC10ZE53QdvqIY31
 kS/Ar0b/Krd6+JITa+SWqjx+sL3NwMhlx/77ozO0inXGoh75HzuWiGjTi5BPUl6k
 VvQ9/KUcLXojbalqEsS+yOUjUb0xA+5yf0MAv96WNXZrseN5TX952KBvlUYRNONR
 refiu8rxvWbxH6MpdmnvrKu2fSICMwQdm1/WBGzi/9vw4vwuizUXEikbAMx8VcR3
 ueT1T6jffJkQRCp4bGmia+G1cu2SWoYMKPZSrhf5gH7Bde2WgFDPYHX1N4A==
Received: from mail-qv1-f69.google.com (mail-qv1-f69.google.com
 [209.85.219.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bpbdbudg6-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 09:28:26 +0000 (GMT)
Received: by mail-qv1-f69.google.com with SMTP id
 6a1803df08f44-88051c72070so16119516d6.1
 for <freedreno@lists.freedesktop.org>; Thu, 15 Jan 2026 01:28:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1768469306; x=1769074106;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=tf4dNBy/KLhWAf/5SoedaBN7FYWOkjyT2K3kQyqfwiU=;
 b=hoXqbmzUXO2Z47jl0zItWMaXTXq/SFn3IveM/gV03lGQSmnltSKOiLBVnXRkLOuIue
 1VTwDLQclMgRglGsdX5JJhTDz9XseZdVVK1e8mJtZOLfPCd7+MieF7FXL/tSnUmMKU6e
 +XJlvQo8pxQyZqeNkrhB0yi8Dmhypco5e9WrZ9LHyNajSmJ/HNDCHIdrhsAw/UlRu8SB
 zWjI87SBfYan9k4Op9mj17u8K/tAF5rNwySvFqL6mHOSWDQG83X31AoMXTZFR5LWuLFI
 8dTXWRCc4O//VP7lo3ixDGEf3LzqKxsLfeIScjRF4GOEMxhbZK5QfABVLjmAxeuwUIZS
 lZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1768469306; x=1769074106;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=tf4dNBy/KLhWAf/5SoedaBN7FYWOkjyT2K3kQyqfwiU=;
 b=dzEVdjhJaJp8G+VBMgkcOdJu7IOmAIqO4KAtpqfSqulc/bKr2l5UYzlwF43ibLSLt4
 YXggvV8D5Co4i+RdEyOFuHclQl9oEO0IZeoYZorPOJkj/H+0xJkjW+lxSnbRz034RBNf
 3sve5EQYCq/4vKkgSD4C4SAlLHyVSKlRDnBAdX4qXP5HI2wJdoTfvRbOz9vuyhkuEQIl
 gHFRICJBj5aCd8gn7/TpjtklDcpt1p3L/fOAkRMI36pG4sup9SAuCd3+u8ImmmWcbC0g
 /uswJVRUMibjoTESPVJTFjavGOPtqbh8xfNz1aWeU2gXWWXfuy7IGuuwyBl9SI+YMobO
 udWA==
X-Forwarded-Encrypted: i=1;
 AJvYcCU1sCvhsjVmjqTZtttUw4MHOO/mS21tnjIqpeCdymPnaVdV6bYORehpYEbHMnHFZ323RdEoPie+Ho8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywy1fvj5iHOf0ifVwMphnDY+YUO9PnlU6wnzLHa3JESAmgXmC+l
 QaVTHIE1cJRF/zpLfOpG21pwRjHIdAozbxX+htc71ZrtRYuYyc8nY+oc9r0qEDVsW/nOVc81AaZ
 FgKyYfyHA+xMIRBNpxLCVjEBjI2dFWJhoDjNQkQL3pn9XOTvjtNrIQTPNx875SKUvI6nDtKY=
X-Gm-Gg: AY/fxX7iiI+skl0PR/trHSbYzCgvsebgYe3Zfjn6W2FaViVmY3VjothJLeFsfx+vTye
 et18feOEvPxEing0Uts93A2ieMnEnEsKbleY1OullXI+NxqvH/x3DaRkb7Vn8Ge9whbBGafTVma
 dTKfgBq2aU1S8exHuYf7a9gaFQy4fg9x6BEhbsu5+E6j1/40PrrJFiSsJ7+EA9vZxF4dano+hz9
 d8wQR0IDR2F4/JOvOZjNzGnzvzZlDlWYpm4H2ahK8QDyIPxV6eDUf4+CF18dSyAL3TAxGwKdXwP
 H0B2ilflJdpMwA1ysFyFsypAQwmN6V3NyR8cePVbdDPU2Ek9uPeLBPSmsCgbny18a/JIh9HV9Uu
 ZDv2yXyT+1XyLgiFlbMrAGcSUnXFZeK/6rEZzlDgsJi+hISuM+dfTDPFbkzE9/m1iXew=
X-Received: by 2002:a05:6214:21e1:b0:88a:42b1:2607 with SMTP id
 6a1803df08f44-892743de419mr94011516d6.36.1768469305652; 
 Thu, 15 Jan 2026 01:28:25 -0800 (PST)
X-Received: by 2002:a05:6214:21e1:b0:88a:42b1:2607 with SMTP id
 6a1803df08f44-892743de419mr94011076d6.36.1768469305230; 
 Thu, 15 Jan 2026 01:28:25 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 6a1803df08f44-892668a2419sm64388416d6.30.2026.01.15.01.28.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 15 Jan 2026 01:28:24 -0800 (PST)
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
 aiqun.yu@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v6 02/12] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali
 DSI PHY
Date: Thu, 15 Jan 2026 17:27:39 +0800
Message-Id: <20260115092749.533-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
References: <20260115092749.533-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=NvncssdJ c=1 sm=1 tr=0 ts=6968b33a cx=c_pps
 a=wEM5vcRIz55oU/E2lInRtA==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=vv4ZX1vSqPLa4hud_FIA:9 a=OIgjcC2v60KrkQgK7BGD:22
X-Proofpoint-ORIG-GUID: 0GOeQW6lbRoagvywYatbOcp8ugC4e03j
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTE1MDA2NSBTYWx0ZWRfX27GP+D8CqZNO
 wufBcr59riiiqFDGtHb9qJWjIchBl/jQba516uwG/q6iA+6c7olrVqsIph27xfh5gW3BeIcVMMH
 t565HtSZOE5LsPNmVKjVlWeEC3ir9x4TiwFfq5oJksUtRfbjh6pZcTBM7q9mPTznfzx5QNLfP+9
 HjSfkh1BXkbd/iTFiIp52oZFbIvUCDMQ/hKbLNvLwcjUpVHFe91CMS5e/r2zNdneHrJtIZJlqFv
 oDCINt7b8gPy4b2GePdbJyasbDU3vlhyh4iRMztJoD4NgVTaRqqOtQ16lzHBZuCbEdmpLeW3A43
 ZJKgaTfP7R3AWNk9cY24iV/HubcyFKEg69ntUxOqYwd/4UapgJSZzlDLIKLjuoaY/TfEe6ybveO
 kY5kgj7kFqHtJuzzyhR8h6Nq5ej+6dZAY98mxNlwf5gEtvNHhF1lSZiuyBMng3nQJovqMvClNcI
 1rzTAHyuexDcCXM0Cwg==
X-Proofpoint-GUID: 0GOeQW6lbRoagvywYatbOcp8ugC4e03j
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2026-01-15_02,2026-01-14_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 phishscore=0 suspectscore=0 bulkscore=0 clxscore=1015
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2601150065
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

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Yuanjie Yang <yuanjie.yang@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
index 7a83387502da..9a9a6c4abf43 100644
--- a/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dsi-phy-7nm.yaml
@@ -19,6 +19,7 @@ properties:
           - enum:
               - qcom,dsi-phy-7nm
               - qcom,dsi-phy-7nm-8150
+              - qcom,kaanapali-dsi-phy-3nm
               - qcom,sa8775p-dsi-phy-5nm
               - qcom,sar2130p-dsi-phy-5nm
               - qcom,sc7280-dsi-phy-7nm
-- 
2.34.1

