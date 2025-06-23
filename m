Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 450C2AE4624
	for <lists+freedreno@lfdr.de>; Mon, 23 Jun 2025 16:14:23 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 16FCA10E3BE;
	Mon, 23 Jun 2025 14:14:22 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="naGXnuY5";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 619F610E3BE
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 14:14:20 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 55NBf2b1029883
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 14:14:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 NtfhK5w7Yo+a5z54EUc7Xp1UlRoMo3u4slEdBn91UUE=; b=naGXnuY5npw8Z1Eu
 SABjSFnHk7x5gWyiwyNUahSEUH8bKSqsv7pFKXm/WhVLMLkCyHQAo4gHMSTXloFv
 O1Rt282vcukJDHGbP45RoPRmsv4XN6uI1LVfvYw0zQxirykQZDv5eYf/8LT1Uxlr
 2XuAwI7OMSOJEuGqf8+I73CXv9V+4qhtiu0dBGLk85m8tdkOyPByQEiXVQzJQy/p
 pvFZy+x1A5pJxLFxLOJHFOP19zT8XaTo81Rynce17c6i1jFdgB3FBeMYrQkK+C8h
 S0jds8VF0KPXcUFGar2mSdMwuA+Hcw8hBKTIxfxbuv9VU3W4Vdd7HiIs/BMF5kDH
 fLCHFA==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ey7k1p2k-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 14:14:19 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-31366819969so3932706a91.0
 for <freedreno@lists.freedesktop.org>; Mon, 23 Jun 2025 07:14:19 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1750688058; x=1751292858;
 h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
 :mime-version:subject:date:from:x-gm-message-state:from:to:cc
 :subject:date:message-id:reply-to;
 bh=NtfhK5w7Yo+a5z54EUc7Xp1UlRoMo3u4slEdBn91UUE=;
 b=u/TzBu2LUAh9FY4miw7OmqNKU7XQu+YvJ8GSLDTyIqf1G03pO7ssQ0s/75hwgcqZc+
 zaWm3GSPbiWiG1ZjgQrv32DHSjwp+jZKoa7aimwtmg+V0VWsPpON4C38kIYii92lw+Mp
 Wix/VfDdB4minbsbQriCu2rcNilV+klIsbIuWZNBXgLWwZjnGoPCgR8H2Ifn57IqOhL/
 SsJzQPkCRzfNAOpNU4IyTRLFaTTVlm8XwiQbXLJHsuR0cPOr5Y85WQI8IqX45n3q2b0F
 LFleWlVEHKvYYJ061kQzaVuPHRQM+mOE3VJRD2kYqV4LC4i1SWJUxKZTLIc+QewVGvJ2
 TtBQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUR8rN5/07tvJUw34wq07EFP3tl543wzZ+TZsLlt9lIYJg96sx/YX5MgkcMMf0c6VYXHM/q7SRkEOE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyBvIckmSQF9XB8afMB6ppaOd0GXYMkhknh76v6sE1472O/Lyvv
 fjHjV/b+bOHN67VD2fEXTiVhpxgBAncYTv2VeE1iZJeAyVM6gx3GMZSaTXsV3m/xEI0/mtrlZSh
 vw3Qe6hV8212hZTMWHhDijBTr3osWWXLXXJ/aC7G/djlf9ICA5DSacvy4fecBO5hDiphHqZY=
X-Gm-Gg: ASbGncsEXQd8766a9IbvBQz4unJypZI2B1LZJr8V5RNOBnj8w3/mMEfo8tXLVqa0XQw
 VdjOfq6/haDrkHcUCdgczoYUmR3gUFmRXPyasJRFb7yaQbTlGeiWJQmI5AAvd9uCxGOpsXogkDa
 FcH4UdSwYgSjKF1c01PSHtH7jcPo5rGqYC/H/+y3QMpA4Sxns7NZMRtRB2Z3yunJuFWDW9V7sZ2
 sp4JxXH+PelK6XBuRC7iGxXEcTovrj8HAB/LlMxCScMJxjb057ep3gHLVlD0qPIHI3V70EiNTcy
 EjZf6ss3mOm0fcUBkuNm2MAjSZrTJG1F
X-Received: by 2002:a17:90b:3506:b0:313:2f45:2fc8 with SMTP id
 98e67ed59e1d1-3159d8c7c8cmr22958691a91.18.1750688058162; 
 Mon, 23 Jun 2025 07:14:18 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE36OaUgAuAzm1zkswuN/1LVRm779C8aiQthxLaXOxOz/CZTu4jbvzkHS2TORWEEglAA5uAtw==
X-Received: by 2002:a17:90b:3506:b0:313:2f45:2fc8 with SMTP id
 98e67ed59e1d1-3159d8c7c8cmr22958623a91.18.1750688057492; 
 Mon, 23 Jun 2025 07:14:17 -0700 (PDT)
