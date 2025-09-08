Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E30BB49A25
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 21:40:24 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CEFED10E5BA;
	Mon,  8 Sep 2025 19:40:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="VBiwS4b+";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B19FE10E168
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 19:40:21 +0000 (UTC)
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 588JSU2O013569
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 19:40:21 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 8xCz4z0Bi/57zqJUn/Mu/aLwfF4knJr/ZgFBZ7thB9k=; b=VBiwS4b+OjjF3Nlw
 y3LEwxbipBHTmcLyVfGQ/94uFZNV6tFzJ750TXRnlYjODWL9JFYi4IeII0bXeieR
 o79zy419jWcW8QkkLG+cmJy88bZH8mxFfrfgxetSrgKO/byBFiiTGdToXcps/V6Z
 4xiouAYv4SH1ry16tDceBmyw3fjUWx29j53gT8Sr8uDWr2lC+EdT0CNIIQedD27m
 Bh+7pmrGb4MeCHWSsLKg2NKS8KFpdWjzT2BN3xlaHeNasanJ4wBVYMVYI0z0eI4N
 6ubakKTAOkPGzZ3f9MTGnMk7Gdz0eZMRS+y0iqKW4JcFPOZ2AUJor32vUAg8ZxLi
 cDSJyQ==
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
 [209.85.215.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 491qhdtkps-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 19:40:21 +0000 (GMT)
Received: by mail-pg1-f199.google.com with SMTP id
 41be03b00d2f7-b522c35db5fso1315114a12.0
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 12:40:21 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757360420; x=1757965220;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=8xCz4z0Bi/57zqJUn/Mu/aLwfF4knJr/ZgFBZ7thB9k=;
 b=QudmIhBh/JmgGrVdPAh3qkTd7BJXnqLz4jWT7fnxuaEPzyl0adyJMW2mZGZ8nYuCw4
 GktsC7AdyPedowlaaUbNHwQuJtU5C+jpNmhQ17a7pDBCJ/2fLuIRv3t4rrB+YnLgSOqp
 Zfwcfv9jW4eQUKbgkN1lkCAD/u9/q1bz8aCQXq70U+7YPtMsWucRlR5NoBvJogpSS6Ta
 /ZPTCPLkWc6DK7+ZDjF/nVR+3OqYHE7GbB2w7WyY7NVhdYN9kP34ylwI8rzuFmU7vakr
 MCviz5lmx2Val8Rm8mq72i6uRl4brVKEuIi9CAchd4sjEqhLMV9kENIcI1ryeFkkiUQe
 O/SA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWppaYi5v5HlR8cSXqtPkf6N+f5Zhjlt8zoVouZg/0GOMtvmlVQUWueOiLBZLfio54fpCtMIrB+JXI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyXsYojAtKaUkeeN0HDaasyMKRXVa/Zd2J5EtYWxOUWgSqPQDoQ
 +/OAJIb0xDgVIeI8V0jgcRM5e0GNBNiLJGATXpksFPpZNQMeyotIi5ryS8BNLSovcA666iZ9324
 p1900whYr8GV+lVSFj0+zPEcGXwbqZO7GjQR8MJ5DHUS5ijZyNsxpNRbR+qN83uYrNwteK3Q=
X-Gm-Gg: ASbGncuqfy3mTbzdz19BFvSuWY1lw3dnumTivvoItubMdeVh2yTrYUqpKs87DYibidz
 kU6QCtplGsWWMkfRqx4pAXT/EPLrtQ3Lixz674c/6hjXo3KZS83c5N8ZB88DxLDPU0dE0liuE2f
 soylVEBtlzm/v3EgwsO+Oi12uKnGXsvUrdHWixxf/Y1FlRLF+TBrt7t9SwE44VeKwq324OwZysg
 4WAJGGoLHOXdRNK4cwJ01FOkR6Xm23KG+4xDQ4HjVSYZyVbdpfbVomuPcFP8UTVjGufrOfn2M/r
 Z8N1AsAE+c0JcsvyHPlnpGLE56U5YYYx5bcNaAEMsWJ/hYnCNLT71v4vYq7Y4kxF
X-Received: by 2002:a17:903:19c6:b0:24c:e3d0:c802 with SMTP id
 d9443c01a7336-2516c896521mr130752025ad.1.1757360420228; 
 Mon, 08 Sep 2025 12:40:20 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFxhiT37B/NGt3Wi8a3WEea6fQ9S7xmvSLYGxYBSHf3TlZTrNT5DS5LYTWCDynBV7L4xpYphw==
X-Received: by 2002:a17:903:19c6:b0:24c:e3d0:c802 with SMTP id
 d9443c01a7336-2516c896521mr130751545ad.1.1757360419698; 
 Mon, 08 Sep 2025 12:40:19 -0700 (PDT)
Received: from hu-akhilpo-hyd.qualcomm.com ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-24ced7ea5e8sm104008475ad.104.2025.09.08.12.40.13
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 08 Sep 2025 12:40:19 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Tue, 09 Sep 2025 01:09:37 +0530
Subject: [PATCH v5 2/6] dt-bindings: nvmem: qfprom: Add sa8775p compatible
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250909-a663-gpu-support-v5-2-761fa0a876bf@oss.qualcomm.com>
References: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
In-Reply-To: <20250909-a663-gpu-support-v5-0-761fa0a876bf@oss.qualcomm.com>
To: Sean Paul <sean@poorly.run>, Konrad Dybcio <konradybcio@kernel.org>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Connor Abbott <cwabbott0@gmail.com>,
 Srinivas Kandagatla <srini@kernel.org>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>
Cc: Gaurav Kohli <quic_gkohli@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1757360399; l=928;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=PL01mJ0RQboPDnIbyuTFQL2+JjE45/PjCXjxeBASbKU=;
 b=xzIai9+odqedIq/xKI96mip3L8PPgW/pEWse8XkWfmWni4Is3GRw6oqtePWGYVP0l1+g1CF0E
 ps5n16/F07fANl8SeSNNXsQ8HXmzVnQOiLSHTCIAfl9g3OChd1VhyDw
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Proofpoint-GUID: BkfRwYS1gsR65fg6I-i9IrfwbTRwlGqY
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA4MDAzNCBTYWx0ZWRfX46tvFsotwZiH
 4WODd+jDCQO6QQWJvGKf6IbS2XganmkSNRthXTbqZnqP1P3nMzMabucGFMobDt2BYXD6YQZLIJe
 lKtORXLb7vGIuVZpeE+eQ/MWbz5ya7r7qdyHDpDD1MT6SE7zPJFsiwR9j+JgY84y3TXcQcbHb6f
 +qnfjCOqaD9bEk2ONOPPivxGzISJ18yZkQWlI/KBFNGxMUhlYJX8nt+Y3Sgwd5JJK/AeU+kNgui
 4D4MYlQljh/vq3MsSfQbFHX2FrQYyZ6CqSS1c2xIg4WVO/VULLO1W8yWKNMNbZDmHFOoRhC6ZOD
 Zkf5SS87e+tqy6peLzFoz91L6T7AmO3XM3PYwl1X3ByW6DQjUk6P/TxuCuJJzckLz93fHk7HfzQ
 LzbrgH4D
X-Authority-Analysis: v=2.4 cv=YOCfyQGx c=1 sm=1 tr=0 ts=68bf3125 cx=c_pps
 a=Oh5Dbbf/trHjhBongsHeRQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=TNpnUgr77EDisZP18eEA:9 a=QEXdDO2ut3YA:10 a=_Vgx9l1VpLgwpw_dHYaR:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: BkfRwYS1gsR65fg6I-i9IrfwbTRwlGqY
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_06,2025-09-08_02,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 phishscore=0 clxscore=1015 adultscore=0 impostorscore=0
 suspectscore=0 priorityscore=1501 spamscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509080034
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

Document compatible string for the QFPROM on Lemans platform.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
index 3f6dc6a3a9f1adc582a28cf71414b0e9d08629ed..7d1612acca48d24c3b54c4d25fa8a210176d3bb5 100644
--- a/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
+++ b/Documentation/devicetree/bindings/nvmem/qcom,qfprom.yaml
@@ -39,6 +39,7 @@ properties:
           - qcom,qcs404-qfprom
           - qcom,qcs615-qfprom
           - qcom,qcs8300-qfprom
+          - qcom,sa8775p-qfprom
           - qcom,sar2130p-qfprom
           - qcom,sc7180-qfprom
           - qcom,sc7280-qfprom

-- 
2.50.1

