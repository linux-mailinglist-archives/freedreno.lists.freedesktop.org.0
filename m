Return-Path: <freedreno-bounces@lists.freedesktop.org>
Delivered-To: lists+freedreno@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YLUtNaO8c2kmyQAAu9opvQ
	(envelope-from <freedreno-bounces@lists.freedesktop.org>)
	for <lists+freedreno@lfdr.de>; Fri, 23 Jan 2026 19:23:31 +0100
X-Original-To: lists+freedreno@lfdr.de
Received: from gabe.freedesktop.org (gabe.freedesktop.org [131.252.210.177])
	by mail.lfdr.de (Postfix) with ESMTPS id 262B5798C7
	for <lists+freedreno@lfdr.de>; Fri, 23 Jan 2026 19:23:31 +0100 (CET)
Received: from gabe.freedesktop.org (localhost [127.0.0.1])
	by gabe.freedesktop.org (Postfix) with ESMTP id E554E10E2DC;
	Fri, 23 Jan 2026 18:23:29 +0000 (UTC)
Authentication-Results: gabe.freedesktop.org;
	dkim=pass (2048-bit key; unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.b="kQMVoNlx";
	dkim=pass (2048-bit key; unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="D+wj8ZJt";
	dkim-atps=neutral
X-Original-To: freedreno@lists.freedesktop.org
Delivered-To: freedreno@lists.freedesktop.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com
 [205.220.180.131])
 by gabe.freedesktop.org (Postfix) with ESMTPS id 54A6710E2E0
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 18:23:28 +0000 (UTC)
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
 by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id
 60NCMnWP2912752
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 18:23:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
 cc:content-transfer-encoding:content-type:date:from:in-reply-to
 :message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
 JcQRaSYmswErFvxepDWiHW0BBlPKFj7UEtuNsulcBmI=; b=kQMVoNlx7hAtO97V
 8MA9n+nrQquFDk6KQKj2rG84pzAcoNkt6XYf3wka/T7fD5IL4w7WMg97ubWNqlVS
 +tbAexM027MM0yaTBNGO+z2XyEmWl3HGQ2iuBHyEI88ZayI3UPHkucR3ZbfJ7VcP
 72XKw9Z0zHKwrwPH7sXXGifAK122hDy93PQoN2+tawwgl9sFgVdY32KoHcgu2zAI
 eWHL/IAXkURS4w6ROPjk2YSP408u+n2vBEBkj8DlZgiheerzY8X8j3SV2wBXR8KC
 1j21tkxgEuZnrWYKfN4aGbvEb41wqBIqMAx5yM+3r4C8Phh2tpVVmtxOR4L3BIKR
 yPnbMw==
Received: from mail-vs1-f72.google.com (mail-vs1-f72.google.com
 [209.85.217.72])
 by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4buvs1uq24-1
 (version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 18:23:27 +0000 (GMT)
Received: by mail-vs1-f72.google.com with SMTP id
 ada2fe7eead31-5ece01183ffso2178433137.2
 for <freedreno@lists.freedesktop.org>; Fri, 23 Jan 2026 10:23:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=oss.qualcomm.com; s=google; t=1769192607; x=1769797407;
 darn=lists.freedesktop.org; 
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :from:to:cc:subject:date:message-id:reply-to;
 bh=JcQRaSYmswErFvxepDWiHW0BBlPKFj7UEtuNsulcBmI=;
 b=D+wj8ZJtnnQMHcznsJ9qiwCwO8hKzTKwlx1MWjQSkOgdEZB53ijt/rgpJgTgLKHn0e
 xIyYEo8A+pTzSCpbZ4gsR3dtIkx2I8MRQQvTjCDwgT9Sj+F6ZIlGe2KzuaHMAa2Xg/bH
 OJk1oWxVVq/GO77hDSdSelouuouCW5gwZ7ExzEOdTmzh8XgEjuXqIJ1g6Fa41Gnt6rD9
 O5CYJx1gQF32PpSlyCV8UYCF0Zd6inbtxK3rVNN3pd08bUpuhKEzEG84Vfbdl8JUF1yV
 OV+1aZ09sOTbnnAVmV+j6NM1W9m9yEYY2sPsp6fiy2nwmzk+gDNLKLQA630LbOwi8bQH
 gklw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20230601; t=1769192607; x=1769797407;
 h=content-transfer-encoding:in-reply-to:from:content-language
 :references:cc:to:subject:user-agent:mime-version:date:message-id
 :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
 :reply-to;
 bh=JcQRaSYmswErFvxepDWiHW0BBlPKFj7UEtuNsulcBmI=;
 b=AliAbjgMxtR+DMUlcCsiwxBj0B/wHmJ5jViW608E4fqTqbl9bC4VIhRrCugyO3N1Mt
 94ABqJ1yoriKKFYWS2xvaa9Z1HcwyWuZsXvsX4ZvMS2upVN3zBFP/37t8+w1ntfih0jq
 0z1bUqEKupCms6Npl/pshgSFHcyict3ONGLHOTbU/93BNDnmwEMmlMDD7HFmHHUBouZ5
 oPREf5qIMnUPfnTDhR7jKqGQ4yiUfabK0qV1hIIlkeWaxtneH9Dcdo4kT2+uJoghT0Rq
 j/tTI7zlfQXoB3l5TC6ZpbaQtj8QUZUNyHZC/s0UxWaZAl7nrqTajPvR9THKVVH/BHdZ
 17zQ==
X-Forwarded-Encrypted: i=1;
 AJvYcCUbYt3ErR7vagZ71kRcmHh5YRWnncdLeSb2YttFc56zyMGD0FeaL4DvjbCjNMjm/NM9cIU+532mSLg=@lists.freedesktop.org
X-Gm-Message-State: AOJu0Yz8Tzc6V6Fpt1t96iPQmq+T57aazdx6GxikEEwYeSx2MqKXG0j6
 cBgnZJd98tsEb9/iHKHNcbG3T5k7SDRT7JSmzRVvXIH1iugQDYxrGGP7yXo8I3GF2BlnqO21CPp
 5R1PCJFBq91CGMHl65WPBLCzAtezzkuCXPLT5unXCGm4754fxvkiW1dPakJTBHTiuricNHlA=
X-Gm-Gg: AZuq6aLgX+HKOoWeJJTugSALrhjm/czl+QBoj1Vl1rxP+tcfYJqOBi0QidV04i4rxzj
 xDS8mq9iMfjncrUECt5mN2V+y0nkaKMqRtyXN4U2pyfXl2mfGD4Q39NIBed0q9FMo1MAA2aTxcQ
 3yk8pULw5WGmGbmcpuf2JCiDAMYO58tTTzh0f/x2eUr+4lT7TvaXbQiRoo8uL3V6lWe3X45PLXy
 v/hn/Bo1mHK6r0Z0qD4ZrFy6ZqEca8bWrP3umWRHLVComfncN15m2cp79V02OoxDMCX9RbFfGeY
 xH5Qc3nlJXDIdfECbc8RXPwKZMunu5VX9e0FnWSZQXVQayWhqFkX+WaYsrbMYc7Snyr3JsTBGhw
 49mahMdb0UEp5NPewVp9RBkg/SBoFCOI5lR2rTfYihKbY+JomyNvvdav+nqyLhV/M
X-Received: by 2002:a05:6102:e08:b0:5ee:a7e9:f157 with SMTP id
 ada2fe7eead31-5f55874884dmr572402137.40.1769192606452; 
 Fri, 23 Jan 2026 10:23:26 -0800 (PST)
X-Received: by 2002:a05:6102:e08:b0:5ee:a7e9:f157 with SMTP id
 ada2fe7eead31-5f55874884dmr572391137.40.1769192605953; 
 Fri, 23 Jan 2026 10:23:25 -0800 (PST)
Received: from [10.205.56.101] (84-253-213-87.bb.dnainternet.fi.
 [84.253.213.87]) by smtp.gmail.com with ESMTPSA id
 2adb3069b0e04-59de48df7e0sm836906e87.17.2026.01.23.10.23.24
 (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
 Fri, 23 Jan 2026 10:23:25 -0800 (PST)
Message-ID: <e62971cd-ed56-46a3-ab47-46f3523ceeff@oss.qualcomm.com>
Date: Fri, 23 Jan 2026 20:23:23 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] drm/msm/adreno: Fix a reference leak in a6xx_gpu_init()
To: Felix Gu <ustc.gu@gmail.com>
Cc: Rob Clark <robin.clark@oss.qualcomm.com>, Sean Paul <sean@poorly.run>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Akhil P Oommen <akhilpo@oss.qualcomm.com>,
 Dmitry Baryshkov <lumag@kernel.org>, Abhinav Kumar
 <abhinav.kumar@linux.dev>, Jessica Zhang <jesszhan0024@gmail.com>,
 Marijn Suijten <marijn.suijten@somainline.org>,
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
 linux-arm-msm@vger.kernel.org, dri-devel@lists.freedesktop.org,
 freedreno@lists.freedesktop.org, linux-kernel@vger.kernel.org
References: <20260124-a6xx_gpu-v1-1-fa0c8b2dcfb1@gmail.com>
 <nsw5leex5uwofbhmue52l4zjmwz2wbel7i5tngjysr73ujvgxh@476xtlglkoom>
 <CAN4SLj3=N0ACXLKbTe1HCjQXuO4GuG+TXEXYjhO-g=u8Y_uKjA@mail.gmail.com>
Content-Language: en-US
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
In-Reply-To: <CAN4SLj3=N0ACXLKbTe1HCjQXuO4GuG+TXEXYjhO-g=u8Y_uKjA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: CiHakQ9gyvFF214u1tkuWzdSpJx_oXoz
X-Proofpoint-ORIG-GUID: CiHakQ9gyvFF214u1tkuWzdSpJx_oXoz
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMTIzMDEzOSBTYWx0ZWRfX6/rEa28dBheM
 YFR8h9IhkA8hKuVSACwS9CUN80BJtO5zadjr3DIzg9X+TO1Ej1MWqMsZb7aNYnIxRPO1tUOAmAK
 cUophLAaHpfnUB3TzlPT3BMt2VYDIAv/T4jVCU8w8J3avQRgZJmbQi9pQfCt852bfaSOSqTc5++
 kNXwFvfPCqa+yPZfCP6wQF3c0Hw0ZiCaHtrMkRkqvAjgSZ9mYCsWB+gEOGJuSnWQqxHc8rmvVwq
 eJIFaKYnm3CdQYcrUt/LBhl1/DKLfen4ossS8LeG2Kz0ay3OzNnYu4W9bH7cBiS/smSc53an/5Y
 KExTsXFOcjHwi2/cbrw5dtUhIg+dDXI2w9eqXB/AxqHbeZJ+7NZYjIYmo2X3q55kK5bWeSaKUa9
 c9/qr4PHhWvCErzR1ICXO1cBpOhq6VLo6N3xpbE4kNlBvz0kZaGrVb7X8NxmQlB5rhvsDODlkqH
 lNXU2ad5++RdnE7gQtg==
X-Authority-Analysis: v=2.4 cv=faSgCkQF c=1 sm=1 tr=0 ts=6973bc9f cx=c_pps
 a=DUEm7b3gzWu7BqY5nP7+9g==:117 a=oW9j1mrv7lfAxSiOe78TcA==:17
 a=IkcTkHD0fZMA:10 a=vUbySO9Y5rIA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=EUspDBNiAAAA:8 a=pGLkceISAAAA:8
 a=nHOJee6wh0HJpeXwZwgA:9 a=3ZKOabzyN94A:10 a=QEXdDO2ut3YA:10
 a=-aSRE8QhW-JAV6biHavz:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.20,FMLib:17.12.100.49
 definitions=2026-01-23_03,2026-01-22_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 malwarescore=0 phishscore=0 suspectscore=0
 lowpriorityscore=0 bulkscore=0 spamscore=0 impostorscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2601230139
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
X-Spamd-Result: default: False [0.19 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[qualcomm.com,reject];
	R_SPF_ALLOW(-0.20)[+ip4:131.252.210.177];
	R_DKIM_ALLOW(-0.20)[qualcomm.com:s=qcppdkim1,oss.qualcomm.com:s=google];
	MAILLIST(-0.20)[mailman];
	RWL_MAILSPIKE_GOOD(-0.10)[131.252.210.177:from];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FORWARDED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_RECIPIENTS(0.00)[m:ustc.gu@gmail.com,m:robin.clark@oss.qualcomm.com,m:sean@poorly.run,m:konradybcio@kernel.org,m:akhilpo@oss.qualcomm.com,m:lumag@kernel.org,m:abhinav.kumar@linux.dev,m:jesszhan0024@gmail.com,m:marijn.suijten@somainline.org,m:airlied@gmail.com,m:simona@ffwll.ch,m:linux-arm-msm@vger.kernel.org,m:dri-devel@lists.freedesktop.org,m:linux-kernel@vger.kernel.org,m:ustcgu@gmail.com,s:lists@lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	FORGED_SENDER(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	FREEMAIL_CC(0.00)[oss.qualcomm.com,poorly.run,kernel.org,linux.dev,gmail.com,somainline.org,ffwll.ch,vger.kernel.org,lists.freedesktop.org];
	FORGED_SENDER_MAILLIST(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PREVIOUSLY_DELIVERED(0.00)[freedreno@lists.freedesktop.org];
	FORGED_SENDER_FORWARDING(0.00)[];
	FROM_HAS_DN(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dmitry.baryshkov@oss.qualcomm.com,freedreno-bounces@lists.freedesktop.org];
	DKIM_TRACE(0.00)[qualcomm.com:+,oss.qualcomm.com:+];
	NEURAL_HAM(-0.00)[-0.672];
	FORGED_RECIPIENTS_FORWARDING(0.00)[];
	ASN(0.00)[asn:6366, ipnet:131.252.0.0/16, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[freedreno];
	DBL_BLOCKED_OPENRESOLVER(0.00)[qualcomm.com:email,qualcomm.com:dkim]
X-Rspamd-Queue-Id: 262B5798C7
X-Rspamd-Action: no action

On 23/01/2026 20:21, Felix Gu wrote:
> Hi Dmitry,
> Thanks for your review.
> linux/cleanup.h is included in linux/of.h.
> So it should be included already.

Yes. However we should not depend on include files being provided by 
other kernel-wide includes.

Also, please don't top-post when replying to the emails on public MLs.

> 
> Best regards,
> Feix Gu
> 
> On Sat, Jan 24, 2026 at 1:58 AM Dmitry Baryshkov
> <dmitry.baryshkov@oss.qualcomm.com> wrote:
>>
>> On Sat, Jan 24, 2026 at 12:37:38AM +0800, Felix Gu wrote:
>>> In a6xx_gpu_init(), node is obtained via of_parse_phandle().
>>> While there was a manual of_node_put() at the end of the
>>> common path, several early error returns would bypass this call,
>>> resulting in a reference leak.
>>> Fix this by using the __free(device_node) cleanup handler to
>>> release the reference when the variable goes out of scope.
>>>
>>> Fixes: 5a903a44a984 ("drm/msm/a6xx: Introduce GMU wrapper support")
>>> Signed-off-by: Felix Gu <ustc.gu@gmail.com>
>>> ---
>>>   drivers/gpu/drm/msm/adreno/a6xx_gpu.c | 5 ++---
>>>   1 file changed, 2 insertions(+), 3 deletions(-)
>>>
>>> diff --git a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> index 2129d230a92b..0bc518d9fd65 100644
>>> --- a/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> +++ b/drivers/gpu/drm/msm/adreno/a6xx_gpu.c
>>> @@ -2640,7 +2640,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>        struct msm_drm_private *priv = dev->dev_private;
>>>        struct platform_device *pdev = priv->gpu_pdev;
>>>        struct adreno_platform_config *config = pdev->dev.platform_data;
>>> -     struct device_node *node;
>>>        struct a6xx_gpu *a6xx_gpu;
>>>        struct adreno_gpu *adreno_gpu;
>>>        struct msm_gpu *gpu;
>>> @@ -2660,7 +2659,8 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>        adreno_gpu->registers = NULL;
>>>
>>>        /* Check if there is a GMU phandle and set it up */
>>> -     node = of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
>>> +     struct device_node *node __free(device_node) =
>>> +             of_parse_phandle(pdev->dev.of_node, "qcom,gmu", 0);
>>
>> Missing include for cleanup.h.
>>
>>>        /* FIXME: How do we gracefully handle this? */
>>>        BUG_ON(!node);
>>>
>>> @@ -2702,7 +2702,6 @@ static struct msm_gpu *a6xx_gpu_init(struct drm_device *dev)
>>>                ret = a6xx_gmu_wrapper_init(a6xx_gpu, node);
>>>        else
>>>                ret = a6xx_gmu_init(a6xx_gpu, node);
>>> -     of_node_put(node);
>>>        if (ret) {
>>>                a6xx_destroy(&(a6xx_gpu->base.base));
>>>                return ERR_PTR(ret);
>>>
>>> ---
>>> base-commit: a0c666c25aeefd16f4b088c6549a6fb6b65a8a1d
>>> change-id: 20260123-a6xx_gpu-cbc095dbe423
>>>
>>> Best regards,
>>> --
>>> Felix Gu <ustc.gu@gmail.com>
>>>
>>
>> --
>> With best wishes
>> Dmitry


-- 
With best wishes
Dmitry
