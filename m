Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 7E5BE9DC19E
	for <lists+freedreno@lfdr.de>; Fri, 29 Nov 2024 10:44:39 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 5E37010EDCA;
	Fri, 29 Nov 2024 09:44:38 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=quicinc.com header.i=@quicinc.com header.b="Kwxkfjht";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 0D3CC10EDCA
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 09:44:37 +0000 (UTC)
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4AT844Vl004573
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 09:44:36 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
 content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 kGMYgyhYk31asooFjSw3rF3Sn+53erGjzbLmlWCo4T4=; b=KwxkfjhtN6FBBBXO
 6kZlsMIX6A3M0W/TnjJEOK067O6NZGGLSFWnMUoMsRQvZynK5WOhY6pmGqS1xS5I
 dOA3wMgrQ390kPR+KW22xqI0tlXIphU+FjTpadTf/FROnQK8wMl8CFQuf4yncb2Q
 cW3K9YS7p5+pG2gk6M9PeDLvkQiCQLfFSFYzBZHnJK2pAMeiaVCn4aOkuZRf0WN2
 VarIOvOasImEUw9EkfSHqhk0orbq2v8VGmE17fFwenHr/O2IoepL81h+AGl+ADBK
 8N4GQt79LUxss2JsKC4d/k4EGzn9Uj7O/0USvITb0bAV1TwwhxjlQTG2ZmkZmsvd
 jVmOQQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com
 [129.46.96.20])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4379s6r8j0-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 09:44:36 +0000 (GMT)
Received: from nalasex01c.na.qualcomm.com (nalasex01c.na.qualcomm.com
 [10.47.97.35])
 by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 4AT9iZb8023207
 (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 29 Nov 2024 09:44:35 GMT
Received: from [10.64.68.119] (10.80.80.8) by nalasex01c.na.qualcomm.com
 (10.47.97.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Fri, 29 Nov
 2024 01:44:34 -0800
Message-ID: <556d0f5c-3a4b-40b7-802b-df8b699deba9@quicinc.com>
Date: Fri, 29 Nov 2024 17:44:32 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] dt-bindings: display/msm: Document MDSS on QCS8300
To: <freedreno@lists.freedesktop.org>
References: <20241127-mdss_qcs8300-v1-0-29b2c3ee95b8@quicinc.com>
 <20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com>
 <173269567235.2233485.7286772244329561840.robh@kernel.org>
 <f433283d-e203-41f7-acc6-59fe606722a5@quicinc.com>
 <d4145905-68d3-40ba-bb66-15747eb0d54d@kernel.org>
Content-Language: en-US
From: Yongxing Mou <quic_yongmou@quicinc.com>
In-Reply-To: <d4145905-68d3-40ba-bb66-15747eb0d54d@kernel.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01c.na.qualcomm.com (10.47.97.35)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800
 signatures=585085
X-Proofpoint-ORIG-GUID: R541AVeL22OHrW4MJizHEMlqFn1UbAzN
X-Proofpoint-GUID: R541AVeL22OHrW4MJizHEMlqFn1UbAzN
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 phishscore=0
 impostorscore=0 priorityscore=1501 malwarescore=0 suspectscore=0
 adultscore=0 lowpriorityscore=0 bulkscore=0 spamscore=0 clxscore=1015
 mlxlogscore=712 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2411290079
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



On 2024/11/27 20:01, Krzysztof Kozlowski wrote:
> On 27/11/2024 12:02, Yongxing Mou wrote:
>>>
>>> doc reference errors (make refcheckdocs):
>>>
>>> See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20241127-mdss_qcs8300-v1-1-29b2c3ee95b8@quicinc.com
>>>
>>> The base for the series is generally the latest rc1. A different dependency
>>> should be noted in *this* patch.
>>>
>>> If you already ran 'make dt_binding_check' and didn't see the above
>>> error(s), then make sure 'yamllint' is installed and dt-schema is up to
>>> date:
>>>
>>> pip3 install dtschema --upgrade
>>>
>>> Please check and re-submit after running the above command yourself. Note
>>> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
>>> your schema. However, it must be unset to test all examples with your schema.
>>>
>> Thank you for your checking. I rechecked this file and indeed found some
>> issues. I will fix them in the next patchset. But i did not see issues
>> related to this header file in local. Maybe it is dependency or tool
>> issues. I will and update tool and recheck this issue and fix it in the
>> next patchset.
>>
> 
> Read the instruction carefully, including statement about base.
> 
Thank you very much for your reminder. I will carefully read and execute 
these suggestions.

> Best regards,
> Krzysztof

