Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 72894CD58C6
	for <lists+freedreno@lfdr.de>; Mon, 22 Dec 2025 11:24:29 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2546610E334;
	Mon, 22 Dec 2025 10:24:28 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VA0o8Cvp";
	dkim=fail reason="signature verification failed" (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LpOPNcx1";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7733510E334
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:26 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5BM7ue5w3619013
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:date:from:in-reply-to:message-id
 :mime-version:references:subject:to; s=qcppdkim1; bh=Z3dXAwZWQrX
 iznkoQcO7REoUwgPXToMeXoe6XzLEAy4=; b=VA0o8CvpqBBiQvYYUPjvXzDQRAT
 Zf5hGMXfJIzFt7pgD59l9GVH7m65k7ba5Xomzkwx+hLTZ0w5EouGU3voEqn8IGkk
 MHlfXqOmrrVTTnrRXi6Sx3bLaMEKL8kAhlJVkWLi0j63WjVvTpDZiLfJDWzQJ00R
 HcnY/7Cn+XZHS8wbEaOWdnTOUIj7HFVmfGt27zf6iRq8YvRGd33ieNdePJ2Y99S8
 g6nVanlLNjkw7Esv9pY1JhLr9xftJUYHKeXq5HLk0eD5eRo54gDh+MNbWy5m7HhY
 q6RTflWF1CTYkf49f8Dog7nvIuVuqwuEy+k5j0G3FWtLxRRBnR/PzBQgu7Q==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com
 [209.85.219.71])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b69ahjy3e-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 10:24:25 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id
 6a1803df08f44-88a3a4af701so95103056d6.1
 for <freedreno@lists.freedesktop.org>; Mon, 22 Dec 2025 02:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1766399065; x=1767003865;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:from:to:cc:subject:date
 :message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=LpOPNcx1Xso2uzCMiwtjvUOv7aaoZzRgxwggPPZ0J7ZgHeWocnP6tlGSJVUqhO4elM
 Npn2jC1ZaoKD61NL348QpLGdmRljVfJTy8ZPlNJiO1A66SmHhDLjMcQHi3qROhCSD/1H
 EaD1Qnj9nKTImeMXsT2QhTkBEJ5cyjiacNijFaXn+2ECiu75HO8P9NqMkz+gsn69o3nY
 tXI9i9lNg/FNWFvJoBWNhcWgtdQRK3ye7DfvGNNb+LfrhK971r+T8lGj5FBE3a0Nogm5
 e2xEku/PJ2YgOiZIhehTOLBpBK+aEM0oWb7pu5QnK++++dG4Jl1aFNr9dwCLOB6x11BM
 eR4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1766399065; x=1767003865;
 h=content-transfer-encoding:mime-version:references:in-reply-to
 :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
 :to:cc:subject:date:message-id:reply-to;
 bh=Z3dXAwZWQrXiznkoQcO7REoUwgPXToMeXoe6XzLEAy4=;
 b=HBbJves8cpsKmoOa94QdZaPig0t3HGaOGDWJZDaW/rULT7y05NdCalkVbCvWr1Tiju
 Zx7o8+rJAau4N8T4fMFzD/JrxRKJgD8XIKzv7YeIS583omNpft1FGqLp6ySLXiaGfZlN
 39Bhcb+8itKiszeJyE6Uc8xe4/qNr54io47+FpwyXvG+05T61XOkSnUBXdsgR370bKBa
 53pO9wVK2rfYTe2lJL1JaO8PjCVtgj6qDMSbGHwVy+1MBxaULRjHlxQaqOKbj7FxBc4F
 9N32vS3RmD89LdM9KzC0ckACnYi2/JR4DQid0wbpTCvYLmdVgc/3FrFfW5exJW2uoNdL
 htjw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUFYrj5OspN6Xz+AMBZDmy2StrkviCn+KDMtNpP2ZIFdyn1pdTkMWKvyyZRhbms1j7EcIbKSMFBv7k=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yx6cMPDloIrnzRz9IGPGKkA73yCUtcu9UrBHO2pG30ofOtQlgNh
 IVvkCoRHTy8v7T1D4bRWnQarQg3LX/ruXFIWRTftbQ1e03bUgC9Biu+N/rjltPs9ME0XmGJs6MX
 E2c7LHr6mdAMzWTfTx1ps6wXzHUTw/cb05e+H4eocV2Zbm2JQ1b8VXvhPLbcHp9PZlkE1nbs=
