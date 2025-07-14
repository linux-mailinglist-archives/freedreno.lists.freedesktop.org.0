Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id BEF1FB048CE
	for <lists+freedreno@lfdr.de>; Mon, 14 Jul 2025 22:47:35 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 9242B10E359;
	Mon, 14 Jul 2025 20:47:34 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="QCqaR3go";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 8A19C10E359
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 20:47:33 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 56EGLAEN008069
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 20:47:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 +6szoN01qMvtkgP/ZIMTwafHhBz2p79aT5gKKnIkfmQ=; b=QCqaR3goC9uClZUN
 Sb5eRIzhmsupAAJFCFty6dx6hBZ4YqpIZfsEaFJqM8+0ry1182YC4irqZb6HZ508
 Vnqp+HnzmKE05YHDPb8HoJWs8yvBuEZJnG4II2mL47ZPUvwHutyWFXFZ+DXKWj5Q
 akZm25lAydQUDkMPyiyHPCvqwQIRCjSgGvBSYmkQNQLI56lIi+peZcDmYCslzCBo
 /Rl3jhM5MfQT6yMfHJpFqphCUnAcNy673QE4bMVocznxFnB+WRIH17GVk8w1FwXl
 8NaE45EuYVwrQoBHubjWmlFCA61W5g9gToXYNaKlpSmEDJui55kbkk26kwed2lJn
 xnealQ==
