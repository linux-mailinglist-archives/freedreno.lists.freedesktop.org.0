Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D981DB5956C
	for <lists+freedreno@lfdr.de>; Tue, 16 Sep 2025 13:42:07 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id AFE4110E78A;
	Tue, 16 Sep 2025 11:42:06 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="eixz+GBt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6CCA510E78A
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 11:42:06 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58GAH0IO012299
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 11:42:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 28jT5eJY9ZKsO53A9rpLGgzTqembdzTWrpkXeaPHOvw=; b=eixz+GBt+PeG79J3
 oCb75uRzMSwaY/lLMulFmfqSANh2rFRGoTTjs1HveZCIoiu4jPoi6tzONPwYolos
 Xxo+RyCxgZzei1e1NPP01+LSQIzPUQclpvs5s0h4AazOjSxVL+F1gl4GxZ4DN8VV
 PXY+MYj7i8cWKZcMS6Bwh1/sigq/9//FWpoVV6xmMeoJCWAduU85pLSkEG19Qxw7
 TVpTsgxuqGTgs9haxIwTL4sZIfAvDyYIvvUfsidGPGFWn9+9Q0sLLGduoMwWsIQi
 ZHLNkV5VzNGBTOBvTnR+k0JMjAOSLtV1Jp5JwUsd9uhZIcYw56ijqp6gg/7eZdD/
 D8CjGw==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 496g12mc59-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 11:42:05 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-267b2ecda65so3181455ad.3
 for <freedreno@lists.freedesktop.org>; Tue, 16 Sep 2025 04:42:05 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758022925; x=1758627725;
 h=content-transfer-encoding:in-reply-to:from:references:cc:to:subject
 :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
 :cc:subject:date:message-id:reply-to;
 bh=28jT5eJY9ZKsO53A9rpLGgzTqembdzTWrpkXeaPHOvw=;
 b=iEjTops3yWXDNPAlfw7MVKhOt/uOG+1qYFlj4LgzwodM5QeWuvW3xUyePcWM0sEEN9
 5o5XbeHcPx4uXvY5qBNQZj0GjXEl81wRVtpYwqj7UlMjb0wPfw72NN1FijomYLpcdDRK
 isTU3ZL9vbZFWlaqSpfzF/8NgNpmriu9pc6gKSpPLpAf9xh1djNzmOFnuUj5g1Ym91xB
 6JcxipneSBxMgzAWLijBF8xGQ72nIPXYenznaZ3dGq3e5wdkgkPTnvj6UTKBk6be5c/6
 /hEAYOf44M55ethwL0k9U997yIaBCMiCyU1EqSRkvxuPISbMXSp+9HxLzRHq+TS7zyk+
 f8+g==
X-Forwarded-Encrypted: i=1;
 AJvYcCXHDw86Aoneh9kpe58Vopo3UHkHp/Z87ihSYlIHje7SHGtALlomOzlTPuCn8D4d5xj6mDsuX7AO3HI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyC51nTeuKigOdQ9Nr1gRXWWAIWPk0wNMx9rF2D45RRlDOGkNS9
 qYpsgqFWt8zxLkWZ0ap3PBN+1bzYfxCYEAQ7aQlZW24uteOAaX0uzHlXToaBxiklF5v61tmvDTe
 WHkkiixmtrw4enbmY+0+1sCMlrOlfcQwSz8zpd7odEOWCg9VSXm+bZxI39Vk1B4Up3tGcdXE=
X-Gm-Gg: ASbGncvd1TbYi8LZZOMSKDBeZptxpbyNjt0lg9RkebRN0Z492PmPQWm1jcQXYXU/AZG
 +Tn55zte+IYfxFtkRrTqF/3bL0nld301dRy1N8JmHQABhF3GM8wfGTP6pcv2qC01rkiLojPeoj5
 HbFHyv3n5dwVWC7NJgNrkb/NcH06NYNhgaLppsw4Ex06M2ya8ZBDZNvZ4mwkRiGauT9RS8WXT2s
 LRHP5a/qmduqeZ8n9O9qeXGqTXLNsGPnKQT1g2Jjft9syrCsH0azdt6u9Not6jQFzoymDDUjv0N
 1jNO6uSDo+sfEid5R4rDf296ejF2KT/eDMHOlp0EHRoL1zsGiPD/r1+t26lIjGwcIg0+/yOXydJ
 hCRhiclIja9n8ihmKKO6ICxMQT5KCKs5eSiE=
