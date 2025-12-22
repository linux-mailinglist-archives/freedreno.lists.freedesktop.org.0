Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id A0A67CD58CC
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 11:24:37 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 764AF10E34C;
	Mon, 22 Dec 2025 10:24:36 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="jsUW0NRG";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="Z8DCfMxo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9BA1210E34C
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:34 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM948b53964176
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:34 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=c8PWEb0m8sW
 dkLPVou1pl3oui9KwXqV++4vSVkw9qLM=; b=jsUW0NRG8L6RSidvL9aT/GcX7FE
 NsATauuEWdt1CMmkxD03VmAR+dI69fU5sCT+O7XzEXjNu9pDVYoQ1rWW2M1Drouo
 tvAU0WUCzgL2MFjU4Py6512Qnc5zkwDP2w1kSH0Xa5WrFXdS8RArb9UmG/RKgcwg
 0dKpuCdLlikRftfQLlQwv2tpoBAv1MT9zjcoVIUgRnN9rQwhgLTmH/Yk5wXT8/9V
 ZnebsPW6MFl9y4V5R0S5P4q/reQ4KaYUbiGA80hf1Kt7wt7hqAKDXND5alikaR93
 E9fDYZI47VAIDvVUxANg5Y1eTh2fAz8dIHRf8k2st44kQTLs8u0J/rzEDSg==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b6vk6hcxf-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:34 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ee0995fa85so110660351cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 02:24:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766399073; x=1767003873;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=c8PWEb0m8sWdkLPVou1pl3oui9KwXqV++4vSVkw9qLM=;
 b=Z8DCfMxo+uzu2tdF7UFyaB3mEK529voSt8+3dBrVoyrmeLpPO6RMHRnVR2wfdxcWuG
 IIPD6TEdLqWRtCAZJXbHMwNTS1jnUmr2YtUIny3VBwopI1DYaU5p0t/2+qkLz5DwlFxL
 sZC2y/PMKy7JIqTYqNt4uMhpfgiPaOvePq446FiED8vz2jIufekBGqzRwdNWW2pgmwV1
 dahc3PqU6Uw26eg/IK+WADKJnnkFgsh4vDAzWwJKKsZuRX0r943K/ZXvYooS0LW6v7kC
 j4NHBvnBgAsOJNj/hq/EX9+0C+/ApxVgpk97qjuljqJGXbrqvWUnWQ9yiWpYsLxlEbC+
 pTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399073; x=1767003873;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=c8PWEb0m8sWdkLPVou1pl3oui9KwXqV++4vSVkw9qLM=;
 b=Cvk0XbfjAQH3viiG7u63b8mv897vB3ImOrAi5XFRg3Ncrijk0r2MuqFh31885perTT
 hhb9Cs2OBPd5uC9AKShq2qLbq9JSuWaT/pLsMw9IhNdUqkBD6kyqfNgz/t6XEJ0xrlnU
 Xl9cD4r6VtfcGo3bppwf1oAb8Lv/ckzuTL3ONUee/Xz4IR3YI2RWaw38JsfAa5MKK8WM
 n7UyXmOLex2xbzIT3qJPSdyJoOKiWXCh4eVfbUUckb4IFWWqpcvcASE0YP+QGl9Ektf3
 zZbapYU47K9xTI7b9EGzh4FsXBnhahAjX0LyShPCFYJn5yIhRLNgdVEgFA6X6HcweLHs
 5VjQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCXVi5E1QPkulJ17u9XWjpzGly8BlWdzk9RMXgbHb1GjLd1Mv1rRg+u+FaYyFffXE0q8f8Q6+Glhfqw=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwGzlPdsWTEaUawDyUjm/p85gc1iZicZlz1sz7IAOoo0RQyuW2
 KWgGk9x4M/hHhw4g8qstncYPqLFh27nbA97eupegznZXBE2HqHEQoNz0W3NKf7/9PVmCE4OqteR
 vECXsCBykO3ChGMPO2/h9lFONYuB0TDuueEFRD4+tXRa+eIXHZsvc4xYz0fUHfKCAutkYVH0=
