Return-Path: <freedreno-bounces@lists.freedesktop.org>
X-Original-To: lists+freedreno@lfdr.de
Delivered-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 8605AC8380F
	for <lists+freedreno@lfdr.de>; Tue, 25 Nov 2025 07:38:02 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id EFA6210E348;
	Tue, 25 Nov 2025 06:37:59 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="oiCWSWb8";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="A+VtxBxc";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id B33C110E16E
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:37:58 +0000 (UTC)
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 5AP2hdXo1980503
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:37:57 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 ErqSuJhmVOAQ6Obb00NbJWCGaUXkzOxerh/e1fs0cE4=; b=oiCWSWb8VF2dOwPO
 mR1QLGw3v/dqeQ3Dl+rEGA7UD/jL1l9LVyR/HRPsGmFz1e6vC4rK/rfcW3JsInQx
 ZIo0BndnpiWoQcZbRRxtxQKk2dkrq7Y+KKn5a/Y1MHUmodi96/lcdrp7D1Jh49q7
 cfAqpKadKK99k2siT4fvSftV/4Kn9WTTz2ZJ+OmrboKa3bl4ApQT6VX0k4prDUx2
 0UBQByU0Wj7ZfOGON0CGa4h9/jbewy1P0pC70Yig//u649OyzQmRbjb4GB8cOZd3
 8cdQ7bDX43BpoeBZOH/xXvF+DK/p8c1v1AL8omMTQL+Q9cw2G65X+Z3XaPd0J2Za
 ag1ugQ==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com
 [209.85.160.200])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4amw9gshfv-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Tue, 25 Nov 2025 06:37:57 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id
 d75a77b69052e-4ed74ab4172so130993471cf.1
 for <freedreno@lists.freedesktop.org>; Mon, 24 Nov 2025 22:37:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1764052677; x=1764657477;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=ErqSuJhmVOAQ6Obb00NbJWCGaUXkzOxerh/e1fs0cE4=;
 b=A+VtxBxcX8/iH/pvAf0SAfY+nn3T3gC1GW4YiMBR7lmxc48655AUsUGo4UVhBS7B85
 ReRG/ASy1qYn4PV0JXFVTvo28oG8LgoMbgkEAbNqhZBVT7W3OM6pbY1E+5YCUeQckJQI
 +omTn1eV29QxPMDXu4W8QfpYw1WUVBoRnSOXQeFLsjlooZYuvPBNtqo8ANs4dkznF/Uq
 wiqveBQEamJaCyGV6SNpao3P1HI/Qq/QA8Yhkw3VbO4753Z4XExrcTK25wbXJuaRd7kN
 8Ydigvb80ucdHV6a4jdIWHMDEaLXAyGAP8UYlV+2CFLtYb4csW/Qp2uEdLgK1pc9bs+Q
 tthw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1764052677; x=1764657477;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=ErqSuJhmVOAQ6Obb00NbJWCGaUXkzOxerh/e1fs0cE4=;
 b=CHWieKBgQEE9Gmd634wVhgydvfuzgBsUI6A987vYifKZNFsmmgIguRk1FL5eqcVlXd
 Qxy9NucOjygwHqhCg33k1LJHeWk+WngOyeBQ0tg1tAqHpNK7CEtWG8XIs6/zwj2jJhOB
 V7TrHomKeSXYIEEM50m6QwMHsSwn2k5TWl4nTnm8RMoxMQqPnYR4IGJWyEf8v063Reyn
 5dAMDsryVORAq7CBz6srRVzcuz44K0rj9HpRMfmrnuc2WLPEmFpyeG+CcRFNMDT+WvLW
 ERRnXNdSlq/NAquVU1DKXJe+Htu7zce2AmNterLpZaxjA/IhQSTcX5ZKJC11+yHoDOyf
 z2Pw==
X-Forwarded-Encrypted: i=1;
 AJvYcCUNmngKQtP/4AFR121rXRgiyuk0SbTnS8SK1S+jizPAGa54WCA2u4wr73TkPqNFfc9C3nY29FythJk=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YyAOX3PX0RmsgwtCfVD30aW4ZD+ImRcqNjAsI+yWZuEna88u5U9
 ywK1O4vWLKE26cO5VUkjvxBML+yed8MP3vuOCo4Kl4okDhONCShJwsTAiGL4kkfey4F9DAZiarm
 jFAxYbqQMJ5gqaLA6PeIQkN3gsTWOZBsxyF4t59gnyxPRB2RVyqYziRVFOK8FtVkoELMSuRM=
X-Gm-Gg: ASbGncshfDNiw9CV0sU2s41el6x0ptm+SKzo69/nR5nAme1oJpGlr4TvoYWXb6ZgUQI
 NlrUYzpK0LeK1xZf/MBt1OhDi5QqhX3icaGlM2uOeL3lkKEFL/djV94uQm8lkuzDWjNDDlIEZdt
 kg3a77NVYWg1DpPWt4RNyJFRfTqEaqzhIhTXHJ/iDscW4nStp5B95XFUnPfJhAnQD3vjIuJRZes
 JHuEtUOMuaxSnpMIWnMpHVLX8M4a1X/duOEVMfjj8sId7/NFR9Hs90G22yino2Sg1RyueCoZoq1
 kcnyjgfTRU2yqgqDyO0NiWtDjzjwjH56UowOtP04Ezggug8LjAebzJgJYwvWWoBPU21UjNmExYd
 g4YP9OYK4MiDRD6fX1HfdvEvz72izNqjZZg==