X-Received: by 2002:a17:903:1c3:b0:263:cd95:9c8a with SMTP id
 d9443c01a7336-263cd95a9f0mr71971045ad.3.1758022924706; 
 Tue, 16 Sep 2025 04:42:04 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWylWAJjgYMxeXH1aDjbmaNpm3PYB57mwZg670WRfZJndDsocIiuW1GfqYWyIhKbdR9hVdLA==
X-Received: by 2002:a17:903:1c3:b0:263:cd95:9c8a with SMTP id
 d9443c01a7336-263cd95a9f0mr71970535ad.3.1758022924093; 
 Tue, 16 Sep 2025 04:42:04 -0700 (PDT)
Received: from [10.133.33.231] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-267b0bbab01sm35190095ad.116.2025.09.16.04.41.58
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 16 Sep 2025 04:42:03 -0700 (PDT)
Message-ID: <7acd7bef-a70c-486d-a052-4a544d751d16@oss.qualcomm.com>
Date: Tue, 16 Sep 2025 19:41:55 +0800
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
 <d302e71f-19bb-426f-a7df-c0d7854e97af@oss.qualcomm.com>
 <67a06487-001a-4af7-83cd-e9d05d848479@oss.qualcomm.com>
 <qnsxykukg3kigfiihdrrjkp6sbm4qte6lsga3as7eg3xaodtlt@skg5tcp4htii>
From: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
In-Reply-To: <qnsxykukg3kigfiihdrrjkp6sbm4qte6lsga3as7eg3xaodtlt@skg5tcp4htii>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Proofpoint-ORIG-GUID: 6pthjSX5NVslKp4IcgBoynL5R5TR6cBR
X-Proofpoint-GUID: 6pthjSX5NVslKp4IcgBoynL5R5TR6cBR
X-Authority-Analysis: v=2.4 cv=E5PNpbdl c=1 sm=1 tr=0 ts=68c94d0d cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8
 a=07YUQ-M1LMe7Y8jrGJMA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTE1MDA4NiBTYWx0ZWRfX9CGoR4Bleb3y
 X+AfXhPkQWCDa4MB046eCj+12Cgf94MTqtQB2ic+wssuYkmvu7XxmwOL/P44pCFsPN6ZbFnl+sw
 pMSmcSSj1aFJCthkt+Z9xZwe5hqscn78L30azyJDMTUhmkQq3XfXMEAtBB8tNGG1iWg3QhkNGuy
 eam6/C5SmwE0WHhQkRxeNa72S2I3Sn7WU59pNvY45TYMf5xQNppNdqh96ZzBKeDnmJB/+E9m4FY
 KNCTmOsGa7mcvH9z415LzrjaSnH7pwhdpOV8M50svv1D7PJCkRb/jnHOkiW1fx1Livy4+fCQUQW
 4BpxPiExQkRkZp4KqCfn1h2sWkH/8XYY8c29INx7zxXVy9i6Aqb9mbqMOfyNO2ym+ciBYnejbOm
 1hy1Zv84
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-16_02,2025-09-12_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 adultscore=0 bulkscore=0 impostorscore=0
 spamscore=0 suspectscore=0 priorityscore=1501 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509150086
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


