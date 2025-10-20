Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BF90BF0DDD
	for <lists+freedreno@lfdr.de>; Mon, 20 Oct 2025 13:36:21 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7BF1410E41F;
	Mon, 20 Oct 2025 11:36:19 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="bUQLio5n";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id C439310E41C
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 11:36:17 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59JMWeS3007591
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 11:36:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 GK+5rKa1ckv1Q0xDSQsg2JrLR6JcjvANAgY1SmDdptQ=; b=bUQLio5nYqY+yhTW
 sugPBh3IxjvFCDE77A33/Vy0zmWuKxMSSrIIvPjuQKOi0UW3SHP+EBqOMfvlxPTy
 QeTD8cmED3H+gE3hLrx5mkL8vhQhr0p9THQMRdGrpPfqvjlY1FjjfXoGNugMKZr9
 NWizG9S2D8TyPnFCAESEestSOSVCz5o0GqU8V1a7uCpn8GBnjrLk5SD5tckqhLyC
 KAfSN3YXpkrfIaYwxFa9NXdu1kpcsHwCneXV3ggLKZ9Ju10m1+xFu/yRNak/28Nl
 5Hc0DTaiGmJu8GYnwtgFHvAItVzbiEXUG7ByAoBmiwfi4U4cuJmAL3/lzhbzffda
 IazMWQ==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49v3984hj5-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 11:36:16 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-26b3e727467so15678565ad.0
 for <freedreno@lists.freedesktop.org>; Mon, 20 Oct 2025 04:36:16 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1760960176; x=1761564976;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=GK+5rKa1ckv1Q0xDSQsg2JrLR6JcjvANAgY1SmDdptQ=;
 b=cov5nPpB9eOMQm5EAwBQm7s3HIPYludYYDWWt8zPnCEfOLgJpIWaKvtFJo+7cJwo4B
 uoPcc2YlwO90H/au+6LgagVfRuHEMtm9M9lqyVna0uJybyKQpk/Iq1CTeYAalEMNr1rC
 eY1FWfHUE9yWK82hSnAWSxqFjhfvp+HeLrOVC+z1k4vhiDlIcf15BGw4l8Ldji4+FluB
 oU+jl4QVlvw7buuJwzuo/E0q0uF0OfZKWpc4kbdEyw5bBjFUrJy4StEngGcyjAwy6sJY
 xgZtGCvNZereP+QDwQyD8/TW008q3bABPSMy7ejajbSnN0hFl2nJesb+adfl4ymiJg/r
 a8AA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWsV7JxoD/WTKg8EuUVrbRlOBs7huECim2BGeBbeLDoPMdNbTS4HqrClPmx6pknwjkhL1lylPFvQew=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyQ6xCqoW+LXiLTRYMhPGX4Lbxk1warFmtHbn111l9q5t9lHBI3
 uPccrxkXkHl9RDcGv0DjsjW2o6o3JqYYPuTbATvy5d/hP4sCcLfZMvZh85eVHlKK9kI7P89RtXN
 usBX9A3XwKCFPos9I8XtFgcn2JHXzp+kDzR42472exVB8DZCcprSyqQrze3iK3Koxh8XzxEU=
X-Gm-Gg: ASbGncs4vSMS1G1nzJ5XmXvP+aDHhEIMh8+QYAOU8kdUuNTFxlqYkj1/zZzli844BAV
 gVfEaNqXIZiwpUPslpXTD+mltwsIH8K64sjadN76ZeGVDrvoEROOOjIbrlbsSR44qZVA7fryYKk
 QH6juuaa4YmJbAEDg28T62jse1ynhrc0VJ3mda19nsqo/dDNxxea5ntUPy90LCuqDfYPQcEfcrY
 4pMqzN59kx0tfdUYih6+4TQPlMKxImekqtMGOUcS7o20cGIMHHLOP5kAlS/e5YX2+D5qJXW6pMc
 STRQDsCiyszUb4vST7WLs4DBEM0fXHnpowTgccdf2uVQqc21hRoV/bBxxh9v+oe8y8Ow7G4oCOc
 UVGJFGXVlptnGWpBHRmlI2WBhpVg8CA2xhslTmWMMWl5LfR7C/pKnW5YCJQAFWZ/tUAmjtA==
X-Received: by 2002:a17:902:f550:b0:290:aaff:344e with SMTP id
 d9443c01a7336-290c9d07528mr93219645ad.2.1760960175687; 
 Mon, 20 Oct 2025 04:36:15 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGqYXTamiz1sZaI2FXDLVVOOe09rjZU54qmwtT0sYAF4DGpiXYK7IZbq29yBk4Y3Y1cW0n/IQ==
