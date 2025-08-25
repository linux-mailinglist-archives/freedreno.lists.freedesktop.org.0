Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id C1036B3345C
	for <lists+freedreno@lfdr.de>; Mon, 25 Aug 2025 04:59:08 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 1872610E23D;
	Mon, 25 Aug 2025 02:59:07 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="MAclPqQO";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D20F210E159
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 02:59:05 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57P0OUfG024938
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 02:59:04 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 pla/QjB44tiQOdRaYME4jtbNLH66yKqPkqc6mc3uXLw=; b=MAclPqQOoaCcJrB0
 MOKE/I3Wu2WONO49XLCWibfXhyT4kk7HWz4BDdUXwcZGmJd43vDuIDOhmKOgSMsf
 rTPWw0qJOXmMHpwd8DlFzLdNo0r5HWxU3dafDTZVQWovELV04R1qTw4zGmFCQFTF
 09j0AAB7jUXLCrpoZiXX0KI4Rene+i4EgyvRqmhH6Q7JpYmUw1UntETvexbx9tBn
 gHtYTzrb+Gm9mnUp7IC2WalxkNXkMo82Rezpsiikz0g/1IfMzWMUCxpD0jE1kpEN
 C612To1uFvuNQxkFV/3tbYbV4lgbRFeRgN6BX5E+FdfNikbbyEdUvHUA+B7Ex7l6
 bZLmhQ==
