Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 90384B44BDD
	for <lists+freedreno@lfdr.de>; Fri,  5 Sep 2025 04:50:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9563610E2AA;
	Fri,  5 Sep 2025 02:50:45 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="aNLe7H+h";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 1425310E2AA
 for <freedreno@lists.freedesktop.org>; Fri,  5 Sep 2025 02:50:45 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 584I0iRh003019
 for <freedreno@lists.freedesktop.org>; Fri, 5 Sep 2025 02:50:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 gwSiyfYynLhMebpZWXrp11DL3hQi8HGEtTbhMohLx0M=; b=aNLe7H+hIb+m//KV
 ylEP6nIvYZ55uhHhlFQYeywFTpy91q1Nf7jS731O+T8/9H4WJj4etV0BdXw8X9ej
 0px136uS7IO0ZBRIQc/MIKq9ACBwTC/k4LtaFi9r1bOtllkAcAk7mP+yn0H3d05E
 cFNwdf/YfnEyv4Aa18n6CfeQRLPnFNsOZcHG+txOqlygQRR69Ado6W3hWVCWgMJL
 nXU3YIS1240RfsXh4wjYOh8lZMkzgCWjBGpDJhheKjv5ZzDb/0mP28oSV5gtqJZk
 aBdgRFjYLSGUBDHiCwGoCaPM0vuKOaiErvV22Zv1bXJ6NS5woSjAZu1Jg1g9fDxV
 c/YNFg==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48ush39edk-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 05 Sep 2025 02:50:44 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-77250c660d3so1844508b3a.0
 for <freedreno@lists.freedesktop.org>; Thu, 04 Sep 2025 19:50:44 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757040643; x=1757645443;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=gwSiyfYynLhMebpZWXrp11DL3hQi8HGEtTbhMohLx0M=;
 b=bpOh5EQsFh6vjDWS5cTJurhFSA08ZmT1mfSO1iy+GXBlba7rpMpjtuhY+YxHzPqPpE
 CoOE0SZCJvaVOi9zCKb8kLxN1E/Uj3/qxdxrYi1UAKZrddAIGg84wM6MUkuSgmM4BQWx
 IPuhuYQT7IuIA+dT5rPg+MeRx3qKLzLWmZNW0HmdH+TWQxxkOSCMIWsZNKixJ8ToTtnZ
 Ae+nH7eSV8Ay1SgrlTQz4t0CcXIRTZYYCPsX0tychuM2lSFDwz8uI04nDz/EB1hhOqlr
 29rZytNHl8keyg6/o7bQrOPKtpsH3cxYDI1QdV6UghN6QFIlRtiCUJvJt3AqbH4NbXot
 9+rw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUBNjZmksVlHDG0dA9lHU4ZrhvZd6sj7rVxcqyLeIY853XOXWdQdRZotkXgYNKtY3Dm5iz5DIa6Bh8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxYvzNKLq6OGdBX00dmg+qb96egxInKjxhi6peXejyARhiQDFSy
 B2DaVcqRxlHhn85DAEEzfEG5mU3IwdyHPx6ppOTRx6Sshtr9/Kv3SOA91f8tAxVcDiK9QLch/Iw
 v7Ly39dhjLJ2h4eTSlBVYkMIDO9bYTUK1NvAsEIjX+k64DDpBFlC82YGxBab8FIuLt5b2sy8=
X-Gm-Gg: ASbGncuPH+ZLpiBbTcqLmG7H2OCCHgm4d7xDs/lOjkreBYPg6nI7vqTKfKFpBNBBCLX
 5SGxFBLtfCIv7z9BiXuFu31sZEvrytkk4rfkjsqF18rffa3a7Akp+/3U1nY9ywshGPBAkeWIV0B
 ik/LzfGYF+LcYI/GM9prRWXwtz5mN4RZHscDoAIMW9msTprjlXt+Iew8u/3BxD4eBRv4ljCBa0c
 0/gjMKRSTUzqWPtI0SYvtuxpsW4OobsJto6BEDiSOu4jxdaSMj2o0Ypz5jYatKoKcLUALwsoR4b
 HaALSjScuuxHk8Kgom59bLBNYdNFxeA+JHaBT3UlKALYaocTvzW90vbddgk+6x1GAgMu1ipT449
 RUxJ2rihLR/7/qpqeI1lIgvXTIJrXUg==
X-Received: by 2002:a05:6a20:1595:b0:24a:b9e:4a75 with SMTP id
 adf61e73a8af0-24a0b9e5423mr7186347637.47.1757040643470; 
 Thu, 04 Sep 2025 19:50:43 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IG202+hHYdYs+StM7sqddV46k8lCxOuVmORinbn6w3E3iPnOnrsT3F7nWJ+yDrEZS7E2co12w==
