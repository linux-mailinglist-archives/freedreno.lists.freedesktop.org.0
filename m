Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id F01EDBA3635
	for <lists+freedreno@lfdr.de>; Fri, 26 Sep 2025 12:45:53 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E168910E34F;
	Fri, 26 Sep 2025 10:45:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="CqpylniP";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A51F110E34F
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 10:45:44 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58Q8vYss015984
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 10:45:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 o37iq3utXp9TlBS1thYy8/XMKpWTzL3E3iu0aR8tupo=; b=CqpylniPW51JYdRJ
 fhhXPYGozB/XcacuunHqGv1GywAbV79/1ywg5EkJA5QiZnluIhNyf/ffs4XxrhgQ
 nf1c25Lk1wdmju/+uAlCov4RreeCz0aXY8EhO0gnluTdRd8DbNCAq1nb1+sdzJp4
 tPrN8lODiDf6CeXIJAaozvG7QlXxkqvP7FrH9+XV/JY2cMynlauXjtpHryrLTVpH
 p/zif35uLqz3ZLtCyOnEeL/DcVAbZfe/3mzQB+UonFQSURcQ6JXJVemh4+jwnFRm
 ALAUiICj403sEC6AJ+vx4n9ofIkHQ4oRrVKvZheM6Rk5q6imqdIfjKlzyDBrQju3
 HoQidA==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49db0rjj5a-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 10:45:43 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id
 af79cd13be357-82b15c1dca8so78758385a.1
 for <freedreno@lists.freedesktop.org>; Fri, 26 Sep 2025 03:45:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758883542; x=1759488342;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=o37iq3utXp9TlBS1thYy8/XMKpWTzL3E3iu0aR8tupo=;
 b=sO8rQVg2I91MDjxzVBUoKLftcA4tQs9wohGqUWztDDweM29yxCKVtyVmxOvw2mXsLI
 ckkzer6J3mIUeuJhs4QMWlY0kgBCgUF8874Fr97XTaRFtXlp9P6iaUJp0wtI1EHi6kz1
 NZfVGfkI3W4G+KEmR4g02HGsA0ZhUylaHaZuFJoVOoMn6/BWNLzhl9OzCqIslh/n2ss0
 bG1fNZYp/WGnzDYfGDfGyVBMcH9tkQrnE/B0XOQUKKwGIQ63rJrIEEzEuU0LGf/gyBcS
 5sShQT87HFuKdYpLjfiLCqztkqgrVx5EBKxYHLRnj7pREka7TAiHyeY8z+dPJBC5TIuH
 oKDw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW0LNc5gqe15du4hJpWEO5+BNlGyJxl4peKGVowmtb9tXPr0B35a9xVdN1BociPgT87e8/xlLTdsmc=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwFNKDbwpgmgbbmN5nIQ9nLJq9cJ68E3Qp0znGfIDVIqpGCGyum
 By0l9ApU9dBCjvfs0y9vLVuF7tTYl7otczP/5q/pEBgV9jg716aueq/FR3X+cTNofJu1A1I0IWK
 vyapT3AEXVhUGnlr3HdgAt1IIZQSu1Ub57iNx+CnJR9PU3/GtKWnNFBooMPblylyO++zfraA=
X-Gm-Gg: ASbGncvRmF1T9YSG1SNqednmRoywf+fC3tB6r7jogoQJIttx6vQ0zkUiYdZLRo4d6Qx
 zIjKbF731GKfS1h6EBv/EcPY7AcQL+pxm18RP/u+1x+08njpOzfjewC+Ksog1JRxjelRqKUuzlX
 MvMW2fDFoCGSY3ZWso0T7xHD6rMvuX/tjlNpAUMrZHX4gDdm04QFSHnpyYi6J8K4QGB30vbwJjG
 kV7iQvC+KBC5jK/cmXH0qqT/Jj6Ko+FOfg4jXenyxvDcJKBzuKMvL4p+42tAqqunxwe/kOAl1H+
 dEJAuujPX/AwxO+xTEMK8ZBQ0+CukVJrTauUIk4/8LMyoxhb192NwouTUmj9KVoC6NNr6h7wGi0
 Ipi+ByWZ6U4fXJ3HumEavmQ==
X-Received: by 2002:ac8:7e81:0:b0:4b5:a0fb:599e with SMTP id
 d75a77b69052e-4da47352360mr54646731cf.2.1758883542550; 
 Fri, 26 Sep 2025 03:45:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGpeGa04LShy34S3PksjJTcWsnlJiBTWqyL53wHPhVeyfkRWDwxP1iH4cDJtpYjWUnPOQvK7g==