Received: from [10.213.111.143] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-3159df71c4bsm8112049a91.2.2025.06.23.07.14.09
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 23 Jun 2025 07:14:17 -0700 (PDT)
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
Date: Mon, 23 Jun 2025 19:42:06 +0530
Subject: [PATCH v4 1/4] dt-bindings: opp: adreno: Update regex of OPP entry
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250623-x1p-adreno-v4-1-d2575c839cbb@oss.qualcomm.com>
References: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
In-Reply-To: <20250623-x1p-adreno-v4-0-d2575c839cbb@oss.qualcomm.com>
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
 linux-pm@vger.kernel.org, Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Jens Glathe <jens.glathe@oldschoolsolutions.biz>,
 Viresh Kumar <viresh.kumar@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Aleksandrs Vinarskis <alex.vinarskis@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1750688040; l=1923;
 i=akhilpo@oss.qualcomm.com; s=20240726; h=from:subject:message-id;
 bh=TCFdV3fJCtM692nAUJeh6Kg61bWHn7h/r/7bivD1ZOY=;
 b=ETabZqcXTpK9ISzvEMm1GGFzT3eN0ByVbCE60cr/JNzTmMAlrzM1bK2CWqhi3ZP4d4IF96zRT
 FJvZjKgub0OD0uTow4rTdGcZTwcRlp+OTMjAwTcNRLZTA2pOJL+p/8Q
X-Developer-Key: i=akhilpo@oss.qualcomm.com; a=ed25519;
 pk=lmVtttSHmAUYFnJsQHX80IIRmYmXA4+CzpGcWOOsfKA=
X-Authority-Analysis: v=2.4 cv=YoEPR5YX c=1 sm=1 tr=0 ts=6859613b cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=6IFa9wvqVegA:10 a=gxl3bz0cAAAA:8 a=KKAkSRfTAAAA:8
 a=pGLkceISAAAA:8 a=EUspDBNiAAAA:8 a=PEQATVZ-5NWm0mRdv2wA:9 a=QEXdDO2ut3YA:10
 a=rl5im9kqc5Lf4LNbBjHf:22 a=kiRiLd-pWN9FGgpmzFdl:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-ORIG-GUID: 35zbdHTuj5MZGdl_uBgQtpL_LzMUvTNu
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjIzMDA4NCBTYWx0ZWRfX8aSg6ZMLsDG1
 6Q8GvlQUzYHLglN4yTwdyizZ0Nl8t1++VQveSWLJ4OYmC+6flhqiqGLG5mJ2J8yUekh+WKud+i2
 ajFzknZabS5+ZuPl2xefI+476yb9RG9y5DZNVpbkEBO3EhqIoszbdFs29iQ7wqVHHib0sMYXjIv
 hQq9lk75MpOZLcQ7PC9rZY3iuQobAvPNfrTJtDNRHc8KPcBb41DYAS5QDEyryO3DJwznOk6Q7tR
 dKYd9kRgm3uokDddQbqLYCpiQMdcnlDCOZgPwFRXMzKby9DndX8LekKnsF+3eAoIVqWHWHqjz3M
 M4wwpa8u/XaX+G/NqRnehVTI+WH2TRwWV1x4qHwnHb2+4fttx2UBwwEh1HmVZp/hFz9OpD7UlGt
 LwenTdbvAojAUiyd9cIfoakS2W9w07tBpDZkm+YrGnbiMLtQgpL7uUlVvoaxCuZo7xSC9XPG
X-Proofpoint-GUID: 35zbdHTuj5MZGdl_uBgQtpL_LzMUvTNu
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-06-23_04,2025-06-23_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 mlxscore=0 adultscore=0 suspectscore=0
 malwarescore=0 mlxlogscore=999 spamscore=0 bulkscore=0 lowpriorityscore=0
 impostorscore=0 clxscore=1015 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506230084
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

In some cases, an OPP may have multiple variants to describe the
differences in the resources between SKUs. As an example, we may
want to vote different peak bandwidths in different SKUs for the
same frequency and the OPP node names can have an additional
integer suffix to denote this difference like below:

 opp-666000000-0 {
         opp-hz = /bits/ 64 <666000000>;
         opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
         opp-peak-kBps = <8171875>;
         qcom,opp-acd-level = <0xa82d5ffd>;
         opp-supported-hw = <0xf>;
 };

 /* Only applicable for SKUs which has 666Mhz as Fmax */
 opp-666000000-1 {
         opp-hz = /bits/ 64 <666000000>;
         opp-level = <RPMH_REGULATOR_LEVEL_SVS_L1>;
         opp-peak-kBps = <16500000>;
         qcom,opp-acd-level = <0xa82d5ffd>;
         opp-supported-hw = <0x10>;
 };

Update the regex to allow this usecase.

Tested-by: Jens Glathe <jens.glathe@oldschoolsolutions.biz>
Acked-by: Viresh Kumar <viresh.kumar@linaro.org>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Tested-by: Aleksandrs Vinarskis <alex.vinarskis@gmail.com> # x1-26-100
Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
---
 Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
index a27ba7b663d456f964628a91a661b51a684de1be..0bd7d6b69755f5f53a045ba7b5e1d08030d980e6 100644
--- a/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
+++ b/Documentation/devicetree/bindings/opp/opp-v2-qcom-adreno.yaml
@@ -23,7 +23,7 @@ properties:
       const: operating-points-v2-adreno
 
 patternProperties:
-  '^opp-[0-9]+$':
+  '^opp(-[0-9]+){1,2}$':
     type: object
     additionalProperties: false
 

-- 
2.48.1

