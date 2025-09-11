Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id E014BB5302B
	for <lists+freedreno@lfdr.de>; Thu, 11 Sep 2025 13:24:31 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AF94A10EAA4;
	Thu, 11 Sep 2025 11:24:30 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="BqKg6IrP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 09DFB10EAA3
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:29 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58BB6Mkq031005
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RIm/FeZHB5M/ZxlpskEh0DOJRMp0J1LnIz0T8jbvq2o=; b=BqKg6IrP7ksbjhNx
 qUq+ScJ5X6x6zGWzLKsu17PvB5HrueS81NxC+sJZa4CSWl+fpLQ1i+fF4YsiqN7J
 shL5DTpDCCkW0syzBS200rW84fXlIGxM6mmHmx4qr68lx5KrZkgkxyJ/QlpKbzRS
 a0Ces7kuoIwm1s13q/WjdR1/fVM/NFG6syzo2+Kz1GfCaiszMHdCBjIYNvjdbAZt
 SiZltamuJ28KpK43nZCBZ5dLV+7396jc5nmyMiQCVwhLgJio2cqRuWcN/RmI6Lny
 7Rf1u8XmIJ9YFJA6rk9P6Jl0iTAu4LxrCzIRQRHQLKdZEbfE1Ld/A/A75478ZPFv
 Hmn25A==
