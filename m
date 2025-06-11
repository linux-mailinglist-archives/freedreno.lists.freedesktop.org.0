Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id DFBC7AD537A
	for <lists+freedreno@lfdr.de>; Wed, 11 Jun 2025 13:16:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B724810E620;
	Wed, 11 Jun 2025 11:16:04 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="C0RsGiU/";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 7D93D10E620
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jun 2025 11:16:03 +0000 (UTC)
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55B9Drnv011530
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jun 2025 11:16:03 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oaAMiIVJgXHtfHES7X7LLIIzOL/6mPXxYGS9Xfa5ANk=; b=C0RsGiU/UHg7iW0p
 svVWXkU0RudSs9AO5l1NmCI7crNwyH2hWulQoF5yVRPLU6Mk/cf1sutTnEBNBlfN
 8vp0rUukMbBibpHBnVWJof2ELlPAWbMYV7Gzl1Xw+aHQMu3A3KW08zVCrj19JWtH
 PcVLqZqq29NMMKHEoStPP27WhjyvClIOI59gF0su8zTychqWCIgDWW/fAFV+F1Yn
 8bmjzOGSzucXTq9bwnNNldkyRkuqeSt/9DxSarOUaYi/lhZkfRjr9ngVPuLyyTwx
 30fXizmPwOi11Ue4ZnJOe+08ZYVVTDYvlJIIab9Ty9+ULKPC1Y19hwOGoLM2JoAA
 E8WQoQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 474ekpvdpy-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jun 2025 11:16:02 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-748475d2a79so2793557b3a.3
 for <freedreno@lists.freedesktop.org>; Wed, 11 Jun 2025 04:16:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1749640562; x=1750245362;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=oaAMiIVJgXHtfHES7X7LLIIzOL/6mPXxYGS9Xfa5ANk=;
 b=pYw22y4pvw+kep6vTc3a9d5h0wAFfKM2Q4W9NqCE/yFXAVrwDLQPzV9TFFwlVB2AG7
 ALIzJiUN2zvfjFLdHAomlI1DWukTT3RaCEkJiOqTQFGsRs3zq6c7z7f35uFy9rZExD4O
 VJsLIBwNf2DGvfe58xeMD0Z/cY3dc2jF7+Js2xlXN98I+fQIfdoiP/hx6HQ1KBucUJj2
 pbeZ3LYuTyD5xsfkIIHfsIYi4OnzPslCjDPQ8CpPDPXyfQARigIydWuuANXKSUZhKqHq
 2Uq7bwRxdblLnOh1m7JI8TuE7tyJiyLjI0XdSxpkJR4MFfAOcknsrChqq3kAuBuJr+Cv
 uROA==
X-Forwarded-Encrypted: i=1;
 AJvYcCVBcv1w0ggXdL+TCmFbVFf4yvEcS2KkmTCsAUitjPMsOeAdPjcNLRPeGT4mgscTpTxsUQB+vk1tePM=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywftk5mYkoxhpDeGdpDLzBMqfehAFfBWDfW6Y8WwZScBysn2cL/
 D3y8MIYj2Kx8sRu5Oswu4p3SLc8b3OyAFS34JqXoMejmzjPuzjkZSXxwmZ7m5WIunJOnWQlk8pG
 1Q41IUUgrppgTgSMiF+6tohcNK8sfNeDyRNBGR6vj1PUM6gzerQ2ZA1Lh2Y38vuEgach2Txk=
X-Gm-Gg: ASbGncvLb8l7nlLsVFbAYPqYUIKWFNNr9sT44/dvex5y9Ro+TuU597hlTdzpgzd+GBw
 ssQIXwomNDLBJetWnULqgzKZml7Vt2p91BpK5gbN9kZoG3Y+lHAz87PZp/fygZcRvsZQ5D2Ha65
 qD5hL1AJfovr3gWg400gA02tJfz0PVwWU0bfPxu3ueHKhDqEkPXr5j1HPWusbLe1UEG3iZTUBQC
 6tuNa892kTlPxlg4TKPir/s3Mf9Nvrg2SUGVlA0Pf1JalcbKsul8F+XWPMD+NOl1Yy5G+lX+y/S
 Yz5oydQtkswkvPeqewoko4Xeq0Y47qo+
