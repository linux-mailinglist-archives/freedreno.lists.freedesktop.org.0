Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 41335B048C3
	for <lists+freedreno@lfdr.de>; Mon, 14 Jul 2025 22:40:27 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 19D5B10E35B;
	Mon, 14 Jul 2025 20:40:26 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="PNLMXFRa";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 506D110E35B
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 20:40:25 +0000 (UTC)
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EJ85Nv013407
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 20:40:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 25GVmgVH9MDk+jPkcTAhkD6+0FAocGPXkUfqlwWZ3pw=; b=PNLMXFRazHMoAE1Q
 b2zqfe89TduErxSZAi8QZeNZpEPkA1msL7FbI0JgU5jvZqNN66vTqv3+XLjAChxQ
 I8nKIFfF5y/8nvK2A+YvkXeXBeKZ+caUVQNssT8B60IcbWAfGftXCSHNqWju/w7z
 nPeXOnvomxj0f/0YWsA8+rPYbeLP0DGyTQcrHxJyEPaFCTcxXJAfwhvI53rSrC+8
 U3AyJvz8I9R2xjv3iosKAS7YzqD11YEyc7YPRVa9v2AFDwre3UkHdmiNpH8/BwtA
 MBQqoyyIhipyY0BXgIyM8dyqkAi7t36Zn+0qY/f7AjFeXcPyWI0Onuu63Dxx44aQ
 zxDdiA==
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
 [209.85.214.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ufvbdtku-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 20:40:24 +0000 (GMT)
Received: by mail-pl1-f200.google.com with SMTP id
 d9443c01a7336-237f8d64263so47957175ad.1
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 13:40:24 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752525623; x=1753130423;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=25GVmgVH9MDk+jPkcTAhkD6+0FAocGPXkUfqlwWZ3pw=;
 b=dzwxPj9maCkm1hqx9MSKe1J3q0DbzXmWz1KVCMM9HQyZlO1OiNMnGyvCEO6QUR/CMK
 fwY5S2WLZ2f83jeyY87NtPBz40qleuf5IFJJMozHjSyf/amAMNBwiGWbQojNRqrskLQF
 A+zsk+1D0wqvV36jQjK0gGZltTt649EWubSeZQqjJNXbzyJDBmheeI1d7Dhq+QV5bBjQ
 pwMW46sjC+l6RCa9JBv5Ksegu8iYYuIOjMU7FDw23NZ6B8ee+6c8+U+iNSYGc+Fqcaux
 KUW4wS1p4rOqmozwF+cL4A7iiar/IV9Z6osUc47+ZlFzlO56Cu3/lulfWzot38hUyb/1
 SyUw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUDs+oa6hJLhP7VRl2Dtpmwgu+NUxluV7eMe6Lw3+vv3OIz09CQJCh5fS9tPYd1QBJKuMo5HaKXRMQ=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YwmvxXKrzYpYP5JFssoYxZmF6ZGE4aoOiqSVkWtoFKuyYp593L1
 M0aTzDeksF9LJPWAWmidDvWNiIrHU0FRWUNLsr6hFR7BLTE7Gj7cANLD4P43YqhuMh/20qcs+0e
 uJYRcTogKgdKcFZsVpfcP82EXcLvQRGcEqlPMKGb05DyMRjBfBma+/TjcCiOxlVcrg3Qdf64=
X-Gm-Gg: ASbGncu4WQF3EzyCsxeFdmnHGBOnj6Z0f6poD8s2cfd3ev02MKSAiNL2ilRkRgyLAZK
 GftVKEDlbfVBKmnV+rjCULwjnjWYbaXCNQVHQa0nar0T32+puKU6mU+j/EZMqjSBZ3/gICfxeCT
 g05m2IkEWo2RsThg1aDWqrWRtCDjTifITzFBPDWauVzRGbf/ENuzPZ2QK5J2YZ80/SN+EFRsMiu
 q3JUtRAxClpgC3uxuSzagzl3O2wd9lSZi7TCs8YmqBzjuNct60JrIW1w2RqWkBs8DP0ur+gxqf3
 2m8LVu3VaF2/0U/3GKcv/IVUE8U/skBp0mZrn90mdwDbKqG1SytDLsk3Nup4YVVDmTWlEDI875+
 WH7qnvMvAK1gsB6uddST8xA==
X-Received: by 2002:a17:903:190d:b0:234:c8f6:1b11 with SMTP id
 d9443c01a7336-23df09637cemr220506835ad.44.1752525623074; 
 Mon, 14 Jul 2025 13:40:23 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGWNBRWKprVEoGbPc3QI56BgXdYcezaLFCqX5CP+sJ7MbZarEK1v7Av0mTf7ehe9MRj6ZXn0g==
X-Received: by 2002:a17:903:190d:b0:234:c8f6:1b11 with SMTP id
 d9443c01a7336-23df09637cemr220506455ad.44.1752525622634; 
 Mon, 14 Jul 2025 13:40:22 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d9443c01a7336-23de4322db2sm99681325ad.100.2025.07.14.13.40.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 13:40:22 -0700 (PDT)
Message-ID: <6883f346-452a-44b1-b670-3bd514f57b08@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 13:38:55 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/19] drm/msm/dp: replace ST_DISPLAY_OFF with power_on in
 msm_dp_hpd_unplug_handle()
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Abhinav Kumar <abhinav.kumar@linux.dev>, Dmitry Baryshkov
 <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Yongxing Mou <quic_yongmou@quicinc.com>,
 Abhinav Kumar <quic_abhinavk@quicinc.com>
