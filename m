Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id D72DAB97B27
	for <lists+freedreno@lfdr.de>; Wed, 24 Sep 2025 00:21:03 +0200 (CEST)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id 90E0010E1E0;
	Tue, 23 Sep 2025 22:20:47 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="F/h0kwTp";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 5C07A10E1E0
 for <freedreno@lists.freedesktop.org>; Tue, 23 Sep 2025 22:20:46 +0000 (UTC)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 58NF5swc014904
 for <freedreno@lists.freedesktop.org>; Tue, 23 Sep 2025 22:20:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 XCqgOa0zMg3bAGkPnVwXTeYirB6xruRZWHedTA8lg7c=; b=F/h0kwTpuzKJK9Si
 C/vHQHBGXHXHcpUGOYGpWXmSYEgDE3kQXgXBZXjBZRqWKVAwdmfXBOk1F1Kmsirm
 uEAScIhViYBsKBb6KarpaHr+0uWwz8czX2/9RqgY1YDFmb+ej+4IgAEkOz2hg506
 RS0z876GscswgrouDyiwKBaZgIRbYbAL3aliex+xmh/gfvERGfOJQTaZrB6/X00P
 zFoFuaotLPLHPa+lrD/ynOGx9YOBRvpa2+pYbQK5vtLiHMjQztJJ7kBYhJ6XJg5o
 hhTbqhVIKPDW53cHFvasOg3/LupMjWsBw84aysd/4Oe9OBpQhYAsWnX7AXzwxWYP
 hwQG9Q==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com
 [209.85.215.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49b3kk64x4-1
 (version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 23 Sep 2025 22:20:44 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id
 41be03b00d2f7-b55735710f0so689670a12.2
 for <freedreno@lists.freedesktop.org>; Tue, 23 Sep 2025 15:20:43 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1758666032; x=1759270832;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
 bh=XCqgOa0zMg3bAGkPnVwXTeYirB6xruRZWHedTA8lg7c=;
 b=E07NUYPfA9mUxDbs6Wl8pPCybDqfWgVk+Ruysyb5dmVGvJu7BUvmAoiJ8EUys4jdBd
 aek2pHwP1NoP2jFZ9qAOACfwgrJqGNp9+YU0iqBbsIvwG3KrvZw915J2Y1YDQp0dVeXz
 T54CiKXljEb7PKcTorYPurQa44rSjlX76OQpxYM9Djjvz+NpZGPIVn/1SKiHxznlJ+/3
 NghwLc7dCYkG8Knpl6LqZCAA0OwLgqDsnyWeiNPAx1ILn0vH8omh+J7zDPpTMf1Lgb7z
 YQG0g2nNNSf8ebZukOg2xAMZYMYhMFWrr2xg8H9VSRPacSbeMu7uGtelQf9YvHw25gd/
 ha5Q==
X-Forwarded-Encrypted: i=1;
 AJvYcCVZ4LvWgFp0vAX3XVX5j84tCinHm1Kofu/iusFKgeaREQNy5Y93W/JJl/bQ9VPpzR8sS5w7Z6P3mxs=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YxJ43GzoS8FEqhuB81pgcHBveJzRqqdGc8ecpkN3E5aIFn0fqcG
 va3XwbfLH5S2MVJelEK/l9HvPYWR2PFgf33TgITiz2IhnZHsFjlnJrWNDU3ZCzIcYwy9YCgEcy/
 YomDsthmQTkK83fIAfkIPTZ06WpLKDAcZ9NRPT/C9xtzzcQCPnCqfHb5RAssPUARAt5kaULs=
X-Gm-Gg: ASbGncvo3jQpboD2/quD1uU0xRejcz+fW2yFwGNdp9iRfJWyKn9lYpbjluvdutwyfQh
 RCK1tZDGgQHDArBQdtQPDs1+0sfHaKLcPP3zOtzNwAmf3zg3T2DoGMxQvn+ZJXML4gR+yES1xZd
 yVdXtakkcOsh7z6uMs84idZFF5e5UhpKNeu394ICozNU7UeZNCn1oxzMx/jG57jVvITOzP1PqLN
 P5APk0O0iBa2A5Sf9UxNFnJZ+eKh8J+B7Ue8q3KGwiVizsL/EYUq4yg7NaipkqRoLjw9b5K8SW4
 Y5Ehj498nD/HmI3Ww+oF30N+019anDSwtIxSO+uqOZoB4RS+NNoefw2pnPcgXktr3U9Hc7CMXA+
 ZBgSo4Kvt0W5IfHQuVTPiFg==
X-Received: by 2002:a05:6a20:72a7:b0:2cc:692a:3a2b with SMTP id
 adf61e73a8af0-2cfdcfefdcbmr6109109637.16.1758666032112; 
 Tue, 23 Sep 2025 15:20:32 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IHrs2A71G+cFUsubAv+Vc1pQAa4dVVMm+2irnjFOxF6C7V/RXWnkIMo3dVaiu2z3htTxPtYpQ==
X-Received: by 2002:a05:6a20:72a7:b0:2cc:692a:3a2b with SMTP id
 adf61e73a8af0-2cfdcfefdcbmr6109080637.16.1758666031687; 
 Tue, 23 Sep 2025 15:20:31 -0700 (PDT)
Received: from [10.134.71.99] (i-global254.qualcomm.com. [199.106.103.254])
 by smtp.gmail.com with ESMTPSA id
 41be03b00d2f7-b554aa612e7sm6897265a12.8.2025.09.23.15.20.30
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Tue, 23 Sep 2025 15:20:31 -0700 (PDT)
Message-ID: <19bf97ed-3cb7-4b69-8d54-3cfef15f93f8@oss.qualcomm.com>
Date: Tue, 23 Sep 2025 15:20:29 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/dpu: Don't adjust mode clock if 3d merge is
 supported
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org,
 Abel Vesa <abel.vesa@linaro.org>
References: <20250922-modeclk-fix-v1-1-a9b8faec74f8@oss.qualcomm.com>
 <cjoxzwkvzjv7pqelcxcepafanauxjt7p5b3qevjdr5bsomifce@i67l2hzavctj>
Content-Language: en-US
From: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
In-Reply-To: <cjoxzwkvzjv7pqelcxcepafanauxjt7p5b3qevjdr5bsomifce@i67l2hzavctj>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: y3xmzp4E2BuiUV9g6RNjajygAbLMD8oz
X-Proofpoint-ORIG-GUID: y3xmzp4E2BuiUV9g6RNjajygAbLMD8oz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwOTIyMDA4OSBTYWx0ZWRfX02ipquzfw0V9
 dBRHC/w1iCb3f4XDeGE+N4GQQ+Ox8pFEDl/r3KghwBefi/W7aIyjUgt1xVjmKH4LhZ2vdMMS0P2
 KtPq4WNK+Qrn5QaOw+mLrwmbv8SZWNrvU1rgEY1wgHIFdjUw7eFVUSmA92u+m9/8h/0DTlbNkYx
 bJvR9/Vh04XKyySDbl8RjhIv2JnvTVdTdJ1pWoT5WaC1SYZLwnGpdH+dQzs0P7iunHNxUv+RhZS
 B5GiMWxwk9fXiGZhElXCflpQXYRMEZGW8Zfh8plz4SIJ6CBqpRcnAeKcs1tRUmc5iLmT4QisULm
 6JDKZ+ndyTWq9aO1BSXjxiYQHYj0d+vrOsdcK2iBrtHnlVTyY2fBCXzTnNXAIYFocdIq+K6HNu8
 Ce1kH2u+
X-Authority-Analysis: v=2.4 cv=BabY0qt2 c=1 sm=1 tr=0 ts=68d31d3d cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17
 a=IkcTkHD0fZMA:10 a=yJojWOMRYYMA:10 a=KKAkSRfTAAAA:8 a=EUspDBNiAAAA:8
 a=1kqHEmTGbaOex8fRdXYA:9 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22
 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-09-23_06,2025-09-22_05,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 clxscore=1015 phishscore=0 bulkscore=0 priorityscore=1501
 adultscore=0 malwarescore=0 spamscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2507300000 definitions=main-2509220089
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



On 9/22/2025 4:50 PM, Dmitry Baryshkov wrote:
> On Mon, Sep 22, 2025 at 04:32:39PM -0700, Jessica Zhang wrote:
>> Since 3D merge allows for higher mode clocks to be supported across
>> multiple layer mixers, filter modes based on adjusted mode clocks
>> only if 3D merge isn't supported.
>>
>> Reported-by: Abel Vesa <abel.vesa@linaro.org>
>> Fixes: 62b7d6835288 ("drm/msm/dpu: Filter modes based on adjusted mode clock")
>> Signed-off-by: Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c | 3 ++-
>>   1 file changed, 2 insertions(+), 1 deletion(-)
>>
>> diff --git a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> index 4b970a59deaf..5ac51863a189 100644
>> --- a/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> +++ b/drivers/gpu/drm/msm/disp/dpu1/dpu_crtc.c
>> @@ -1549,7 +1549,8 @@ static enum drm_mode_status dpu_crtc_mode_valid(struct drm_crtc *crtc,
>>   	 * The given mode, adjusted for the perf clock factor, should not exceed
>>   	 * the max core clock rate
>>   	 */
>> -	if (dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
>> +	if (!dpu_kms->catalog->caps->has_3d_merge &&
> 
> Well, not quite. If 3D merge is available, we should allow 2x of the
> clock, instead of skipping the check completely. I don't think that we
> should allow 8k or 16k just because the platform has 3D Mux.

Hi Dmitry,

Ack, I'll fix the math here.

Thanks,

Jessica Zhang

> 
>> +	    dpu_kms->perf.max_core_clk_rate < adjusted_mode_clk * 1000)
>>   		return MODE_CLOCK_HIGH;
>>   
>>   	/*
>>
>> ---
>> base-commit: b5bad77e1e3c7249e4c0c88f98477e1ee7669b63
>> change-id: 20250922-modeclk-fix-a870375d9960
>>
>> Best regards,
>> --
>> Jessica Zhang <jessica.zhang@oss.qualcomm.com>
>>
> 

