Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 810F9B59518
	for <lists+freedreno@lfdr.de>; Tue, 16 Sep 2025 13:25:41 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5CF7B10E774;
	Tue, 16 Sep 2025 11:25:40 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZQHCo1Vw";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id DC5C810E76C
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 11:25:38 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GABOGD005605
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 11:25:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 B2Q6PRAh17oXHVPDZ9oVb7TOFBwMNug0TqTqHd/Ji2U=; b=ZQHCo1VwZ3EWs5K9
 VO5ujswRVFbv47hMmZWmYhKEYkcI95b6Wgh1+awYrzbZC0RNMYP1M2KQ5dM5MGYa
 bFe60hX9Hc6hKGjwcLBd+p1mdVykIftwoObv3Gk8LrIs9w2H/iLpOiqA3JoX6Hah
 ii5vBh7GO20D2BXDSmpjoXC+F8Zg5nyJVomI0P2QldU7YMix6wBU/Ve823XJLUz/
 k3WlqS7JVbGiI8QvCvJs65OBvDVuaLIuaam4bo6UqUQ9fiYJDh6N2jejk1+mJGcP
 dx03nezcTIW3ddno/uAoCmCUFwMpeZe0THyn48bj6MZXBHP5WDhgGulR8by5hWZC
 7rryIA==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com
 [209.85.214.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4950u58kqp-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 11:25:38 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id
 d9443c01a7336-265f30bad28so3116515ad.0
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 04:25:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758021937; x=1758626737;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=B2Q6PRAh17oXHVPDZ9oVb7TOFBwMNug0TqTqHd/Ji2U=;
 b=xBssHM/TFbXjXmgEW5Xtreoqz5T3mpqVqX+ZQzXiyEKvl5mpa5Q1HNul7AcUwNQpTl
 xZTUbX4cIPUeDhf5sLsOKzmEHx/Bve7Q5g3rzWy672gE9HxTcBqtc5uKBpoXcLkFsaSi
 OK68Hg3bkgFUCf6dYW/MhH+do0CkHW7jJp0tV5o4reOkNxZpug5FTai4j3/Oni/UDV0B
 L/V+MX47WFKIOohvov0IHfaui2w/nJG0h5gotKbD5swITEHcqRBfS8koWJPHTsNDYLJr
 AkjzTkgNwsWqAoYe6q780EWWzP6pZcxCgvlcMZtzjdtIYa6mzqy9aidq4vl8JPfxvOcJ
 eEbQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCVbZf6cdGVWfH3MF0PAvsJmUQ0KretI9Vz44Y2quOAAXLORty6UKxuehNxs7m0io2xCqqtZfEEdXZI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxkTz80BoAndFXQ3Yk6sweIUk3mWJHnEviaxnxPcSujuNYQInWc
 ghI0xZnycpQ+G6fV1V+95ddIOe1kEVklNqOVTLX9qHWWkMI7iFBiKryTeG6ZCHNCGYJ3Xx8lGcL
 R7VsfW80igu5pWArtoRAYBhVOp/kCfkZ0vgHNkhKp2tOrVvfBfzNonsXuxsMc5jtZFPDl31Y=
X-Gm-Gg: ASbGncug/CfhjgwK9CoytSDGd35R6V/AwZ8AnpE4MAPzatQbWExjjZcsTkIc/PxIM7O
 1geUAXXwALA+2qbmtwYI1JJE2ixTvUYypmJf0K0Z5GexKZrq2+eoMbAxAmVw19wfaEy9gsCR+qN
 6+PJFgbAXcE0rps7aiPiHw52Yjh61bDWV3Ay5WH561X/lWR3YSuhjKfOWXXVVrN6oHgsLvTCYsU
 COGIPHnqcYDEUcP2JfA2fb6mkezKF8jcOOVMX6bvXRndC+0gjrmSWi+9W0eoX2LMsaSgVIcFaR7
 hwvzkRWVDncNr0k+ucOtB5YMrALw4bKu3FBsP4AKGMLgtcqLbnqmqJtjXkrI0mTdbyYpOQWITk5
 AYieECMjWDgvqp5finK1shaLo4jcbo69pVCI=
X-Received: by 2002:a17:902:f546:b0:266:d667:9a6c with SMTP id
 d9443c01a7336-266d6679bb1mr44543065ad.7.1758021937147; 
 Tue, 16 Sep 2025 04:25:37 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFWCKZjTbQfe7tePHoP7fP0eywxKpjHtZsIYTCYp8lSIxUg3lTfrhSYDNp9seh2fc1YF8qScg==
X-Received: by 2002:a17:902:f546:b0:266:d667:9a6c with SMTP id
 d9443c01a7336-266d6679bb1mr44542835ad.7.1758021936617; 
 Tue, 16 Sep 2025 04:25:36 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-2613fe8f9absm95332075ad.131.2025.09.16.04.25.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 04:25:36 -0700 (PDT)
Message-ID: <d302e71f-19bb-426f-a7df-c0d7854e97af@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 19:25:28 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: display/msm: dp-controller: Add SM6150
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
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <5sg43rsun33i6bm3vz7io7yx2p4m7bmk5bnrnjg6u3zrulyofs@gyxtnfs4gvhz>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: E-R7zDGT2kvNA_zSnD5R2jP9RQBsJWG0
X-Proofpoint-ORIG-GUID: E-R7zDGT2kvNA_zSnD5R2jP9RQBsJWG0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTEzMDAzMSBTYWx0ZWRfX2B65zgB46GtC
 IuKVCQxZ5Uk6OkWJi/+Kybo8kVNPcysQ2zT1Z4VoT94WWvlLZtOC0XzNDQt3YtfyvOlwxgOdpj1
 zYuZLa0JVsU6UDP9ld2plv/gqjK0/Iss1P/bgNyxujzwC1HGl0LsZZSKeYPuhA9wGOu59EsxLOr
 RMvZks/PdgwDQb1mRoUVl7qzez3hNR1uOolvQnzKlAFfto8GKF829/WRRE2qrzl1zLMBM+SNBTd
 ds7v47/f1kYxIQfmJNYiETobaXllVCLjKbIZr7lSH8uByjtjY/Xy9Hh0Yvb5+lW601PcsVdFxqK
 beDTPfoGlqImqGx19qPG/HWXOLhBTelMfzS9UucSfdbdYCudRCFwimWA9UmSm/mpstmzihos9+c
 tyBGFka6
X-Authority-Analysis: v=2.4 cv=JvzxrN4C c=1 sm=1 tr=0 ts=68c94932 cx=c_pps
 a=JL+w9abYAAE89/QcEU+0QA==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=Y6_DBQXGChbAxPBu4GEA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=324X-CrmTo6CU4MGRt3R:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 phishscore=0 suspectscore=0 clxscore=1015 impostorscore=0
 spamscore=0 adultscore=0 malwarescore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509130031
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


On 9/16/2025 6:22 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 16, 2025 at 03:31:35PM +0800, Xiangxu Yin wrote:
>> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
>> 'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp'.
>> Declare 'qcom,sm6150-dp' as a fallback compatible to 'qcom-sm8350-dp'
>> for consistency with existing bindings and to ensure correct matching and
>> future clarity.
>>
>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>> ---
>> This series splits the SM6150 dp-controller definition from the
>> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
>> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
>>
>> The devicetree modification for DisplayPort on SM6150 will be provided
>> in a future patch.
>> ---
>> Changes in v2:
>> - Update commit message and binding with fallback configuration. [Dmitry]
>> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
>> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
>> ---
>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..82481519005a1b038a351aa358b9266239d0e8a9 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -46,6 +46,7 @@ properties:
>>        - items:
>>            - enum:
>>                - qcom,sar2130p-dp
>> +              - qcom,sm6150-dp
>
> In the review to the previos iteration I think I was a bit explicit:
> "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom-sm8350-dp". You seemed to
> agree to it. Now you didn't implemet that. Why?


Sorry, I misunderstood your previous comment.
I thought the recommendation was only about the commit message, not the
binding structure.

Does the current implementation mean that qcom,sm6150-dp and qcom,sm8150-dp
fallback to "qcom,sm8350-dp"?
    - items:
        - enum:
            - qcom,sar2130p-dp
            - qcom,sm6150-dp
            - qcom,sm7150-dp
            - qcom,sm8150-dp
            - qcom,sm8250-dp
            - qcom,sm8450-dp
            - qcom,sm8550-dp
        - const: qcom,sm8350-dp

Do you mean modifying it as below?
    - items:
        - enum:
            - qcom,sar2130p-dp
            - qcom,sm6150-dp
            - qcom,sm7150-dp
            - qcom,sm8250-dp
            - qcom,sm8450-dp
            - qcom,sm8550-dp
        - const: qcom,sm8150-dp
        - const: qcom,sm8350-dp


>>                - qcom,sm7150-dp
>>                - qcom,sm8150-dp
>>                - qcom,sm8250-dp
>>
>> ---
>> base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
>> change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86
>>
>> Best regards,
>> -- 
>> Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>