On 9/16/2025 7:37 PM, Dmitry Baryshkov wrote:
> On Tue, Sep 16, 2025 at 07:34:52PM +0800, Xiangxu Yin wrote:
>> On 9/16/2025 7:25 PM, Xiangxu Yin wrote:
>>> On 9/16/2025 6:22 PM, Dmitry Baryshkov wrote:
>>>> On Tue, Sep 16, 2025 at 03:31:35PM +0800, Xiangxu Yin wrote:
>>>>> Add DisplayPort controller binding for Qualcomm SM6150 SoC.
>>>>> 'qcom,sm6150-dp' uses the same controller IP as 'qcom,sm8150-dp'.
>>>>> Declare 'qcom,sm6150-dp' as a fallback compatible to 'qcom-sm8350-dp'
>>>>> for consistency with existing bindings and to ensure correct matching and
>>>>> future clarity.
>>>>>
>>>>> Signed-off-by: Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>> ---
>>>>> This series splits the SM6150 dp-controller definition from the
>>>>> '[v3] Add DisplayPort support for QCS615 platform' series and rebases
>>>>> 'dt-bindings: msm/dp: Add support for 4 pixel streams'.
>>>>>
>>>>> The devicetree modification for DisplayPort on SM6150 will be provided
>>>>> in a future patch.
>>>>> ---
>>>>> Changes in v2:
>>>>> - Update commit message and binding with fallback configuration. [Dmitry]
>>>>> - Drop driver patch since SM6150 is declared as a fallback to 'qcom-sm8350-dp'.
>>>>> - Link to v1: https://lore.kernel.org/r/20250912-add-dp-controller-support-for-sm6150-v1-0-02b34b7b719d@oss.qualcomm.com
>>>>> ---
>>>>>  Documentation/devicetree/bindings/display/msm/dp-controller.yaml | 1 +
>>>>>  1 file changed, 1 insertion(+)
>>>>>
>>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..82481519005a1b038a351aa358b9266239d0e8a9 100644
>>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>>> @@ -46,6 +46,7 @@ properties:
>>>>>        - items:
>>>>>            - enum:
>>>>>                - qcom,sar2130p-dp
>>>>> +              - qcom,sm6150-dp
>>>> In the review to the previos iteration I think I was a bit explicit:
>>>> "qcom,sm6150-dp", "qcom,sm8150-dp", "qcom-sm8350-dp". You seemed to
>>>> agree to it. Now you didn't implemet that. Why?
>>> Sorry, I misunderstood your previous comment.
>>> I thought the recommendation was only about the commit message, not the
>>> binding structure.
>>>
>>> Does the current implementation mean that qcom,sm6150-dp and qcom,sm8150-dp
>>> fallback to "qcom,sm8350-dp"?
>>>     - items:
>>>         - enum:
>>>             - qcom,sar2130p-dp
>>>             - qcom,sm6150-dp
>>>             - qcom,sm7150-dp
>>>             - qcom,sm8150-dp
>>>             - qcom,sm8250-dp
>>>             - qcom,sm8450-dp
>>>             - qcom,sm8550-dp
>>>         - const: qcom,sm8350-dp
>>>
>>> Do you mean modifying it as below?
>>>     - items:
>>>         - enum:
>>>             - qcom,sar2130p-dp
>>>             - qcom,sm6150-dp
>>>             - qcom,sm7150-dp
>>>             - qcom,sm8250-dp
>>>             - qcom,sm8450-dp
>>>             - qcom,sm8550-dp
>>>         - const: qcom,sm8150-dp
>>>         - const: qcom,sm8350-dp
>>>
>> Or this?
>>
>>     - items:
>>         - enum:
>>             - qcom,sm6150-dp
>>         - const: qcom,sm8150-dp
>>         - const: qcom,sm8350-dp
>
> Yes


Thanks for clarifying, and sorry for the confusion earlier. 

I will update the binding to use this format in the next patch.


>>
>>>>>                - qcom,sm7150-dp
>>>>>                - qcom,sm8150-dp
>>>>>                - qcom,sm8250-dp
>>>>>
>>>>> ---
>>>>> base-commit: c3067c2c38316c3ef013636c93daa285ee6aaa2e
>>>>> change-id: 20250916-add-dp-controller-support-for-sm6150-525ac2ed8c86
>>>>>
>>>>> Best regards,
>>>>> -- 
>>>>> Xiangxu Yin <xiangxu.yin@oss.qualcomm.com>
>>>>>
