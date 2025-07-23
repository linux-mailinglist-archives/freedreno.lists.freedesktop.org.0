Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 183AFB0EFE9
	for <lists+freedreno@lfdr.de>; Wed, 23 Jul 2025 12:33:56 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E66F110E7A2;
	Wed, 23 Jul 2025 10:33:54 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="Z0yrZJWe";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id D1A4110E7A2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:33:53 +0000 (UTC)
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56N9RPU4012787
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:33:53 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 oBHkd60XiHv3KTV4Q/cfQM2d2Sgw9xBBOOYrRSYVnq4=; b=Z0yrZJWeWkVSGRng
 ztzDGzJDZ7ad7CtObEmZZxE395gQXCp5/a/bKKALwUBwhajCf+C7sYP9mdJ5doP0
 8yteaZRW9EIKZX33NyvAm3XQ3yWjm8jwy0qCYwOBYf9kwu1oEAmsJLTMfKuguF7W
 SeiW4YJ08+ybvypPghMWMRPzqJmYh+jssS/HmL9yOkCxkHbw6U+ulUTh1A6AI7yK
 rcPWxFbQLcAZ2BZqakZI2qbqLdvX4OXucGtR6MdzQKaBSWh1FpbAeiqwtAowSiiA
 vKMbdQ1w4Zmoi4TnP9nEkbqixtLdFwvpaLRTF5G4DyvyzDFiSK6fhZWUNNmT8CpR
 BhARHw==
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4804na37ma-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 10:33:53 +0000 (GMT)
Received: by mail-qv1-f72.google.com with SMTP id
 6a1803df08f44-6facbe71504so9875826d6.2
 for <freedreno@lists.freedesktop.org>; Wed, 23 Jul 2025 03:33:53 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1753266832; x=1753871632;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=oBHkd60XiHv3KTV4Q/cfQM2d2Sgw9xBBOOYrRSYVnq4=;
 b=b+G3SL6Qa+iBPBQD1Jp1B4s3kNAddAnxAb+cxdx0gscwA1O/IdvfRkcwcV9Of0xXgI
 1TLnZh+DB6p2ZTFc+zd4xUADBhlcpIagu12cDXXzDvWdE6w/dl86PSpV8WOOSL2Awx8E
 C+rHVYCZH7As0VwJ09HtkxrXLFZOoqP5WqiFNsPe4mwq8hUYNV/6XM/I5klvsiZa5nKB
 72AN1uwqVkfGIVtpL309paxCd1/cCOktoJ1wNrb/nOL+s0nLHZoxkwXzCDSl2HXbukEg
 t+bHani+8JSurHjnVjGS/WAOWpJ6spyIGCT1fd97np3cjQW+r3yEQqC1y9PHXO5hPglf
 VGgw==
X-Forwarded-Encrypted: i=1;
 AJvYcCX9+Ghsfb80k8WurMKEJXiaLhuaeFYqoq0fCIhjN/VwQAW2DvSX7dBR65LUHbeh21uOdfMRpzDg8yk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Ywz1Swr0F2IdYYjGA/FfwirBRWOHHEA75WpbJYIxChgFMq4JE8b
 Oprhg7iCn2S8lqHUMw8zcSucU4cugI6DbGBYGj1WVgHmlAW5EKEG+IlicRAEvcqjhIFMdSmCCiB
 WZAgw4s2jkPGl6qAg3TUfMFm4g5bhHP8u7B68ezvXjzhq87JuPEPsmjlpAY5FDRJWFlKENac=
X-Gm-Gg: ASbGnctOUtL8+PNKlpDsrU9bO2sVQcxz2dg9B79BUYoQkFlFkqKUyarE/jHBzoP7zaN
 S7yA8PJTdQg1dAkGYDQL0P0cxDmtZTL4E/JMHIsjyVLNESsh0tXlK9oZy19Bk94hHrk/krRHBot
 21fbfVxEELewU4clXCsTip6V5Evq6OTM5ctKCUj2uxrIWcVUQOJSY2ftbWmbOGbCj/31H6B00zJ
 CAfMxyvhc/DCq7bWGonraTF3EzADJrt2+sLlN3Y0lWW7xi5TzZkQCxh9TWIHK9fbDG6KsUGmW8m
 rnHmAiibjk/hrbs0zt7ogEj/N1NnHnNz80bdSvV79KlFVRmXWY2/Q3+022CWzl94HOjzKzv+7aP
 Ds2mLyNvCDyovfyLJbA==
