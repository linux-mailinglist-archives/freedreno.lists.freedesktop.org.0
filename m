Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 46BEFB59546
	for <lists+freedreno@lfdr.de>; Tue, 16 Sep 2025 13:35:05 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 4DD5810E77B;
	Tue, 16 Sep 2025 11:35:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CnwrSwMm";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B831910E766
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 11:35:01 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GA56RB005286
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 11:35:01 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 PmwR9D+tvcvJlEb5/hczlmY/+kQv8mMLdqGi569sPyA=; b=CnwrSwMmSndg1RoR
 psWTN+6pYKUIsJ6Fh1+b9Fd5xz0fYmy727XciC4m9Qgt7Mr3jPdMpMm4IaI+mf2B
 X79Mga39k6pEelDcBoj2Tm6QaKe8JdUITkjbIIFUrvfWdLY7ft1mUge9gtNdy7AE
 c53qAjeGAYzNbCZDIjDycFYa+rZrRadZlOg8VXHqVU5AXdC7B5Lee8FaTJGMlSiB
 vTgWWbibB2j/EZTi9Hqpjdg2PCUU3MPckSgkRXK8HLbELSPcMr2DrdMfv9+rpms2
 5mGvys8Ts2E60ka/w75O9wJ5a1w72r8wULZJvSzCddVhAK4mvnhGJV4nKwtmJMs0
 zcjeQQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com
 [209.85.214.198])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g5n4c5h-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 11:35:01 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id
 d9443c01a7336-24cedbddd35so22469215ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 04:35:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758022500; x=1758627300;
 h=content-transfer-encoding:in-reply-to:references:cc:to:from:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=PmwR9D+tvcvJlEb5/hczlmY/+kQv8mMLdqGi569sPyA=;
 b=wmHP4DT0k4OthDEHu6XZJjsH31T1NE61S3RzsyoY1RDqwjzLZDZA3kQugDGQMjE37M
 RNg4jsT5EcV0teeciQ21BSqu/1MfKlBpIpFe1Cox+rIRKDhEqj2twSRUlGhvz0+L+frs
 LV1UQUnLX+OvASSPnoYb7FUfDCrUxaf52cCdy5LqYvxuRBrwHovxneKCWF2RKg6T54vg
 S8X2r8UtJpzASQb5/Q/q/3kbqGHtM6rb4MPdUE/3HfNuz48xuAalMtBoS7B6KXTL/h6X
 jGuq8uoqOG6Qnwzt/YDlwPDbCvZxAGvXygHvx4pYUXLAFH0J0UhB60SyQaZhitYHmBCc
 HzbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCWilzHlR/5cOSJyJ8zVZfe4oTP0owhfQRTTqjnzAEvKI8OvELa9/dq7UQqqqmlE/5eJJhZHdZnZyh0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxLpR1JbqEZr2CdV9OFfznit5XqN+Fdqzh5D+ULwIgqzOf/UN0y
 aJfZzcTo0wofl8Men2fOXUD0W2FMwqTIfPW1fXtBsX2aAZNg+fbH/s2GavmHfakt1d8KUhyo/mh
 WOXXoz5zbrE5n0jFLgBgtgxSNHSfpHAtm+fXrTrWHSLRieQ13+IuHy5tJKwCZsCaHKMx9f5g=
X-Gm-Gg: ASbGnctXMjiwO4f0yxESdW//FKD8VFp5vM2Vf1a6Or03tcxDomwqgmnAOksLbGhLHpD
 lMeP/k7ZfCHnlG3jxoENh/h3xL/wTb9rRQbeAf0db2kT+bRNObP/18zhtixqd8tqUKvuxMTpu76
 pgYpqB/HJ/xuCF9wskLJFSg5lu3oMC1hJUIMaYd4GkyX+YHisv+DQMiPOToE8cQsXtkHCtm/OcT
 NeuVeqMw2+TX5uy5VNrUNL0cA5CNeowJAIk4ilr1ShIMDE3Imcf+zi+IQayKXS6GCJwRQjHFOS3
 Zs1Vd0ZTtKrTyNnfJ5uF3ODtVSLoikvCPMaqzcZVjmpXtu/jKJOin+mdHsGN2rRGeKq0DOe6/zS
 ye9mWK0PJ0KfnO0JJDKNiVI6tPOTOpoq5kEI=
X-Received: by 2002:a17:902:ea03:b0:267:8b4f:df10 with SMTP id
 d9443c01a7336-2678b4fe1eamr38673865ad.0.1758022500168; 
 Tue, 16 Sep 2025 04:35:00 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFUGBkOmp8SbmqyPrB/ux8BIh6J3rY072mZrg1gtge/X1eT2SGo/MRJMekisexbLCC9g2Zk5g==
X-Received: by 2002:a17:902:ea03:b0:267:8b4f:df10 with SMTP id
 d9443c01a7336-2678b4fe1eamr38673655ad.0.1758022499633; 
 Tue, 16 Sep 2025 04:34:59 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-267e9372e86sm7196355ad.136.2025.09.16.04.34.53
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 04:34:59 -0700 (PDT)
Message-ID: <67a06487-001a-4af7-83cd-e9d05d848479@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 19:34:52 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: display/msm: dp-controller: Add SM6150
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
 Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 fange.zhang@oss.qualcomm.com, yongxing.mou@oss.qualcomm.com,
 li.liu@oss.qualcomm.com