Received: from mail-pf1-f200.google.com (mail-pf1-f200.google.com
 [209.85.210.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 47ug37wyk4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 20:47:32 +0000 (GMT)
Received: by mail-pf1-f200.google.com with SMTP id
 d2e1a72fcca58-74b185fba41so4157355b3a.1
 for <freedreno@lists.freedesktop.org>; Mon, 14 Jul 2025 13:47:32 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1752526051; x=1753130851;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=+6szoN01qMvtkgP/ZIMTwafHhBz2p79aT5gKKnIkfmQ=;
 b=SNHM5meE7LT/24iTKj1Y2H84Gjt0fuLHdc/v3CD6I2yM4z9KzVvQlMHisAiqCWwg9J
 KADCC0Roh3bXyafxMAL6QFL6sOn1qgxc5zb2rEZFIqDQVnjJpAebEbG3FcQtvkiApKIt
 g/BoOHEFlQM7gExO635AFLEEhZiiMSmp387kjaDZBW70vhvKkxiGrkQXRcRGe3i+dbn+
 GxYc34x7g/nCq0Vg6F5OeyT+YROLOAY+RQetrE1q68NAE9eUx69lOt/efHVjhRjO6Ilw
 0i4Ge3T3DQq5GhvGWh/7VZZnCTFcJ0MQPjWK2lv8n1E49fCCEIdCs4AWcef1ERXudl3Q
 +PNg==
X-Forwarded-Encrypted: i=1;
 AJvYcCUQqCp0ztMPO8jKKU+3iYd6Q0bYitynkVvrdSaVnDJkr+IB86VfoFkbOn0ZfHp5UeLSQxkuLlpypB8=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyVIQrXzQJH8nE4JtPdOT+NjwjJPxY1rEBnV39MeqcmCtxruhHO
 Izf1RJcAmO+g9HQ+xdlQJQXUZ/AZ4PkspGy/SkOKaAbPuReISYi2B4u1mJ6MXaaGQV6DhOUjBiJ
 Z7uEcF7jX5JDA80lRWjOllMacdG3h93E8rwCPm0X0//1E7p1GYStr+jezIhP7E/LrNHxgxqE=
X-Gm-Gg: ASbGncusvKaPz5ALSfUON27cGomlL9l3oisLgOaXYejXkO+i6KRITlEZ59FhBQUpSCz
 j+tgLyR33du17XznEbnF2tc8CF5djocqeROkiW5+ZaIEyCFhq7VJQ7YBwJSCH9WRwCuAdgIcmM0
 x0pJCizfNbqLxa7RGzaupNlySBQfY8uFMEv+rsdKcJvlJ5Kv5iekal9Hm8x8tfmJD9ETV7hcgqu
 6EiePcnASc7Noi2DxVWwJC6Aq0Jw2Nk0LcZIDaRHqZvpzRkzGr+pAabMMVIYRO7LscSk/taQdMM
 pBYViPj42Iw3moKTKx3ybGPc/lIsYnpfjczL4ltpXpygfHVxYtqURENVoHyCZnXQ0dMbrZ34zUY
 loMPWJ3MLF/3A+ME2SoIwUw==
X-Received: by 2002:a05:6a00:1821:b0:748:ef04:99d with SMTP id
 d2e1a72fcca58-755b41ab6f6mr437041b3a.14.1752526051355; 
 Mon, 14 Jul 2025 13:47:31 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IGh+Xikax20uVvqGMWirr1Ngeo4M3PY5vi4JIlcDBOfp3FjPa5Y+BJ4IdduqjZYXlTEboQ1uQ==
X-Received: by 2002:a05:6a00:1821:b0:748:ef04:99d with SMTP id
 d2e1a72fcca58-755b41ab6f6mr436999b3a.14.1752526050905; 
 Mon, 14 Jul 2025 13:47:30 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-74eb9f1a841sm10684116b3a.86.2025.07.14.13.47.29
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 14 Jul 2025 13:47:30 -0700 (PDT)
Message-ID: <b6b51282-7ab0-4cbc-a12d-86f35bcd6ffe@oss.qualcomm.com>
Date: Mon, 14 Jul 2025 13:47:29 -0700
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
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzE0MDEzOSBTYWx0ZWRfX9m9/p9XbB5Es
 hmSZ8fcVzJJ3MajEXhyxar3E3WVKl/S88A1eFd3sHlo2OFdo4NXDiPeFAIGV54TWgS2ILvzANOg
 /U3TGgxqMOMgsNEj3+9iAbEy40gAaYlUiO6RBtYHV/a8TyccMuSGo8ju8RCcDujkJMO1z+b/Rz+
 Z7WIAi4lT6hRG2U6k0VTcVWZMwqRJFhpgoHF8SvNquHQEHZvT3Ykw8VcJunQAdTJzRc8lQeUUyl
 Ex3Wj824h2TFZ1QtOCpUH4hej3kSnR8F/Kbou0jlrAZk0adZtyCDpxPoDYwbI0tHQFbF763/6g7
 a6gMrOP97sQFgeGHNf087ePatCsi8L9SZqOKB9Xm77v2cJLBwUJCRRQUVRrGl1wm2ihEv6OYPiS
 1A/0kXFAKz/+KiYByO96Z5qRVq44znFz0DX456FKBKO9Ww0nKmHZiPT3kd/FuiSnoLQcc4sV
X-Proofpoint-GUID: u2nAPE7cIybrQJq9dt8afsXxvagHr8d7
X-Authority-Analysis: v=2.4 cv=SZT3duRu c=1 sm=1 tr=0 ts=68756ce4 cx=c_pps
 a=mDZGXZTwRPZaeRUbqKGCBw==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=Wb1JkmetP80A:10 a=e5mUnYsNAAAA:8 a=COk6AnOGAAAA:8
 a=EUspDBNiAAAA:8 a=a_MUTpskHjF2EEzg2GEA:9 a=QEXdDO2ut3YA:10
 a=zc0IvFSfCIW2DFIPzwfm:22 a=Vxmtnl_E_bksehYqCbjh:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-ORIG-GUID: u2nAPE7cIybrQJq9dt8afsXxvagHr8d7
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-14_02,2025-07-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 mlxlogscore=693 mlxscore=0 priorityscore=1501
 lowpriorityscore=0 bulkscore=0 adultscore=0 impostorscore=0 malwarescore=0
 phishscore=0 spamscore=0 suspectscore=0 classifier=spam authscore=0
 authtc=n/a authcc= route=outbound adjust=0 reason=mlx scancount=1
 engine=8.19.0-2505280000 definitions=main-2507140139
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

Ack -- I'd separated them to keep the patches small, but I can squash 
patches 4-16 into 1 patch if that makes it easier for you.

Thanks,

Jessica Zhang

> 

