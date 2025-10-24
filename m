Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 5A124C070AD
	for <lists+freedreno@lfdr.de>; Fri, 24 Oct 2025 17:44:47 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 03C0A10E201;
	Fri, 24 Oct 2025 15:44:46 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="iF0tJPBo";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 6860F10E201
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 15:44:44 +0000 (UTC)
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 59OCFEMm001292
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 15:44:44 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 RsSIFOmPwOHfjKgaufxErN9BuxGH1hiiSVvvEFdeNg4=; b=iF0tJPBo7tivlT9j
 X+fqeHS8Rs4DZQz14wcCn53jSzoIqO5bF0p9DEMxaija/ThZbcObPxbhJiE9peGQ
 58Z0Z2A5ZBft8IjHJiVPghwENeecPSdzrGihxFsRUj0u350iuTUTannpLVuT1/HZ
 toR0UUtX+aqfd/xj9YCSP4V0OyqJdzBIIwH5hWq0nSjsqwPuvjNDDILkXuUkR2WI
 A1wipld5nQ7CQjd/htIEi86dMLveLc4/0YIBoAY23uVBKeahV2Iqub9NEPz7VnBn
 KgX2JLIbKzgNj/9ssPQ3b+i+hy1j0JKO/cts0ln2iJ1JWEgmEW+D6GgRdB4X0QMz
 KrawDw==
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
 [209.85.216.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49ym9j44t1-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 15:44:43 +0000 (GMT)
Received: by mail-pj1-f69.google.com with SMTP id
 98e67ed59e1d1-33baef12edaso2129724a91.0
 for <freedreno@lists.freedesktop.org>; Fri, 24 Oct 2025 08:44:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1761320683; x=1761925483;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=RsSIFOmPwOHfjKgaufxErN9BuxGH1hiiSVvvEFdeNg4=;
 b=wxDYlZ8ZzfXVc49afaQR1nJZZ4l2NUEOYAwxoWGL1ZOA6rTw50zbBjHUmnrO29XrYa
 PNrfiLV8ErWHqC0tBzGSYRFKkjNSybf1Wk9h1q47JZGAg8exge+f7JCOtX5wpQdXQW5Z
 cbX/qqvjY4Q7fqCmhru19Ul8IWQUETc5b1oL0T2Ku8wCkmFBEv2liO1tk5IdI6v6I1Wz
 MZVetC25dni9xqyJNsAiCqzvULn0hkoVwAGfwNLtLTzKyAb9Dsx5xk6lCk09i54NGjHO
 Eje7+Ag0BZRs3+yUxVl45nQOc5gs8xXM404Fl2JrFpM9t+dL6XtxwTxdWqDTthjzseEz
 UXgw==
X-Gm-Message-State: AOJu0YyzEsp9DD0Ys3AExfM2vKoUx2AgHdTPhStLUqO8qrzOqgNtbory
 xZY54CVGBxOoz+6Drfd1CjLUJw19137lInBzvwTEJWJHxvvu5Z86qu7itT2ORXR0nwh8euUG6vU
 4q506eVOa1jPNlfVkUGUPDNhd5xlu1/Lf9S0saODqGURTVRQPq+YDUcT0R1W4hVzxjJI6WeA=
X-Gm-Gg: ASbGncuqgQFs7L6ULYrVosNuj4n5e/Ys6SUQ28wDunwzDvrMjnAFlwGHK5qj9LfzBSY
 1hFOAUQ0mhmY+A4zDIzWC12f0q4W/Qvj06gujeblEfs5qCzxqkjr7Acg1jy77SqxjGHPHeP9VAj
 p9MXqRjCNIGeRE2adDssHmD8Ac7zuvhEpVMih4c8euMLNJ1NcNtT+71lG7c8skttKVXLe0X5bEf
 p0+cTJqGeLWjmxM0fJjqyD1+2pzRQESfHyssImlTITB6sc1MUWT+JrmLMHpuGSxoU1B3oe/q15j
 G00KJveiNEhqWojZEDN7E1He9LioIxPNQxsomcry/qv4ch8NkUsgm8jq5WJlELbKYC//K/N8CTo
 XKWsl2fl2mUNEprZqp8dR9w==
X-Received: by 2002:a17:90b:3a46:b0:33b:b0f7:fdc3 with SMTP id
 98e67ed59e1d1-33fd65ca640mr3482668a91.8.1761320682854; 
 Fri, 24 Oct 2025 08:44:42 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHoydupJwYWbjfP4d6gKx6bLId6YhXa84WjCyAv6FuMrHrk33VGVoOGz0iiaQM3Gv/lfWoJJw==
X-Received: by 2002:a17:90b:3a46:b0:33b:b0f7:fdc3 with SMTP id
 98e67ed59e1d1-33fd65ca640mr3482638a91.8.1761320682339; 
 Fri, 24 Oct 2025 08:44:42 -0700 (PDT)
Received: from [10.204.104.20] ([202.46.23.25])
 by smtp.gmail.com with ESMTPSA id
 98e67ed59e1d1-33faff37c14sm6200687a91.2.2025.10.24.08.44.39
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 24 Oct 2025 08:44:42 -0700 (PDT)
Message-ID: <7cc6b184-e192-4d57-ba3a-82d4c7069fff@oss.qualcomm.com>
Date: Fri, 24 Oct 2025 21:14:38 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] MAINTAINERS: Remove Jessica from drm-msm reviewers
To: Neil Armstrong <neil.armstrong@linaro.org>,
 Rob Clark <rob.clark@oss.qualcomm.com>, Dmitry Baryshkov <lumag@kernel.org>