Received: from mail-pf1-f199.google.com (mail-pf1-f199.google.com
 [209.85.210.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48q5wdudum-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 25 Aug 2025 02:59:04 +0000 (GMT)
Received: by mail-pf1-f199.google.com with SMTP id
 d2e1a72fcca58-77057266d0bso1552075b3a.1
 for <freedreno@lists.freedesktop.org>; Sun, 24 Aug 2025 19:59:04 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1756090743; x=1756695543;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=pla/QjB44tiQOdRaYME4jtbNLH66yKqPkqc6mc3uXLw=;
 b=QPUpw1RaG29KQNcPqq2WSwcuSbZx0pPDpOocS171QHU8FUUtJukmDE2yB+Anaefr8E
 I6S13LCPCkL0z90B3YtSKsofh8E/KB7SqQbIuW2e0ttt979oZA/s/chX8+KjMzjhsdpl
 fHOwnEtkM1vNztlUrttY9OP9Mv2+gcKoFgazTIi8z6dnGcTd2sUNDjYhBab5ge7ThK09
 kkw9JzF1lTSwDTBGEWCVkX6+NeYG/zhMtLWm0CtMkZlm50cxHcL3L3Vedco5+w8nfEtT
 9ARY/cT3GZHzvY0DMNdi2Zo7HCbyBrVf0KWkKvLHIYww3sz0ZYqDdAotgYAzXI+YRorG
 ko8w==
X-Forwarded-Encrypted: i=1;
 AJvYcCXALsBNb4+Yr/FxZvA+ThEhB8uQ11i6n5vt9I0NufaWsIrL84eQ2xXoshxCIru1pXUOnpwq9mkrcUE=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwlorcUvbLTVjJQOaDKmiojdO47VDwtW5MLoGb7KEebTGsR8SFa
 Nnmo6udlD1EvovsasZjUpQP3S1aXtH9Te5LLqOtbMHiTjQNf7XgHclxP8sRy0trrtduH/1eA8UA
 lYv8fow/T9nwezS37au+e+HdqRXpQ8cZNwHv6giRLQK/2oXDn+nJauAhuZ01XppDpy8yv0mQ=
X-Gm-Gg: ASbGncunnC8WnTqZJEJS8vHLcs29+XPX6Z6/AQib4kSxrWSYYo/apkoELzRdPz1Etrg
 /K/+RsJYHnqnZW5JuL7u8VMT4B1HO46u8nPrnQkEW4+H1GLRowPAdaPhTEyS9ceYma2/1YZGwHV
 NDOtfIvkDZQWHI/GOZXoZUVes2hG2Y9JGAtc5d9EYSSHyoY9KWnKjLhrMRq81f2+U6+WmiO5dAz
 LCdCRuv1TTTeq2v3y5OwiNMiPatuCY2sjml+8170zL4ExOu/6w8JB3u0ScitlrpekJ6ppdfn3PE
 CuuNgCfqSZ+du0mX7ndRmrc2xJkwy/7KPb1+hJoaLCfHIZEdQJyV9gr32HiSo6SQiXybbwmgmeG
 74hQ1dizdyFfl0kN9v/11IzzhpsmFou0=
X-Received: by 2002:a05:6a00:190e:b0:757:ca2b:48a3 with SMTP id
 d2e1a72fcca58-7702fa048d1mr14178779b3a.9.1756090743361; 
 Sun, 24 Aug 2025 19:59:03 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGCpI9lwwPj/ghs95Ybuszk8ZhygB0e+mYXnTFXl3eSB1K0RxyvY+gmOa2bAJx/E+5Zx4Bxtw==
X-Received: by 2002:a05:6a00:190e:b0:757:ca2b:48a3 with SMTP id
 d2e1a72fcca58-7702fa048d1mr14178751b3a.9.1756090742854; 
 Sun, 24 Aug 2025 19:59:02 -0700 (PDT)
Received: from [10.133.33.147] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7704000edeasm5911077b3a.45.2025.08.24.19.58.56
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Sun, 24 Aug 2025 19:59:02 -0700 (PDT)
Message-ID: <65dfd4c2-37bb-4d99-8753-ce17e17097d2@oss.qualcomm.com>
Date: Mon, 25 Aug 2025 10:58:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
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
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kuogee Hsieh <quic_khsieh@quicinc.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
 dri-devel@lists.freedesktop.org, freedreno@lists.freedesktop.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250821-qcs8300_mdss-v8-0-e9be853938f9@oss.qualcomm.com>
 <20250821-qcs8300_mdss-v8-2-e9be853938f9@oss.qualcomm.com>
 <3ws6xfmmrnjybn4umbbnzjdksqberzuxslz6uxpabtsz2yzyss@jwblshilyx4p>
 <b86a1759-e49f-48b1-833d-fdc37b450f5e@oss.qualcomm.com>
 <ftazymlvq7rtbesx4keuek4avmmjq5cx4clewwpmem6ta7qmti@bn24prgszc2j>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <ftazymlvq7rtbesx4keuek4avmmjq5cx4clewwpmem6ta7qmti@bn24prgszc2j>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: YfQZA_FW4smHALWzYEjLPi663yfFvqi0
X-Proofpoint-ORIG-GUID: YfQZA_FW4smHALWzYEjLPi663yfFvqi0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODIzMDAzMyBTYWx0ZWRfX7yWcgIkwRh+N
 xjz96fsw4EBpjaEJzj1LiFpp0WU5SNj/KAFd9rofRwM+8ZHELrx4lM8gwaGg+fkVXOLnldtMLbU
 WBd5DngE0H4sgRVhJSa2DyhasVY6x5HZLTbU4LSl59HbsSJ/ys+Xiju/Xw8iuUzdCyO2AmKxOiW
 L/xBXzjt1ZIapKz9QzrN969SAhw7Mk8d+vRtnqd4X2SObh4XUFsgZkZMcWxa25amSPu9k6N6bUp
 B71pf075t6XimEcNndCK/UdCK4x8cn3BD+3W3rPseBXmf0PITErn26bL3Wx69lE8BykEhNSRbwS
 7hpPk8XfSdJs6tXMA0MvX2kPCr/4Fa2lIQhFlthLGju4yCRSiGAAoGwKfgfNFdtS8/qljb6m9s9
 ROPBZTCw
X-Authority-Analysis: v=2.4 cv=BJazrEQG c=1 sm=1 tr=0 ts=68abd178 cx=c_pps
 a=WW5sKcV1LcKqjgzy2JUPuA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=2PmUQm8wz_2Da7m3RkIA:9
 a=QEXdDO2ut3YA:10 a=OpyuDcXvxspvyRM73sMx:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-25_01,2025-08-20_03,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 priorityscore=1501 clxscore=1015 impostorscore=0
 bulkscore=0 phishscore=0 suspectscore=0 spamscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508230033
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



On 2025/8/22 18:34, Dmitry Baryshkov wrote:
> On Fri, Aug 22, 2025 at 11:06:58AM +0800, Yongxing Mou wrote:
>>
>>
>> On 2025/8/21 18:28, Dmitry Baryshkov wrote:
>>> On Thu, Aug 21, 2025 at 11:35:57AM +0800, Yongxing Mou wrote:
>>>> Add compatible string for the DisplayPort controller found on the
>>>> Qualcomm QCS8300 SoC.
>>>>
>>>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>>>> with same base offset as SM8650. It requires new compatible string
>>>> because QCS8300 controller supports 4 MST streams. And 4 MST streams
>>>> support will be enabled as part of MST feature support. Currently, using
>>>> SM8650 data structure to enable SST on QCS8300 in the driver.
>>>
>>> Bindings describe the hardware. There is no point in discussing the
>>> driver here.
>>>
>> Thanks for point it.. "The Qualcomm QCS8300 platform comes with one
>> DisplayPort controller that supports 4 MST streams", do you think this
>> description will more appropriate?, only discusses the DP controller, not
>> referencing the driver or SM8650..
> 
> Yes
> 
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 5 ++++-
>>>>    1 file changed, 4 insertions(+), 1 deletion(-)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index 68a6fd27506fda004e53174db5bcc88a29e8d2a6..ac44abfdd2853393ae199387c9ae2c37e1c48f52 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -18,6 +18,7 @@ properties:
>>>>      compatible:
>>>>        oneOf:
>>>>          - enum:
>>>> +          - qcom,qcs8300-dp
>>>>              - qcom,sa8775p-dp
>>>>              - qcom,sc7180-dp
>>>>              - qcom,sc7280-dp
>>>> @@ -179,6 +180,7 @@ allOf:
>>>>              compatible:
>>>>                contains:
>>>>                  enum:
>>>> +                - qcom,qcs8300-dp
>>>>                    - qcom,sa8775p-dp
>>>>                    - qcom,x1e80100-dp
>>>>          then:
>>>> @@ -217,8 +219,9 @@ allOf:
>>>>              compatible:
>>>>                contains:
>>>>                  enum:
>>>> -                # some of SA8775P DP controllers support 4 streams MST,
>>>> +                # SA8775P DP0 and QCS8300 DP controllers support 4 streams MST,
>>>>                    # others just 2 streams MST
>>>
>>> QCS8300 has only one DP. As such, it doesn't belong to this clause.
>>>
>> Emm,thanks, i got this point. So here need add another clause only work for
>> QCS8300(one DP controller with 4 streams), and i put codes before
>> "# Default to 2 streams MST", is this the correct place?
>>
>> -          # Default to 2 streams MST
>> -          properties:
>> -            clocks:
>> -              minItems: 6
>> -              maxItems: 6
>> +          if:
>> +            properties:
>> +              compatible:
>> +                contains:
>> +                  enum:
>> +                    # QCS8300 only have one DP controllers support 4
> 
> typo, controller.
> 
Got it.
>> streams
>> +                    # MST, no second DP controller.
>> +                    -qcom,qcs8300-dp
> 
> Missing whitespace, drop the "second DP controller" phrase.
> 
Thanks for review and point it , will update next patch.
>> +          then:
>> +            properties:
>> +              clocks:
>> +                minItems: 8
>> +                maxItems: 8
>> +          else:
>> +            # Default to 2 streams MST
>> +            properties:
>> +              clocks:
>> +                minItems: 6
>> +                maxItems: 6
>>>> +                - qcom,qcs8300-dp
>>>>                    - qcom,sa8775p-dp
>>>>          then:
>>>>            properties:
>>>>
>>>> -- 
>>>> 2.34.1
>>>>
>>>
>>
> 

