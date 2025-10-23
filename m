Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 38185BFF2B6
	for <lists+freedreno@lfdr.de>; Thu, 23 Oct 2025 06:50:22 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id B130E10E869;
	Thu, 23 Oct 2025 04:50:20 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="nIcSRWEF";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id EC40810E869
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 04:50:19 +0000 (UTC)
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59MIf7Ac008244
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 04:50:19 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ILH2Noyb/0pcF89WfVFMs9McJHKzcr01cOg5psDy5yo=; b=nIcSRWEFb7aEhO+D
 q6Z+7bd6h3rxMt5LxnPxQbTmDBCYHOqF0a2m5IO2Vml819e6lWWsUDbj769GE+t7
 CF08aLfjQ7L7kOMh1odWpJKIfP9yMfnGanczhZ12rJ94HMu+5XiAS14Qgg3Oy52L
 d6BwRafCPlqhx8CM/S2fl7yUpxcENWIX8JGV0qhyKzdsdPq0ySH9aL3qau+/RKbI
 6fzTJGkcyjKkqlH39vRh/MMKnzcuIVNTkdgfhf683FlPFdyWYxDoTBZIgBZWOI9U
 CNcY4Gg57FZgQX2DK973udaTKSnCHW5h/C+hyxt+3FEjskbSCQ7/WUKZX7cARB+2
 JaPl1w==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v27j6y5w-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Thu, 23 Oct 2025 04:50:18 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-2698ede62c2so1447635ad.1
 for <freedreno@lists.freedesktop.org>; Wed, 22 Oct 2025 21:50:18 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761195008; x=1761799808;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=ILH2Noyb/0pcF89WfVFMs9McJHKzcr01cOg5psDy5yo=;
 b=KP3FbtuwJFOAbNpgsH3c5naHTT/kfJKIdPUGk9Sl59aSyY6pZvr6VZYjdBLZqM9rn0
 h0HsPMfcjR+HfOyJxcxWeTkU0vXooYJ3NbBM7wGPDSigJ7S28n81NpBFNclHQnNeY2+d
 Oe7r79PTN2AjL1VrV7cWH6SXbmqP/yRr6/nsCWCUdDQ/+zZZ/mxOYjILI74m07xwIMqf
 9NjGRkxZF4S2Tv+tArZ3rWNuhkqLCTiwHkM4S5HO5XnzYEWI9wxIKa9BAiglr/n00A2A
 MHwUD+1a4khyAR9MlzE6eSkXs4JGZQYljO55wlDaJPggkJDumBBj0T5NrRm6+MQfTE4H
 Ec4g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXgCk/Jd6vAsJOzMalNHH6dyHzsNP93NTlPTbTGKaETxmlYt0FvokF1pM170MeqEXMOs7mu4fF/W+M=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyzlnC5bhSgm0r0MzoX/+baSiMaem/2nLZK8Rnlo9oStFcwk/eH
 5wacNSN8Uh14Rgq8Hzi1nMBtcN1gtwJWk6qJEvmKUusQwU2UCkI/cSyQIW/DJ/CRC0Q+cuYrBvb
 CxSsDwmxqL97qh81HWew1wzK4akKS6msn7OhtikfbgvxzfWfBiJovYBmKP0oMKurkQVdFQmA=
X-Gm-Gg: ASbGncv4J7ZnwDJWKx2F7ToAyc3kOfjoQru7vyTFjExgBTKqzXsQxidXs4UwalcKYaL
 +uBf3sh0rpkmUxfR5tmq+EkNP5iYdk6xeQlyw38rQ7NT/mSe9Z+EOTLZoOCBJhN72uRJgY+aeZW
 jwRMGTJ9vJFvMfIKKOcrPmv4tkkglT+09YpkfKmCjl0GEBgH/E0vUgObvyhi2/eayf7NJyl+boR
 7zznFq88kkPw3Fe2Wg50QxVXSBNxHZvBhWPjqNl8v3jDrJME9vmKwfTcHVz+Qmr9DyWvcUl9PCh
 DgXjdtJHWFZXP4L252TNBGjO6PpipQURJ6zJ84lqMuX7XgNeoVJpo3kbhAKzpL+C8GJ7GtUGHzK
 TmYYPKn7T6Tp+ZcynuqsblAPOHdhaqOTpCzdKSusF4l6iCufw90FP1vOEzOjtVI9vF5CdiA==
X-Received: by 2002:a17:902:cec2:b0:261:500a:5742 with SMTP id
 d9443c01a7336-292d3fd9a38mr72509005ad.10.1761195008593; 
 Wed, 22 Oct 2025 21:50:08 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IEJqjQ5VJXt3VI85Iu5u10F0hg2Fj8UlcAw7hs/Onz/30KSLJIC0RZtQJ73mpgOW8HVaN7wLA==