X-Received: by 2002:a05:622a:148c:b0:4ed:67bc:50de with SMTP id
 d75a77b69052e-4ee5885402bmr185785621cf.24.1764052677008; 
 Mon, 24 Nov 2025 22:37:57 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3IEAKR3Cy+9eYJq5upmyvN0y0HD6s2YnTjLvISf6qEEcoow8UYxypFBvz2esF8/bKVX5elg==
X-Received: by 2002:a05:622a:148c:b0:4ed:67bc:50de with SMTP id
 d75a77b69052e-4ee5885402bmr185785451cf.24.1764052676589; 
 Mon, 24 Nov 2025 22:37:56 -0800 (PST)
Received: from [10.64.68.30] ([114.94.8.21]) by smtp.gmail.com with ESMTPSA id
 d75a77b69052e-4ee48b45ccesm100522231cf.0.2025.11.24.22.37.52
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 24 Nov 2025 22:37:56 -0800 (PST)
Message-ID: <e6aff9d8-a6ae-497f-8c8c-91d60959eadc@oss.qualcomm.com>
Date: Tue, 25 Nov 2025 14:37:46 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 01/38] drm/msm/dp: remove cached drm_edid from panel
To: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jessica.zhang@oss.qualcomm.com>,
 Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20250825-msm-dp-mst-v3-0-01faacfcdedd@oss.qualcomm.com>
 <20250825-msm-dp-mst-v3-1-01faacfcdedd@oss.qualcomm.com>
 <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
Content-Language: en-US
From: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
In-Reply-To: <otmy4kttxflsxkvacwdsqynck4nqeww7jsxaq2xwjtlooxnhvx@gmpezdliskck>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMTI1MDA1MyBTYWx0ZWRfX45ev/3d6R+BO
 twofaWgB/90BIxR7dXK95jDgs85NH3ni7a1ktsDxmwL0kcbzN0VCZ9ZMhPV6uJ4a52eQSKwPdNN
 7QuvtAaxCs7n354Mz8UXJrq9B4x4YZCfbUZyx72gNCZUzXVQuL9aRmaAEUVHEMs605bYaNOKoUT
 fOt/xbHixu/GbVuuFeuTkik3mq0BUu6nW4fTWv74dkQJ1IeWJtgpL3vrArXiHjsfVJrGJ3GSfET
 hXXfphlW2bs3TtihcmWmvndsc6xmqVpJrh4zsSGENpXJyF5Tc/3HmYEL6M6pD5J+R7J+AYrwWLW
 MSBWpToTc1EjjV9ThHjbqXK3eSD5H6TKgvXk6wVc3BdIcLmM3QVhW6+y6fZ9bwmyDG6e+hk3aOz
 ICJDu0FqfZ8yND+wriekyttwfabk7A==
X-Authority-Analysis: v=2.4 cv=H53WAuYi c=1 sm=1 tr=0 ts=69254ec5 cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=Uz3yg00KUFJ2y2WijEJ4bw==:17
 a=IkcTkHD0fZMA:10 a=6UeiqGixMTsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=UzQ1Ta3AV69qgWW9qvUA:9
 a=QEXdDO2ut3YA:10 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-ORIG-GUID: fXqpjRsExwrAb232pO7VqYMpCTPk9r90
X-Proofpoint-GUID: fXqpjRsExwrAb232pO7VqYMpCTPk9r90
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-11-25_01,2025-11-24_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 spamscore=0 phishscore=0 clxscore=1015 lowpriorityscore=0
 adultscore=0 priorityscore=1501 suspectscore=0 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2510240001 definitions=main-2511250053
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



On 8/26/2025 12:41 AM, Dmitry Baryshkov wrote:
> On Mon, Aug 25, 2025 at 10:15:47PM +0800, Yongxing Mou wrote:
>> The cached drm_edid in msm_dp_panel was redundant and led to unnecessary
>> state management complexity. This change removes the drm_edid member from
> 
> Please see Documentation/process/submitting-patches.rst on how to write
> commit messages. Please use imperative language instead of describing
> the changes.
> 
> THe patch LGTM.
> 
How about this:
"The cached drm_edid seems unnecessary here. Use the drm_edid pointer
directly in the plug stage instead of caching it. Remove the cached
drm_edid and the corresponding oneliner to simplify the code."

>> the panel structure and refactors related functions to use locally read
>> EDID data instead.
>>
>> - Replaces msm_dp_panel_read_sink_caps() with msm_dp_panel_read_link_caps()
>> - Updates msm_dp_panel_handle_sink_request() to accept drm_edid as input
>> - Removes msm_dp_panel_get_modes() and drm_edid caching logic
>> - Cleans up unused drm_edid_free() calls
>>
>> This simplifies EDID handling and avoids stale data issues.
>>
>> Signed-off-by: Yongxing Mou <yongxing.mou@oss.qualcomm.com>
>> ---
>>   drivers/gpu/drm/msm/dp/dp_display.c | 28 +++++++++++++++-------
>>   drivers/gpu/drm/msm/dp/dp_panel.c   | 47 ++++---------------------------------
>>   drivers/gpu/drm/msm/dp/dp_panel.h   |  9 +++----
>>   3 files changed, 26 insertions(+), 58 deletions(-)
>>
> 