X-Received: by 2002:a05:620a:2a16:b0:7e3:512b:97f4 with SMTP id
 af79cd13be357-7e62a1211b1mr119489485a.3.1753266832065; 
 Wed, 23 Jul 2025 03:33:52 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE2NMUcGI464RrH7J7b4NwsfI3U6elRNVRs3V+eXGNIbBdAvL30yamLCKXZICj1j4UL5vBZ6A==
X-Received: by 2002:a05:620a:2a16:b0:7e3:512b:97f4 with SMTP id
 af79cd13be357-7e62a1211b1mr119486685a.3.1753266831636; 
 Wed, 23 Jul 2025 03:33:51 -0700 (PDT)
Received: from [192.168.43.16] (078088045245.garwolin.vectranet.pl.
 [78.88.45.245]) by smtp.gmail.com with ESMTPSA id
 a640c23a62f3a-aec6c7d68a1sm1023903366b.46.2025.07.23.03.33.49
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Wed, 23 Jul 2025 03:33:51 -0700 (PDT)
Message-ID: <50d6a7dd-46a4-4281-968d-d7df041f21ae@oss.qualcomm.com>
Date: Wed, 23 Jul 2025 12:33:48 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 16/17] drm/msm/a6xx: Enable IFPC on Adreno X1-85
To: Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Dmitry Baryshkov <lumag@kernel.org>,
 Abhinav Kumar <abhinav.kumar@linux.dev>,
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250720-ifpc-support-v1-0-9347aa5bcbd6@oss.qualcomm.com>
 <20250720-ifpc-support-v1-16-9347aa5bcbd6@oss.qualcomm.com>
 <37nuk4kevhpwlzbpgm4tyhnmk6vi3a75oosz7l7xbvvn7qwq22@oomdnizhc673>
 <85073de3-3933-439d-9912-1f0ff145df97@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <85073de3-3933-439d-9912-1f0ff145df97@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: k7Wp5uAcrRAPog4k7cSfZ4YKcDGfj5V5
X-Proofpoint-ORIG-GUID: k7Wp5uAcrRAPog4k7cSfZ4YKcDGfj5V5
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzIzMDA4OSBTYWx0ZWRfX+tWkPauCGrWd
 NqGany6DM4r4c9mRqm+EYCmuXLE3rDp1uBg0hY6xzWxIZ5YMugUZlSwgkHINO5Kpbzuahtsnoq0
 L4eB2jkEheuFkWNfkDNEsM+9eYGyaBtJr+qBrFPwjlqShW4Fn5MyHYewQe+9iCpGgu0D0BHGEAs
 YWyolZzS0SNUK/WfXQ5tumjM30vkpgUZK7Ts5rUwlX7jYLUwpKw/Yren4X/VxdWrzT1Gi3Iv1WF
 wzX59wfie5XyqLHhiRoiv2LI+C5O2aDL4U3ZUfsIIrckoAW/7MK+B0JTnm3LtAYtY0wdRhUKSC+
 DkRm0/J4n6YeLl917eqG4CjyCdm6hCUYOp5eaiUJNxettnVInxZeqnebzxWLkVziiC0HmQxTg0C
 9C3c8sc7vHTFejr0uISTrIEMJUDT2OhXkzU4fi6upbTPqvm+Dv9PrMufkJoKEqAIjl496E8y
X-Authority-Analysis: v=2.4 cv=DoFW+H/+ c=1 sm=1 tr=0 ts=6880ba91 cx=c_pps
 a=7E5Bxpl4vBhpaufnMqZlrw==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=KWxADXa3oT3Tu5R4PFYA:9
 a=QEXdDO2ut3YA:10 a=zZCYzV9kfG8A:10 a=pJ04lnu7RYOZP9TFuWaZ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-07-23_02,2025-07-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 phishscore=0 clxscore=1015 mlxscore=0 mlxlogscore=719
 bulkscore=0 impostorscore=0 malwarescore=0 lowpriorityscore=0 adultscore=0
 spamscore=0 priorityscore=1501 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507230089
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

On 7/22/25 11:37 PM, Akhil P Oommen wrote:
> On 7/22/2025 7:25 PM, Dmitry Baryshkov wrote:
>> On Sun, Jul 20, 2025 at 05:46:17PM +0530, Akhil P Oommen wrote:
>>> Add the IFPC restore register list and enable IFPC support on Adreno
>>> X1-85 gpu.
>>
>> Nit: GPU
>>
>> I can't stop but notice that KGSL enables IFPC for a bigger set of
>> SKUs, starting from a630v2 and a615. Is there a plan to get IFPC
>> supported on those platforms?
> 
> Sorry, no access to those hardwares. But I can certainly help if someone
> wants to do that. :)

Let's get the groundwork merged first ;) 

Nowadays you can reasonably assume we have access to at least one board,
no matter which SoC

Konrad
