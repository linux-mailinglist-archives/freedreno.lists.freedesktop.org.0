Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 58629B488EE
	for <lists+freedreno@lfdr.de>; Mon,  8 Sep 2025 11:46:28 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 2F7AB10E4C1;
	Mon,  8 Sep 2025 09:46:27 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ZPTyTe8J";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 071BC10E4B7
 for <freedreno@lists.freedesktop.org>; Mon,  8 Sep 2025 09:46:25 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5888xwp6002538
 for <freedreno@lists.freedesktop.org>; Mon, 8 Sep 2025 09:46:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 Now7RcY6lOs2y1Ct5ks9/SnhCMggFah46716miCh2BQ=; b=ZPTyTe8JDjkGsm8R
 qG7L0NMJauUOwQ/EbeNfLsXeLv66semrXDvJCoOKmTvzTZt9jlYBGGWdmV/57CKp
 UdCc48t54mAVqMHGUuQG79m0Hn9ru6N0x8RDuFW9drNecY/O9G4zLqrm2RtD2MKf
 /4eHqxibxhGgZEeb2S4Osa+p0b8hcQtgCA++5s3+z8ZSDo93/JtZ5eip2k+DaWmn
 X64VXaSutZqbVjuNcJaoCcSlPdz4YFYbvbWh05k8Y67j/WATUTqjfkboPeALyilT
 odAno1gs4Bq0ZE4pZ+t0/mCxXleguFimcxHiwTN/jzVJ9Q7/hwzTwA5dm/34wSkR
 70pQnQ==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 490aapcb9d-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 09:46:25 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-7722ef6c864so3957875b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 08 Sep 2025 02:46:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1757324784; x=1757929584;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=Now7RcY6lOs2y1Ct5ks9/SnhCMggFah46716miCh2BQ=;
 b=RlJnFB/bH8CTECQPgbsaUrKcclvZ3TdqzWJGcJXofbZwEvHeTRRzMf/LZ/OuucUjsa
 Yfhvuht9cjVyyqzRp9qPnVfcjAoGxt6TWT94iLfg7uImB/j3aAkYEYi538HD5gwlANMf
 96wmO70OzO2wRWwayyCIfsYNACUw5UB4xexWNveLXSyIYlB8yFSRt+zIjzjELCCaAup/
 Hp61D7dFSDwLMUZdDBJS1pa5nL0a/t3SRYJlLrS91j/8iOkaUIdPz0OEv/+xZXSZ7LN4
 f7yd1xM30s+W9vvfUtp5foufJP9e8aZ+YcDQ9WIjPPKmieaUWTV/sV4+kANOn5253ApI
 F0VA==
X-Forwarded-Encrypted: i=1;
 AJvYcCWo/ZcDWMz2vE2Sp7CTzjfh7TRjFVR3hUzIEOs6lYs+ldczb52nzf9pGeKjLq9G6selAS4ALb/sIAI=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxaRrzq7lhQYNwD8BPbKCGzh+ZjWN3gHnW67hcbA9VY7QaOrlAC
 4svwMfDph7nBEL8I+XyFtH1aIQ7NGVrlRTwx6OB1Cz6jSZH8ckb6D35cqBQBANby5xSRleOkfWw
 +Jc5MmL75obj/ID6EleZOtTct9PSjuRwoKHuCWtOKM4swswyJRpe+sIP3ZWpDgw6ablkDLsk=
X-Gm-Gg: ASbGncvh4smI27sEfEMYOdK5E49kBfhOJ2ATKdv2oNk8B5aYrNdAy99MiXumITANP1H
 4tJ9beOv3ZDY84HAVaU4bQPr8p4KdsYvEtLrVQzEwqH6mCbo5fVkB5vOEsMKZq6Gdk+P8r4CNH9
 vQUb6tDVnq9ga3FXishpirKdkW/CNV23UrCu8/lKNLs62eEOlXru+68okIBXYunFqCL42LYm9SK
 o8rZOI0s6KO9V+0nR1vnI02e9xrX6hPO8I0+UWc/WN3DcKklzFA5s3xdja036niSCA2T2j/kFwB
 HRUjWF9tOYsyE+0yd7+9MiORCvnpS32h2dlZUvSj0s+7144dOhxvSli537SgpobND0Ah0PLdnkH
 sQcK+BgszKet9j5DK0Hah03IbKiL+kHs=
X-Received: by 2002:a05:6a00:856:b0:772:59c6:432b with SMTP id
 d2e1a72fcca58-7742de9bd71mr7192772b3a.27.1757324783917; 
 Mon, 08 Sep 2025 02:46:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFev82Yp9Kr5wVOJJhoMHp/yvgqYrcjDrrgXkQ6IJGt4YT9zimh23alxUGwv5gPyVFAtpkruw==
