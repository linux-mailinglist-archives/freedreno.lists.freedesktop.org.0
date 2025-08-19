Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 66111B2C29C
	for <lists+freedreno@lfdr.de>; Tue, 19 Aug 2025 14:04:45 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 7904110E5BF;
	Tue, 19 Aug 2025 12:04:43 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="ICYEgLv3";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 9811A10E579
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 09:22:29 +0000 (UTC)
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 57J90Yos026974
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 09:22:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 KczFnqDzEs+8Gb7pivRJCslUzgY2ZS98+cXZUjdh5lA=; b=ICYEgLv3ITBdFBKr
 uvXfh7N/Y4K6UR7I6z0l/LLT8+qtcjGj56uYEbq8KzkijCu/+lZLh5HLBPmJ9YPY
 qgY4FP9o4zHREFtktO1RLFdhWX7WBfdm0VIbngG+uL5HgJx3HzP5LK+ewwd78dRF
 L/31KnStgx/WI18gKdrrPIUoM4KvgRzsmlzbs7Tmnbd1yRR7Re/1opsiIw9SOeLV
 euufvIQBHHwalR1X2pwXX4232jC5kqVJNcYcRaHeJCfWsSRbuuObelSWplReXcYT
 Jt3UPSB/VELqWlYzONXnCJ0zGub0iQCAAOeR7EBXfiZKXAczIgL9ZCg/dkWm1zXU
 70c/YA==
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
 [209.85.210.197])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 48jhjyfy8y-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 09:22:28 +0000 (GMT)
Received: by mail-pf1-f197.google.com with SMTP id
 d2e1a72fcca58-76e2eab5baaso4333301b3a.2
 for <freedreno@lists.freedesktop.org>; Tue, 19 Aug 2025 02:22:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1755595347; x=1756200147;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=KczFnqDzEs+8Gb7pivRJCslUzgY2ZS98+cXZUjdh5lA=;
 b=iDjbSP2mJWZrwwiVqHy1sfZeKsxiOkA2pwQze8jAtKOXto3QUMExkmF7gaktFYaomJ
 cYYZFM4lYKsWcPWftP0K7VkO/YtU5KWjky2Bz6kyhd4APv2p8laZxm3bPoWIbgq9huhJ
 xVzX7Wpqpc//uZ9OG1sVZ/sCHk/Y1WY0HQ6GAdbeZot6xklpSbvI8P+2jSFIf/vnStDM
 kSHgDMUSGa1ZkE+qnxyM4TLVXF49LhaO2akaQFSFAJquWbJ3ZXh8lKuNW0uXIf9Qz3fc
 78JLE+kNxXYvJnCo2cjoGYMl4elS9wUcAvd14/17SocM6VxRCyto5o90G85OgV9fJ5eF
 uJog==
X-Forwarded-Encrypted: i=1;
 AJvYcCV9vPQYNZ9dRlHGh0x7RnMmS0DurUYjf0cont36F2aIzqGArdxlopoAress20iOYFdtLoU1JIjRqCU=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyeNnCoE5Z+NmwVxK5i7+mE00cDMKQfnFrQUutf+zASG/y4cf6r
 kjb3ltBvdrS25CJQdbRyZPGjeJPqoAA1RyiURieeleDue7qvrNO9za8XTHWk30xvpytDNchNFKJ
 Ny6qUyyGIS/SQ/mUFoEzymchxj0ip/UP2DrfgjbNklSdlroIhdG/hIfPtLS+D79D/RAAqHLM=
X-Gm-Gg: ASbGnct8+EM9ZUL1Iydro6kNQzaKfKi886mIvkIX/8EHrlW7otJJJ1Cb/jS+Y9g4Rf6
 mJlX9gC6dprQi59u8DoW1Ft09iLqdEcA4WmttLvYNYdojfqc4DbbUBvVT5hntsPB2Ubs5pGCnTG
 lAIQEaseJS9FJd6Ytgx9qoqbHGpoWB8TS8EFmgzsiYaa5COs6rwr9NfC3wxA84LQ/mVC5MT/Btk
 fuVzf+g4seb+4dYY43a07PCm6a+uSmX5rblEb2jLOKfAemG97odE2vqohyz2rBJ2hBnOzALZErh
 8xdPHyDp3QP7go38s+ie5BwBS+oW8tTbLfdsLXQFROeuUrZimGoIxEm9pth5Z8MCEEQd0RyHsAd
 iIlcIiSDdpp3rrquJiYPMBw8+l3iCmg==
X-Received: by 2002:a05:6a00:3e16:b0:76b:cae6:ee8a with SMTP id
 d2e1a72fcca58-76e81102294mr2238137b3a.12.1755595347385; 
 Tue, 19 Aug 2025 02:22:27 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFphi7ddJrn4OsHLiNEW55tJtpl5xzFPqO7FIxkJjqz5ACjMc6dZTHp/btM76pdxRLSv7Tocw==
X-Received: by 2002:a05:6a00:3e16:b0:76b:cae6:ee8a with SMTP id
 d2e1a72fcca58-76e81102294mr2238112b3a.12.1755595346893; 
 Tue, 19 Aug 2025 02:22:26 -0700 (PDT)
