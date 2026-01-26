Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id iIJCJqpGd2mMdQEAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Mon, 26 Jan 2026 11:49:14 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 04CCD873DA
	for <lists+freedreno@lfdr.de>; Mon, 26 Jan 2026 11:49:13 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id CC38310E10C;
	Mon, 26 Jan 2026 10:49:12 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="dm4xNN6a";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="TfcSJsFC";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com
 [205.220.168.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id A4C5010E3BF
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 10:49:11 +0000 (UTC)
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60Q3N4Vw3575046
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 10:49:11 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 0wM+WE9prT1wwArZUSke8alVwSaN9+rfvAM9XmMAVqM=; b=dm4xNN6ahl/BNMUM
 SylQa7q8d+tnoYNSiwnlQuphMK2eJ2uo+RSLbNaFxqr0rIlAOg5hhlXGyunrZg3G
 Pj0pBLZiUii9I1uMtNBGQCujR88h9DllZ2gAz/J9QfNNNkwXOmWKUOzoiAEnxNzi
 EwjDA+rwlj28TUsw1KXvF1Hv31xAJ+rQ77NUj07daoTl5epb22+bLmU1rzVyyTCq
 MaS6BvwfzCfXSxfFFm5juhfV/Us8t8U50C06z6EvKosjK/eCDsGxzBABm23PL/NX
 wpmqeMeYPw1NGF+OHadejRlBhN77MKSIK6tGQtXcDIZMPtBhzTsg18Q3tzLWja7W
 4y9QUw==
Received: from mail-vs1-f69.google.com (mail-vs1-f69.google.com
 [209.85.217.69])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4bvwtybq8g-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 10:49:11 +0000 (GMT)
Received: by mail-vs1-f69.google.com with SMTP id
 ada2fe7eead31-5ec38a3265aso13289737137.1
 for <freedreno@lists.freedesktop.org>; Mon, 26 Jan 2026 02:49:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769424550; x=1770029350;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=0wM+WE9prT1wwArZUSke8alVwSaN9+rfvAM9XmMAVqM=;
 b=TfcSJsFCJ7y9Ehlxvs55lPKmPSaU/2ap2kvcPJxOFLj7NNYLXOy9qt0yOvMIujSvwv
 w1V5RaLI/r5xtiRXVQd+XrhNU2P8fDrvG9lQhdayPVPMbuSJZmTsFeJIX3D6J01m35hn
 gnysbynZoIZ63hJkPqwU0mnm6EcYSkCmPDRYQyq3ITHZ6JC8YOnD7TOXrw/4fO6W1VDt
 34XjJxWUcxFs4zk4rm57QfjVVvpeVJbb1BRd6T8o57xm8Ueqol9JbVrFCS9VOX4oUXmY
 1FkwzO0Qtd7tovk/1Fn13dGKWH2uX03Nwq0drG9RtZJh46g/KA8NTmR9uI0erfO+9l9j
 8MGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769424550; x=1770029350;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=0wM+WE9prT1wwArZUSke8alVwSaN9+rfvAM9XmMAVqM=;
 b=pRjjJUtEbF3EiG+uEw5gP7K9lEGDv+qHfe8Dh+RH+txsL49qN0Kh3Z/y5skydbbJ12
 6mFmOZxXOyHyZAjQigXzWu92o4YuN4dfm31U9N5vjMJcuBeefsFytEPPa14Yd4qiQQzd
 TgBr/BuiOrqpQ4FewXIzslMlcUrwUKgOHvhTdTiUJCP3+3anSeF7xhTgR4cZwzrJiJV6
 uty9U9WbiTq84m1tv89KjCAjrgLipaQECDE8nH3wjnGjGQuGSfhlTDJ0SFZvZ/45ajcw
 Qdaw2+e985oJRFeuGAQ2Nuod0jdiWXa6JHOY8dyI3VMTaM9CgZOkLpDG7vksv+dbDe0q
 TrAw==
X-Forwarded-Encrypted: i=1;
 AJvYcCW8PGzM28APItUkI6WimOlIv3Qti6oUBlpaWMGQcXqNfdpEupGbeC4ZNvEAo1uzQ5oRiqUDSKwN5H0=@lists.freedesktop.org
X-Gm-Message-State: AOJu0YzkP6j/Af7VCM9ke9qqxxMnL3jcflbrtk9Bin584B/o+t2K8uhf
 YC+E3XgVVCMup+n7rhy4VXeM9IgGpZj+iXriQYxgGUMshUopnURAWu+ON9o6XNrWYk3LYADhmlA
 MlrSiZSafA65KOCeW0OD7oI2BicYtLOCpivJTELI5YMTx3f38//XCnPfsGTtjn05JzxVpHb0=
X-Gm-Gg: AZuq6aKdWLTxiibpCBbb2dLp6nluPMS6rVtvznqoZAmuvzNdLj6MDrQx2a/EK0NUpUn
 rREfBkiRgE3S32Gy+EgdBZsP7bqOX1qG8TzkjaqwvwFxsxXyD6sosypI1d1rQbehQ/jDEDDjt8G
 WG6a2zn0vIeJwCphPkf0S/FOnIae+U8nlmh4/3RPDMyEzeQ0vbw3OYKTtkTh83H4b4w2usNacbJ
 /9+KqodPocws8xtfUqHT/a2i6UWC4XUMw/r1WC/LjOPv3m2zg5203Bbq9NL9Vjg5udKEAytIFl3
 6PLiTKcBkbBE21kcDd7qyetgWTl5lJiyEJ4v5wXChLMhzcdL19Qdjy5xIkVA4M3reM9SJ6jSONG
 ogHKls7BjWZ5ASxOzFrPFWa3xageNRVplk4Jo+g5tkrDlidoRlIZrDFOZoyPvop11
X-Received: by 2002:a05:6102:419e:b0:5f5:259b:66e1 with SMTP id
 ada2fe7eead31-5f5771b013bmr1458825137.3.1769424549888; 
 Mon, 26 Jan 2026 02:49:09 -0800 (PST)
X-Received: by 2002:a05:6102:419e:b0:5f5:259b:66e1 with SMTP id
 ada2fe7eead31-5f5771b013bmr1458811137.3.1769424549455; 
 Mon, 26 Jan 2026 02:49:09 -0800 (PST)
Received: from [10.205.56.101] (84-253-213-87.bb.dnainternet.fi.
 [84.253.213.87]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de491f9besm2544066e87.73.2026.01.26.02.49.08
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Mon, 26 Jan 2026 02:49:08 -0800 (PST)
Message-ID: <bbd8e584-4398-40da-9759-0c27f34214d3@oss.qualcomm.com>
Date: Mon, 26 Jan 2026 12:49:07 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v17 2/4] drm/msm/dpu: Defer SSPP allocation until CRTC
 check
To: Jun Nie <jun.nie@linaro.org>
Cc: Abhinav Kumar <abhinav.kumar@linux.dev>,
 Dmitry Baryshkov <lumag@kernel.org>, Sean Paul <sean@poorly.run>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 Rob Clark <robin.clark@oss.qualcomm.com>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260121-msm-next-quad-pipe-split-v17-0-6eb6d8675ca2@linaro.org>
 <20260121-msm-next-quad-pipe-split-v17-2-6eb6d8675ca2@linaro.org>
 <6kzd2g4hgffqz5ipaqbourgiefuxxh3njj44n35blo37z6hhhj@us7lzlgmjuld>
 <CABymUCMf8LxX6VWUuzNJP+G1y3Xi5-CVYhaqLR7F=kU6ZgdcgA@mail.gmail.com>
 <c56e4ylgwcqni23btaxegdbfg3tbkyp2vtjtboeb3kbvcfk27u@vrlh276djtfr>
 <CABymUCP6ZDGtEJeQSZ48x8TZyJ4gKVDC+JzJRz-tZ0ksCUCqsA@mail.gmail.com>
 <91d590de-fa00-4df3-923f-b49ad00cd9da@oss.qualcomm.com>
 <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CABymUCOqxtYS7BaDMHeN2npn=4+Y-6kxLDOS6oskiiH58epR5w@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: j8lkBln1jVmHVgbDJ9BDhdH8MZs0nj0y
X-Authority-Analysis: v=2.4 cv=BteQAIX5 c=1 sm=1 tr=0 ts=697746a7 cx=c_pps
 a=5HAIKLe1ejAbszaTRHs9Ug==:117 a=oW9j1mrv7lfAxSiOe78TcA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=_F_Q2RQ5sgb5A98PVdQA:9
 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10 a=gYDTvv6II1OnSo0itH1n:22
X-Proofpoint-ORIG-GUID: j8lkBln1jVmHVgbDJ9BDhdH8MZs0nj0y
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTI2MDA5MSBTYWx0ZWRfXytEFL4f0CdWs
 D/WQxL+VgdaipbfSgecqFKb1jyZcc/001BP9YK4oPdQEa9ovczXhuBm/7OICxQIZsSl2bn4JaYb
 T5LH6kwV7vFByMjT8cV6qGE1ztgYIm+XTJ0BbyLlRxAuAj71wOQWUNTulX4hx2/S50n/9UY5AIl
 Sc6p9y9lFCniwisDKer5dkxoqec/keR24BY0G9pPpJ0VFVMbG+vVs7YphTKYWoEGafgNz+RCWf7
 H8JRn76RamPyb+JukbEDC/WIvijfFkfEuuf61kh5MEAk4BvlFVbE9gPjO2In9e7h+YxbwpdbT1f
 V73Meg+G809QdBBRb4vz2sfIo6CQukE12Lv82QnNwzDqLgi//xlB8558DeTcZzlpya7f+E3mo3M
 PPnfHoiyu9iPBxwzaVqvE8Ultf7rgtq7J99xOf642xudaMiJpEEJN2h1fjcbaR6wNTOfk1jIAE+
 xeWZBqH16lpvCjguZRQ==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-26_02,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 priorityscore=1501 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 adultscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601260091
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
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.31 / 15.00];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177:c];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FORGED_RECIPIENTS(0.00)[m:jun.nie@linaro.org,m:abhinav.kumar@linux.dev,m:lumag@kernel.org,m:sean@poorly.run,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:robin.clark@oss.qualcomm.com,m:neil.armstrong@linaro.org,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,s:lists@lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_CC(0.00)[linux.dev,kernel.org,poorly.run,somainline.org,gmail.com,ffwll.ch,oss.qualcomm.com,linaro.org,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	ARC_NA(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[13];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	MIME_TRACE(0.00)[0:+];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	TO_DN_SOME(0.00)[];
	FORGED_SENDER_FORWARDING(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[freedreno];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[oss.qualcomm.com:mid,oss.qualcomm.com:dkim,qualcomm.com:email,qualcomm.com:dkim,gabe.freedesktop.org:helo,gabe.freedesktop.org:rdns]
X-Rspamd-Queue-Id: 04CCD873DA
X-Rspamd-Action: no action

On 26/01/2026 12:29, Jun Nie wrote:
> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月26日周一 18:13写道：
>>
>> On 26/01/2026 12:06, Jun Nie wrote:
>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月22日周四 18:22写道：
>>>>
>>>> On Thu, Jan 22, 2026 at 02:03:25PM +0800, Jun Nie wrote:
>>>>> Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com> 于2026年1月21日周三 17:30写道：
>>>>>>
>>>>>> On Wed, Jan 21, 2026 at 04:01:51PM +0800, Jun Nie wrote:
>>>>>>> Currently, plane splitting and SSPP allocation occur during the plane
>>>>>>> check phase. Defer these operations until dpu_assign_plane_resources()
>>>>>>> is called from the CRTC side to ensure the topology information from
>>>>>>> the CRTC check is available.
>>>>>>
>>>>>> Why is it important? What is broken otherwise?
>>>>>
>>>>> I see. Thanks! Will add below lines in next version.
>>>>>
>>>>> By default, the plane check occurs before the CRTC check.
>>>>> Without topology information from the CRTC, plane splitting
>>>>> cannot be properly executed. Consequently, the SSPP
>>>>> engine starts without a valid memory address, which triggers
>>>>> an IOMMU warning.
>>>>
>>>> What is plane splitting? Write commit message for somebody who doesn't
>>>> exactly know what is going on.
>>>
>>> Thanks for the suggestion! Any more revise is needed?
>>
>> Sadly enough the text below is not a significant improvement.
>>
>>>
>>> Currently, splitting plane into SSPP rectangles the allocation occur
>>> during the plane check phase, so that a plane can be supported by
>>> multiple hardware pipe.
>>
>> What does this mean? Without virtual planes in place, there are no
>> multiple hardware pipes.
>>
>>> While pipe topology is decided in CRTC check.
>>
>> ?? What does it mean here?
>>
>>> By default, the plane check occurs before the CRTC check in DRM
>>> framework. Without topology information from the CRTC, plane splitting
>>> cannot be properly executed.
>>
>> What does 'properly' mean here? How is it executed? What happens?
>>
>>> Consequently, the SSPP engine starts
>>> without a valid memory address, which triggers IOMMU warning.
>>
>> IOMMU faults. There are no "warnings".
>>
>>>
>>> Defer above plane operations until dpu_assign_plane_resources()
>>> is called from the CRTC side to ensure the topology information from
>>> the CRTC check is available.
>>
>>
> Thanks for the patience!
> 
> 
> Currently, splitting plane into SSPP rectangles and allocation occur
> during the plane check phase. When virtual plane is enabled to support
> quad-pipe topology later, 2 SSPPs with 4 rect will be needed, so that
> a plane can be supported by 4 hardware pipes. And pipe number is

number of pipes

> decided in CRTC check per interface number, resolution and hardware
> feature.

Okay, but IOMMU errors were reported with virtual planes being disabled. 
So how is it relevant?

> 
> By default, the plane check occurs before the CRTC check in DRM
> framework. Without topology information from the CRTC, plane splitting

WHat is plane splitting?

> will be skipped for the first time as pipe number is 0. Consequently,
> the SSPP engine starts without a valid memory address, which triggers
> IOMMU fault.
> 
> Defer above plane related operations until dpu_assign_plane_resources()
> is called from the CRTC side to ensure the topology information from
> the CRTC check is available.
> 
> Regards,
> Jun
>>
>> --
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