X-Received: by 2002:a05:6a00:856:b0:772:59c6:432b with SMTP id
 d2e1a72fcca58-7742de9bd71mr7192730b3a.27.1757324783398; 
 Mon, 08 Sep 2025 02:46:23 -0700 (PDT)
Received: from [10.133.33.101] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-7722a2b65a2sm29336054b3a.34.2025.09.08.02.46.16
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 08 Sep 2025 02:46:23 -0700 (PDT)
Message-ID: <4a475efc-7da6-4456-ba6a-ef3320fea3d2@oss.qualcomm.com>
Date: Mon, 8 Sep 2025 17:46:14 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v11 2/6] dt-bindings: display/msm: dp-controller: document
 QCS8300 compatible
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
 Rob Clark <robin.clark@oss.qualcomm.com>, Dmitry Baryshkov
 <lumag@kernel.org>, Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
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
 <d8aaff46-9e3b-4b53-a690-351253753edd@oss.qualcomm.com>
 <20250905-indigo-mastiff-of-aptitude-b89e0a@kuoka>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <20250905-indigo-mastiff-of-aptitude-b89e0a@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=eMETjGp1 c=1 sm=1 tr=0 ts=68bea5f1 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=EUspDBNiAAAA:8 a=6QMyuPo7PgMWPuL3cUUA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: 2yCztg8iTbey_SGeEi9PocYPoYc6-elq
X-Proofpoint-ORIG-GUID: 2yCztg8iTbey_SGeEi9PocYPoYc6-elq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTA2MDAwMCBTYWx0ZWRfXzaZK+g3WirOa
 xNgHcYshKPEaikZSYxDQU5BISNnFxOnZ2sDd1OEB/blbWYNw9pIHPwI3nW+IIWs3mXPeBdsIOpf
 UyrfmCfF6NrrAmGKPldOYURaGGoCiUX/eejQwJlq3x3oXMAe62KGaW2WLr+hknQicZYViV1i/8X
 qNdqYn5wTDiMgmciCaKNjGSJXxlFY32u9Gv5E67wXKd2UDZXH52zdgdE4lCgQ42DhUjzGfpUYqI
 Lx0vjxK0bLbX5aSa4hkG0AgRYJ1CkYhqZQ82UqTBJ6YVIn4I9tllLb9zrhFeztjZbTXLkY5Hs2y
 4oh1AvNgqACIZv49S+69X1x18X3Q5bCZMGggWTKixWlgCUXLYUoujYGD3nKjs51kjAOLi6M3lz1
 dZ09NYlw
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-08_03,2025-09-08_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 malwarescore=0 clxscore=1015 adultscore=0
 bulkscore=0 phishscore=0 spamscore=0 suspectscore=0 classifier=typeunknown
 authscore=0 authtc= authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2507300000 definitions=main-2509060000
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



On 9/5/2025 4:25 PM, Krzysztof Kozlowski wrote:
> On Fri, Sep 05, 2025 at 10:50:33AM +0800, Yongxing Mou wrote:
>>
>>
>> On 9/4/2025 9:43 PM, Dmitry Baryshkov wrote:
>>> On Thu, Sep 04, 2025 at 03:22:37PM +0800, Yongxing Mou wrote:
>>>> Add compatible string for the DisplayPort controller found on the
>>>> Qualcomm QCS8300 SoC.
>>>>
>>>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>>>> that supports 4 MST streams.
>>>>
>>>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>>>> ---
>>>>    .../bindings/display/msm/dp-controller.yaml        | 22 ++++++++++++++++++++++
>>>>    1 file changed, 22 insertions(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> index aeb4e4f36044a0ff1e78ad47b867e232b21df509..ad08fd11588c45698f7e63ecc3218a749fc8ca67 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/dp-controller.yaml
>>>> @@ -18,6 +18,7 @@ properties:
>>>>      compatible:
>>>>        oneOf:
>>>>          - enum:
>>>> +          - qcom,qcs8300-dp
>>>
>>> Can we use fallback to qcom,sa8775p-dp instead of declaring a completely
>>> new one?
>>>
>> I think we can not use fallback to sa8775p, since we don't have DP1
>> controller for QCS8300. SA8775P actually have 4 DP controllers (now only 2
>> really used). So in the hardware, i think it is different with SA8775P and
>> we need a new one.>>             - qcom,sa8775p-dp
> 
> I don't understand how this rationale explains what Dmitry asked.
> 
> Why number of IP blocks (and this is DPx, right?) matter? Are you sure
> you understand what compatibility means? Please read the slides from
> OSSE25 or just read writing bindings.
> 
> Best regards,
> Krzysztof
> 
Sure.. I’ll discuss this further here to make sure I fully understand 
these comments.