X-Received: by 2002:a05:6a00:84f:b0:747:cd01:9f75 with SMTP id
 d2e1a72fcca58-7486cba09a7mr3858961b3a.10.1749640561967; 
 Wed, 11 Jun 2025 04:16:01 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHROg37CoLQX/gpU9C5YtRVK3WyqImgZyCmQYBDNqko/4jqswI6HbSmNXgi+XM35/6CERVSVQ==
X-Received: by 2002:a05:6a00:84f:b0:747:cd01:9f75 with SMTP id
 d2e1a72fcca58-7486cba09a7mr3858922b3a.10.1749640561603; 
 Wed, 11 Jun 2025 04:16:01 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7482b0e9d57sm8820772b3a.160.2025.06.11.04.15.55
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Wed, 11 Jun 2025 04:16:01 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Wed, 11 Jun 2025 16:45:31 +0530
Subject: [PATCH v2 1/4] dt-bindings: opp: adreno: Update regex of OPP entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250611-x1p-adreno-v2-1-5074907bebbd@oss.qualcomm.com>
References: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
In-Reply-To: <20250611-x1p-adreno-v2-0-5074907bebbd@oss.qualcomm.com>
To: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Bjorn Andersson <andersson@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Viresh Kumar <vireshk@kernel.org>,
 Nishanth Menon <nm@ti.com>, Stephen Boyd <sboyd@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1749640547; l=826;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=lHxIg8z3r4MYFlwLi2deHZy4r/sg9/34BnWytVOD0js=;
 b=ICq0mXqikfLYi6zoSoY7dUbF11OEkSXzvry9bOOUpbQi4bPFyVr+Va+GQM0kxxwrsM2sVUL3o
 J5HOSoxdbY9CddPxQ42d6Jw8+7mjv5B7uHLuEWJY1k8LDyEMdilimZ4
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=JcO8rVKV c=1 sm=1 tr=0 ts=68496572 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=EUspDBNiAAAA:8 a=j--r9fh2p167zETY0CYA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjExMDA5NiBTYWx0ZWRfX49JXRSzDuMFV
 IQuyY+0Dw8KNdHH/V5BvTCliFcPOjK1vwt1pG9SUWdUydNSwJIf7fdCFU6UlXD05P5VargpRdn7
 ttPHHWu0en5DrlE/2ZlwG1VyuIsiMi+Ij2UV46QjTHff9ucClxZGJaHNkPp7eppbMlJ4AAGtkz0
 UkLkztEX8mOV2zi/pkEGgegZzx6mrCWCfpagUAzBKWwIh5OS1Fr5YyQ6w1zsufyJYqTAZAHxhoo
 i6yKfVMPaNJer15kFVUgA2efcdj4pLSCHSEgvPsM7uM8cx9Vqc3RlzIBJGeMOGj+H2XmYJ9o/YM
 2ORoD701xndGya7HlesYk5Cn9Yce6n9PgiSUp+VEnSW7APZhERecuQ8o4g2leriJuuDBR7sgfKi
 dfHTKyrWAR9GEVT4FVhjJrb77vLaZ4bYWdg2QEyco/SHQQGg2Fs1+d+8KD+q0rcVST4hqx1A
X-Proofpoint-GUID: ZMZ_IVOFreCqXmmybtsjmlOZtn9wECCz
X-Proofpoint-ORIG-GUID: ZMZ_IVOFreCqXmmybtsjmlOZtn9wECCz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-11_04,2025-06-10_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxlogscore=907 bulkscore=0 spamscore=0 impostorscore=0 phishscore=0
 priorityscore=1501 mlxscore=0 adultscore=0 clxscore=1015 malwarescore=0
 suspectscore=0 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a
 authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2506110096
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

Update regex to allow multi-worded OPP entry names.

Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
index a27ba7b663d456f964628a91a661b51a684de1be..bba95799919eb52d12afa42354ed909d0ef3c627 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
@@ -23,7 +23,7 @@ properties:
       const: operating-points-v2-adreno
 
 patternProperties:
-  '^opp-[0-9]+$':
+  '^opp(-?[0-9]+)*$':
     type: object
     additionalProperties: false
 

-- 
2.48.1