X-Received: by 2002:a17:902:f550:b0:290:aaff:344e with SMTP id
 d9443c01a7336-290c9d07528mr93219385ad.2.1760960175155; 
 Mon, 20 Oct 2025 04:36:15 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-292471fe4d8sm77471275ad.96.2025.10.20.04.36.06
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 20 Oct 2025 04:36:14 -0700 (PDT)
Message-ID: <e6c481cd-e084-4f5f-a75a-d1e0a254efc1@oss.qualcomm.com>
Date: Mon, 20 Oct 2025 19:36:02 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] dt-bindings: display/msm: Add SM6150 DisplayPort
 controller
To: Krzysztof Kozlowski <krzk@kernel.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
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
References: <20251015-add-displayport-support-to-qcs615-devicetree-v4-0-aa2cb8470e9d@oss.qualcomm.com>
 <20251015-add-displayport-support-to-qcs615-devicetree-v4-1-aa2cb8470e9d@oss.qualcomm.com>
 <58446b2d-560f-4a7e-890a-78ae0bb92908@kernel.org>
 <f4dihh4z2nnkjcpsrmopycm6opellvv4mkpee72xjbn26nw544@sfc4oy6c2xci>
 <a3994a92-0a36-411e-97a3-b01fd406ddd1@kernel.org>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <a3994a92-0a36-411e-97a3-b01fd406ddd1@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=KcvfcAYD c=1 sm=1 tr=0 ts=68f61eb0 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=EUspDBNiAAAA:8 a=csQNx8weYdTNeSVC_AYA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDE4MDAyNSBTYWx0ZWRfX4aPmoqhghsRs
 cGOgAOBcTmFlCAL1jEINfMNmlROAWVmcKJp9adDOy+8kHYufZfVk3wCOHbgKfMM9WgXKFRUpP5p
 ddeyW/CehQFWudFeX0QD5Jux+yFYFReNLP2SwQ0kmp+RDYm7NtKgY7eRhXTZH1Yg/JwcgU1SiMK
 LY8SwN8sSw60Cej2srI41so5xAgA9pWX6vZOJkr3ur3Sd+FFr6+gCTB857si+cbzfb1vuRM29We
 BpRgkzFJLD10TMVCnGf0Rtcnteb8mF0XTsgq6xPfIf7Jmn1UiWCIMIDsVrJWS2ziOwX3phbp/0m
 rxFb02JnPMNJFjSLImI1nVDWbz0sjyoI2bk0E7OpuOukJ6swzAa9Js0Xhs6DI/yjVCjlsUy2SN7
 YNfxSCHALiYNYiCqW+EjkmrojoSupw==
X-Proofpoint-GUID: 68QG7JqgD0sanQUi95v_F3loPLrF3Ntw
X-Proofpoint-ORIG-GUID: 68QG7JqgD0sanQUi95v_F3loPLrF3Ntw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-20_02,2025-10-13_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 malwarescore=0 clxscore=1015 bulkscore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510180025
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


On 10/20/2025 7:18 PM, Krzysztof Kozlowski wrote:
> On 20/10/2025 13:07, Dmitry Baryshkov wrote:
>> On Sun, Oct 19, 2025 at 07:13:32PM +0200, Krzysztof Kozlowski wrote:
>>> On 15/10/2025 03:53, Xiangxu Yin via B4 Relay wrote:
>>>> From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>
>>>> Describe the DisplayPort controller for Qualcomm SM6150 SoC.
>>>>
>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>> ---
>>>>  .../devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml     | 11 +++++++++++
>>>>  1 file changed, 11 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>>> index 9ac24f99d3ada1c197c9654dc9babebccae972ed..935eca23ce6b30b81b3ad778e5fcacc817a230c3 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm6150-mdss.yaml
>>>> @@ -51,6 +51,16 @@ patternProperties:
>>>>        compatible:
>>>>          const: qcom,sm6150-dpu
>>>>  
>>>> +  "^displayport-controller@[0-9a-f]+$":
>>>> +    type: object
>>>> +    additionalProperties: true
>>>> +    properties:
>>>> +      compatible:
>>>> +        items:
>>>> +          - const: qcom,sm6150-dp
>>>> +          - const: qcom,sm8150-dp
>>> 6150 is compatible with 8150 or 8350? I have doubts.
>> SM6150 has the same DP controller as SM8150. SM8150 is compatible with
>> SM8350.
>
> So if SM6150 is EXACTLY the same as SM8150, then describe it in commit
> msg. If NOT EXACTLY the same, then probably this should be just
> compatible with 8350. Anyway, proper justification is missing.
>
> Existing commit msg is pretty useless, repeat the diff. I can read the
> diff. Commit msg should explain all the background which is not obvious.


Yes, SM6150 uses the same DP controller as SM8150. We already discussed this in
'20250916-add-dp-controller-support-for-sm6150-v3-1-dd60ebbd101e@oss.qualcomm.com'.
I will update the commit message to clarify the compatible information and fix
the indentation in the binding example.


>
> Best regards,
> Krzysztof