X-Received: by 2002:a17:902:cec2:b0:261:500a:5742 with SMTP id
 d9443c01a7336-292d3fd9a38mr72508645ad.10.1761195008139; 
 Wed, 22 Oct 2025 21:50:08 -0700 (PDT)
Received: from [10.133.33.163] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2946f681eabsm7873065ad.15.2025.10.22.21.50.02
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 22 Oct 2025 21:50:07 -0700 (PDT)
Message-ID: <8d4184a8-4e32-43ce-a487-a195e97fa874@oss.qualcomm.com>
Date: Thu, 23 Oct 2025 12:50:00 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20251021-add-displayport-support-to-qcs615-devicetree-v5-0-92f0f3bf469f@oss.qualcomm.com>
 <20251021-add-displayport-support-to-qcs615-devicetree-v5-1-92f0f3bf469f@oss.qualcomm.com>
 <fh7daiy5p5taaz7ifymbivfktjqngs5oashhd3osrtzspsac2z@nswaeyh3kkhi>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <fh7daiy5p5taaz7ifymbivfktjqngs5oashhd3osrtzspsac2z@nswaeyh3kkhi>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAxOCBTYWx0ZWRfX7ulqenpcUDo8
 VX/wcMg2AR8KH+ZnwzwKE5mMfPN/SYHc7DrKifosH3ulct5uq8o0ul2DX2L04nCl27FmyKcOhoQ
 8f6mB0uqFauXtrenDFbMg5tGmwvEu5S3NdqXDZfBuI6sPL5ekyVxF2JyGgrx5ST5PkU2ej6WYYK
 foSeZuuswtqZ8EnMMRIM7gJTkjgPd0INZ+J1r4jp3te/wmlunnMQKC7+IFRWQffsaf9oxuQsrUR
 4B7EYwNxiNJ5s/1CPETUETega8qJHxH88TetekyxrcRwOlOwvTqlvsIK79Z66EVwdKQb4XCVhFM
 /K8KKpef3GTvvvKDYT3y/0N00JH8T4zv1iS/A9DMx9xjsuz5KZQl8FMTRD7pDdHC3F7vWRfvlyZ
 LAsIAJaxfrHtVmmJ39DttLHWZvhloA==
X-Authority-Analysis: v=2.4 cv=G4UR0tk5 c=1 sm=1 tr=0 ts=68f9b40a cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=WzllQ2DKJnOsbc1lEq8A:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: 8Nn8H3gvFgGYFx7VUHQe2QWYhQtf31sr
X-Proofpoint-ORIG-GUID: 8Nn8H3gvFgGYFx7VUHQe2QWYhQtf31sr
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-22_08,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 malwarescore=0 bulkscore=0
 priorityscore=1501 spamscore=0 suspectscore=0 adultscore=0 clxscore=1015
 phishscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2510020000
 definitions=main-2510180018
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


On 10/22/2025 11:07 PM, Dmitry Baryshkov wrote:
> On Tue, Oct 21, 2025 at 11:18:07AM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> SM6150 uses the same DisplayPort controller as SM8150, which is already
>> compatible with SM8350. Add the SM6150-specific compatible string and
>> update the binding example accordingly.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml   | 13 ++++++++++++-
>>  1 file changed, 12 insertions(+), 1 deletion(-)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..89852af70de97a9025079107b838de578778c049 100644
>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> @@ -51,6 +51,16 @@ patternProperties:
>>        compatible:
>>          const: qcom,sm6150-dpu
>>  
>> +  "^displayport-controller@[0-9a-f]+$":
>> +    type: object
>> +    additionalProperties: true
>> +    properties:
>> +      compatible:
>> +        items:
>> +          - const: qcom,sm6150-dp
>> +          - const: qcom,sm8150-dp
>> +          - const: qcom,sm8350-dp
>> +
>>    "^dsi@[0-9a-f]+$":
>>      type: object
>>      additionalProperties: true
>> @@ -132,13 +142,14 @@ examples:
>>                  port@0 {
>>                    reg = <0>;
>>                    dpu_intf0_out: endpoint {
>> +                    remote-endpoint = <&mdss_dp0_in>;
> Why?


Oh, I think I misunderstood the “messed up indentation” comment from Krzysztof.
It seems the two-space indentation under port@X and opp-x is the actual issue.

However, that part was not introduced in this patch.
I will split a separate patch to fix the indentation there.


>>                    };
>>                  };
>>  
>>                  port@1 {
>>                    reg = <1>;
>>                    dpu_intf1_out: endpoint {
>> -                      remote-endpoint = <&mdss_dsi0_in>;
>> +                    remote-endpoint = <&mdss_dsi0_in>;
> Why?


Ack.


>>                    };
>>                  };
>>              };
>>
>> -- 
>> 2.34.1
>>
>>