Cc: freedreno@lists.freedesktop.org, linux-arm-msm@vger.kernel.org,
 linux-kernel@vger.kernel.org, Rob Clark <robin.clark@oss.qualcomm.com>
References: <20251024-remove-jessica-v1-1-f1bb2dfc2e18@oss.qualcomm.com>
 <fe898b57-2b96-4f8a-8f27-58dca1c11ffa@linaro.org>
Content-Language: en-US
From: Akhil P Oommen <akhilpo@oss.qualcomm.com>
In-Reply-To: <fe898b57-2b96-4f8a-8f27-58dca1c11ffa@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Authority-Analysis: v=2.4 cv=CLknnBrD c=1 sm=1 tr=0 ts=68fb9eeb cx=c_pps
 a=vVfyC5vLCtgYJKYeQD43oA==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=VwQbUJbxAAAA:8 a=EUspDBNiAAAA:8 a=tVI0ZWmoAAAA:8 a=-IAwFrDFS_yr-AoREdYA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=rl5im9kqc5Lf4LNbBjHf:22
 a=-BPWgnxRz2uhmvdm1NTO:22 a=HhbK4dLum7pmb74im6QT:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDIzMDExMiBTYWx0ZWRfXwGduWa3QqXrQ
 KmXt3GiNoBN+l6nPRsle5IpLc2Amrz/KtdqRtMAE3lCkKC1Aym1l6wb8vCZW2ZNPDDcQULHMsUH
 ATltCKYG+DMLPo+oOsXMnQHbwXLJTzgLlD5RHtk7Z9dAH23vH5lDqc2QVyAjoFE8KpdISb5LakA
 t70VTchDJ91532GnO2rBqkA+oyUIAb00IpzzXwO/Q01f+cy8IuCeXzM4oapfL5zTrIKQBEF5SmH
 zXbveablqQy0NprYv8dq7Qz3y7htSvz3PmEkjwOxFIPIk7ZElk4vxi4xsOArO86qi+dEbI/BT43
 AGm641jlTE7HmPuGQFwK2rpbW2LeLYEoq1eXR+mfxSQv9bUAgOfOSmlMKwWRVwqKKjOdovVD7+v
 nyPsF1Bi//blc5FA0HdhoslBKB9q3A==
X-Proofpoint-GUID: P6xAOBqu81_pl6Lflh90JWqfullqZbdF
X-Proofpoint-ORIG-GUID: P6xAOBqu81_pl6Lflh90JWqfullqZbdF
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-24_03,2025-10-22_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 spamscore=0 phishscore=0 bulkscore=0 malwarescore=0
 suspectscore=0 clxscore=1015 impostorscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510230112
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

On 10/24/2025 8:41 PM, Neil Armstrong wrote:
> Hi,
> 
> On 10/24/25 16:56, Akhil P Oommen wrote:
>> Jessica has left Qualcomm and her Qualcomm email address is bouncing.
>> So remove Jessica from the reviewer list of drm-msm display driver for
>> now.
>>
>> Cc: Rob Clark <robin.clark@oss.qualcomm.com>
>> Cc: Dmitry Baryshkov <lumag@kernel.org>
>> Signed-off-by: Akhil P Oommen <akhilpo@oss.qualcomm.com>
>> ---
>>   MAINTAINERS | 1 -
>>   1 file changed, 1 deletion(-)
>>
>> diff --git a/MAINTAINERS b/MAINTAINERS
>> index 5889df9de210..064aecda38cf 100644
>> --- a/MAINTAINERS
>> +++ b/MAINTAINERS
>> @@ -7889,7 +7889,6 @@ DRM DRIVER for Qualcomm display hardware
>>   M:    Rob Clark <robin.clark@oss.qualcomm.com>
>>   M:    Dmitry Baryshkov <lumag@kernel.org>
>>   R:    Abhinav Kumar <abhinav.kumar@linux.dev>
>> -R:    Jessica Zhang <jessica.zhang@oss.qualcomm.com>
> 
> The email has already been updated in drm-misc-next, but .mailmap change
> is needed now:
> https://lore.kernel.org/all/20251002-quit-qcom-
> v1-1-0898a63ffddd@oss.qualcomm.com/

Thanks. I didn't notice that. We can drop this patch.

-Akhil

> 
> Neil
> 
>>   R:    Sean Paul <sean@poorly.run>
>>   R:    Marijn Suijten <marijn.suijten@somainline.org>
>>   L:    linux-arm-msm@vger.kernel.org
>>
>> ---
>> base-commit: 6fab32bb6508abbb8b7b1c5498e44f0c32320ed5
>> change-id: 20251024-remove-jessica-1abd363a4647
>>
>> Best regards,
> 

