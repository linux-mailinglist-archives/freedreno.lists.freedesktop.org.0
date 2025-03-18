Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 3B509A6713E
	for <lists+freedreno@lfdr.de>; Tue, 18 Mar 2025 11:28:23 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id DC80710E09D;
	Tue, 18 Mar 2025 10:28:21 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CrzOBCL9";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4DA6310E09D
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 10:28:19 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 52I8U0lN004561
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 10:28:18 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 /ffeju9dab3SjXkQBFykek/FOXIdiqaUl5qwjSDR5rA=; b=CrzOBCL9BxGuCYdy
 PpGccRQNdJtgOuoSTI/Hxt7LPk/WA9gBrjFthfC2CSnlkedNUFOAIQeylhFYkELM
 qSU4ZieuRaJ0KBbwkUh9UWU7fGBLzaMciBFljU47noP9N8wlo1/Y48/AZb+UEsxa
 KH+nk9N6ls9ub7jHZ6vfeGP4lbFMfQ+lVXB+dhZLdMMfVoV2+nLclgns145fmsqD
 Vr6o+a2+X5RVhDsAshIHwQH9OO8si0E3pFSLpD5/zf7D+UtJ3cj83WdoxlrEdWpA
 nx/ZAdBVvKxM6qky/sSXxpijIGy0HjvKr+9aJX4k4bZqSDPW8Y/G/0h4PyUGJnJh
 4gW9jw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45etmbsymm-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 10:28:18 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id
 af79cd13be357-7c53d5f85c9so81030585a.1
 for <freedreno@lists.freedesktop.org>; Tue, 18 Mar 2025 03:28:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1742293697; x=1742898497;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=/ffeju9dab3SjXkQBFykek/FOXIdiqaUl5qwjSDR5rA=;
 b=J9aF31NZBbdxB1/C2AVqnjpBrGtZw2LKoOxFU5RKJc+7xpBqUhhPl0AiXbTO1O1VZt
 KmcdwTnjuqdDcFrw99CGnUtzUf7yd4vEFwjTZuOElkkvJikpKh7DwkSmXMNeliLmPvoT
 sCpznXjJ9wSU66ow71mN2HXwRLdjVmSzfrRPdnNXbLR5vMJlOm5meyb/Zu/1Z7OZEjDr
 j06/nDMun+KXka3FMWD9xlN+uSoEMOUDz040TBgn/4+c8qJPZSZ1oMfJcrvkt8tBl/Pr
 1b2zjtJvRVudiB/zgq9jmaC2rrNEMixHLbNqCLoY5GV598v2RNzxedFaE0IzXcZ8FEP1
 b1Dw==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9oprNPrj7t9JyLYNCLjaPfvXKwGlHfrnxFDgOb6q2YSWnO7OEPsWWHNZ9aG35yjUeVmNg2gKfCzE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwwWiRwlKj3Ddi47xwEtl4xWtpiUzxtM148DVd/k3P9rBXRfw3J
 t4XLEKCUrK+5iZibMqIpBfI4VsWmJfdmCWrck9BZ8h3uvWkNwWX3Y6qB7zgs67IlDBs7TTHfdtw
 KhwqlyPu6/066ZtWUhGY7z58TLCrl1sjXZF9IXJ7O/nad+Nigt7jx9gn/ekqqog1dDWs=
X-Gm-Gg: ASbGncuMwqjQJ/9tOylrAPeGDu3uL+X/DmRSg97Kl/tESI8ASSYyocjxk9+nBANRi9i
 4+1rP8GFxBDQ0QewGApub8m7ZoaUllMGSoIM63ahfNMiiaGr1Ew0KFi7BK7jwqsVSPpHAXDVaxf
 L9wlADEUYGsMH0fgiTqFnHtbl6z8y0rupFUdsJ47sUhoSsEIgqNPpgOe1mTfm4u7+pC+/rrNI9N
 7VTDKqyKNkabRizGYvsutqBWuiB1NnkDgUYWl/tXGt8kyXQOceU4UefX+p3XC+qhLrU8827bsk9
 w/41rZMB+yJE3WAqWFNQIWS2Dux/c+9TCMZZmcJZFa7eCIxFsM/ezMf8KkXq4dsTtGhcoA==