References: <20250711-hpd-refactor-v1-0-33cbac823f34@oss.qualcomm.com>
 <20250711-hpd-refactor-v1-4-33cbac823f34@oss.qualcomm.com>
 <rmlgjr3fzb7dmnwmthf5bj67wb6fkcksmn3ouchzsvhhgxiv7h@vwcieejcufr7>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <rmlgjr3fzb7dmnwmthf5bj67wb6fkcksmn3ouchzsvhhgxiv7h@vwcieejcufr7>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEzOCBTYWx0ZWRfX4fr5N9sU4t/c
 Ak7/7rB2pL9ZU1mRwejoxy3Yn47FBJPFNRbJPSUi1okd1g1Td4tlJzb4a/xHQ3/2sfaPBYlPZiL
 385rZSkuKzbnlV3STGa3PENeY/5TMAEYHpck3c0VHzdbKUA0U5/A1IPrF8kNIbzSxOVffPLyzAX
 Lg1T4rLkqPxB2whGYglePvMuD3pC2/74KUNPQyjwlMfGSYfvuABECF/1c1gOWtpsVG37IJXqNf5
 LFGE8bZ3uYR2XXkSrMhAPR/gOWJPjouy0vNqY4frXLc9ca7Daf3LeSFtsF30rBCJ4Gip/GXwV5V
 VKscvhA37Yopd48Sk9FWDp1UZLPIQgAEnylB8fEeEEGMf1f4ex2KsHWhG34hX5CydRnGRbiA/x1
 NSqabPkhARB7yJ1lvmSmOV1lhPRBk6KVdHTDiGYHJsL1gTlbcVOQebfjw91Km1EHt608FInQ
X-Proofpoint-GUID: EFYMJ5zP3HMN1ZjdF6FQAeY7rZtWo-rX
X-Authority-Analysis: v=2.4 cv=RPSzH5i+ c=1 sm=1 tr=0 ts=68756b38 cx=c_pps
 a=IZJwPbhc+fLeJZngyXXI0A==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=a_MUTpskHjF2EEzg2GEA:9 a=QEXdDO2ut3YA:10
 a=uG9DUKGECoFWVXl0Dc02:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: EFYMJ5zP3HMN1ZjdF6FQAeY7rZtWo-rX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 mlxscore=0 bulkscore=0 priorityscore=1501 mlxlogscore=740 spamscore=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 malwarescore=0 impostorscore=0 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2507140138
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



On 7/14/2025 5:27 AM, Dmitry Baryshkov wrote:
> On Fri, Jul 11, 2025 at 05:58:09PM -0700, Jessica Zhang wrote:
>> From: Abhinav Kumar <quic_abhinavk@quicinc.com>
>>
>> msm_dp_hpd_unplug_handle() checks if the display was already disabled and
>> if so does not transition to ST_DISCONNECT_PENDING state and goes directly
>> to ST_DISCONNECTED. The same result can be achieved with the !power_on
>> check.
>>
>> Replace ST_DISPLAY_OFF with !power_on to achieve the same outcome.
>>
>> Signed-off-by: Abhinav Kumar <quic_abhinavk@quicinc.com>
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>> Note: Taken from https://patchwork.freedesktop.org/series/142010/
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 2 +-
>>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> Please squash all state-related patches into a single one. It would make
> it easier to review and more logical.

Hi Dmitry,

Ack -- I'd wanted to keep all the patches small, but I can squash 
patches 4-16 into 1 patch if that makes it easier for you.

Thanks,

Jessica Zhang

> 