References: <20250916-add-dp-controller-support-for-sm6150-v2-1-e466da9bb77d@oss.qualcomm.com>
 <5sg43rsun33i6bm3vz7io7yx2p4m7bmk5bnrnjg6u3zrulyofs@gyxtnfs4gvhz>
 <d302e71f-19bb-426f-a7df-c0d7854e97af@oss.qualcomm.com>
In-Reply-To: <d302e71f-19bb-426f-a7df-c0d7854e97af@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: VoNGiuNyfWiUsjnio8NRin8cX6CgNsuQ
X-Proofpoint-ORIG-GUID: VoNGiuNyfWiUsjnio8NRin8cX6CgNsuQ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NyBTYWx0ZWRfX4J/DRB0kV+jz
 U972Wxvn6dUlG/CliRaIW0GsTn7Jc0Gst13yWy+ip+pwbG+utpXi9LyAHgOLOZYojO8rnaSemkB
 cAGkiXNai/52J4wazmL42PwkApIhBQrGa4kSBA+Ss6gHTtoModD6SIuUKeUZ1VHomyGdzl5nZCi
 xVjH7HpmCrBMWv63Sh55gOvlM/q0/li3qDT9KEC78qJwrfVg2+X5CfXfdOSyzN1kZXIWBJwtLIT
 xHFyh1yaXfTYn3GN595GhbclbKiIEGRs9F9U3JFW93FKAMuTcuni5UZXTabE4GTGXWzfEp0M73o
 JjkWnqdt0EKs/6f8stR6nhNEcRDkbMHAVIVbv2iSKqcjmC5vs60mSEvm0z0iouIGcqMQDO51cNi
 gjtMqtpi
X-Authority-Analysis: v=2.4 cv=SaD3duRu c=1 sm=1 tr=0 ts=68c94b65 cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=ODrqbaRasvCVI81-ReQA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=GvdueXVYPmCkWapjIL-Q:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 adultscore=0 malwarescore=0 phishscore=0 spamscore=0
 priorityscore=1501 bulkscore=0 impostorscore=0 suspectscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150087
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


On 9/16/2025 7:25 PM, Xiangxu Yin wrote:
> On 9/16/2025 6:22 PM, Dmitry Baryshkov wrote:
>> On Tue, Sep 16, 2025 at 03:31:35PM +0800, Xiangxu Yin wrote:
>>> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
>>> 'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp'.
>>> Declare 'qcom,sm6150-dp' as a fallback compatible to 'qcom-sm8350-dp'
>>> for consistency with existing bindings and to ensure correct matching and
>>> future clarity.
>>>
>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>> ---
>>> This series splits the SM6150 dp-controller definition from the
>>> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
>>> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
>>>
>>> The devicetree modification for DisplayPort on SM6150 will be provided
>>> in a future patch.
>>> ---
>>> Changes in v2:
>>> - Update commit message and binding with fallback configuration. [Dmitry]
>>> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
>>> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
>>> ---
>>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>>  1 file changed, 1 insertion(+)
>>>
>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..82481519005a1b038a351aa358b9266239d0e8a9 100644
>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>> @@ -46,6 +46,7 @@ properties:
>>>        - items:
>>>            - enum:
>>>                - qcom,sar2130p-dp
>>> +              - qcom,sm6150-dp
>> In the review to the previos iteration I think I was a bit explicit:
>> "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom-sm8350-dp". You seemed to
>> agree to it. Now you didn't implemet that. Why?
>
> Sorry, I misunderstood your previous comment.
> I thought the recommendation was only about the commit message, not the
> binding structure.
>
> Does the current implementation mean that qcom,sm6150-dp and qcom,sm8150-dp
> fallback to "qcom,sm8350-dp"?
>     - items:
>         - enum:
>             - qcom,sar2130p-dp
>             - qcom,sm6150-dp
>             - qcom,sm7150-dp
>             - qcom,sm8150-dp
>             - qcom,sm8250-dp
>             - qcom,sm8450-dp
>             - qcom,sm8550-dp
>         - const: qcom,sm8350-dp
>
> Do you mean modifying it as below?
>     - items:
>         - enum:
>             - qcom,sar2130p-dp
>             - qcom,sm6150-dp
>             - qcom,sm7150-dp
>             - qcom,sm8250-dp
>             - qcom,sm8450-dp
>             - qcom,sm8550-dp
>         - const: qcom,sm8150-dp
>         - const: qcom,sm8350-dp
>

Or this?

    - items:
        - enum:
            - qcom,sm6150-dp
        - const: qcom,sm8150-dp
        - const: qcom,sm8350-dp


>>>                - qcom,sm7150-dp
>>>                - qcom,sm8150-dp
>>>                - qcom,sm8250-dp
>>>
>>> ---
>>> base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
>>> change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86
>>>
>>> Best regards,
>>> -- 
>>> Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>