X-Received: by 2002:ac8:7e81:0:b0:4b5:a0fb:599e with SMTP id
 d75a77b69052e-4da47352360mr54646461cf.2.1758883542010; 
 Fri, 26 Sep 2025 03:45:42 -0700 (PDT)
Received: from [192.168.149.223] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-b353e5d1671sm352124866b.3.2025.09.26.03.45.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 26 Sep 2025 03:45:41 -0700 (PDT)
Message-ID: <f685f02d-9faa-4d76-b9ad-35f2fee0ebe1@oss.qualcomm.com>
Date: Fri, 26 Sep 2025 12:45:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] arm64: dts: qcom: qcs8300: add Display Serial
 Interface device nodes
To: Ayushi Makhija <quic_amakhija@quicinc.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, robdclark@gmail.com, sean@poorly.run,
 marijn.suijten@somainline.org, andersson@kernel.org, robh@kernel.org,
 robh+dt@kernel.org, krzk+dt@kernel.org, konradybcio@kernel.org,
 conor+dt@kernel.org, andrzej.hajda@intel.com,
 neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, quic_rajeevny@quicinc.com,
 quic_vproddut@quicinc.com, quic_jesszhan@quicinc.com
References: <20250925053602.4105329-1-quic_amakhija@quicinc.com>
 <20250925053602.4105329-3-quic_amakhija@quicinc.com>
 <vsty7sy7gi2eeyifokwcqpoycmarxietkijmlkymwrmzmdsfws@x64f4ulbc6ja>
 <8c248bf8-2f25-443d-a08f-6504c349b72b@quicinc.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <8c248bf8-2f25-443d-a08f-6504c349b72b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=dP+rWeZb c=1 sm=1 tr=0 ts=68d66ed8 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=COk6AnOGAAAA:8 a=ov-OtuGVHHWtkdtd7_0A:9
 a=QEXdDO2ut3YA:10 a=bTQJ7kPSJx9SKPbeHEYW:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: NKCmP3jf28zZ9IviZAP5BzPCLCJ6tXh5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTI1MDE3MSBTYWx0ZWRfX5Stoa5YjWqKK
 hPcwpd0JDuymlMauOtRVBCJX86CGZfPseSyQTxQNvKa1GK4wTUwA0YMrnR1DL0P8gRbKKsSTnJe
 vjpHKxuFTM+U5/wnQLgX6E2T8qbfT5GaBdwJbZMjzLRi7YFBMFEeW9mIFjXn7rTDvWNRTZFz936
 lXmr8qo/MZhksTZcNFmCapc25/XpGUfZ7HFcTd0QkKb5/1ZgpHE49zEwfEPoj3HpdZv0dlrPt85
 5iyNdvhV0OPSiB3OfjqjVDRxwds7ozC7wTqHxNl/33gWkpsKM1MhgT0iw4uqtPOuq9SQq2KXqyX
 jSNGxvPIuHOAFwD967yzIy697PkBC6PSPTfC9dDDI6UgQP6gwqcVGa2QOOG9th2ShUo3QNOj+Qq
 UNU7B66+QLwB2kiDIhAFLNDlAq9YDQ==
X-Proofpoint-GUID: NKCmP3jf28zZ9IviZAP5BzPCLCJ6tXh5
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-26_03,2025-09-26_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 clxscore=1015 priorityscore=1501
 impostorscore=0 suspectscore=0 adultscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2509150000 definitions=main-2509250171
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

On 9/26/25 11:25 AM, Ayushi Makhija wrote:
> On 9/26/2025 3:32 AM, Dmitry Baryshkov wrote:
>> On Thu, Sep 25, 2025 at 11:06:01AM +0530, Ayushi Makhija wrote:
>>> Add device tree nodes for the DSI0 controller with their corresponding
>>> PHY found on Qualcomm QCS8300 SoC.
>>>
>>> Signed-off-by: Ayushi Makhija <quic_amakhija@quicinc.com>
>>> ---

[...]

>>> +			mdss_dsi0_phy: phy@ae94400 {
>>> +				compatible = "qcom,sa8775p-dsi-phy-5nm";
>>
>> Add qcs8300-specific compatible and use sa8775p as a fallback
>>
> 
> Hi Dmitry,
> 
> I have one doubt, even though the ctrl and phy versions for sa8775p(LeMans) and qcs8300(Monaco) are same.
> Why can't we use the same compatible string that we have used for LeMans ctrl and phy ? what is the need to define a separate
> compatible string for monaco ctrl and phy ?

Because they're different SoCs and if it turns out there's e.g.
a silicon bug specific to monaco, we can apply a quirk to just
monaco this way

Konrad