Received: from [10.133.33.87] (tpe-colo-wan-fw-bordernet.qualcomm.com.
 [103.229.16.4]) by smtp.gmail.com with ESMTPSA id
 d2e1a72fcca58-76e7d524c95sm1906515b3a.81.2025.08.19.02.22.21
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 19 Aug 2025 02:22:26 -0700 (PDT)
Message-ID: <20e7790e-6a30-4301-aa50-db180ceeb7a8@oss.qualcomm.com>
Date: Tue, 19 Aug 2025 17:22:19 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 6/6] drm/msm/dp: Add DisplayPort controller for QCS8300
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
References: <20250819-qcs8300_mdss-v7-0-49775ef134f4@oss.qualcomm.com>
 <20250819-qcs8300_mdss-v7-6-49775ef134f4@oss.qualcomm.com>
 <brculyyu3dgc5nkj2cuzv3jkjzcouljy5o4jwr6mw33r6i7gt7@j6ur7yvwmky5>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <brculyyu3dgc5nkj2cuzv3jkjzcouljy5o4jwr6mw33r6i7gt7@j6ur7yvwmky5>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: cNd2QKie70AKdu3SaxS7bHZqrREqhHx0
X-Authority-Analysis: v=2.4 cv=ZJHXmW7b c=1 sm=1 tr=0 ts=68a44254 cx=c_pps
 a=rEQLjTOiSrHUhVqRoksmgQ==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=2OwXVqhp2XgA:10 a=EUspDBNiAAAA:8 a=ZXt-rHCGnEisyK7TIFQA:9
 a=QEXdDO2ut3YA:10 a=2VI0MkxyNR6bbpdq8BZq:22
X-Proofpoint-GUID: cNd2QKie70AKdu3SaxS7bHZqrREqhHx0
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwODE2MDAyOCBTYWx0ZWRfX7gJVf5mV1QId
 f6ioL/GSZlVNW7uAzPWvFJNyb7Zu1DKDjN36eNjkUpD6P8xHWAV7inlxqCExjiCtniDCXKncy/J
 5RlctX93X4gdL9gL/0QM4/MPcUwaNbctNpgnsn5FteAXjwWhKlrBe2OOG92o/ZiSzRzzQnQ/qP/
 aXKz6h/8KGDrnRiRwLYkozMFYoWMV6GvOkG0Kphv890CAUgeXWC/WNO1BzaLGYsXm18ggJUvJth
 uQG112rMJLAYBBwuwgVd4gDv4LXextg53/G6sl8/metmPlySj/yS2RbgXws0nqbsJCOgUeysaue
 Y6w8UKE6EDgoMWk41B+FOf2L9bQNL3wIVa1Jb+EQ2fFmla6WG2XTIRH/9qEvsbdaEU3GjCHFnQT
 IlWOIJmb
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-08-19_01,2025-08-14_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 phishscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 spamscore=0 impostorscore=0 priorityscore=1501
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2508160028
X-Mailman-Approved-At: Tue, 19 Aug 2025 12:04:42 +0000
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



On 2025/8/19 15:59, Dmitry Baryshkov wrote:
> On Tue, Aug 19, 2025 at 11:33:33AM +0800, Yongxing Mou wrote:
>> The Qualcomm QCS8300 platform comes with one DisplayPort controller
>> with same base offset as SM8650. But it requires new compatible string
>> because QCS8300 controller supports 4 MST streams. 4 MST streams will
>> be enabled as part of MST feature support. Currently, using SM8650 as
>> fallback to enable SST on QCS8300.
> 
> Hmm, no, you are not using SM8650 as a fallback. You are using the data
> structure for SM8650 for QCS8300. That's a different thing. It would
> have been using SM8650 as fallback, if you had declared device with two
> compatibles, qcom,qcs8300-dp and qcom,sm8650-dp, and then relied on the
> second entry (only) to provide a match and data.
> 
> Exactly the same comment applies to the UBWC patch.
> 
Got it, thanks, will correct it in next version soon..
>>
>> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 1 +
>>   1 file changed, 1 insertion(+)
>>
>> diff --git a/drivers/gpu/drm/msm/dp/dp_display.c b/drivers/gpu/drm/msm/dp/dp_display.c
>> index d87d47cc7ec3eb757ac192c411000bc50b824c59..bb4660585849d1a67921a28e7e12422e0c327ab2 100644
>> --- a/drivers/gpu/drm/msm/dp/dp_display.c
>> +++ b/drivers/gpu/drm/msm/dp/dp_display.c
>> @@ -187,6 +187,7 @@ static const struct msm_dp_desc msm_dp_desc_x1e80100[] = {
>>   };
>>   
>>   static const struct of_device_id msm_dp_dt_match[] = {
>> +	{ .compatible = "qcom,qcs8300-dp", .data = &msm_dp_desc_sm8650 },
>>   	{ .compatible = "qcom,sa8775p-dp", .data = &msm_dp_desc_sa8775p },
>>   	{ .compatible = "qcom,sc7180-dp", .data = &msm_dp_desc_sc7180 },
>>   	{ .compatible = "qcom,sc7280-dp", .data = &msm_dp_desc_sc7280 },
>>
>> -- 
>> 2.34.1
>>
> 