X-Gm-Gg: AY/fxX6K3Vf4LIKKOCuIdZsWbIe/6tR82rp8zUNG6LflcuvnEvuwQIvu7HY80lEQ+F1
 eG3MmdyLVGmg4veFy57sWT2o1FNFcZD7gXwyq6aTt/JVeqVM0NnpU6omdbpQZZdtJ0U1nCSA+NW
 3mTEzZ9bz/6GHAY0IwWL5O/qDm0iprALz2/Yf912B+dgZPEy/KNoZikl56BsUFFabMoxYaevT6b
 2j9SUcjTkPPtKtyKFioSqIFkwsODjBkqElSxuKr91W/oS9YBhzkcAV9UCsthYPj8JRH+1RhIzvj
 YI+22wE7zxeXzWDEC8fLMmDPAPHAbQfAmRWUa1+S9glnONSVN9/r8kllRJPxQa8gsx2AZJvuFLu
 FxcFeMjIJ8Ss4KC36zCfdGCHCg8TmRwYmeQ2B+MU4EbpQz3p20wizvYOiQJ13wYVorUw=
X-Received: by 2002:ac8:5cca:0:b0:4f1:b948:ccd8 with SMTP id
 d75a77b69052e-4f4abcd2a84mr158209601cf.18.1766399073282; 
 Mon, 22 Dec 2025 02:24:33 -0800 (PST)
X-Google-Smtp-Source: AGHT+IFMKhW9p2zaejQR4//btV0xBbTVxZJY8S5L7LeEZtBFmS63nxS/a27xorqAWzcKScdu69tvIQ==
X-Received: by 2002:ac8:5cca:0:b0:4f1:b948:ccd8 with SMTP id
 d75a77b69052e-4f4abcd2a84mr158209301cf.18.1766399072787; 
 Mon, 22 Dec 2025 02:24:32 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.25
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 02:24:32 -0800 (PST)
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
Subject: [PATCH v4 02/11] dt-bindings: display/msm: dsi-phy-7nm: Add Kaanapali
 DSI PHY
Date: Mon, 22 Dec 2025 18:23:51 +0800
Message-Id: <20251222102400.1109-3-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: LPa-zqQCfwbnzM4P5O16ijH1W-hKpd0J
X-Authority-Analysis: v=2.4 cv=cuuWUl4i c=1 sm=1 tr=0 ts=69491c62 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=tNVMJPnUsVqa3Ada0T4A:9 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX0ehuwVWv8vl9
 ZRwyxZHNnMVWRC7OAyYFfkA5NLdtaGwQZCpb/sgXY2pIqBdtcc2xXhsiqllqOEhJ2auXFF5Sbd9
 QVYlHYjQYMaxAo0KA+QaNDk/VS93LD08/z9BDuaycZlc6gYn7GT4v3+lqShVylaJlx1/Kvd2CVb
 CIBrfXCJlurFSIe1NB1FsH6cgKy1qTFxIJq3VwDoULsPB5LyAtJw15TRi8iT7LhIm8Zvin4G10o
 UMRm7Aj67vAxH4PnEzTqpjXVKaefolTG6PWTxfuVuRzzYdiXrXRAb3E91SdG75tvEWEYZAm85cX
 sbKnVsJJCcZbjtWVPsFrSeK4PjH4W3jlqPQFmxQDoH2uQpaWVu7JPzv6LkAuZXxISClAaR7jP1U
 RMTKNSEaihWYlsfMIEP4N3+BolAzPRoygdY2+zSGRlvxSYo/HT+i4UqGyQfYVJBnr0TwmdAz/OD
 AlUr2wfKYg+ECDgxGBg==
X-Proofpoint-GUID: LPa-zqQCfwbnzM4P5O16ijH1W-hKpd0J
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 adultscore=0 malwarescore=0
 priorityscore=1501 spamscore=0 bulkscore=0 suspectscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
 definitions=main-2512220094
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