X-Received: by 2002:a05:6a20:1595:b0:24a:b9e:4a75 with SMTP id
 adf61e73a8af0-24a0b9e5423mr7186312637.47.1757040642973; 
 Thu, 04 Sep 2025 19:50:42 -0700 (PDT)
Received: from [10.133.33.41] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b5209ccb174sm566277a12.19.2025.09.04.19.50.36
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Thu, 04 Sep 2025 19:50:42 -0700 (PDT)
Message-ID: <d8aaff46-9e3b-4b53-a690-351253753edd@oss.qualcomm.com>
Date: Fri, 5 Sep 2025 10:50:33 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller: document
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
References: <20250904-qcs8300_mdss-v11-0-bc8761964d76@oss.qualcomm.com>
 <20250904-qcs8300_mdss-v11-2-bc8761964d76@oss.qualcomm.com>
 <p2okyfwfl23bip65koaqezlvhyo3z47bnugojcieuspr37xc7b@s3qwgbqmts4l>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <p2okyfwfl23bip65koaqezlvhyo3z47bnugojcieuspr37xc7b@s3qwgbqmts4l>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODMwMDAzMiBTYWx0ZWRfX1aaeidAPv3iA
 lkPuhrw/bbUJQnIJ90pYP5rsMPA+NPtKBBzmMo6eo5h27LHzzE2Eup7/NQ5sJD+IoZOTPuwWhWd
 07ZTRLk0Fm+s1We/FO2VjKV6yywffJvVB4W9qm4VmxpIIJTZ/GprhqrgNisfiuhF7aLY1tqPDIQ
 ig46+sb3Z3JjbNIgcqCsUjUELvPyqrzUe2U70slyIha/vZuajVBbRZosuDg84pxMaIi0pP/u8rS
 ZnYRdb84ZNooOs+7/a6OS9MlrAwSLls+/cpVx2zy8idkviUHDKkLJ79vGGsKOV6eky4ZUXJuusi
 fr+fRX3R/xkeffVkwaNLn3vfKrGn1Fwtr/U+0Dm11ZcwA741QCLgkP3EbEP3J0upyYL5+FdOyK/
 3WdlVAHk
X-Proofpoint-ORIG-GUID: 2qFbYhd-JUnTgP-YgBi2VsVgFD5JP0pN
X-Proofpoint-GUID: 2qFbYhd-JUnTgP-YgBi2VsVgFD5JP0pN
X-Authority-Analysis: v=2.4 cv=M9NNKzws c=1 sm=1 tr=0 ts=68ba5004 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=LzpWVPJsz2Mq4VjTse8A:9
 a=QEXdDO2ut3YA:10 a=zc0IvFSfCIW2DFIPzwfm:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-05_01,2025-09-04_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 adultscore=0 spamscore=0 priorityscore=1501 malwarescore=0
 clxscore=1015 suspectscore=0 phishscore=0 bulkscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2508300032
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



On 9/4/2025 9:43 PM, Dmitry Baryshkov wrote:
> On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
>> Add compatible string for the DisplayPort controller found on the
>> Qualcomm QCS8300 SoC.
>>
>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>> that supports 4 MST streams.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
>>   1 file changed, 22 insertions(+)
>>
>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>> @@ -18,6 +18,7 @@ properties:
>>     compatible:
>>       oneOf:
>>         - enum:
>> +          - qcom,qcs8300-dp
> 
> Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
> new one?
> 
I think we can not use fallback to sa8775p, since we don't have DP1 
controller for QCS8300. SA8775P actually have 4 DP controllers (now only 
2 really used). So in the hardware, i think it is different with SA8775P 
and we need a new one.>>             - qcom,sa8775p-dp
>>             - qcom,sc7180-dp
>>             - qcom,sc7280-dp
>> @@ -195,6 +196,7 @@ allOf:
>>             compatible:
>>               contains:
>>                 enum:
>> +                - qcom,qcs8300-dp
>>                   - qcom,sa8775p-dp
>>                   - qcom,x1e80100-dp
>>         then:
>> @@ -295,6 +297,26 @@ allOf:
>>             minItems: 6
>>             maxItems: 8
>>   
>> +  - if:
>> +      properties:
>> +        compatible:
>> +          contains:
>> +            enum:
>> +              # QCS8300 only has one DP controller that supports 4
>> +              # streams MST.
>> +              - qcom,qcs8300-dp
>> +    then:
>> +      properties:
>> +        reg:
>> +          minItems: 9
>> +          maxItems: 9
>> +        clocks:
>> +          minItems: 8
>> +          maxItems: 8
>> +        clocks-names:
>> +          minItems: 8
>> +          maxItems: 8
>> +
>>   additionalProperties: false
>>   
>>   examples:
>>
>> -- 
>> 2.34.1
>>
> 