Received: from mail-pl1-f197.google.com (mail-pl1-f197.google.com
 [209.85.214.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490dqg7635-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 11:24:28 +0000 (GMT)
Received: by mail-pl1-f197.google.com with SMTP id
 d9443c01a7336-24c8264a137so7180835ad.3
 for <freedreno@lists.freedesktop.org>; Thu, 11 Sep 2025 04:24:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757589867; x=1758194667;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=RIm/FeZHB5M/ZxlpskEh0DOJRMp0J1LnIz0T8jbvq2o=;
 b=bc6Y26OpA05A8WSEC6TnjjLN4QXj1PL69ABVEoSGoDamjLRe0OQnykuGl+8GjDEYnl
 DFkPQurrz+gZLNaE1EJ42ntga6WoIoJuGJLIRxEwt3CxMC4hjbzxI6SPWqD47Vje/+2G
 jEtEwbnleG24Jgt05gsXwU1FNH8aqZyGr8KO3xuO5m6LNkk9ZaSQFyu7kYUrWKvGAbas
 Py8UCULzIvwmlH/q1t2cO4pVffLwDfGsIFI2dlmXjgpz2hrNpyD4cJyCT/Mko+nuXGh4
 OaCoUtAB+JqCoYXdEM5uuy+snHlQwUve4EMlOl7NDMTP7ezorzh6ECSb2uQ6K1IshfsV
 0flw==
X-Forwarded-Encrypted: i=1;
 AJvYcCVRdkw3U2X/NLCHlErDSPZ8o2UrOhNFnAU+B9p+WcoLz7ZIKj++LIQ6TjAKdUptlt18Ypmr4T1Q7qI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yw/WQYfcmDU9YPG5hg0W4J/gUs+IJj/fReB+tYln146dPN17zUW
 iCLiuNHm5bpSmSLdEqFKV87ENsz02x4CBSzgooEOB91pTKGYHW5Bi/ZfIPG+OPnDSjVpVETS1Dl
 Gn9WBLk1HCRDpQcQruvdB2KX87OpLbY+XlEXnAQwHwiKVTnXIyJ5wCNw+eIJXlyBGjgqpP1JZbI
 5ZJro=
X-Gm-Gg: ASbGnctyvOp8gMGN/OV5U4QNvN/NHIy2eJP/pJBmBR3gZmjsnsIsc8E5TRgvBR3F0db
 drOD/YfEVVKviYfUMNh6boG6zUw4Hvq0NfKY11XNfVne0WbuoyGu5bermuriOLlKqUBJNsFyMsr
 /uVpvRHucNT0wrYKh0ySEYECXNO5GP8JxO9GydP7Ykq032GEtrNuvlmiCxXcr3mY2jh2xnPoDWI
 66wXyaigzlboZjwlgicORMYb5a+iVZhbekvJ9oEvw9mm4YGXFuukVeeNZ1nuE4azCL+XcKGt4TW
 Uptwr1goXo0+saDAxzbNLy7BuQSOmiyCDELR/+KgdmT+nMG2GLmrPPKrxcd0zNSWLKV/LouxVgs
 TBt3q3maJ7L58pzZSRq6X40kG6PkT+BPF
X-Received: by 2002:a17:902:f693:b0:248:cd0b:3434 with SMTP id
 d9443c01a7336-25170c41671mr260681655ad.36.1757589867407; 
 Thu, 11 Sep 2025 04:24:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IH63LOEnM0/9yJJk+9ZQU/OYiv5OWDqETgfKsJUjkwvSFJMDA0nSC3vhgmxSerAXE0+xyeKbA==
X-Received: by 2002:a17:902:f693:b0:248:cd0b:3434 with SMTP id
 d9443c01a7336-25170c41671mr260681305ad.36.1757589866899; 
 Thu, 11 Sep 2025 04:24:26 -0700 (PDT)
Received: from yongmou2.ap.qualcomm.com
 (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-25c37294b17sm17005365ad.40.2025.09.11.04.24.20
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Thu, 11 Sep 2025 04:24:26 -0700 (PDT)
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
Date: Thu, 11 Sep 2025 19:24:02 +0800
Subject: [PATCH v12 2/5] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250911-qcs8300_mdss-v12-2-5f7d076e2b81@oss.qualcomm.com>
References: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
In-Reply-To: <20250911-qcs8300_mdss-v12-0-5f7d076e2b81@oss.qualcomm.com>
To: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Yongxing Mou <yongxing.mou@oss.qualcomm.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757589847; l=1035;
 i=yongxing.mou@oss.qualcomm.com; s=20250910; h=from:subject:message-id;
 bh=4NxcNPcdZQwrNtW6aZHc1wxhueG2DBgaJO6CuwtD5lg=;
 b=Yv0UlU8te3uLa+M0miLX218hpaQHvae7QoWDa5xnVhgy4kK/K1R8ctuX5xgeGWBo64hQZOoGN
 3bUH8bIGNC5DZdOxa/8f3UiqemI3/n7/4sxV3qoHkB1r+WtLos5vvG/
X-Developer-Key: i=yongxing.mou@oss.qualcomm.com; a=ed25519;
 pk=rAy5J1eP+V7OXqH5FJ7ngMCtUrnHhut30ZTldOj52UM=
X-Proofpoint-ORIG-GUID: bp01-hUsqXUZHsttdx-uhIQBxCCYG7ee
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAzNSBTYWx0ZWRfX18fTVAs2i3Cu
 0oOehWBkU/lMHJmL+gmXJHkcM7vS67MdxBQcl9YRdJYrViCSQBmfr4OYYqP2YHr/RX8AuuDE3ty
 cNyiaWnNe2zIBdsODIsr0pztu4bJU2jDdZuY8gFjfQOImE6+yYRYBAEvnmlhSkSeUVq6ZJXiB/+
 3kvVGKYZpDXINv0byRjXdOeXFjk3q4tNSpBr/9VEJuZ8wNquFlACr4VteVQKrpkasUnIrXRtPn/
 +4wg6GRiy7OP0az4f6F+AU9BdFmFiD+fMipNl3FshZL8H4JUm+5u+eOfYx96c5paPm3lZdhj0sa
 vm2tBMaE5WgSx8cTKPEGFWHfFWnhKKVQcvdqDMwW/zlimiWUa0PlkCzUCUuyHWsV9ZTRxdtSGgt
 0+/212RR
X-Proofpoint-GUID: bp01-hUsqXUZHsttdx-uhIQBxCCYG7ee
X-Authority-Analysis: v=2.4 cv=N8UpF39B c=1 sm=1 tr=0 ts=68c2b16c cx=c_pps
 a=cmESyDAEBpBGqyK7t0alAg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=W7hmKyP8XuOziMQ-xZMA:9
 a=QEXdDO2ut3YA:10 a=1OuFwYUASf3TG4hYMiVC:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-10_04,2025-09-11_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 spamscore=0 malwarescore=0 clxscore=1015 bulkscore=0
 suspectscore=0 priorityscore=1501 impostorscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509060035
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

Add compatible string for the DisplayPort controller found on the
Qualcomm QCS8300 SoC.

The Qualcomm QCS8300 platform comes with one DisplayPort controller
that supports 4 MST streams, similar to the one found on the SA8775P.

Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 +++++
 1 file changed, 5 insertions(+)

diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
index aeb4e4f36044..ea88e1903f26 100644
--- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
+++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
@@ -31,6 +31,11 @@ properties:
           - qcom,sm8650-dp
           - qcom,x1e80100-dp
 
+      - items:
+          - enum:
+              - qcom,qcs8300-dp
+          - const: qcom,sa8775p-dp
+
       - items:
           - enum:
               - qcom,sm6350-dp

-- 
2.43.0