X-Received: by 2002:a05:6214:252a:b0:6e4:4034:5ae8 with SMTP id
 6a1803df08f44-6eaeaa5893emr88168196d6.5.1742293697554; 
 Tue, 18 Mar 2025 03:28:17 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHbWrHKNAmWpMHc+BHfClrKrXHiIT6z2F6YxU0JPnsWruAuabzkJG8LsnO7K1C+4bw9HqrCrw==
X-Received: by 2002:a05:6214:252a:b0:6e4:4034:5ae8 with SMTP id
 6a1803df08f44-6eaeaa5893emr88167666d6.5.1742293697087; 
 Tue, 18 Mar 2025 03:28:17 -0700 (PDT)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-ac31485d046sm814425666b.83.2025.03.18.03.28.13
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 18 Mar 2025 03:28:16 -0700 (PDT)
Message-ID: <f1848598-c8d7-4c17-8a40-3a6828c32dbe@oss.qualcomm.com>
Date: Tue, 18 Mar 2025 11:28:12 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/9] dt-bindings: arm: qcom,coresight-static-replicator:
 add optional clocks
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <robdclark@gmail.com>, Abhinav Kumar <quic_abhinavk@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Mike Leach
 <mike.leach@linaro.org>, James Clark <james.clark@linaro.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Leo Yan <leo.yan@linux.dev>, Kumar Gala <galak@codeaurora.org>,
 Andy Gross <agross@codeaurora.org>,
 "Ivan T. Ivanov" <ivan.ivanov@linaro.org>, Andy Gross
 <andy.gross@linaro.org>, Georgi Djakov <djakov@kernel.org>,
 David Heidelberg <david@ixit.cz>
Cc: linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, coresight@lists.linaro.org,
 linux-arm-kernel@lists.infradead.org
References: <20250317-fix-nexus-4-v1-0-655c52e2ad97@oss.qualcomm.com>
 <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250317-fix-nexus-4-v1-4-655c52e2ad97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: nUsL11gUAfK045SdJ5vCYwXNLKenJlgK
X-Proofpoint-GUID: nUsL11gUAfK045SdJ5vCYwXNLKenJlgK
X-Authority-Analysis: v=2.4 cv=aMLwqa9m c=1 sm=1 tr=0 ts=67d94ac2 cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Vs1iUdzkB0EA:10 a=EUspDBNiAAAA:8 a=iEn_WmSgXS-yHfNkfEQA:9
 a=QEXdDO2ut3YA:10 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1093,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-03-18_05,2025-03-17_03,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0
 priorityscore=1501 spamscore=0 clxscore=1015 phishscore=0 mlxscore=0
 suspectscore=0 malwarescore=0 mlxlogscore=999 bulkscore=0 adultscore=0
 lowpriorityscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2503180076
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

On 3/17/25 6:44 PM, Dmitry Baryshkov wrote:
> As most other CoreSight devices the replicator can use either of the
> optional clocks (or both). Document those optional clocks in the schema.
> 
> Fixes: 3c15fddf3121 ("dt-bindings: arm: Convert CoreSight bindings to DT schema")
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> ---
>  .../bindings/arm/arm,coresight-static-replicator.yaml          | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> index a6f793ea03b6c193fc0ff72a45e0249a63a2ba3c..56e64067ed3d63c5e293a0840858f13428bacb45 100644
> --- a/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> +++ b/Documentation/devicetree/bindings/arm/arm,coresight-static-replicator.yaml
> @@ -30,6 +30,16 @@ properties:
>    power-domains:
>      maxItems: 1
>  
> +  clocks:
> +    minItems: 1
> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 1
> +    enum:

I believe this should either be items: if 0/1/2 is allowed, or
minItems should be dropped if 0/1 is allowed, but the former seems
to be the intention

Konrad

> +      - apb_pclk
> +      - atclk
> +
>    in-ports:
>      $ref: /schemas/graph.yaml#/properties/ports
>      additionalProperties: false
> 