X-Gm-Gg: AY/fxX5i29TU/2QTOlmeJnDs5efhaVFCC4UWMTZXdi5UVMoBj9arrPpeMsW6WmgY3MB
 HY0tfFka3PNgfm0LYA47gQEB6luJlbP87Uj8/0zSgD71YCmJFs3u2tzc/Yv7sbWOtdGOIV10/fv
 Qzz0RJbphqk2l8XnkPei8vi3NtwxzDYEiDFfGtscoaa4LtnnIpuh9Vfv81LBHvQSvHR7Seq8GKY
 qYdlPmT/AVYOwM7qaI00sB2QuprN9TH9f8Fp6EctO1tu3KvJ5a/JnTC/n/EO00WrNO9nryCPnXg
 4Lk12TAc3GVTYvTJYpwG0UGq/wAhgZd9Eh7YBHbJAfRRXVZLMFxXS6fQ9QKTsjU1ebWZXBlFZuO
 JT+inc/NmxtY6sqgccsl99G27rMDQ85pIrK8fKu3EwPmmtvJeH980sriH8hKceXHxp9s=
X-Received: by 2002:ac8:5fcf:0:b0:4ee:1dd0:5a53 with SMTP id
 d75a77b69052e-4f4abde9f30mr150903871cf.78.1766399065040; 
 Mon, 22 Dec 2025 02:24:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IG+T6m91+oGsjfriTmuX3mj6iu58uoeeqOFMGa6SnGVr/aTF4HD9oscEnMvSP7CWfajySBoLw==
X-Received: by 2002:ac8:5fcf:0:b0:4ee:1dd0:5a53 with SMTP id
 d75a77b69052e-4f4abde9f30mr150903641cf.78.1766399064651; 
 Mon, 22 Dec 2025 02:24:24 -0800 (PST)
Received: from yuanjiey.qualcomm.com (Global_NAT1_IAD_FW.qualcomm.com.
 [129.46.232.65]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4f4ac66a1aasm72500001cf.33.2025.12.22.02.24.17
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 22 Dec 2025 02:24:24 -0800 (PST)
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
Subject: [PATCH v4 01/11] dt-bindings: display/msm: qcom,
 kaanapali-dpu: Add Kaanapali
Date: Mon, 22 Dec 2025 18:23:50 +0800
Message-Id: <20251222102400.1109-2-yuanjie.yang@oss.qualcomm.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
References: <20251222102400.1109-1-yuanjie.yang@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=JuH8bc4C c=1 sm=1 tr=0 ts=69491c5a cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=C3Dk8TwHQYyIj7nOf9RCJw==:17
 a=wP3pNCr1ah4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=VwQbUJbxAAAA:8 a=LEfPF28z9Y6gGZEU5FYA:9
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-ORIG-GUID: G59xYmU6qM2CoHFn5TDvypdt2DFXyqJe
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA5NCBTYWx0ZWRfX5U16KgnDjt4V
 bOX6l2yw7pHIPRfazJ0YVvNLPAFmGv6yyOAgOeGaCNXjE084g+bGWqjgHcTGe4PtR9k+ifmV9a0
 nWIKLDalszB1UXiow48uHeyVnKXF+AHg0Aq9s/zCH9LALgGIovU7103hHyV5x0RaAo5+ohmnizX
 4plIsaUMG/ACUpp16NnChTSqlfQCN5VeuBennB1BkMuyAuh0Y/uF6fZvMQSFFGZcQLkTXxr8OYf
 IiGoCpdKNSwisCe0jPXjGfc938BNwJ59NRzQNgjs00Nqfqf9PedcTbPQ30R4vtKJwwvKsLIx6nB
 phU46Orbtz/jUomDgnQwAbpPF5aS0+gU37ViZZS3lOIrR4K54Cv5TrI7e7PbcFfppk8ZTBo3pws
 pTCAjexET2YmCHHa7X/cxQt4/RrIPsAyrHg4MOkwfRY7s/XU/hQs1gICzRHLoAU6cUqQqJawL/3
 mCTlCsaDdboFlBEJ+Pw==
X-Proofpoint-GUID: G59xYmU6qM2CoHFn5TDvypdt2DFXyqJe
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 phishscore=0
 lowpriorityscore=0 clxscore=1015 impostorscore=0 suspectscore=0 spamscore=0
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2512120000
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

