Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 88747C12EBA
	for <lists+freedreno@lfdr.de>; Tue, 28 Oct 2025 06:16:48 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 8D43010E35E;
	Tue, 28 Oct 2025 05:16:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bHBDugC6";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id ACCE610E301
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 05:16:45 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 59S325Ab353674
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 05:16:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XUAeRsK1Hv6t+HbR9mvGhvvq8azAUXrlOwY/BXZoNu4=; b=bHBDugC6Rva9VlmR
 xzli3lJpPCJSQDGTeqKtQnGhT5tEvR/cj0JfRqkyYNHIBM00oAQSCb6FuoKwdcgs
 wXU9kkoTrMVLFPWqOTpRpX7N+Brl5gMlC2zX4POaZblmKN1Dc2bhJvg+eIu2wF80
 G9XAquv8hUo7Dzlkn0aVJgYQ9/sGpscQqhn62U2WqLsd05Kjne7YUqSmBv1Mow09
 M3cCkCncwHViHqSs6aBhlxu+XbXUHCDPqAhoykIAE8LJPx5pa0akk/szC/uIk8XD
 7uNzHc73AY0Ks6kYSb8jo66++na15q5E9JUPBjUgkqRRgoGdkrv3nq8eoL8vAipy
 rTLm9A==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4a2njrrabt-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 28 Oct 2025 05:16:45 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-293063da120so17453485ad.0
 for <freedreno@lists.freedesktop.org>; Mon, 27 Oct 2025 22:16:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761628604; x=1762233404;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=XUAeRsK1Hv6t+HbR9mvGhvvq8azAUXrlOwY/BXZoNu4=;
 b=EJeNx5jkpOckqflJHU+PNGX0YD0V7yS9TsQ/nMnTRsk+4AoG0/IB1xvolenFzBxtNy
 OIDCDmSNThtDGixfBB2czTWgQxX/4QmQ5u+EL8frGW83l4WamfLdxv074pMxbbWa+jut
 6MVJ7gpCWQr4z/2up6ZJ758k7VeazaP/mZVZyIzQzSYfJ3nPqA33i6S76GmPF8rK6ud4
 DrcoC68c/Juof4/4mb/ieAZGInk5x1c0yJ5Df7wbSDZby37n27/Q/fy1MC10nbEhyEd/
 t5DCfv+ucHoos8nYhs4AcKLzlJLtYcEIeFGzmSQOUSP1s5l//VX6frC2aXITaznqljCi
 qhxA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo1NarE03Q81GsbmVr5lIo8nNk8fJHhHD31WGQ6gWGbn1vythXNdAOkqf2fvAgvB0ZqKYY8e7YLa8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxzopqV+n7QczZcckALl0jt8BRqRsnO568Qlj9pcwSQkaWuQKaS
 h23pcEMJpMHJ6f03OtaMUdO8PMSt27LK3VvuqihSdxiK6R90mTWPD+4bq4gFMTZCV4cuFrNu6ia
 85ESpr+D5OyrzpyqecT/ELgVepJP9nSWgt/MgU6Hcv5aOPrr2R5fwLLUXcax/QkbzJLDGjHM=
X-Gm-Gg: ASbGncuAiTwO2I7m8V2f1p6BZ+lOjsuYdYcfhaHR+0lmx9U3ic19MVv9yhTwAzTaID1
 Kg4DfB72qx+6wh3spIFUGAu0gtiiV4hZcUfH8hI9GNhyJw0amVAl6lsJlb3C41JIL6QdmM3G1y8
 uuU3wvIlS0MDtn2ygb+byE9/iKmL5dHedjwi8wP9uiSLFESyXLXADCSsz0HEQPs0djfIRyQd0c2
 hI8WPSo/uobtPObR91eqjRHlv2C79fGfqUVLl4TJwCAjpw/GiCUaELlcravxYX1lM+u7IGK4ELw
 XE5dFv70vb4QVNMc3hxupPwn9O7oXzsp93gUJCKl/jpjK5rhkNY19wxs1jP+G0AOU85n7lOlVe+
 hS5x9CRR1xpTMNgn+Gd8IYlVIxDpPCpiWfDPmLR2PPTXkozu+pdcewhNogQ==
X-Received: by 2002:a17:903:15c7:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-294cb38dad8mr15162205ad.4.1761628604360; 
 Mon, 27 Oct 2025 22:16:44 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFGCtI/e0xCUDzsunj5pLCq95XvGzaYTPPAgqnYqvKPP49ZjdTjLzgLXq4j89VNN8OjcYuAPA==
