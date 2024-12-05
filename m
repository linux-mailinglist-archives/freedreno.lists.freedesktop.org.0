Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id EE22A9E4C6C
	for <lists+freedreno@lfdr.de>; Thu,  5 Dec 2024 03:46:04 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id C981B10E0D9;
	Thu,  5 Dec 2024 02:46:03 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="lTMWj79f";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 4F04710E0D9
 for <freedreno@lists.freedesktop.org>; Thu,  5 Dec 2024 02:46:02 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4B4Fwg40010257;
 Thu, 5 Dec 2024 02:46:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 EzSIqIAI2H3OCPUQVzKadBRtjIA7eSHPxpR42SjxRaM=; b=lTMWj79f9ye8eH2V
 gEFJjOoDa3SDhyQ33gXHwYAXR9xhxmN7ejjpIO5Ii7uE+mQNfXM9FAkBNXsXxEwr
 BVaSNGuWtga/RlNKtGvTi3AcvUcWrH7AltHNmvVoUVzNun3PsAnrb+CHNZqlr2ys
 97R1AXuaJqfHZ79+7IM9bpNVxUhcKuboolkZ6p7lAGTBMJByKdJ/ap6uxgNN2buH
 NLlqMJOcOLboUD4SwE72j8BP57ADoY8R9p70u3LUk/VMd1IYIk445yFpgLOoXkz5
 GtGY7iS+9gQ0cmfHEOghD0v2iQABLu9uWWpbrIoCKaudDb3cheMjhKR8hLfkHYBE
 Rl6jrQ==
Received: from nalasppmta03.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 439v7yx87t-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 05 Dec 2024 02:46:00 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA03.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4B52jxDY009089
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
 Thu, 5 Dec 2024 02:45:59 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 4 Dec 2024
 18:45:58 -0800
Message-ID: <59ee46e6-53fc-4cfa-8bf5-ecd82c2eb55a@quicinc.com>
Date: Thu, 5 Dec 2024 10:45:55 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/5] dt-bindings: display/msm: Document the DPU for QCS8300
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
CC: <freedreno@lists.freedesktop.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-2-29b2c3ee95b8@quicinc.com>
 <bzuzxddbxtlzeps7zfx33ghrfm7pbz64mynnnv6t4pznppxjyn@zhjpqwsliinu>
 <7538d45a-e1a6-42fa-93d3-69b6f394e450@quicinc.com>
 <CAA8EJpoRF+d5=gLxVpwB-AR9N3z_1PoG35eoDpckD8JHhn-=Fw@mail.gmail.com>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <CAA8EJpoRF+d5=gLxVpwB-AR9N3z_1PoG35eoDpckD8JHhn-=Fw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: y-DHOV_IkXD_nI8Q9w1G0qX2l5tm-S2z
X-Proofpoint-GUID: y-DHOV_IkXD_nI8Q9w1G0qX2l5tm-S2z
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 mlxscore=0
 impostorscore=0 adultscore=0 priorityscore=1501 clxscore=1015
 lowpriorityscore=0 suspectscore=0 mlxlogscore=980 malwarescore=0
 bulkscore=0 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2412050021
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



On 2024/11/29 21:44, Dmitry Baryshkov wrote:
> On Fri, 29 Nov 2024 at 11:51, Yongxing Mou <quic_yongmou@quicinc.com> wrote:
>>
>>
>>
>> On 2024/11/27 21:56, Dmitry Baryshkov wrote:
>>> On Wed, Nov 27, 2024 at 03:05:02PM +0800, Yongxing Mou wrote:
>>>> Document the DPU for Qualcomm QCS8300 platform.
>>>>
>>>> Signed-off-by: Yongxing Mou <quic_yongmou@quicinc.com>
>>>> ---
>>>>    Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml | 1 +
>>>>    1 file changed, 1 insertion(+)
>>>>
>>>> diff --git a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>>>> index 01cf79bd754b491349c52c5aef49ba06e835d0bf..631181df2bcf2752679be4de0dee74e15e2c66c2 100644
>>>> --- a/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>>>> +++ b/Documentation/devicetree/bindings/display/msm/qcom,sm8650-dpu.yaml
>>>> @@ -14,6 +14,7 @@ $ref: /schemas/display/msm/dpu-common.yaml#
>>>>    properties:
>>>>      compatible:
>>>>        enum:
>>>> +      - qcom,qcs8300-dpu
>>>
>>> The DPU is the same as the one on SA8775P. Drop it completely.
>> Thanks,got it.The DPU of qcs8300 and sa8775p are exactly the same, but
>> sa8775p has two DPUs, while qcs8300 has only one DPU and has removed
>> intf2, intf4, and intf8. That's their difference.Can qcs8300 reuse
>> sa8775p's dpu driver? if we can reuse it,will drop this patch.
> 
> Are INTF_n blocks implemented in silicon or not? What happens if one
> reads one of INTF_2 or INTF_4 registers?
> If they are actually RAZ or cause data aborts, you can not reuse
> SA8775P catalog entry. Please add corresponding data structures to
> dpu_8_4_sa8775p.h.
Sorry for later reponse,i took some time to confirm the hardware 
details.For QCS8300,DP1 CTRL/INTF_n is present in silicon.Only DP1 phy 
is removed in silicon,it not available.so i think we can reuse the 
sa8775p dpu.
> 
>>
>>>
>>>>          - qcom,sa8775p-dpu
>>>>          - qcom,sm8650-dpu
>>>>          - qcom,x1e80100-dpu
>>>>
>>>> --
>>>> 2.34.1
>>>>
>>>
>>
> 
> 