X-Received: by 2002:a17:903:15c7:b0:272:2bf1:6a1f with SMTP id
 d9443c01a7336-294cb38dad8mr15161945ad.4.1761628603887; 
 Mon, 27 Oct 2025 22:16:43 -0700 (PDT)
Received: from [10.133.33.251] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-29498e429d9sm100614015ad.100.2025.10.27.22.16.37
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 27 Oct 2025 22:16:43 -0700 (PDT)
Message-ID: <f34c6aaa-f3c6-4171-89e4-9f44da9a6a94@oss.qualcomm.com>
Date: Tue, 28 Oct 2025 13:16:36 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 1/4] dt-bindings: display: msm: Add SM6150 DisplayPort
 controller
To: Bjorn Andersson <andersson@kernel.org>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>,
 Jessica Zhang <jesszhan0024@gmail.com>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20251024-add-displayport-support-to-qcs615-devicetree-v6-0-c4316975dd0e@oss.qualcomm.com>
 <20251024-add-displayport-support-to-qcs615-devicetree-v6-1-c4316975dd0e@oss.qualcomm.com>
 <m6j3sdc4jb2jonzbpez7g3xb6cfputdz34wtydfrx736nqvrv6@o5ntg7csl7dr>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <m6j3sdc4jb2jonzbpez7g3xb6cfputdz34wtydfrx736nqvrv6@o5ntg7csl7dr>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=dqvWylg4 c=1 sm=1 tr=0 ts=690051bd cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=qjA4-Y8jdfHfWDHiyvAA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-GUID: Qw3fEkS1zrT0UcVBmiSHLiY9dlhp7UVb
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDI4MDA0NCBTYWx0ZWRfX/vueHSdZFvEc
 t5eXq/G4KhD3BOFkH3VTGvuFHTl854QWwgZkfy0sT9hudYZ4CwOD0tXGVNolddsWCXFGbdW6w76
 uL1bvzQwy6urPZ25aSeeH9iri+ApKJROB59vIiIUHiBcoR5UMufXBV0XREJfI7YQmur9clqUm5+
 /IzPk1yrIUZNroJZPFcGFIgKUGN/FwlVUWzAovj8GlokhBcX6iYP98bbgqNoFYPVgQee71a9sia
 JDp3LXULGM7qb5z7EibYvBT1pGB5UOSAFLkAZAESVs/S4I6IceOnicN4g+ks2nAjcN1zjho2s/a
 zjiRwvdlPqW1xWSlL+vmykuVzoDw9gvqAyvXKiJKRmZm/o+EI7v5SBWUnQXg5JkCHHoAVLvj6lD
 6wu34hPK+tdKjS0jAhyV6idO+gvdSA==
X-Proofpoint-ORIG-GUID: Qw3fEkS1zrT0UcVBmiSHLiY9dlhp7UVb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-28_02,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 impostorscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 spamscore=0 suspectscore=0 malwarescore=0
 adultscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2510020000
 definitions=main-2510280044
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


On 10/28/2025 2:54 AM, Bjorn Andersson wrote:
> On Fri, Oct 24, 2025 at 01:21:01PM +0800, Xiangxu Yin via B4 Relay wrote:
>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
>> SM6150 uses the same DisplayPort controller as SM8150, which is already
>> compatible with SM8350. Add the SM6150-specific compatible string and
>> update the binding example accordingly.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml      | 10 ++++++++++
>>  1 file changed, 10 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..ba0dea2edea98cee0826cf38b3f33361666e004a 100644
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
> Perhaps I'm missing something, but if sm6150-dp is the same controller
> as sm8150-dp, which is the same controller as sm8350-dp...doesn't that
> imply that sm6150-dp is the same as sm8350-dp and we could not mention
> the sm8150-dp here?
>
> Regards,
> Bjorn


I have discussed this with Dmitry in message-id 
<20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com>
SM6150 uses the same controller IP as SM8150 and should fall back to sm8350 for
consistency.

And when running CHECK_DTBS, I encountered DTS compatible warnings, which is
why all three compatibles are listed.


>> +          - const: qcom,sm8350-dp
>> +
>>    "^dsi@[0-9a-f]+$":
>>      type: object
>>      additionalProperties: true
>>
>> -- 
>> 2.34.1
>>
>>
